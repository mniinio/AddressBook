require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :user => nil,
      :name => "Name",
      :address1 => "Address1",
      :address2 => "Address2",
      :zip_code => "Zip Code",
      :city => "City",
      :state => "State",
      :country => "Country",
      :phone => "Phone",
      :mobile => "Mobile",
      :email => "Email",
      :website => "Website",
      :other => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/MyText/)
  end
end
