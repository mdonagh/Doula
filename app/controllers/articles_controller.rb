class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    render template: "articles/#{params[:article]}"
  end
end
  