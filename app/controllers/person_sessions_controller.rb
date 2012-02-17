class PersonSessionsController < ApplicationController
  def new
    @person_session = PersonSession.new
  end

  def create
    @person_session = PersonSession.new(params[:person_session])
    if @person_session.save
      flash[:notice] = "Successfully logged in."
      redirect_back_or_default root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @person_session = PersonSession.find
    @person_session.destroy
    redirect_to root_url, notice: "Successfully logged out."
  end
end
