class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def search
	@search_terms = params[:search_terms]
	@search_results = Source.where("firstname LIKE ? OR lastname LIKE ? OR name LIKE ?", "%#{@search_terms}%", "%#{@search_terms}%", "%#{@search_terms}%")
	
	# pour form
	@source = Source.new
	render :partial => "sources_search"
  end
  
  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(source_params)
	authorize! :manage, @source

    respond_to do |format|
      if @source.save
		flash.now[:notice] = "La source a été créée."
       # format.html { redirect_to @source, notice: 'La source a été créée.' }
        #format.json { render :view, status: :created, location: @source }
        format.js { render :create, status: :created, location: @source }
      else
		flash.now[:error] = "La source n'a pas pu être créée.<br />" + @source.errors.full_messages.join("<br />")
        #format.html { render :new }
        #format.json { render json: @source.errors, status: :unprocessable_entity }
		#format.js { render :create, @source.errors, status: :unprocessable_entity }
		format.js { render :create, status: :created, location: @source }
      end
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
	authorize! :manage, @source
	
    respond_to do |format|
      if @source.update(source_params)
		flash.now[:notice] = "La source a été mise à jour."
        format.html { redirect_to @source, notice: 'La source a été mise à jour.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
	authorize! :manage, @source
  
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'La source a été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:tyype, :firstname, :lastname, :name)
    end
end
