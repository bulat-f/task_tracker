class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :creater,   class_name: 'User'
  belongs_to :performer, class_name: 'User'

  scope :new_tasks,  -> { where(state: 0) }
  scope :queue,      -> { where(state: 1) }
  scope :assigned,   -> { where(state: 2) }
  scope :performing, -> { where(state: 3) }
  scope :checking,   -> { where(state: 4) }
  scope :ready,      -> { where(state: 5) }
  scope :closed,     -> { where(state: 6) }

  def creater?(user)
    creater.eql?(user)
  end

  state_machine :initial => :new do
    state :new,        value: 0
    state :queue,      value: 1
    state :assigned,   value: 2
    state :performing, value: 3
    state :checking,   value: 4
    state :ready,      value: 5
    state :closed,     value: 6

    event :assign do
      transition [:new, :queue] => :assigned
    end

    event :close do
      transition [:new, :queue, :assigned] => :closed
    end

    event :to_queue do
      transition [:new, :assigned] => :queue
    end

    event :performation do
      transition [:assigned, :checking] => :performing
    end

    event :to_checking do
      transition performing: :checking
    end

    event :made do
      transition checking: :ready
    end
  end
end
