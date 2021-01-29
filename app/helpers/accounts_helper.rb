module AccountsHelper

def can_edit_profile? profile_id
account_signed_in? && current_account.id == profile_id
end

end
