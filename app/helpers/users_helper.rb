module UsersHelper
  def determine_new_user_type
    return @user.type if @user.type.present?
    params[:type] == 'Admin' ? 'Admin' : 'Employee'
  end
end
