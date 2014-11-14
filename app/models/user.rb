class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects,      foreign_key: 'creater_id'
  has_many :tasks,         foreign_key: 'performer_id'
  has_many :created_tasks, foreign_key: 'creater_id', class_name: 'Task'

  def to_s
    name.blank? ? email : name
  end
end
