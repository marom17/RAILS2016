class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show, :search]
  
  # added
  def search
	@search_terms = params[:search_terms]
	@search_results = Hash.new
	@search_results["reports"] = Report.where("title LIKE ? OR head LIKE ? OR text LIKE ?", "%#{@search_terms}%", "%#{@search_terms}%", "%#{@search_terms}%").order("updated_at DESC").limit(20)
	@search_results["categories"] = Category.where("name LIKE ?", "%#{@search_terms}%")
	@search_results["sources"] = Source.where("firstname LIKE ? OR lastname LIKE ? OR name LIKE ?", "%#{@search_terms}%", "%#{@search_terms}%", "%#{@search_terms}%")
	@search_results["medias"] = Medium.where("name LIKE ?", "%#{@search_terms}%")
	
	render :partial => "reports_search"
  end
  
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end
  
  # Assigne les catégories et sources correspondant à leurs ids reçus
  def assign_categories_and_sources
	# added
	parameters = report_params
	parameters[:user_id] = current_user.id
	
	# assignation des catégories
	categories = parameters[:categories]
	categories_obj = []

	if categories
		categories.each do |c|
			categories_obj << Category.find(c)
		end
	end
	
	parameters[:categories] = categories_obj

	# assignation des sources
	sources = parameters[:sources]
	sources_obj = []

	if sources
		sources.each do |s|
			sources_obj << Source.find(s)
		end
	end
	
	parameters[:sources] = sources_obj
	
	return parameters
  end

  # POST /reports
  # POST /reports.json
  def create
	if current_user.role != "author"
		redirect_to reports_path, notice: "Vous ne pouvez pas créer une news."
	else
		parameters = assign_categories_and_sources()

		# création de l'article
		@report = Report.new(parameters)

		respond_to do |format|
		  if @report.save
			format.html { redirect_to @report, notice: 'Report was successfully created.' }
			format.json { render :show, status: :created, location: @report }
		  else
			format.html { render :new }
			format.json { render json: @report.errors, status: :unprocessable_entity }
		  end
		end
	end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
	if @report.user.id != current_user.id
		redirect_to reports_path, notice: "Vous ne pouvez pas modifier cette news."
	else
		parameters = assign_categories_and_sources()

		respond_to do |format|
		  if @report.update(parameters)
			format.html { redirect_to @report, notice: 'Report was successfully updated.' }
			format.json { render :show, status: :ok, location: @report }
		  else
			format.html { render :edit }
			format.json { render json: @report.errors, status: :unprocessable_entity }
		  end
		end
	end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
	if @report.user.id != current_user.id && current_user.role != "admin"
		redirect_to reports_path, notice: "Vous ne pouvez pas modifier cette news."
	else
		@report.destroy
		respond_to do |format|
		  format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :head, :text, :categories => [], :sources => [])
    end
end
