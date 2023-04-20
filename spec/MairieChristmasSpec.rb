require_relative '../lib/MairieChristmas'

describe "the mairies profilage function" do
    
    it "should return a true value" do
        expect(profilage_de_mairies()).to eq(true)
    end
end