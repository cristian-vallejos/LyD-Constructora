# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170912191431) do

  create_table "areabenefits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
  end

  create_table "asformularies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rut_atendido"
    t.string "codigo_obra"
    t.bigint "user_id"
    t.string "nombre_atendido"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.bigint "aspcategory_id"
    t.string "solucion"
    t.boolean "estado"
    t.boolean "subcontrato"
    t.string "nombre_supervisor"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "telefono"
    t.bigint "benefit_id"
    t.integer "atencion_id"
    t.integer "numero_atencion", default: 1
    t.bigint "lyduser_id"
    t.index ["aspcategory_id"], name: "index_asformularies_on_aspcategory_id"
    t.index ["benefit_id"], name: "index_asformularies_on_benefit_id"
    t.index ["lyduser_id"], name: "index_asformularies_on_lyduser_id"
    t.index ["user_id"], name: "index_asformularies_on_user_id"
  end

  create_table "asignarmultiplebeneficios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.bigint "obra_id"
    t.bigint "areabenefit_id"
    t.bigint "benefit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["areabenefit_id"], name: "index_asignarmultiplebeneficios_on_areabenefit_id"
    t.index ["benefit_id"], name: "index_asignarmultiplebeneficios_on_benefit_id"
    t.index ["employee_id"], name: "index_asignarmultiplebeneficios_on_employee_id"
    t.index ["obra_id"], name: "index_asignarmultiplebeneficios_on_obra_id"
  end

  create_table "aspcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
  end

  create_table "assignbenefits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "benefit_id"
    t.string "rut_trabajador"
    t.string "rut_beneficiario"
    t.string "relacion"
    t.date "fecha_nacimiento"
    t.bigint "obra_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_assignbenefits_on_benefit_id"
    t.index ["obra_id"], name: "index_assignbenefits_on_obra_id"
  end

  create_table "benefits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "area"
    t.integer "costotrabajador"
    t.integer "costoempresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "familia", default: false
    t.boolean "asistencia", default: false
    t.bigint "areabenefit_id"
    t.boolean "is_active", default: true
    t.index ["areabenefit_id"], name: "index_benefits_on_areabenefit_id"
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rut"
    t.string "nombre"
    t.string "cencos"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "epcformularies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "asformulary_id"
    t.integer "rut_atendido"
    t.string "codigo"
    t.string "nombre_pariente"
    t.string "apellido_paterno_pariente"
    t.string "apellido_materno_pariente"
    t.integer "rut_pariente"
    t.string "parentesco"
    t.string "empresa"
    t.integer "codigo_obra"
    t.text "comentarios_caso"
    t.boolean "caso_amerita_epc"
    t.string "derivar_a"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asformulary_id"], name: "index_epcformularies_on_asformulary_id"
  end

  create_table "familiartrabajadors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rut"
    t.string "nombre"
    t.string "relacion"
    t.date "fechanacimiento"
    t.string "rut_trabajador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loanformularies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_solicitante"
    t.string "rut_solicitante"
    t.string "obra"
    t.string "cargo"
    t.integer "monto_solicitado"
    t.integer "monto_aprobado"
    t.integer "numero_cuotas"
    t.integer "monto_cuota"
    t.integer "renta_liquida"
    t.integer "antiguedad"
    t.datetime "fecha_ultimo_contrato"
    t.integer "fondo_finiquito"
    t.integer "continuidad_en_obra"
    t.integer "descuentos_en_curso"
    t.text "descripcion_documentos_respaldo"
    t.text "motivo_solicitud"
    t.text "comentarios"
    t.boolean "aceptado_por_as", default: true
    t.boolean "aceptado_por_administrativo_obra"
    t.boolean "aceptado_por_subgerente_personas"
    t.boolean "aceptado_por_jefe_remuneraciones"
    t.boolean "cerrado", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_aceptado_por_as"
    t.date "fecha_aceptado_por_administrativo_obra"
    t.date "fecha_aceptado_por_subgerente_personas"
    t.date "fecha_aceptado_por_jefe_remuneraciones"
    t.text "comentario_as"
    t.text "comentario_administrativo_obra"
    t.text "comentario_subgerente_personas"
    t.text "comentario_jefe_remuneraciones"
    t.bigint "lyduser_id"
    t.string "estado", default: "en proceso"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["lyduser_id"], name: "index_loanformularies_on_lyduser_id"
  end

  create_table "logas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "asocial_id"
    t.string "user_name"
    t.string "codigo_obra"
    t.string "rut_atendido"
    t.string "nombre_atendido"
    t.string "apellido_paterno_atendido"
    t.string "apellido_materno_atendido"
    t.string "aspcategory_name"
    t.string "solucion"
    t.boolean "estado"
    t.boolean "subcontrato"
    t.string "supervisor"
    t.text "descripcion"
    t.string "rut_pariente"
    t.string "nombre_pariente"
    t.string "apellido_paterno_pariente"
    t.string "apellido_materno_pariente"
    t.string "parentezco"
    t.string "empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telefono"
  end

  create_table "logbenefitsfinals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "areabeneficio"
    t.string "nombrebeneficio"
    t.string "costoempresa"
    t.string "costotrabajador"
    t.string "ruttrabajador"
    t.string "nombretrabajador"
    t.string "rutbeneficiario"
    t.string "relacion"
    t.string "nombreobra"
    t.integer "asistebeneficio"
    t.integer "Idasignacionbeneficio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombrebeneficiario"
  end

  create_table "logloans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rut_solicitante"
    t.string "nombre_solicitante"
    t.string "empresa"
    t.string "obra"
    t.string "cargo"
    t.string "monto_solicitado"
    t.string "numero_cuotas"
    t.string "monto_pagado"
    t.string "por_pagar"
    t.text "motivo_solicitud"
    t.text "comentarios"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lydusers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_role", default: false
    t.boolean "asocial_role", default: true
    t.boolean "boperativos_role", default: false
    t.boolean "administrativo_obra_role", default: false
    t.boolean "subgerente_personas_role", default: false
    t.boolean "jefe_remuneraciones_role", default: false
    t.string "obra"
    t.string "nombre_usuario"
    t.boolean "is_active", default: true
    t.boolean "ao_role", default: false
    t.index ["email"], name: "index_lydusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lydusers_on_reset_password_token", unique: true
  end

  create_table "obras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.boolean "is_active", default: true
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "asformularies", "aspcategories"
  add_foreign_key "asformularies", "benefits"
  add_foreign_key "asformularies", "lydusers"
  add_foreign_key "asformularies", "users"
  add_foreign_key "asignarmultiplebeneficios", "areabenefits"
  add_foreign_key "asignarmultiplebeneficios", "benefits"
  add_foreign_key "asignarmultiplebeneficios", "employees"
  add_foreign_key "asignarmultiplebeneficios", "obras"
  add_foreign_key "assignbenefits", "benefits"
  add_foreign_key "assignbenefits", "obras"
  add_foreign_key "benefits", "areabenefits"
  add_foreign_key "epcformularies", "asformularies"
  add_foreign_key "loanformularies", "lydusers"
end
