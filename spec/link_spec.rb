require 'link'

describe Link do


  describe "#all" do
    it "returns a list of all links" do
      expect(described_class.all).to include "http://google.com"
      expect(described_class.all).to include "http://facebook.com"
    end
  end

  describe "#add" do
    it "adds a link to the database" do
      described_class.add("http://friedegg.com")
      expect(described_class.all).to include "http://friedegg.com"
    end
  end


end
