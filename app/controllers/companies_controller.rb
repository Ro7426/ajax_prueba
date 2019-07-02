class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @companies = Company.all
    @company= Company.new
  end
  

  def show 
     @claims = Claim.all.order('created_at DESC') 
  end


  def new
    @company = Company.new
  end
  
  
  def edit
  end
  
  
  def create
    @company = Company.create(company_params)
    respond_to do |format|
    format.js
    end
  end

  def update
    @company.update(company_params)

    respond_to do |format|
        format.js
    end 
end
  


  

    def destroy
      @company.destroy
      respond_to do |format|
      format.js
    end
  end
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  
  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name)
      end
  end
