class CompaniesController < ApplicationController

  def index 
    @companies = Company.all
  end

  def show 
    @company = Company.find(params[:id])
  end 

  def new 

  end 

  def create 
    @company = Company.create({name: params[:name], profession: params[:profession]})
    redirect_to "/companies/#{@company.id}"
  end 

  def edit
    @company = Company.find(params[:id])
  end 

  def update
    @company = Company.find(params[:id])
     @company = Company.update({name: params[:name], profession: params[:profession]})

    redirect_to "/companies/#{@company["id"]}"
  end 

  def destroy
    @company = Company.delete(params[:id])
    
    redirect_to "/companies"
  end

end

