module UsersHelper
  def get_the_user_roles
    roles = []
    UserRole.all.each do  |role|
       roles << [role.user_role_type, role.id]
    end
    roles
  end
end
