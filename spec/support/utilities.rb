def full_title(page_title)
  base_title = "Matts cool website"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def non_valid_signin
  click_button "Sign in"
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def sign_out(user)
  visit signout_path
end


RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.flash.error', text: message)
  end
end