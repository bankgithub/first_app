class StatusController < ApplicationController
  def destroy
    @status = Status.find_by(id:params[:id]);
    @status.destroy;
    redirect_to users_timeline_path ;
  end
end
