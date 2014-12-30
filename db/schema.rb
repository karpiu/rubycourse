# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141230155732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grupa", primary_key: "kod_grupy", force: true do |t|
    t.integer "kod_przed_sem",            null: false
    t.integer "kod_uz",                   null: false
    t.integer "max_osoby",     limit: 2,  null: false
    t.string  "rodzaj_zajec",  limit: 1,  null: false
    t.string  "termin",        limit: 13
    t.string  "sala",          limit: 3
  end

  create_table "milestones", force: true do |t|
    t.integer  "number"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "przedmiot", primary_key: "kod_przed", force: true do |t|
    t.text    "nazwa",                             null: false
    t.integer "punkty",  limit: 2,                 null: false
    t.string  "rodzaj",  limit: 1,                 null: false
    t.boolean "egzamin",           default: false, null: false
  end

  create_table "przedmiot_semestr", primary_key: "kod_przed_sem", force: true do |t|
    t.integer "semestr_id",                null: false
    t.integer "kod_przed",                 null: false
    t.string  "strona_domowa", limit: 120
    t.boolean "angielski"
  end

# Could not dump table "semestr" because of following StandardError
#   Unknown type 'semestry' for column 'semestr'

  create_table "student_tasks", force: true do |t|
    t.integer  "student_id"
    t.integer  "task_id"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_tasks", ["student_id"], name: "index_student_tasks_on_student_id", using: :btree
  add_index "student_tasks", ["task_id"], name: "index_student_tasks_on_task_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "github_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "milestone_id"
  end

  add_index "tasks", ["milestone_id"], name: "index_tasks_on_milestone_id", using: :btree

  create_table "uzytkownik", primary_key: "kod_uz", force: true do |t|
    t.string  "imie",     limit: 15, null: false
    t.string  "nazwisko", limit: 30, null: false
    t.integer "semestr",  limit: 2
  end

  create_table "wybor", id: false, force: true do |t|
    t.integer  "kod_grupy",                   null: false
    t.integer  "kod_uz",                      null: false
    t.datetime "data",      default: "now()", null: false
    t.datetime "data_wyp",  default: "now()"
  end

end
