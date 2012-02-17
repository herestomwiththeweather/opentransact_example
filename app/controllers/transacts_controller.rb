class TransactsController < ApplicationController
  before_filter :login_required
  before_filter :find_by_asset
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to transacts_path(asset: @asset.name), :alert => exception.message
  end

  def index
    @transacts = current_person.transactions.by_asset(@asset)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transacts.as_json }
    end
  end

  def show
    @transact = Transact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transact.as_json }
    end
  end

  def new
    @transact = Transact.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def create
    @transact = Transact.new(to: params[:to],note: params[:note],amount: params[:amount])
    @transact.asset = @asset
    @transact.payer = current_person
    
    respond_to do |format|
      if @transact.save
        format.html { redirect_to transacts_path(asset: params[:asset]), notice: 'Transact was successfully created.' }
        format.json { render json: @transact.as_json, status: :created, location: @transact }
      else
        format.html { render action: "new" }
        format.json { render json: @transact.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @transact = Transact.find(params[:id])
    @transact.destroy

    respond_to do |format|
      format.html { redirect_to transacts_path(asset: params[:asset]), notice: "Successfully deleted transaction." }
      format.json { head :no_content }
    end
  end

  def find_by_asset
    @asset = Asset.where(name: params[:asset]).first
    if @asset.nil?
      respond_to do |format|
        format.html { redirect_to root_path, error: "Unknown asset class" }
        format.json { head :no_content}
      end
    end
  end
end
