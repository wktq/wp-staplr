class Admin::HomeController < ApplicationController
  before_action :authenticate_user!

  def top
  end

  def new_post
    #code
  end

  def settings
    #code
  end
end
