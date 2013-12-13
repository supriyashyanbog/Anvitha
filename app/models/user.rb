class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :openid_identifier, :first_name, :last_name, :mobile_phone, :date_of_birth

  validates_presence_of :date_of_birth, :mobile_phone, :first_name, :last_name
  validates_length_of :mobile_phone ,:maximum => 10, :allow_blank => true
  has_many :transactions
  has_one :user_role


  acts_as_authentic do |c|
    c.login_field :username
    c.validates_presence_of :username, :message => "^User name cannot be blank."
    c.validate_login_field true
    c.merge_validates_length_of_login_field_options :within => 6..255
    c.validates_presence_of :email,  :message => "^Email can't be blank."
    c.validates_format_of_email_field_options :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "^Email must be a valid email address."
    c.validates_uniqueness_of_email_field_options
    c.merge_validates_length_of_email_field_options :message => I18n.t(:email_address_length_error)
    c.ignore_blank_passwords false
    c.validates_presence_of :password, :message => I18n.t(:password_blank_error), :if => Proc.new { |user| user.new_record?  }
    c.validates_presence_of :password_confirmation, :message => I18n.t(:password_confirmation_blank_error), :if => Proc.new { |user| user.new_record?  }
    c.merge_validates_confirmation_of_password_field_options :message => I18n.t(:merge_password_matching_validation_error)
    c.validates_length_of_password_confirmation_field_options :minimum => 6, :allow_blank => true, :allow_nil => true, :message =>  "^Password confirmation must be greater than 5 characters."
    c.validates_length_of_password_field_options :minimum => 6, :allow_blank => true, :allow_nil => true, :message => "^Password must be greater than 5 characters."
    c.logged_in_timeout = 4.hours
  end

  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def self.deliver_payment_remainder
    Notifier.deliver_payment_remainder
  end
  
  def self.permanent_users
    permanent_user_role = UserRole.find_by_user_role_type "Permanent Account Holder"
    User.find_all_by_user_role_id permanent_user_role.id
  end
  
  def super_user?
    self.user_role.user_role_type == 'Super Admin'
  end

end
