class Admin::SitesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sites = current_user.sites
  end

  def new
    @site = current_user.sites.build
  end

  def show
  end

  def create
    @site = current_user.sites.build site_params

    begin
      wp = Rubypress::Client.new(:host => @site.url,
                                 :username => @site.username,
                                 :password => @site.password,
                                 :retry_timeouts => true)
    rescue => e
      # p e.message
    end


    @site.raw_info = wp.getOptions
    @site.name = wp.getOptions['blog_title']['value']

    if @site.save
      flash[:success] = "New WP Site Added."
      redirect_to admin_sites_path
    else
      render :new
    end
  end

  private
  def site_params
    params.require(:site).permit(
      :url,
      :username,
      :password,
      :xmlrpc_path,
      :ssl,
      :ssl_port
    )
  end
end
