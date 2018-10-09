require 'spec_helper'
require './app/models/member'


describe Member do
  it "exists" do
    attributes = {}
    member = Member.new(attributes)

    expect(member).to be_a(Member)
  end

  it "has attributes" do
    attributes = {  name: "Alice",
                    party: "D",
                    role: "Representative",
                    district: "1"
    }

    member = Member.new(attributes)

    expect(member.name).to eq("Alice")
    expect(member.party).to eq("D")
    expect(member.role).to eq("Representative")
    expect(member.district).to eq("1")
  end

end