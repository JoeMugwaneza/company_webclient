class CompaniesController < ApplicationController

  def index 
    company_hashes = Unirest.get("http://localhost:3000/api/v1/companies.json").body
    @companies = []
    company_hashes.each do |company_hash|
      @companies << Company.new(company_hash)
    
    end

  end 

  def show 
    @company_hash = Unirest.get("http://localhost:3000/api/v1/companies/#{params[:id]}.json").body
    @company = Company.new(@company_hash)
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
