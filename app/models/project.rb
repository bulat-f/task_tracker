class Project < ActiveRecord::Base
  belongs_to :creater, class_name: 'User'

  def to_s
    title
  end

  def creater?(user)
    user.admin && creater.eql?(user)
  end
end
