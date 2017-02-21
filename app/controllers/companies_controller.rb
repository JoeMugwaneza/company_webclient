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
    @company = Unirest.patch("#{ENV['DOMAIN']}/companies/#{params[:id]}.json",
      :headers => {"Accept" => "application/json"},
      :parameters => {:name => params[:name],
      :profession => params[:profession]}).body

    redirect_to "/companies/#{@company["id"]}"
  end 

  def destroy

    @company = Unirest.delete("#{ENV['DOMAIN']}/#{params[:id]}.json").body
    redirect_to "/companies"
  end

end

