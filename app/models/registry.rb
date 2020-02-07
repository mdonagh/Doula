require 'elasticsearch/model'

class Registry < ApplicationRecord
    include Elasticsearch::Model 
    include Elasticsearch::Model::Callbacks 

    has_many :registry_services

    validates_uniqueness_of :slug

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :name, analyzer: 'english'
      end
    end

    def to_param
      slug
    end 

    def add_service(service_id, increments)
      service = Service.find(service_id)

      registry_service = RegistryService.new
      registry_service.registry = self 
      registry_service.service = service 
      registry_service.save

      increments_price = service.price / increments
      increments = Array.new(increments){ServiceIncrement.new}

      increments.map! do |increment| 
        increment.registry_service = registry_service 
        increment.price = increments_price 
        increment.save 
      end 
      
    end 

    def self.search_by_name(query)
        __elasticsearch__.search({
            query: {
              bool: {
                must: [
                {
                  multi_match: {
                    query: query,
                    fields: [:name]
                  }
                }]
              }
            }
          })
    end 

    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ['name'],
              fuzziness: 'AUTO'
            }
          }
        }
      )
    end
  
    def as_indexed_json(options={})
      as_json(only: 'name')
    end
end

Registry.import(force: true) #for auto syncing the model with elasticsearch
