class ElectoralWardsController < ApplicationController
  def index
    @electoral_wards = ElectoralWard.all
  end
end
