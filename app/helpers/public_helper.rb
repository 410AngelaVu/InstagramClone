module PublicHelper

def account_in
if account_signed_in?
	(link_to 'Log Out', destroy_account_session_path, method: :delete, class:'btn btn-secondary')
else
	(link_to 'Sign Up', new_account_registration_path, class:'btn btn-success') +
	(link_to 'Log In', new_account_session_path, class:'btn btn-success')
end
end
end

