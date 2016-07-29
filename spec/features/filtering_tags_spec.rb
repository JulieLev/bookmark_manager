feature "filtring tags" do
  scenario "it filters tags" do
    visit_and_fill
    add_tag
    click_button "Add Link"
    visit '/links/new'
    fill_in :title, with: "Gum Factory"
    fill_in :url, with: "www.gums.com"
    fill_in :tag, with: "bubbles"
    click_button "Add Link"
    visit '/tags/bubbles'
    expect(page).to_not have_content "search engine"
    expect(page).to have_content "Gum Factory"
  end

end
