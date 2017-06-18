class Admin::SitesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @site = current_user.sites.build
  end

  def show
  end

  def create
    #code
  end
end
