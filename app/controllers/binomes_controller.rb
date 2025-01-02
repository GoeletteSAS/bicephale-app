class BinomesController < ApplicationController
  before_action :set_binome, only: [:show]


  def index
    @binomes = current_user.binomes
  end

  def show
    @message = Message.new
    @users = User.where.not(id: current_user.id)
    @binomes = Binome.where("user_1_id = :user_id OR user_2_id = :user_id", user_id: current_user.id)
    @binome.messages.where(sender: @binome.other_user(current_user), reading: false).update_all(reading: true)
  end

  def new
    @binome = Binome.new
    @binome.find_by(user_1: current_user, user_2: @user)

  end

  def create
    if Binome.find_by(user_1: current_user, user_2_id: params[:binome][:recipient_id])
      redirect_to dashboard_binomes_path(@binome), notice: 'Binome was successfully found.'
    else
      @binome = Binome.new(binome_params)
      @binome.user_1 = current_user
      @binome.user_2 = User.find(params[:binome][:recipient_id])
      if @binome.save
        Message.create!(binome: @binome, sender: current_user, content: params[:binome][:message])
        redirect_to dashboard_searches_path, notice: 'Message successfully sent.'
      else
        redirect_to dashboard_searches_path, alert: "Impossible de créer la conversation"
      end
    end
  end

  private

  def set_binome
    @binome = Binome.find(params[:id])
    unless @binome.user_1 == current_user || @binome.user_2 == current_user
      redirect_to root_path, alert: "You don't have access to this chat"
    end
  end

  def binome_params
    params.require(:binome).permit(:name, :user_2_id)
  end
end
