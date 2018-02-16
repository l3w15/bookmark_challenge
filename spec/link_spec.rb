require 'link'

describe Link do

  let(:links) { described_class.all }
  let(:urls) { links.map(&:url) }

  describe ".all" do
    it "returns a list of all links" do
      expect(described_class.all).to be_an Array
      expect(urls).to include "http://www.facebook.com", "http://www.google.com"
    end
  end

  describe ".add" do
    it "adds a link to the database" do
      described_class.add("http://www.friedegg.com", "friedegg")
      expect(urls).to include "http://www.friedegg.com"
    end

    it "Doesn't add an invalid link" do
      expect { described_class.add("http:||www.dogswearingsunglassses.com", "won't work") }
      .to raise_error RuntimeError
    end
  end

  describe ".delete" do
    it "deletes a link from the database" do
      described_class.delete(1)
      expect(urls).not_to include "facebook"
    end
  end

end
