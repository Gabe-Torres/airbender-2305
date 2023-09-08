class SearchController < ApplicationController
  def index
    nation = params[:nation]
    @members = MembersFacade.members_by_nation(nation)
  end
end
