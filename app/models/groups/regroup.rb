class Groups::Regroup < ActiveRecord::Base
  belongs_to :group
  has_many :regroup_groups
  accepts_nested_attributes_for :regroup_groups

  def build
    students = group.students.sort_by { |student| (student.answers.average(:grade) || 0) + (rand-0.5)/10 }
    splits = students.in_groups_of(target_group_size, false)
    if leads = splits.shift
      regroups = leads.zip(*splits)
      regroups.each_with_index do |students, index|
        regroup_groups.build(users: students.compact, name: "Group #{index+1}")
      end
    end
  end

end
