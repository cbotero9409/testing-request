class FriendsController < ApplicationController
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(params[:name])
    respond_to do |format|
      if @friend.save
        flash.alert = "Friend was successfully created."
        format.html { redirect_to friend_path(@friend) }
        format.json
      end
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end
end
