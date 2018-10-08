class MemberSearchResult
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def member_count
    members.count
  end

  def members
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-Key"] = ENV["propublica_api_key"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/congress/v1/members/house/#{@state}/current.json")

    JSON.parse(response.body, symbolize_names: true)[:results].map do |member_data|
      Member.new(member_data)
    end    
  end
end