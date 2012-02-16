module PeopleHelper
  def submit_button_text
    if 'edit' == action_name
      "Update Profile"
    else
      "Register"
    end
  end
end
