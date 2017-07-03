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

ActiveRecord::Schema.define(version: 20170703211946) do

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
    t.index ["aspcategory_id"], name: "index_asformularies_on_aspcategory_id"
    t.index ["user_id"], name: "index_asformularies_on_user_id"
  end

  create_table "aspcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
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
  add_foreign_key "asformularies", "users"
  add_foreign_key "epcformularies", "asformularies"
end
