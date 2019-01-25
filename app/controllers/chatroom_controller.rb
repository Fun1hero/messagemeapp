class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.custom_display
    # .each do |connection|
    #   @users_online.push(connection)
    # end
  end

  def new
  end

  def create
  end

  def delete
  end
end
