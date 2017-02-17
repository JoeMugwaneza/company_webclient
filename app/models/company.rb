class Company 
  attr_accessor :id, :name, :profession
  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @profession = hash['profession']
  end 

  def self.find(id)
    @company_hash = Unirest.get("http://localhost:3000/api/v1/companies/#{id}.json").body
    @company = Company.new(@company_hash)
  end 

end
