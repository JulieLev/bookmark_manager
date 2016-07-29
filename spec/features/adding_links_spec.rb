feature "creating links" do

  scenario "user adds a new link" do
    visit_and_fill_in_link
    click_button "Add Link"

    expect(current_path).to eq '/links'

    within "ul#links" do
      expect(page).to have_content "BBC"
    end
  end
end
