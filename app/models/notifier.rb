class Notifier < ActionMailer::Base
  #  default_url_options[:host] = "anvitha.com"
  
  def password_reset_instructions(user)
    subject "Password Reset Instructions"
    from "Binary Logic Notifier <noreply@binarylogic.com>"
    recipients user.email
    sent_on Time.now
    body :edit_password_reset_url => edit_reset_password_url(:id => user.perishable_token)
  end
  
  def payment_remainder
    subject "Please plan for payment"
    from "Remainder <noreply@anvitha.com>"
    recipients (User.permanent_users.collect{|user| user.email}).uniq
    sent_on Time.now
    body 
  end
end