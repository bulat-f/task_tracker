class Project < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships, source: :user

  belongs_to :creater, class_name: 'User'

  def to_s
    title
  end

  def creater?(user)
    user.admin? && creater.eql?(user)
  end

  def member?(user)
    user.admin? || members.find_by_id(user.id)
  end
end
