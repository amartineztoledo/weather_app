require 'rails_helper'

RSpec.describe "weathers/edit", type: :view do
  before(:each) do
    @weather = assign(:weather, Weather.create!(
      :temp => 1.5,
      :city => nil
    ))
  end

  it "renders the edit weather form" do
    render

    assert_select "form[action=?][method=?]", weather_path(@weather), "post" do

      assert_select "input[name=?]", "weather[temp]"

      assert_select "input[name=?]", "weather[city_id]"
    end
  end
end
