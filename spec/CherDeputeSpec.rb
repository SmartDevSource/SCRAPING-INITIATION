require_relative '../lib/CherDepute'

describe "the main scraping function" do
    
    it "should return a true value" do
        expect(main_scraping_function()).to eq(true)
    end
end