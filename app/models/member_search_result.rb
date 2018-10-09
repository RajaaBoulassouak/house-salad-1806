class MemberSearchResult
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def member_count
    members.count
  end

  def members
    # this returns the parsed response (hash)
    
    @members ||= service.member_search[:results].map do |member_data|
      Member.new(member_data)
    end
  end

  private
  def service
    ProPublicaService.new({state: @state})
  end
end