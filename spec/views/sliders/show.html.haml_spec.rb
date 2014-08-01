require 'rails_helper'

RSpec.describe "sliders/show", :type => :view do
  before(:each) do
    @slider = assign(:slider, Slider.create!(
      :title => "Title",
      :description => "Description",
      :image => "Image",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(//)
  end
end
