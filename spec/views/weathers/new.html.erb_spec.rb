require 'rails_helper'

RSpec.describe "weathers/new", type: :view do
  before(:each) do
    assign(:weather, Weather.new(
      :temp => 1.5,
      :city => nil
    ))
  end

  it "renders new weather form" do
    render

    assert_select "form[action=?][method=?]", weathers_path, "post" do

      assert_select "input[name=?]", "weather[temp]"

      assert_select "input[name=?]", "weather[city_id]"
    end
  end
end
