class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :creater,   class_name: 'User'
  belongs_to :performer, class_name: 'User'

  scope :newest,    -> { where(state: 0) } # :)
  scope :queue,     -> { where(state: 1) }
  scope :assigned,  -> { where(state: 2) }
  scope :performed, -> { where(state: 3) }
  scope :checked,   -> { where(state: 4) }
  scope :ready,     -> { where(state: 5) }
  scope :closed, -> { where(state: 6) }

  def creater?(user)
    creater.eql?(user)
  end

  state_machine :initial => :new do
    state :new,       value: 0
    state :queue,     value: 1
    state :assigned,  value: 2
    state :performed, value: 3
    state :checked,   value: 4
    state :ready,     value: 5
    state :closed,    value: 6

    event :assign do
      transition [:new, :queue] => :assigned
    end

    event :close do
      transition [:new, :queue, :assigned] => :closed
    end

    event :to_queue do
      transition [:new, :assigned] => :queue
    end

    event :to_performe do # :)
      transition [:assigned, :checked] => :performed
    end

    event :check do
      transition performed: :checked
    end

    event :production do # :)
      transition checked: :ready
    end
  end
end
