require 'link'

describe Link do


  describe "#all" do
    it "returns a list of all links" do
      expect(described_class.all).to include "http://www.google.com"
      expect(described_class.all).to include "http://www.facebook.com"
    end
  end

  describe "#add" do
    it "adds a link to the database" do
      described_class.add("http://www.friedegg.com")
      expect(described_class.all).to include "http://www.friedegg.com"
    end

    it "Doesn't add an invalid link" do
      expect { described_class.add("http:||www.dogswearingsunglassses.com") }
      .to raise_error RuntimeError
    end
  end


end
