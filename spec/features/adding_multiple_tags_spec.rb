feature "Adding multiple tags" do
  scenario 'adding multiple tags to each bookmark' do
    visit_and_fill_in_link
    fill_in :tags, with: "TV radio news"
    click_button "Add Link"

    link = Link.first
    expect(link.tags.map(&:name)).to include('TV', 'radio', 'news')
  end
end
