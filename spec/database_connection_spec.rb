require "database_connection"

describe DatabaseConnection do

let (:test_db) {"bookmark_manager_test"}

  describe "#set up" do
    it "creates a new connection" do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
        described_class.setup('bookmark_manager_test')
    end
  end





end
