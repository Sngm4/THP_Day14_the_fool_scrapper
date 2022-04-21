require_relative '../lib/dark_trader'

describe "the crypto name method" do
  it "should return an array, and array is not nil" do
    expect(array_currency_names).not_to be_nil
  end
end

describe "the price method" do
  it "should return an array, and array is not nil" do
    expect(array_price).not_to be_nil
  end
end

