class ArticlesController < ApplicationController
    def show
      render template: "articles/#{params[:article]}"
    end
  end
  