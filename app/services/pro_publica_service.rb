class ProPublicaService
  def initialize(filter = {})
    @filter = filter
  end

  def member_search
    get_json("/congress/v1/members/house/#{@filter[:state]}/current.json")
  end
  
  def district_search
    get_json("/congress/v1/members/house/#{@filter[:state]}/#{@filter[:district]}/current.json")
  end

  
  private

  def conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-Key"] = ENV["propublica_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
  # def district_search
  #   response = conn.get("/congress/v1/members/#{@filter[:chamber]}/#{@filter[:state]}/#{@filter[:district]}/current.json")
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  # hash = {state: "CO",
  #         chamber: "House",
  #         district: "1"}
  # service = ProPublicaService.new(hash)
  # service.district_search
  # service.member_search
end