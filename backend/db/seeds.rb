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

first_project = Project.create({ name: "ProjectName", user_id: 1 })

first_todo =
  TodoItem.create({ title: "TodoItemTitle", project_id: 1, user_id: 1 })

second_todo = TodoItem.create({ title: "TodoItemTitle", user_id: 1 })
