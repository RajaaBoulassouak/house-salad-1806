require 'rails_helper'

describe MemberSearchResult do 
  before :each do 
    file = File.open("./fixtures/member_search.json")
    
    stub_request(:get, "https://api.propublica.org/congress/v1/members/house/CO/current.json").
      to_return(body: file, status: 200)
  end
  it "exists" do
    result = MemberSearchResult.new("CO")

    expect(result).to be_a(MemberSearchResult)
  end

  context "instance methods" do
    context "member_count" do
      it "returns the correct count" do
        result = MemberSearchResult.new("CO")

        expect(result.member_count).to eq(7)
      end
    end

    context "members" do
      it "returns a collection of members" do 
        result = MemberSearchResult.new("CO")

        expect(result.members).to be_a(Array)
        expect(result.members.first).to be_a(Member)
      end
     end

  end

end
