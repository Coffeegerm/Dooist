# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_user =
  User.create(
    {
      username: "tester",
      email: "test@email.com",
      password: "SuperSecretPassword"
    }
  )

first_project = Project.create({ name: "Science 101", user_id: first_user.id })

first_todo =
  TodoItem.create(
    {
      title: "Take Physics Test",
      description: "Have to take test to pass the class.",
      project_id: first_project.id,
      user_id: first_user.id
    }
  )

second_todo =
  TodoItem.create({ title: "Take trash out", user_id: first_user.id })

second_user =
  User.create(
    {
      username: "tester2",
      email: "test2@email.com",
      password: "SuperSecretPassword2"
    }
  )

second_user_first_project =
  Project.create({ name: "English 101", user_id: second_user.id })

second_user_first_todo =
  TodoItem.create(
    {
      title: "Take Beowulf Test",
      description: "Have to take test to pass the class.",
      project_id: second_user_first_project.id,
      user_id: second_user.id
    }
  )

second_user_second_todo =
  TodoItem.create({ title: "Take trash out", user_id: second_user.id })
