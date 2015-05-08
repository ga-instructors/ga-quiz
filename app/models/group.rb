class Group < ActiveRecord::Base
  has_many :quizzes, class_name: 'Quizzes::Quiz'
  has_many :group_members
  accepts_nested_attributes_for :group_members, allow_destroy: true
  has_many :users, through: :group_members

  has_many :instructors, -> { where( group_members: { role: 'instructor' } ) }, through: :group_members, source: :user
  has_many :students, -> { where( group_members: { role: 'student' } ) }, through: :group_members, source: :user
  has_many :members, -> { where( group_members: { role: 'member' } ) }, through: :group_members, source: :user

  has_many :regroups, class_name: 'Groups::Regroup'

  scope :active, -> { where('(groups.start_at IS NULL OR NOW() > groups.start_at) AND (groups.end_at IS NULL OR NOW() < groups.end_at)') }

  def self.administrators
    Group.find(1)
  end

  def self.instructors
    Group.find(2)
  end

end
