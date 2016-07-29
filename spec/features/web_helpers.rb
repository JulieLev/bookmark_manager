def visit_and_fill_in_link
  visit '/links/new'
  fill_in :title, with: "BBC"
  fill_in :url, with: "www.bbc.co.uk"
end

def add_tag
  fill_in 'tags', with: 'TV'
end

def sign_up(email: 'RoiRoi@gmail.com', password_repeat: 'orangepassword')
  visit '/users/new'
  fill_in :user_name, with: "David"
  fill_in 'email', with: email
  fill_in 'password', with: 'orangepassword'
  fill_in 'password_repeat', with: password_repeat
  click_button 'Register'
end
