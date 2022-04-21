require_relative '../lib/mairie_christmas.rb'

describe "the townhall mail method" do
  it "should return a string, and string is not nil" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/val-d-oise.html")).not_to be_nil
  end
end