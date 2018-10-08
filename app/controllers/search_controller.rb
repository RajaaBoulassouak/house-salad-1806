class SearchController < ApplicationController
  def index
    @search_result = MemberSearchResult.new(params[:state])
  end
end