class ClientsController < ApplicationController
  before_filter :login_required, :except => [:create, :host_meta]
  #load_and_authorize_resource
  before_filter :get_client, :only => [:show,:edit,:update,:destroy]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to clients_path, :alert => exception.message
  end

  def host_meta
    render 'host_meta.xml.erb'
  end

  def index
    @clients = current_person.clients

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    respond_to do |format|
      format.html do
        @client = current_person.clients.new(params[:client])
        if @client.save
          redirect_to @client, notice: 'Client was successfully created.'
        else
          render action: "new"
        end
      end
      format.json do
        response.headers["Cache-Control"] = "private, no-store, max-age=0, must-revalidate"
        redirect_uri = ""
        begin
          raise "client_name" if params[:client_name].nil?
          raise "client_url" if params[:client_url].nil?
          raise "client_description" if params[:client_description].nil?
          raise "type" if params[:type].nil?

          if params[:application_type] && 'noredirect' == params[:application_type]
            redirect_uri = request.protocol + request.host_with_port + "/people"
          elsif params[:redirect_url]
            redirect_uri = params[:redirect_url]
          end
          @client = Client.new(:name => params[:client_name],:description => params[:client_description],:website => params[:client_url], :redirect_uri => redirect_uri)
          if @client.save
            render :json => @client.as_json
          else
            render :json => {:error => "Bad Request"}.as_json, :status => 400
          end
        rescue => e
          render :json => {:error => "Missing parameter: #{e}"}.as_json, :status => 400
        end
      end
    end
  end

  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
  def get_client
    unless @client = current_person.clients.find(params[:id])
      flash[:notice] = "Wrong application id"
      raise ActiveRecord::RecordNotFound
    end
  end
end
