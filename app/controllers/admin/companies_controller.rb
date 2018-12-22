class Admin::CompaniesController < Admin::BaseController
  # GET /companies
  def index
    @companies = Company.all
  end

  # GET /companies/:id
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
  end

  # POST /companies
  def create
  end

  # GET /companies/:id/edit
  def edit
  end

  # PATCH /companies/:id
  def update
  end

  # DELETE /companies/:id
  def destroy
  end
end
