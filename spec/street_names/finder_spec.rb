require 'spec_helper'
describe StreetNames::Finder do

  let (:street_finder) { StreetNames::Finder.new "en" }

  it 'load streets from spreadsheet' do
    street = { :name => "Agias Marinas", :postcode => 8041, :area => "Pafos"}

    street_finder.streets.map(&:to_json).should include street.to_json
  end

  context '#finders' do
    let(:street) { {  :name => "Dimosthenous Georgiou", :postcode => 8020, :area => "Pafos"} }

    it 'find streets by postcode' do
      street_finder.find_by_postcode(8020).map(&:to_json).should include street.to_json
    end

    it 'find street by name' do
      street_finder.find_by_name("Dimosthenous Georgiou").map(&:to_json).should include street.to_json
    end

    it 'find area by street name' do
      street_finder.find_by_area("Pafos").map(&:to_json).should include street.to_json
    end
  end
end
