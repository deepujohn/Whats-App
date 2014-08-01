require 'rails_helper'

RSpec.describe "sliders/new", :type => :view do
  before(:each) do
    assign(:slider, Slider.new(
      :title => "MyString",
      :description => "MyString",
      :image => "MyString",
      :user => nil
    ))
  end

  it "renders new slider form" do
    render

    assert_select "form[action=?][method=?]", sliders_path, "post" do

      assert_select "input#slider_title[name=?]", "slider[title]"

      assert_select "input#slider_description[name=?]", "slider[description]"

      assert_select "input#slider_image[name=?]", "slider[image]"

      assert_select "input#slider_user_id[name=?]", "slider[user_id]"
    end
  end
end
