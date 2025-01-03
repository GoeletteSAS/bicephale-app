class WorkflowsController < ApplicationController

before_action :set_workflow, only: [:show]
before_action :set_user

def index
  # Récupère tous les workflows associés à l'utilisateur via ses binômes
    @workflows = @user.workflows
end

  def show
    @coachings = Coaching.where(id: [
      @workflow.first_coaching_id,
      @workflow.first_month_coaching_id,
      @workflow.second_month_coaching_id,
      @workflow.third_month_coaching_id
    ])
  end

  private

  def set_user
    @user = current_user  # Utilisateur connecté
  end

  def set_workflow
    @workflow = Workflow.find(params[:id])
  end

  def workflow_params
    params.require(:workflow).permit(
      :create_workspace,
      :first_quizz_done,
      :second_quizz_done,
      :third_quizz_done,
      :real_meeting_done,
      :company_validation,
      :first_coaching_id,
      :first_coaching_done,
      :contract_prepared,
      :first_month_coaching_id,
      :second_month_coaching_id,
      :third_month_coaching_id
    )
  end
end
