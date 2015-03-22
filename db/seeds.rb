# Constantized Groups
DatabaseCleaner.clean_with(:truncation)
Group.create! id: 1, name: 'Administrators'
Group.create! id: 2, name: 'Instructors'
