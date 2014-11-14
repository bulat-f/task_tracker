class MembershipsController < ApplicationController
  before_action :admin?

  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      redirect_to project_path(membership_params[:project_id])
    end
  end

  def destroy
    @membership = Membership.find_by_id(params[:id])
    @membership.destroy
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :project_id)
  end
end
