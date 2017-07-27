json.extract! employee, :id, :rut, :nombre, :cencos, :estado, :created_at, :updated_at
json.url employee_url(employee, format: :json)
