# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin

User.destroy_all

User.create!([{
  name: "Paulina"
},
{
  name: "Pablo"
},
{
  name: "Andres"

}])

p "Created #{User.count} users"


Eep.destroy_all

Eep.create!([{
  nombre: "Salud",
  descripcion: "cosas de salud"
},
{
  nombre: "Legal",
  descripcion: "cosas legales"
},
{
  nombre: "Vivienda",
  descripcion: "cosas de vivienda"

}])

p "Created #{Eep.count} eeps"
=end


Aet.destroy_all
 
Aet.create!([{
  rut_atendido: 6666666,
  codigo_obra: 10,
  user_id: 4,
  nombre_atendido: "Pedro",
  apellido_paterno_atendido: "Pedro",
  eep_id: 1
},
{
  rut_atendido: 7777777,
  codigo_obra: 10,
  user_id: 4,
  nombre_atendido: "Juan",
  apellido_paterno_atendido: "Juan",
  eep_id: 1

},
{
  rut_atendido: 8888888,
  codigo_obra: 10,
  user_id: 4,
  nombre_atendido: "Diego",
  apellido_paterno_atendido: "Diego",
  eep_id: 2

},
{
  rut_atendido: 9999999,
  codigo_obra: 11,
  user_id: 5,
  nombre_atendido: "Jose",
  apellido_paterno_atendido: "Jose",
  eep_id: 3

},
{
  rut_atendido: 1111111,
  codigo_obra: 11,
  user_id: 5,
  nombre_atendido: "Camilo",
  apellido_paterno_atendido: "Camilo",
  eep_id: 3

},
{
  rut_atendido: 2222222,
  codigo_obra: 12,
  user_id: 6,
  nombre_atendido: "Pamela",
  apellido_paterno_atendido: "Pamela",
  eep_id: 3

}])
 
p "Created #{Aet.count} Aets"


