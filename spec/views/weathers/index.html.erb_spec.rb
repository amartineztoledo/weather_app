require 'rails_helper'

RSpec.describe "weathers/index", type: :view do
  before(:each) do
    assign(:weathers, [
      Weather.create!(
        :temp => 2.5,
        :city => nil
      ),
      Weather.create!(
        :temp => 2.5,
        :city => nil
      )
    ])
  end

  it "renders a list of weathers" do
    render
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
