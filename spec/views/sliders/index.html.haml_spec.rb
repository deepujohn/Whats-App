require 'rails_helper'

RSpec.describe "sliders/index", :type => :view do
  before(:each) do
    assign(:sliders, [
      Slider.create!(
        :title => "Title",
        :description => "Description",
        :image => "Image",
        :user => nil
      ),
      Slider.create!(
        :title => "Title",
        :description => "Description",
        :image => "Image",
        :user => nil
      )
    ])
  end

  it "renders a list of sliders" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
