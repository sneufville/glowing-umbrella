class ElectoralWardsController < ApplicationController
  def index
    @electoral_wards = ElectoralWard.all
    @count = ElectoralWard.all.count
  end
end
