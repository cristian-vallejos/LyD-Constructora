class Employee < ApplicationRecord

  # Este código cada vez que existe un nuevo campo, rellena la tabla con remples agregando nuevos employees
  #my_hash = JSON.load(File.read(Rails.root + "app/data/REMPLES.txt"))

  #my_hash.each do |row|
  #  emple = Employee.new
  #  emple.nombre = row['Nombre']
  #  emple.rut = row['Rut']
  #  emple.cencos = row['Cencos']
  #  emple.estado = row['Estado']
  #  emple.cargo = row['Cargo']
  #  emple.save
  #end
end
