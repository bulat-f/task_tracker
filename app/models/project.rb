class Project < ActiveRecord::Base
  belongs_to :creater, class_name: 'User'

  def correct_admin?(user)
    user.admin && creater.eql?(user)
  end
end
