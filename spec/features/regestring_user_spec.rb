feature "Users sign-up" do
  scenario "user register an account/users count increases by 1" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, David!"
    expect(User.first.email).to eq "David@mail.com"
  end


  scenario "no user created with a mismatching password" do
    visit '/users/new'
    fill_in :user_name, with:              "David"
    fill_in :password, with:               "123456789"
    fill_in :password_confirmation, with:  "123"
    fill_in :email, with:                  "David@mail.com"
    expect { click_button "Register" }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Password and confirmation password do not match")
  end

  scenario "user can't signup with blank email address" do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "user can't sign up with an invalid email address" do
    expect{ sign_up(email: "fff00" ) }.not_to change(User, :count)
  end

  scenario "user cannot sign up with an already registered email address" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("This email is already registered")
  end
end
