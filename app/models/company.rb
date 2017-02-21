class Company 
    attr_accessor :id, :name, :profession
  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @profession = hash['profession']
  end 

  def self.find(id)
    company_hash = Unirest.get("#{ENV['DOMAIN']}/companies/#{id}.json").body
   Company.new(company_hash)
  end 

  def self.all 

    company_hashes = Unirest.get("#{ENV['DOMAIN']}/companies.json",headers:{ "Accept" => "application/json", "Authorization" => "Token token = #{ENV['api_ke']}", "X-User-Email" => ENV['API_EMAIL']}).body
    companies = []
    company_hashes.each do |company_hash|
      companies << Company.new(company_hash)

    end 
      return companies
  end 

  def self.create(params)
     company_hash = Unirest.post("#{ENV['DOMAIN']}/companies.json", :headers => {"Accept"=> "application/json"}, :parameters => params).body

    Company.new(company_hash)

  end
end