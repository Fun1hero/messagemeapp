class ChatroomController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def new
  end
  
  def create
  end
  
  def delete
  end
end