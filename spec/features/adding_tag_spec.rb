
feature "New tag" do
  scenario 'adding a new tag to bookmark' do
    visit_and_fill_in_link
    add_tag
    click_button "Add Link"
    expect(page).to have_content "search engine"
  end
end
