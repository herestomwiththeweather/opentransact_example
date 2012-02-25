class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_person

  def invalid_oauth_response(code=401,message="Invalid OAuth Request")
    render :text => {:error => message}.to_json, :status => code
  end

  def current_person_session
    return @current_person_session if defined?(@current_person_session)
    @current_person_session = PersonSession.find
  end

  def current_person
    return @current_person if defined?(@current_person)
    @current_person = current_person_session && current_person_session.record
  end

  def current_user
    current_person
  end

  private

  def require_oauth_token
    @current_token = AccessToken.find_by_token request.env[Rack::OAuth2::Server::Resource::ACCESS_TOKEN]
    raise Rack::OAuth2::Server::Resource::MAC::Unauthorized unless @current_token
  end

  def require_oauth_user_token
    require_oauth_token
    raise Rack::OAuth2::Server::Resource::MAC::Unauthorized.new(:invalid_token,'User token is required') unless @current_token.person
    @current_person = @current_token.person
  end

  def oauth?
    !(request.env['rack.oauth2.access_token'].blank?)
  end

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
