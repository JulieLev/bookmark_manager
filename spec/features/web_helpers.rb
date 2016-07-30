def visit_and_fill_in_link
  visit '/links/new'
  fill_in :title, with: "BBC"
  fill_in :url, with: "www.bbc.co.uk"
end

def add_tag
  fill_in 'tags', with: 'TV'
end

# def sign_up(email: 'RoiRoi@gmail.com',
#             password: '12345678',
#             password_confirmation: 'orangepassword')
#   visit '/users/new'
#   fill_in 'email', with: email
#   fill_in 'password', with: password
#   fill_in 'password_confirmation', with: password_confirmation
#   click_button 'Sign up'
# end
