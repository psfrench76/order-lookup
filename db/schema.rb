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

ActiveRecord::Schema.define(version: 0) do

  create_table "customers", primary_key: "customerid", force: :cascade do |t|
    t.string "firstname",       limit: 20
    t.string "lastname",        limit: 15
    t.string "companyname",     limit: 47
    t.string "billingaddress1", limit: 35
    t.string "billingaddress2", limit: 36
    t.string "city",            limit: 16
    t.string "state",           limit: 29
    t.string "postalcode",      limit: 10
    t.string "country",         limit: 13
    t.string "phonenumber",     limit: 25
    t.string "emailaddress",    limit: 37
    t.string "customer_notes",  limit: 10
  end

  add_index "customers", ["customerid"], name: "customerid", unique: true, using: :btree

  create_table "options", id: false, force: :cascade do |t|
    t.integer "id",          limit: 4
    t.string  "optionsdesc", limit: 98
  end

  add_index "options", ["id"], name: "id", unique: true, using: :btree

  create_table "orderdetails", id: false, force: :cascade do |t|
    t.integer "orderdetailid", limit: 4
    t.integer "orderid",       limit: 4
    t.string  "productcode",   limit: 12
    t.string  "productname",   limit: 36
    t.integer "quantity",      limit: 4
    t.decimal "productprice",             precision: 6, scale: 1
    t.decimal "totalprice",               precision: 6, scale: 1
    t.string  "shipped",       limit: 10
    t.string  "shipdate",      limit: 10
    t.string  "optionids",     limit: 95
    t.string  "optionid",      limit: 5
    t.string  "discounttype",  limit: 10
    t.string  "discountvalue", limit: 10
  end

  add_index "orderdetails", ["orderdetailid"], name: "orderdetailid", unique: true, using: :btree

  create_table "orders", id: false, force: :cascade do |t|
    t.integer "orderid",            limit: 4,   null: false
    t.integer "customerid",         limit: 4,   null: false
    t.string  "billingcompanyname", limit: 128, null: false
    t.string  "billingfirstname",   limit: 128, null: false
    t.string  "billinglastname",    limit: 128, null: false
    t.string  "billingphonenumber", limit: 128, null: false
    t.string  "shipcompanyname",    limit: 128, null: false
    t.string  "shipfirstname",      limit: 128, null: false
    t.string  "shiplastname",       limit: 128, null: false
    t.string  "shipaddress1",       limit: 128, null: false
    t.string  "shipaddress2",       limit: 128, null: false
    t.string  "shipcity",           limit: 128, null: false
    t.string  "shipstate",          limit: 50,  null: false
    t.string  "shippostalcode",     limit: 15,  null: false
    t.string  "shipcountry",        limit: 128, null: false
    t.string  "shipphonenumber",    limit: 128, null: false
    t.string  "paymentamount",      limit: 128, null: false
    t.string  "cardholdersname",    limit: 128, null: false
    t.string  "orderdate",          limit: 128, null: false
  end

  add_index "orders", ["orderid"], name: "orderid", unique: true, using: :btree

  create_table "products", id: false, force: :cascade do |t|
    t.string  "productcode",  limit: 128, null: false
    t.string  "productname",  limit: 256, null: false
    t.integer "productprice", limit: 4,   null: false
    t.integer "listprice",    limit: 4,   null: false
    t.integer "saleprice",    limit: 4,   null: false
    t.integer "optionids",    limit: 4,   null: false
    t.string  "producturl",   limit: 256, null: false
  end

end
