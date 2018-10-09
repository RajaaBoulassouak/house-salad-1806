require 'rails_helper'

describe ProPublicaService do
  it "exists" do
    service = ProPublicaService.new({state: "CO"})

    expect(service).to be_a(ProPublicaService)
  end

  context "instance methods" do
    context "#member_search" do
      it "returns a hash" do 
        VCR.use_cassette("member_search") do
          service = ProPublicaService.new({state: "CO"})

          expect(service.member_search).to be_a(Hash)
          expect(service.member_search).to have_key(:results)
          expect(service.member_search[:results]).to be_a(Array)
          expect(service.member_search[:results].first).to have_key(:name)
          expect(service.member_search[:results].first).to have_key(:party)
          expect(service.member_search[:results].first).to have_key(:district)
          expect(service.member_search[:results].first).to have_key(:role)
        end
      end
    end
  end
end

