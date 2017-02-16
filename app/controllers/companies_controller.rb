class CompaniesController < ApplicationController

  def index 
    @companies = Unirest.get("http://localhost:3000/api/v1/companies.json").body
  end 

  def show 
    @company = Unirest.get("http://localhost:3000/api/v1/companies/#{params[:id]}.json").body
  end 

  def new 
  end 

  def create 
    @company = Unirest.post("http://localhost:3000/api/v1/companies.json",
    :headers => {"Accept" => "application/json"},
    :parameters => {:name => params[:name],
      :profession => params[:profession]}).body

    redirect_to "/companies/#{@company['id']}"
  end 

  def edit
    @company = Unirest.get("http://localhost:3000/api/v1/companies/#{params[:id]}.json").body
  end 

  def update
    @company = Unirest.patch("http://localhost:3000/api/v1/companies/#{params[:id]}.json",
      :headers => {"Accept" => "application/json"},
      :parameters => {:name => params[:name],
      :profession => params[:profession]}).body

    redirect_to "/companies/#{@company["id"]}"
  end 

  def destroy

    @company = Unirest.delete("http://localhost:3000/api/v1/companies/#{params[:id]}.json").body
    redirect_to "/companies"
  end
end
