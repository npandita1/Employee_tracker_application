# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Employee.destroy_all
Division.destroy_all
Designation.destroy_all
MasterRole.destroy_all

MasterRole.create([{
    name: "HR Manager"
},
{
    name: "Project Manager"
},
{
    name: "Employee"
}])

Division.create([{
    name: "Human Resources(HR)"
}])

Designation.create([{
    name: "HR Manager"
}])

Employee.create([{
    name: "Niharika Pandita",
    username: "npandit1",
    email: "npandita1@paychex.com",
    password: "12345678",
    master_role_id: MasterRole.first.id,
    division_id: Division.first.id,
    designation_id: Designation.first.id
}])

# masterrole = MasterRole.create([{
#     name: "HR Manager"
# },
# {
#     name: "Project Manager"
# },
# {
#     name: "Employee"
# }])

# division = Division.create([{
#     name: "Human Resources(HR)"
# }])

# designation = Designation.create([{
#     name: "HR Manager"
# }])

# Employee.create([{
#     name: "Niharika Pandita",
#     username: "npandit1",
#     email: "npandita1@paychex.com",
#     password: "12345678",
#     master_role_id: masterrole.first.id,
#     division_id: division.first.id,
#     designation_id: designation.first.id
# }])

# Employee.create!([{
#     name: "Niharika Pandita",
#     username: "npandit1",
#     email: "npandita1@paychex.com",
#     password: "12345678",
#     master_role_id: 1,
#     division_id: 1,
#     designation_id: 1
# }])