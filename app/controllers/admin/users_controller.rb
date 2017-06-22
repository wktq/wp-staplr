class Admin::UsersController < ApplicationController
  def index
    @all_users = []

    current_user.sites.each do |site|
      wp = Rubypress::Client.new(:host => site.url,
                                 :username => site.username,
                                 :password => site.password,
                                 :retry_timeouts => true)

      @all_users << wp.getUsers
    end
  end
end
