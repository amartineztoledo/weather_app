require 'rails_helper'

RSpec.describe "weathers/show", type: :view do
  before(:each) do
    @weather = assign(:weather, Weather.create!(
      :temp => 2.5,
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
  end
end
