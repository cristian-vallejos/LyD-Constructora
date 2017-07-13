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

ActiveRecord::Schema.define(version: 20170713201933) do

  create_table "asformularies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "rut_atendido"
    t.integer "codigo_obra"
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
    t.integer "numero_atencion"
    t.bigint "lyduser_id"
    t.index ["aspcategory_id"], name: "index_asformularies_on_aspcategory_id"
    t.index ["benefit_id"], name: "index_asformularies_on_benefit_id"
    t.index ["lyduser_id"], name: "index_asformularies_on_lyduser_id"
    t.index ["user_id"], name: "index_asformularies_on_user_id"
  end

  create_table "aspcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "benefits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "area"
    t.integer "costotrabajador"
    t.integer "costoempresa"
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

  create_table "ldusers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_ldusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_ldusers_on_reset_password_token", unique: true
  end

  create_table "ldusers2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_ldusers2_on_email", unique: true
  end

  create_table "logas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "asocial_id"
    t.string "user_name"
    t.integer "codigo_obra"
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
    t.string "comentarios_caso"
    t.boolean "caso_amerita_epc"
    t.string "derivar_a"
    t.datetime "fecha_as"
    t.datetime "fecha_epc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "codigo"
    t.integer "epcformulary_id"
    t.integer "rut_atendido_epc"
    t.integer "codigo_epc"
    t.integer "telefono"
    t.string "beneficio"
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
    t.index ["email"], name: "index_lydusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lydusers_on_reset_password_token", unique: true
  end

  create_table "obras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  add_foreign_key "epcformularies", "asformularies"
end
