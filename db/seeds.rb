# Constantized Groups
DatabaseCleaner.clean_with(:truncation)
Group.create!(name: 'Administrators').tap do |group|
  raise 'Administrators Group ID should be 1.  Abort!' unless group.id == 1
end
Group.create!(name: 'Instructors').tap do |group|
  raise 'Instructors Group ID should be 2.  Abort!' unless group.id == 2
end

