feature "Adding multiple tags" do
  scenario "checks for multiple tags" do
    visit_and_fill
    fill_in :tag, with: "search, homepage"
    click_button "Add Link"
    visit "/tags/search"
    within "ul#links" do
      expect(page).to have_content "search, homepage"
    end
  end

end
