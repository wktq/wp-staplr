class Api::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    render [0,1,2,3,4,5]
  end

  def edit
    @site = Site.find_by(id: params[:id])
  end

  def delete
    @site = Site.find_by(id: params[:id])
  end

  def destroy
    @site = Site.find_by(id: params[:id])

    if @site.destroy
      flash[:success] = "オファーを削除しました。"
    else
      flash[:danger] = "オファーの削除に失敗しました。"
    end
    redirect_to admin_sites_path
  end

  def posts
    @site = Site.find_by(id: params[:site_id])

    wp = Rubypress::Client.new(:host => @site.url,
                               :username => @site.username,
                               :password => @site.password,
                               :retry_timeouts => true)

    @posts = wp.getPosts
  end

  def users
    @site = Site.find_by(id: params[:site_id])

    wp = Rubypress::Client.new(:host => @site.url,
                               :username => @site.username,
                               :password => @site.password,
                               :retry_timeouts => true)

    @users = wp.getUsers
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
