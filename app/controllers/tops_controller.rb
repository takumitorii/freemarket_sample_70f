class TopsController < ApplicationController
  def index
  end

  def show
    @tops = Top.find(params[:id])
  end
end
