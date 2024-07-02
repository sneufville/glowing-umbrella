class ElectoralWardsController < ApplicationController
  def index
    @electoral_wards = ElectoralWard.all
    @count = ElectoralWard.all.count
  end

  def show
    begin
      @electoral_ward = ElectoralWard.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @error = "Resource Not Found!"
    end
  end
end
