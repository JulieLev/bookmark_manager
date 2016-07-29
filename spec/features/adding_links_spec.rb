feature "creating links" do

  scenario "user adds a link to datatbase" do
    visit_and_fill
    click_button "Add Link"
    expect(current_path).to eq '/links'
    within "ul#links" do
      expect(page).to have_content "Google"
    end
  end
end
