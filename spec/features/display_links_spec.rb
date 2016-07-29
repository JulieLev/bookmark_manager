
feature "Show a list of links" do
  scenario "it displays a list of links" do
    Link.create(title: "Makers Academy site", url: "www.makersacademy.com" )
    visit 'links/'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
