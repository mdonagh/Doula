require 'elasticsearch/model'

class Registry < ApplicationRecord
    include Elasticsearch::Model 
    include Elasticsearch::Model::Callbacks 

    validates_uniqueness_of :slug

    def to_param
      slug
    end 
    # attr_accessor :name

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
end

Registry.import(force: true) #for auto syncing the model with elasticsearch