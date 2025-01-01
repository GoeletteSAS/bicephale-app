class ExperiencesController < ApplicationController

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    @experience.save!
    redirect_to dashboard_profile_path
  end
  
  def update
    @experience = Experience.find(params[:id])
    @experience.update(experience_params)
    redirect_to # à définir
  end

  def destroy
    @experience.find(params[:id])
    @experience.destroy
    # path à définir
    redirect_to somewhere_path, status: :see_other
  end

  private

  def experience_params
    params.require(:experience).permit(:user_id, :start_date, :end_date, :is_current, :line_of_work, :field, :address)
  end

end
