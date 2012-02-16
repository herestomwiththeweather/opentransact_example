class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_person

  def current_person_session
    return @current_person_session if defined?(@current_person_session)
    @current_person_session = PersonSession.find
  end

  def current_person
    return @current_person if defined?(@current_person)
    @current_person = current_person_session && current_person_session.record
  end

  private

    def login_required
      unless current_person
        store_location
        redirect_to login_url, :notice => "You must be logged in to view the page"
        return false
      end
    end

   def store_location
      session[:return_to] = request.fullpath
   end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
