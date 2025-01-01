class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def notifications_messages
    @chatrooms = current_user.chatrooms
    if @chatrooms.nil?
      @number = 0
    else
      @number = 0
      @chatrooms.each do |chatroom|
      @number += chatroom.messages.where(sender: chatroom.other_user(current_user), reading: false).count
      end
    end
  end

  def dashboard_searches
    @searches = current_user.searches
    @favorite = Favorite.new(user_1_id: current_user.id)
    notifications_messages()
  end

  def dashboard_profile
    @user = current_user
    @experience = Experience.new(user: current_user)
    @lines_of_work = Search::LINES_OF_WORK
    @fields = Search::FIELDS
    notifications_messages()
  end

  def dashboard_favorites
    @user = current_user
    @favorites = current_user.favorites
    notifications_messages()
  end

  def dashboard_chatrooms
    notifications_messages()
  end

  def dashboard_chatrooms_unread
    notifications_messages()
  end
end
