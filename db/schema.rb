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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110903142717) do

  create_table "aging_product_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aging_products", :force => true do |t|
    t.integer  "u_start"
    t.integer  "u_end"
    t.integer  "start"
    t.integer  "end"
    t.integer  "score"
    t.integer  "score_message"
    t.integer  "weight"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id"
  end

  add_index "aging_products", ["color_id"], :name => "index_aging_products_on_color_id"

  create_table "application_uses", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "score_message"
  end

  create_table "arrester", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "humidity"
    t.integer  "is_gap_less"
    t.string   "mfghv"
    t.string   "mfglv"
    t.string   "mfgtv"
    t.float    "rated_current"
    t.float    "rated_ka"
    t.float    "rated_kahv"
    t.float    "rated_kalv"
    t.float    "rated_katv"
    t.float    "rated_kvhv"
    t.float    "rated_kvlv"
    t.float    "rated_kvtv"
    t.float    "rated_voltage"
    t.datetime "test_date"
    t.string   "typehv"
    t.string   "typelv"
    t.string   "typetv"
    t.string   "updated_by"
    t.string   "weather"
    t.string   "yearhv"
    t.string   "yearlv"
    t.string   "yeartv"
    t.decimal  "perform_type",  :precision => 10, :scale => 0
    t.decimal  "transformer",   :precision => 10, :scale => 0
  end

  create_table "brands", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "score"
    t.string   "score_message"
  end

  create_table "bus_voltage_hvs", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_voltage_lvs", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_voltages", :force => true do |t|
    t.integer  "start"
    t.integer  "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bushing", :force => true do |t|
    t.integer  "version"
    t.float    "amphv"
    t.float    "amplv"
    t.float    "amptv"
    t.integer  "bilhv"
    t.integer  "billv"
    t.integer  "biltv"
    t.float    "caphv"
    t.float    "caplv"
    t.float    "captv"
    t.integer  "classhv"
    t.integer  "classlv"
    t.integer  "classtv"
    t.float    "kvhv"
    t.float    "kvlv"
    t.float    "kvtv"
    t.string   "manufachv"
    t.string   "manufaclv"
    t.string   "manufactv"
    t.float    "pfhv"
    t.float    "pflv"
    t.float    "pftv"
    t.datetime "test_date"
    t.string   "typehv"
    t.string   "typelv"
    t.string   "typetv"
    t.string   "updated_by"
    t.string   "yearhv"
    t.string   "yearlv"
    t.string   "yeartv"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "bushing_condition_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "bushing_conditions", :force => true do |t|
    t.decimal "oil_color_hv",         :precision => 10, :scale => 0
    t.decimal "oil_color_lv",         :precision => 10, :scale => 0
    t.decimal "oil_color_tv",         :precision => 10, :scale => 0
    t.decimal "oil_fail_hv",          :precision => 10, :scale => 0
    t.decimal "oil_fail_lv",          :precision => 10, :scale => 0
    t.decimal "oil_fail_tv",          :precision => 10, :scale => 0
    t.decimal "oil_level_hv",         :precision => 10, :scale => 0
    t.decimal "oil_level_lv",         :precision => 10, :scale => 0
    t.decimal "oil_level_tv",         :precision => 10, :scale => 0
    t.decimal "porcelain_clean_hv",   :precision => 10, :scale => 0
    t.decimal "porcelain_clean_lv",   :precision => 10, :scale => 0
    t.decimal "porcelain_clean_tv",   :precision => 10, :scale => 0
    t.decimal "porcelain_status_hv",  :precision => 10, :scale => 0
    t.decimal "porcelain_status_lv",  :precision => 10, :scale => 0
    t.decimal "porcelain_status_tv",  :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "bushing_test_conditions", :force => true do |t|
    t.integer  "score"
    t.string   "score_message"
    t.string   "testing"
    t.float    "start"
    t.float    "end"
    t.integer  "weight"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bushing_tests", :force => true do |t|
    t.integer  "transformer_id"
    t.string   "test_type"
    t.date     "test_date"
    t.string   "work_order"
    t.string   "h1_c1_serial_number"
    t.integer  "h1_c1_test_kv"
    t.decimal  "h1_c1_current",       :precision => 10, :scale => 2
    t.decimal  "h1_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "h1_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "h1_c1_remark"
    t.string   "h1_c2_serial_number"
    t.integer  "h1_c2_test_kv"
    t.decimal  "h1_c2_current",       :precision => 10, :scale => 2
    t.decimal  "h1_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "h1_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "h1_c2_remark"
    t.string   "h2_c1_serial_number"
    t.integer  "h2_c1_test_kv"
    t.decimal  "h2_c1_current",       :precision => 10, :scale => 2
    t.decimal  "h2_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "h2_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "h2_c1_remark"
    t.string   "h2_c2_serial_number"
    t.integer  "h2_c2_test_kv"
    t.decimal  "h2_c2_current",       :precision => 10, :scale => 2
    t.decimal  "h2_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "h2_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "h2_c2_remark"
    t.string   "h3_c1_serial_number"
    t.integer  "h3_c1_test_kv"
    t.decimal  "h3_c1_current",       :precision => 10, :scale => 2
    t.decimal  "h3_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "h3_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "h3_c1_remark"
    t.string   "h3_c2_serial_number"
    t.integer  "h3_c2_test_kv"
    t.decimal  "h3_c2_current",       :precision => 10, :scale => 2
    t.decimal  "h3_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "h3_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "h3_c2_remark"
    t.string   "h0_c1_serial_number"
    t.integer  "h0_c1_test_kv"
    t.decimal  "h0_c1_current",       :precision => 10, :scale => 2
    t.decimal  "h0_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "h0_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "h0_c1_remark"
    t.string   "h0_c2_serial_number"
    t.integer  "h0_c2_test_kv"
    t.decimal  "h0_c2_current",       :precision => 10, :scale => 2
    t.decimal  "h0_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "h0_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "h0_c2_remark"
    t.string   "x1_c1_serial_number"
    t.integer  "x1_c1_test_kv"
    t.decimal  "x1_c1_current",       :precision => 10, :scale => 2
    t.decimal  "x1_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "x1_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "x1_c1_remark"
    t.string   "x1_c2_serial_number"
    t.integer  "x1_c2_test_kv"
    t.decimal  "x1_c2_current",       :precision => 10, :scale => 2
    t.decimal  "x1_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "x1_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "x1_c2_remark"
    t.string   "x2_c1_serial_number"
    t.integer  "x2_c1_test_kv"
    t.decimal  "x2_c1_current",       :precision => 10, :scale => 2
    t.decimal  "x2_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "x2_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "x2_c1_remark"
    t.string   "x2_c2_serial_number"
    t.integer  "x2_c2_test_kv"
    t.decimal  "x2_c2_current",       :precision => 10, :scale => 2
    t.decimal  "x2_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "x2_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "x2_c2_remark"
    t.string   "x3_c1_serial_number"
    t.integer  "x3_c1_test_kv"
    t.decimal  "x3_c1_current",       :precision => 10, :scale => 2
    t.decimal  "x3_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "x3_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "x3_c1_remark"
    t.string   "x3_c2_serial_number"
    t.integer  "x3_c2_test_kv"
    t.decimal  "x3_c2_current",       :precision => 10, :scale => 2
    t.decimal  "x3_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "x3_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "x3_c2_remark"
    t.string   "x0_c1_serial_number"
    t.integer  "x0_c1_test_kv"
    t.decimal  "x0_c1_current",       :precision => 10, :scale => 2
    t.decimal  "x0_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "x0_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "x0_c1_remark"
    t.string   "x0_c2_serial_number"
    t.integer  "x0_c2_test_kv"
    t.decimal  "x0_c2_current",       :precision => 10, :scale => 2
    t.decimal  "x0_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "x0_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "x0_c2_remark"
    t.string   "y1_c1_serial_number"
    t.integer  "y1_c1_test_kv"
    t.decimal  "y1_c1_current",       :precision => 10, :scale => 2
    t.decimal  "y1_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "y1_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "y1_c1_remark"
    t.string   "y1_c2_serial_number"
    t.integer  "y1_c2_test_kv"
    t.decimal  "y1_c2_current",       :precision => 10, :scale => 2
    t.decimal  "y1_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "y1_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "y1_c2_remark"
    t.string   "y2_c1_serial_number"
    t.integer  "y2_c1_test_kv"
    t.decimal  "y2_c1_current",       :precision => 10, :scale => 2
    t.decimal  "y2_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "y2_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "y2_c1_remark"
    t.string   "y2_c2_serial_number"
    t.integer  "y2_c2_test_kv"
    t.decimal  "y2_c2_current",       :precision => 10, :scale => 2
    t.decimal  "y2_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "y2_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "y2_c2_remark"
    t.string   "y3_c1_serial_number"
    t.integer  "y3_c1_test_kv"
    t.decimal  "y3_c1_current",       :precision => 10, :scale => 2
    t.decimal  "y3_c1_watt",          :precision => 10, :scale => 2
    t.decimal  "y3_c1_capacitance",   :precision => 10, :scale => 2
    t.string   "y3_c1_remark"
    t.string   "y3_c2_serial_number"
    t.integer  "y3_c2_test_kv"
    t.decimal  "y3_c2_current",       :precision => 10, :scale => 2
    t.decimal  "y3_c2_watt",          :precision => 10, :scale => 2
    t.decimal  "y3_c2_capacitance",   :precision => 10, :scale => 2
    t.string   "y3_c2_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cf",                  :precision => 10, :scale => 0
  end

  add_index "bushing_tests", ["transformer_id"], :name => "index_bushing_tests_on_transformer_id"

  create_table "chart_present", :force => true do |t|
    t.integer "version"
  end

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conservator_tank", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "breather_maintank",  :precision => 10, :scale => 0
    t.decimal  "breather_oltc",      :precision => 10, :scale => 0
    t.decimal  "corrosion_maintank", :precision => 10, :scale => 0
    t.decimal  "corrosion_oltc",     :precision => 10, :scale => 0
    t.decimal  "jel_color_maintank", :precision => 10, :scale => 0
    t.decimal  "jel_color_oltc",     :precision => 10, :scale => 0
    t.decimal  "oil_level_maintank", :precision => 10, :scale => 0
    t.decimal  "oil_level_oltc",     :precision => 10, :scale => 0
    t.decimal  "oilfail_maintank",   :precision => 10, :scale => 0
    t.decimal  "oilfail_oltc",       :precision => 10, :scale => 0
    t.decimal  "perform_type",       :precision => 10, :scale => 0
    t.decimal  "transformer",        :precision => 10, :scale => 0
  end

  create_table "conservator_tank_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conservator_tanks", :force => true do |t|
    t.decimal "breather_maintank",    :precision => 10, :scale => 0
    t.decimal "breather_oltc",        :precision => 10, :scale => 0
    t.decimal "corrosion_maintank",   :precision => 10, :scale => 0
    t.decimal "corrosion_oltc",       :precision => 10, :scale => 0
    t.decimal "jel_color_maintank",   :precision => 10, :scale => 0
    t.decimal "jel_color_oltc",       :precision => 10, :scale => 0
    t.decimal "oil_level_maintank",   :precision => 10, :scale => 0
    t.decimal "oil_level_oltc",       :precision => 10, :scale => 0
    t.decimal "oilfail_maintank",     :precision => 10, :scale => 0
    t.decimal "oilfail_oltc",         :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "damage_of_properties", :force => true do |t|
    t.string   "value"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "damage_of_properties_transformer_informations", :id => false, :force => true do |t|
    t.integer  "damage_of_property_id"
    t.integer  "transformer_information_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dga_gas_scores", :force => true do |t|
    t.integer  "score"
    t.string   "score_message"
    t.integer  "start"
    t.integer  "end"
    t.integer  "weight"
    t.integer  "gas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dgas", :force => true do |t|
    t.string   "gas"
    t.integer  "start"
    t.integer  "end"
    t.integer  "score"
    t.string   "score_message"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elec_cor", :force => true do |t|
    t.integer  "version"
    t.integer  "resistance"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "elec_dcr", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "amph1h0_2r"
    t.float    "amph1h0_max"
    t.float    "amph1h0_min"
    t.float    "amph1h0_n"
    t.float    "amph2h0_2r"
    t.float    "amph2h0_max"
    t.float    "amph2h0_min"
    t.float    "amph2h0_n"
    t.float    "amph3h0_2r"
    t.float    "amph3h0_max"
    t.float    "amph3h0_min"
    t.float    "amph3h0_n"
    t.float    "ampx1x0"
    t.float    "ampx2x0"
    t.float    "ampx3x0"
    t.float    "ampy1y2"
    t.float    "ampy2y3"
    t.float    "ampy3y1"
    t.float    "humidity"
    t.float    "oil_temp"
    t.float    "rated_current"
    t.string   "remarkhv_2r"
    t.string   "remarkhv_max"
    t.string   "remarkhv_min"
    t.string   "remarkhv_n"
    t.string   "remarklv"
    t.string   "remarktv"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "volth1h0_2r"
    t.float    "volth1h0_max"
    t.float    "volth1h0_min"
    t.float    "volth1h0_n"
    t.float    "volth2h0_2r"
    t.float    "volth2h0_max"
    t.float    "volth2h0_min"
    t.float    "volth2h0_n"
    t.float    "volth3h0_2r"
    t.float    "volth3h0_max"
    t.float    "volth3h0_min"
    t.float    "volth3h0_n"
    t.float    "voltx1x0"
    t.float    "voltx2x0"
    t.float    "voltx3x0"
    t.float    "volty1y2"
    t.float    "volty2y3"
    t.float    "volty3y1"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",  :precision => 10, :scale => 0
    t.decimal  "transformer",   :precision => 10, :scale => 0
  end

  create_table "elec_exc", :force => true do |t|
    t.float    "ac_amph1h0"
    t.float    "ac_amph1h0_2r"
    t.float    "ac_amph1h0_max"
    t.float    "ac_amph1h0_min"
    t.float    "ac_amph1h0_n"
    t.float    "ac_amph2h0"
    t.float    "ac_amph2h0_2r"
    t.float    "ac_amph2h0_max"
    t.float    "ac_amph2h0_min"
    t.float    "ac_amph2h0_n"
    t.float    "ac_amph3h0"
    t.float    "ac_amph3h0_2r"
    t.float    "ac_amph3h0_max"
    t.float    "ac_amph3h0_min"
    t.float    "ac_amph3h0_n"
    t.float    "ac_ampx1x0"
    t.float    "ac_ampx1x0_n"
    t.float    "ac_ampx2x0"
    t.float    "ac_ampx2x0_n"
    t.float    "ac_ampx3x0"
    t.float    "ac_ampx3x0_n"
    t.float    "ac_ampy1y2"
    t.float    "ac_ampy2y3"
    t.float    "ac_ampy3y1"
    t.float    "ac_kvhv"
    t.float    "ac_kvlv"
    t.float    "ac_volthv"
    t.float    "ac_voltlv"
    t.float    "ac_volttv"
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "humidity"
    t.string   "hv_max_tap"
    t.string   "hv_min_tap"
    t.string   "hv_tap"
    t.float    "oil_temp"
    t.float    "rated_current"
    t.string   "remarkhv"
    t.string   "remarkhv_2r"
    t.string   "remarkhv_max"
    t.string   "remarkhv_min"
    t.string   "remarkhv_n"
    t.string   "remarklv"
    t.string   "remarklv_n"
    t.string   "remarktv"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",   :precision => 10, :scale => 0
    t.decimal  "transformer",    :precision => 10, :scale => 0
  end

  create_table "elec_imp_single", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "amp1_2r"
    t.float    "amp1_max"
    t.float    "amp1_min"
    t.float    "amp1_n"
    t.float    "amp1_n_ht"
    t.float    "amp1_n_lt"
    t.float    "amp2_2r"
    t.float    "amp2_max"
    t.float    "amp2_min"
    t.float    "amp2_n"
    t.float    "amp2_n_ht"
    t.float    "amp2_n_lt"
    t.float    "amp3_2r"
    t.float    "amp3_max"
    t.float    "amp3_min"
    t.float    "amp3_n"
    t.float    "amp3_n_ht"
    t.float    "amp3_n_lt"
    t.float    "humidity"
    t.string   "max_tap"
    t.string   "min_tap"
    t.float    "oil_temp"
    t.float    "rate_imp1_2r"
    t.float    "rate_imp1_max"
    t.float    "rate_imp1_min"
    t.float    "rate_imp1_n"
    t.float    "rate_imp1_n_ht"
    t.float    "rate_imp1_n_lt"
    t.float    "rate_imp2_2r"
    t.float    "rate_imp2_max"
    t.float    "rate_imp2_min"
    t.float    "rate_imp2_n"
    t.float    "rate_imp2_n_ht"
    t.float    "rate_imp2_n_lt"
    t.float    "rate_imp3_2r"
    t.float    "rate_imp3_max"
    t.float    "rate_imp3_min"
    t.float    "rate_imp3_n"
    t.float    "rate_imp3_n_ht"
    t.float    "rate_imp3_n_lt"
    t.float    "rated_current"
    t.string   "test_by"
    t.string   "test_choice_2r"
    t.string   "test_choice_max"
    t.string   "test_choice_min"
    t.string   "test_choice_n"
    t.string   "test_choice_n_ht"
    t.string   "test_choice_n_lt"
    t.datetime "test_date"
    t.float    "volt1_2r"
    t.float    "volt1_max"
    t.float    "volt1_min"
    t.float    "volt1_n"
    t.float    "volt1_n_ht"
    t.float    "volt1_n_lt"
    t.float    "volt2_2r"
    t.float    "volt2_max"
    t.float    "volt2_min"
    t.float    "volt2_n"
    t.float    "volt2_n_ht"
    t.float    "volt2_n_lt"
    t.float    "volt3_2r"
    t.float    "volt3_max"
    t.float    "volt3_min"
    t.float    "volt3_n"
    t.float    "volt3_n_ht"
    t.float    "volt3_n_lt"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",     :precision => 10, :scale => 0
    t.decimal  "transformer",      :precision => 10, :scale => 0
  end

  create_table "elec_imp_three", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "amp1_2r"
    t.float    "amp1_max"
    t.float    "amp1_min"
    t.float    "amp1_n"
    t.float    "amp1_n_ht"
    t.float    "amp1_n_lt"
    t.float    "amp2_2r"
    t.float    "amp2_max"
    t.float    "amp2_min"
    t.float    "amp2_n"
    t.float    "amp2_n_ht"
    t.float    "amp2_n_lt"
    t.float    "amp3_2r"
    t.float    "amp3_max"
    t.float    "amp3_min"
    t.float    "amp3_n"
    t.float    "amp3_n_ht"
    t.float    "amp3_n_lt"
    t.float    "humidity"
    t.string   "impedance_from_2r"
    t.string   "impedance_from_max"
    t.string   "impedance_from_min"
    t.string   "impedance_from_n"
    t.string   "impedance_from_n_ht"
    t.string   "impedance_from_n_lt"
    t.string   "max_tap"
    t.string   "min_tap"
    t.float    "oil_temp"
    t.float    "rate_impedance_2r"
    t.float    "rate_impedance_max"
    t.float    "rate_impedance_min"
    t.float    "rate_impedance_n"
    t.float    "rate_impedance_n_ht"
    t.float    "rate_impedance_n_lt"
    t.float    "rated_kv"
    t.float    "tap_voltage_2r"
    t.float    "tap_voltage_max"
    t.float    "tap_voltage_min"
    t.float    "tap_voltage_n"
    t.float    "tap_voltage_n_ht"
    t.float    "tap_voltage_n_lt"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "volt1_2r"
    t.float    "volt1_max"
    t.float    "volt1_min"
    t.float    "volt1_n"
    t.float    "volt1_n_ht"
    t.float    "volt1_n_lt"
    t.float    "volt2_2r"
    t.float    "volt2_max"
    t.float    "volt2_min"
    t.float    "volt2_n"
    t.float    "volt2_n_ht"
    t.float    "volt2_n_lt"
    t.float    "volt3_2r"
    t.float    "volt3_max"
    t.float    "volt3_min"
    t.float    "volt3_n"
    t.float    "volt3_n_ht"
    t.float    "volt3_n_lt"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",        :precision => 10, :scale => 0
    t.decimal  "transformer",         :precision => 10, :scale => 0
  end

  create_table "elec_ins_auto", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "cap1"
    t.float    "cap2"
    t.float    "cap3"
    t.float    "cap4"
    t.float    "corpc"
    t.float    "current1"
    t.float    "current2"
    t.float    "current3"
    t.float    "current4"
    t.float    "humidity"
    t.float    "hv1"
    t.float    "hv10"
    t.float    "hv_test"
    t.float    "oil_temp"
    t.float    "rated_current"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "test_kv"
    t.float    "tv1"
    t.float    "tv10"
    t.float    "tv_test"
    t.float    "watt1"
    t.float    "watt2"
    t.float    "watt3"
    t.float    "watt4"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",  :precision => 10, :scale => 0
    t.decimal  "transformer",   :precision => 10, :scale => 0
  end

  create_table "elec_ins_three", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "cap1"
    t.float    "cap2"
    t.float    "cap3"
    t.float    "cap4"
    t.float    "cap5"
    t.float    "cap6"
    t.float    "corpc"
    t.float    "current1"
    t.float    "current2"
    t.float    "current3"
    t.float    "current4"
    t.float    "current5"
    t.float    "current6"
    t.float    "humidity"
    t.float    "hv1"
    t.float    "hv10"
    t.float    "hv_test"
    t.float    "lv1"
    t.float    "lv10"
    t.float    "lv_test"
    t.float    "oil_temp"
    t.float    "rated_current"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "test_kv"
    t.float    "tv1"
    t.float    "tv10"
    t.float    "tv_test"
    t.float    "watt1"
    t.float    "watt2"
    t.float    "watt3"
    t.float    "watt4"
    t.float    "watt5"
    t.float    "watt6"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",  :precision => 10, :scale => 0
    t.decimal  "transformer",   :precision => 10, :scale => 0
  end

  create_table "elec_ins_two", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "cap1"
    t.float    "cap2"
    t.float    "cap3"
    t.float    "cap4"
    t.float    "corpc"
    t.float    "current1"
    t.float    "current2"
    t.float    "current3"
    t.float    "current4"
    t.float    "humidity"
    t.float    "hv1"
    t.float    "hv10"
    t.float    "hv_test"
    t.float    "lv1"
    t.float    "lv10"
    t.float    "lv_test"
    t.float    "oil_temp"
    t.float    "rated_current"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "test_kv"
    t.float    "watt1"
    t.float    "watt2"
    t.float    "watt3"
    t.float    "watt4"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.decimal  "perform_type",  :precision => 10, :scale => 0
    t.decimal  "transformer",   :precision => 10, :scale => 0
  end

  create_table "elec_rat", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "h1h0ratio_2r"
    t.float    "h1h0ratio_max"
    t.float    "h1h0ratio_min"
    t.float    "h1h0ratio_n"
    t.float    "h1h0ratio_n_tv"
    t.float    "h2h0ratio_2r"
    t.float    "h2h0ratio_max"
    t.float    "h2h0ratio_min"
    t.float    "h2h0ratio_n"
    t.float    "h2h0ratio_n_tv"
    t.float    "h3h0ratio_2r"
    t.float    "h3h0ratio_max"
    t.float    "h3h0ratio_min"
    t.float    "h3h0ratio_n"
    t.float    "h3h0ratio_n_tv"
    t.float    "humidity"
    t.string   "max_tap"
    t.string   "min_tap"
    t.float    "oil_temp"
    t.float    "rated_current"
    t.string   "remark_2r"
    t.string   "remark_lv_tv"
    t.string   "remark_max"
    t.string   "remark_min"
    t.string   "remark_n"
    t.string   "remark_n_tv"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "volthv_2r"
    t.float    "volthv_hv_tv"
    t.float    "volthv_lv_tv"
    t.float    "volthv_max"
    t.float    "volthv_min"
    t.float    "volthv_n"
    t.float    "voltlv_2r"
    t.float    "voltlv_hv_tv"
    t.float    "voltlv_lv_tv"
    t.float    "voltlv_max"
    t.float    "voltlv_min"
    t.float    "voltlv_n"
    t.float    "wdg_temp"
    t.string   "weather"
    t.string   "work_order"
    t.float    "x1x0ratio_lv_tv"
    t.float    "x2x0ratio_lv_tv"
    t.float    "x3x0ratio_lv_tv"
    t.decimal  "perform_type",    :precision => 10, :scale => 0
    t.decimal  "transformer",     :precision => 10, :scale => 0
  end

  create_table "equipment", :force => true do |t|
    t.integer "version"
    t.string  "name"
    t.decimal "equipment_group", :precision => 10, :scale => 0
  end

  create_table "equipment_group", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "failure_condition", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "failure_condition_detail", :force => true do |t|
    t.integer "version"
    t.string  "detail"
    t.integer "is_other"
    t.decimal "failure_condition", :precision => 10, :scale => 0
  end

  create_table "fruits", :force => true do |t|
    t.integer "version"
  end

  create_table "furan_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.float    "start"
    t.float    "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "furans", :force => true do |t|
    t.float    "acf"
    t.float    "fal"
    t.float    "fol"
    t.float    "hmf"
    t.float    "mef"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "perform_type",   :precision => 10, :scale => 0
    t.integer  "transformer_id"
    t.string   "test_type"
  end

  create_table "gas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "general_condition", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "animal_protect",   :precision => 10, :scale => 0
    t.decimal  "foundation",       :precision => 10, :scale => 0
    t.decimal  "ground_connector", :precision => 10, :scale => 0
    t.decimal  "percentload",      :precision => 10, :scale => 0
    t.decimal  "perform_type",     :precision => 10, :scale => 0
    t.decimal  "sound",            :precision => 10, :scale => 0
    t.decimal  "transformer",      :precision => 10, :scale => 0
    t.decimal  "vibration",        :precision => 10, :scale => 0
  end

  create_table "general_condition_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "general_conditions", :force => true do |t|
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "animal_protect",       :precision => 10, :scale => 0
    t.decimal  "foundation",           :precision => 10, :scale => 0
    t.decimal  "ground_connector",     :precision => 10, :scale => 0
    t.decimal  "maxload",              :precision => 10, :scale => 0
    t.decimal  "perform_type",         :precision => 10, :scale => 0
    t.decimal  "sound",                :precision => 10, :scale => 0
    t.decimal  "transformer_id",       :precision => 10, :scale => 0
    t.decimal  "vibration",            :precision => 10, :scale => 0
    t.integer  "visual_inspection_id"
  end

  create_table "hif_of_oil_dgas", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "percent_dgaf_start"
    t.integer  "percent_dgaf_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
  end

  create_table "hot_line_oil_filter", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "corrosion",    :precision => 10, :scale => 0
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "pressure",     :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "hot_line_oil_filter_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hot_line_oil_filters", :force => true do |t|
    t.decimal "corrosion",            :precision => 10, :scale => 0
    t.decimal "pressure",             :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "importance_indices", :force => true do |t|
    t.integer  "start"
    t.integer  "end"
    t.string   "importance"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspection", :force => true do |t|
    t.integer "version"
    t.string  "name"
    t.string  "perform_name"
    t.integer "wi"
  end

  create_table "inspection_detail", :force => true do |t|
    t.integer "version"
    t.string  "color"
    t.string  "description"
    t.integer "score"
    t.decimal "visual_inspection", :precision => 10, :scale => 0
  end

  create_table "insulating_oil_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insulating_oil_weights", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insulating_oils", :force => true do |t|
    t.integer  "version"
    t.float    "ambient_temp"
    t.float    "cf"
    t.float    "current_avg_maintank"
    t.float    "current_avg_oltc"
    t.float    "gap_distance_maintank"
    t.float    "gap_distance_oltc"
    t.float    "humidity"
    t.float    "oil_temp"
    t.string   "remark_maintank"
    t.string   "remark_oltc"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "watt_avg_maintank"
    t.float    "watt_avg_oltc"
    t.string   "work_order"
    t.float    "xi1_maintank"
    t.float    "xi1_oltc"
    t.float    "xi2_maintank"
    t.float    "xi2_oltc"
    t.float    "xi3_maintank"
    t.float    "xi3_oltc"
    t.float    "xi4_maintank"
    t.float    "xi4_oltc"
    t.float    "xi5_maintank"
    t.float    "xi5_oltc"
    t.decimal  "perform_type",          :precision => 10, :scale => 0
    t.string   "test_type"
    t.integer  "transformer_id"
    t.integer  "test_kv_maintank"
    t.integer  "test_kv_oltc"
  end

  create_table "lightning_arrester", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "ground_connector_hv", :precision => 10, :scale => 0
    t.decimal  "ground_connector_lv", :precision => 10, :scale => 0
    t.decimal  "ground_connector_tv", :precision => 10, :scale => 0
    t.decimal  "leakage_current_hv",  :precision => 10, :scale => 0
    t.decimal  "leakage_current_lv",  :precision => 10, :scale => 0
    t.decimal  "leakage_current_tv",  :precision => 10, :scale => 0
    t.decimal  "perform_type",        :precision => 10, :scale => 0
    t.decimal  "pocelain_clean_hv",   :precision => 10, :scale => 0
    t.decimal  "pocelain_clean_lv",   :precision => 10, :scale => 0
    t.decimal  "pocelain_clean_tv",   :precision => 10, :scale => 0
    t.decimal  "pocelain_status_hv",  :precision => 10, :scale => 0
    t.decimal  "pocelain_status_lv",  :precision => 10, :scale => 0
    t.decimal  "pocelain_status_tv",  :precision => 10, :scale => 0
    t.decimal  "transformer",         :precision => 10, :scale => 0
  end

  create_table "load_history", :force => true do |t|
    t.integer  "version"
    t.integer  "n0"
    t.integer  "n1"
    t.integer  "n2"
    t.integer  "n3"
    t.integer  "n4"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "load_history_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "load_pattern_factors", :force => true do |t|
    t.integer  "start"
    t.integer  "end"
    t.integer  "score"
    t.string   "score_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "load_pattern_per_years", :force => true do |t|
    t.integer  "lteq_0_pt_6"
    t.integer  "gt_0_pt_6_and_lteq_1"
    t.integer  "gt_1_and_lteq_1_pt_2"
    t.integer  "gt_1_pt_2_and_lteq_1_pt_5"
    t.integer  "gt_1_pt_5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transformer_information_id"
    t.integer  "load_pattern_factor_id"
  end

  create_table "main_tank_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_tanks", :force => true do |t|
    t.decimal "corrosion",            :precision => 10, :scale => 0
    t.decimal "oil_fail",             :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "maintank", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "corrosion",    :precision => 10, :scale => 0
    t.decimal  "oil_fail",     :precision => 10, :scale => 0
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "manufacturer", :force => true do |t|
    t.string  "address"
    t.integer "version"
    t.string  "name"
    t.string  "tel_no"
  end

  create_table "n1_criterias", :force => true do |t|
    t.string   "value"
    t.integer  "score"
    t.string   "score_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ngr", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "base_status",      :precision => 10, :scale => 0
    t.decimal  "ground_connector", :precision => 10, :scale => 0
    t.decimal  "ngr_status",       :precision => 10, :scale => 0
    t.decimal  "perform_type",     :precision => 10, :scale => 0
    t.decimal  "pocelain_clean",   :precision => 10, :scale => 0
    t.decimal  "transformer",      :precision => 10, :scale => 0
  end

  create_table "ngr_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ngrs", :force => true do |t|
    t.decimal "base_status",          :precision => 10, :scale => 0
    t.decimal "ground_connector",     :precision => 10, :scale => 0
    t.decimal "ngr_status",           :precision => 10, :scale => 0
    t.decimal "pocelain_clean",       :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "oil_aging", :force => true do |t|
    t.integer  "version"
    t.float    "ift"
    t.float    "nn"
    t.float    "pf100"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "oil_contamination_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oil_contaminations", :force => true do |t|
    t.integer  "version"
    t.float    "color"
    t.float    "ift"
    t.float    "nn"
    t.float    "pf100"
    t.float    "pf20"
    t.string   "test_by"
    t.datetime "test_date"
    t.integer  "water_content"
    t.string   "work_order"
    t.integer  "transformer_id"
    t.integer  "test_type"
  end

  create_table "oil_dga", :force => true do |t|
    t.integer  "version"
    t.float    "c2h2"
    t.float    "c2h4"
    t.float    "c2h6"
    t.float    "c3h6"
    t.float    "c3h8"
    t.float    "ch4"
    t.float    "co"
    t.float    "co2"
    t.float    "h2"
    t.float    "n2"
    t.float    "o2"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "oil_dgas", :force => true do |t|
    t.string   "test_type"
    t.date     "test_date"
    t.string   "work_order"
    t.integer  "co2"
    t.integer  "co2_score"
    t.integer  "co"
    t.integer  "co_score"
    t.integer  "h2"
    t.integer  "h2_score"
    t.integer  "ch4"
    t.integer  "ch4_score"
    t.integer  "c2h2"
    t.integer  "c2h2_score"
    t.integer  "c2h4"
    t.integer  "c2h4_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "c2h6"
    t.integer  "c2h6_score"
    t.integer  "transformer_id"
    t.integer  "c3h6"
    t.integer  "c3h8"
    t.integer  "o2"
    t.integer  "n2"
  end

  create_table "oil_qualities", :force => true do |t|
    t.string   "name"
    t.integer  "u_start"
    t.integer  "u_end"
    t.float    "start"
    t.float    "end"
    t.integer  "score"
    t.integer  "weight"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oil_quality_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_compartment", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "corrosion",    :precision => 10, :scale => 0
    t.decimal  "oil_fail",     :precision => 10, :scale => 0
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "oltc_compartment_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_compartments", :force => true do |t|
    t.decimal "corrosion",            :precision => 10, :scale => 0
    t.decimal "oil_fail",             :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "oltc_contact", :force => true do |t|
    t.integer  "version"
    t.float    "moving_a"
    t.float    "moving_b"
    t.float    "moving_c"
    t.float    "r1_a"
    t.float    "r1_b"
    t.float    "r1_c"
    t.float    "r2_a"
    t.float    "r2_b"
    t.float    "r2_c"
    t.float    "station_a"
    t.float    "station_b"
    t.float    "station_c"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "oltc_type",    :precision => 10, :scale => 0
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "oltc_control_cab", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "animal",           :precision => 10, :scale => 0
    t.decimal  "control_humidity", :precision => 10, :scale => 0
    t.decimal  "corrosion",        :precision => 10, :scale => 0
    t.decimal  "perform_type",     :precision => 10, :scale => 0
    t.decimal  "pragen",           :precision => 10, :scale => 0
    t.decimal  "transformer",      :precision => 10, :scale => 0
    t.decimal  "wiring_control",   :precision => 10, :scale => 0
  end

  create_table "oltc_control_cabinet_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_control_cabinets", :force => true do |t|
    t.decimal "animal",               :precision => 10, :scale => 0
    t.decimal "control_humidity",     :precision => 10, :scale => 0
    t.decimal "corrosion",            :precision => 10, :scale => 0
    t.decimal "pragen",               :precision => 10, :scale => 0
    t.decimal "wiring_control",       :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "oltc_dga_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.string   "status"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_dgas", :force => true do |t|
    t.float    "c2h2"
    t.float    "c2h4"
    t.float    "c2h6"
    t.float    "ch4"
    t.float    "h2"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "oltc_type",      :precision => 10, :scale => 0
    t.decimal  "transformer_id", :precision => 10, :scale => 0
    t.float    "c3h6"
    t.string   "status"
    t.string   "test_type"
  end

  create_table "oltc_dielectric_property_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_model", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "oltc_oil_contamination_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_oil_contaminations", :force => true do |t|
    t.integer  "version"
    t.float    "color"
    t.string   "test_by"
    t.datetime "test_date"
    t.integer  "water_content"
    t.string   "work_order"
    t.decimal  "oltc_type",      :precision => 10, :scale => 0
    t.integer  "transformer_id"
    t.integer  "test_type"
  end

  create_table "oltc_oil_qualities", :force => true do |t|
    t.string   "name"
    t.integer  "u_start"
    t.integer  "u_end"
    t.float    "start"
    t.float    "end"
    t.integer  "score"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id"
  end

  create_table "oltc_oil_quality_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oltc_type", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "overall_condition_weights", :force => true do |t|
    t.string   "name"
    t.string   "text"
    t.string   "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perform_draft_result", :force => true do |t|
    t.float   "activehv"
    t.string  "activehvcolor"
    t.float   "activelv"
    t.string  "activelvcolor"
    t.float   "activetv"
    t.string  "activetvcolor"
    t.float   "activepart"
    t.string  "activepart_color"
    t.integer "version"
    t.float   "arresterhv"
    t.string  "arresterhvcolor"
    t.float   "arresterlv"
    t.string  "arresterlvcolor"
    t.float   "arrestertv"
    t.string  "arrestertvcolor"
    t.float   "bushinghv"
    t.string  "bushinghvcolor"
    t.float   "bushinglv"
    t.string  "bushinglvcolor"
    t.float   "bushingtv"
    t.string  "bushingtvcolor"
    t.float   "eleccor"
    t.string  "eleccor_color"
    t.float   "elecdcrhv1"
    t.string  "elecdcrhv1color"
    t.float   "elecdcrhv2"
    t.string  "elecdcrhv2color"
    t.float   "elecdcrlv1"
    t.string  "elecdcrlv1color"
    t.float   "elecdcrlv2"
    t.string  "elecdcrlv2color"
    t.float   "elecdcrtv1"
    t.string  "elecdcrtv1color"
    t.float   "elecdcrtv2"
    t.string  "elecdcrtv2color"
    t.float   "elecexchv1"
    t.string  "elecexchv1color"
    t.float   "elecexchv2"
    t.string  "elecexchv2color"
    t.float   "elecexclv1"
    t.string  "elecexclv1color"
    t.float   "elecexclv2"
    t.string  "elecexclv2color"
    t.float   "elecexctv"
    t.string  "elecexctvcolor"
    t.float   "elecimpsinglehl"
    t.string  "elecimpsinglehlcolor"
    t.float   "elecimpsingleht"
    t.string  "elecimpsinglehtcolor"
    t.float   "elecimpsinglelt"
    t.string  "elecimpsingleltcolor"
    t.float   "elecimpthreehl"
    t.string  "elecimpthreehlcolor"
    t.float   "elecimpthreeht"
    t.string  "elecimpthreehtcolor"
    t.float   "elecimpthreelt"
    t.string  "elecimpthreeltcolor"
    t.float   "elecinsautohv"
    t.string  "elecinsautohvcolor"
    t.float   "elecinsautotv"
    t.string  "elecinsautotvcolor"
    t.float   "elecinsthreehv"
    t.string  "elecinsthreehvcolor"
    t.float   "elecinsthreelv"
    t.string  "elecinsthreelvcolor"
    t.float   "elecinsthreetv"
    t.string  "elecinsthreetvcolor"
    t.float   "elecinstwohv"
    t.string  "elecinstwohvcolor"
    t.float   "elecinstwolv"
    t.string  "elecinstwolvcolor"
    t.float   "elecrathl"
    t.string  "elecrathlcolor"
    t.float   "elecratht"
    t.string  "elecrathtcolor"
    t.float   "elecratlt"
    t.string  "elecratltcolor"
    t.float   "oilaging"
    t.string  "oilaging_color"
    t.float   "oilcontamination"
    t.string  "oilcontamination_color"
    t.float   "oildga"
    t.string  "oildga_color"
    t.float   "oilfuran"
    t.string  "oilfuran_color"
    t.float   "oilpart"
    t.string  "oilpart_color"
    t.float   "oltccontact"
    t.string  "oltccontact_color"
    t.float   "oltcdga"
    t.string  "oltcdga_color"
    t.float   "oltcdielectric"
    t.string  "oltcdielectric_color"
    t.float   "oltcoilcontamination"
    t.string  "oltcoilcontamination_color"
    t.float   "oltcpart"
    t.string  "oltcpart_color"
    t.float   "overall"
    t.string  "overall_color"
    t.integer "quater"
    t.string  "recordyear"
    t.float   "vbushing"
    t.string  "vbushing_color"
    t.float   "vconservator"
    t.string  "vconservator_color"
    t.float   "vgeneral"
    t.string  "vgeneral_color"
    t.float   "vhotline"
    t.string  "vhotline_color"
    t.float   "vlightning"
    t.string  "vlightning_color"
    t.float   "vloadhistory"
    t.string  "vloadhistory_color"
    t.float   "vmaintank"
    t.string  "vmaintank_color"
    t.float   "vngr"
    t.string  "vngr_color"
    t.float   "voilquality"
    t.string  "voilquality_color"
    t.float   "voltccompartment"
    t.string  "voltccompartment_color"
    t.float   "voltccontrolcab"
    t.string  "voltccontrolcab_color"
    t.float   "voltcdga"
    t.string  "voltcdga_color"
    t.float   "voltcoilquality"
    t.string  "voltcoilquality_color"
    t.float   "vpowerfactor"
    t.string  "vpowerfactor_color"
    t.float   "vradiatorcooling"
    t.string  "vradiatorcooling_color"
    t.float   "vregulatingpt"
    t.string  "vregulatingpt_color"
    t.float   "vthermoscan"
    t.string  "vthermoscan_color"
    t.float   "vtranscontrolcab"
    t.string  "vtranscontrolcab_color"
    t.decimal "transformer",                :precision => 10, :scale => 0
  end

  create_table "perform_part", :force => true do |t|
    t.integer "version"
    t.string  "name"
    t.float   "wf"
    t.decimal "perform_group", :precision => 10, :scale => 0
  end

  create_table "perform_score", :force => true do |t|
    t.integer "version"
    t.string  "evaluation"
    t.string  "more_perform"
    t.float   "score1max"
    t.string  "score1meaning"
    t.float   "score1min"
    t.float   "score2max"
    t.string  "score2meaning"
    t.float   "score2min"
    t.float   "score3max"
    t.string  "score3meaning"
    t.float   "score3min"
    t.float   "score4max"
    t.string  "score4meaning"
    t.float   "score4min"
    t.float   "score5max"
    t.string  "score5meaning"
    t.float   "score5min"
    t.float   "score6max"
    t.string  "score6meaning"
    t.float   "score6min"
    t.string  "variable"
    t.float   "variable_max"
    t.float   "variable_min"
    t.integer "wi"
    t.decimal "perform_group", :precision => 10, :scale => 0
    t.decimal "sub_group",     :precision => 10, :scale => 0
  end

  create_table "perform_sub_group", :force => true do |t|
    t.integer "version"
    t.string  "color"
    t.integer "hi_factor"
    t.float   "lower_bound"
    t.string  "meaning"
    t.string  "name"
    t.float   "upper_bound"
    t.decimal "perform_group", :precision => 10, :scale => 0
  end

  create_table "perform_type", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "performance_group", :force => true do |t|
    t.integer "version"
    t.string  "color"
    t.string  "description"
    t.float   "lower_bound"
    t.string  "meaning"
    t.string  "name"
    t.float   "upper_bound"
  end

  create_table "person", :force => true do |t|
    t.string  "authority_enum"
    t.integer "version"
    t.string  "department"
    t.string  "description"
    t.string  "name"
    t.string  "password"
    t.string  "username"
  end

  create_table "pollutions", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "score_message"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "power_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.float    "start"
    t.float    "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "probability_of_force_outages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "score_message"
    t.integer  "start"
    t.integer  "end"
  end

  create_table "public_images", :force => true do |t|
    t.string   "value"
    t.integer  "score"
    t.string   "score_message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "radiator_cooling", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "animal",       :precision => 10, :scale => 0
    t.decimal  "corrosion",    :precision => 10, :scale => 0
    t.decimal  "noise_level",  :precision => 10, :scale => 0
    t.decimal  "oil_fail",     :precision => 10, :scale => 0
    t.decimal  "oil_pump",     :precision => 10, :scale => 0
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "radiator_cooling_system_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "radiator_cooling_systems", :force => true do |t|
    t.decimal "animal",               :precision => 10, :scale => 0
    t.decimal "corrosion",            :precision => 10, :scale => 0
    t.decimal "noise_level",          :precision => 10, :scale => 0
    t.decimal "oil_fail",             :precision => 10, :scale => 0
    t.decimal "oil_pump",             :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "regulating_pt_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regulating_pts", :force => true do |t|
    t.decimal "oil_color",            :precision => 10, :scale => 0
    t.decimal "oil_fail",             :precision => 10, :scale => 0
    t.decimal "oil_level",            :precision => 10, :scale => 0
    t.decimal "pocelain_clean",       :precision => 10, :scale => 0
    t.decimal "pocelain_status",      :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "regulatingpt", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "oil_color",       :precision => 10, :scale => 0
    t.decimal  "oil_fail",        :precision => 10, :scale => 0
    t.decimal  "oil_level",       :precision => 10, :scale => 0
    t.decimal  "perform_type",    :precision => 10, :scale => 0
    t.decimal  "pocelain_clean",  :precision => 10, :scale => 0
    t.decimal  "pocelain_status", :precision => 10, :scale => 0
    t.decimal  "transformer",     :precision => 10, :scale => 0
  end

  create_table "report", :force => true do |t|
    t.integer  "version"
    t.datetime "down_date"
    t.string   "down_time"
    t.datetime "incident_date"
    t.integer  "oltc_count"
    t.string   "reporter"
    t.datetime "up_date"
    t.string   "up_time"
    t.string   "work_order"
    t.decimal  "ab_environment", :precision => 10, :scale => 0
    t.decimal  "damage_data",    :precision => 10, :scale => 0
    t.decimal  "environment",    :precision => 10, :scale => 0
    t.decimal  "equipment",      :precision => 10, :scale => 0
    t.decimal  "failure_mode",   :precision => 10, :scale => 0
    t.decimal  "maintenance",    :precision => 10, :scale => 0
    t.decimal  "real_cause",     :precision => 10, :scale => 0
    t.decimal  "station",        :precision => 10, :scale => 0
    t.decimal  "transformer",    :precision => 10, :scale => 0
  end

  create_table "risk_probabilities", :force => true do |t|
    t.integer  "start"
    t.integer  "end"
    t.string   "probability_of_failure"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "risks", :force => true do |t|
    t.integer "start"
    t.integer "end"
    t.string  "risk"
    t.string  "action"
  end

  create_table "social_aspects", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "score_message"
  end

  create_table "station", :force => true do |t|
    t.integer "version"
    t.string  "full_name"
    t.integer "kv"
    t.string  "name"
    t.string  "region"
  end

  create_table "stations", :force => true do |t|
    t.integer  "version"
    t.string   "full_name"
    t.integer  "kv"
    t.string   "name"
    t.string   "region"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sun_flower", :force => true do |t|
    t.integer "version"
    t.string  "owner"
  end

  create_table "surge_arrester_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surge_arresters", :force => true do |t|
    t.decimal "ground_connector_hv",  :precision => 10, :scale => 0
    t.decimal "ground_connector_lv",  :precision => 10, :scale => 0
    t.decimal "ground_connector_tv",  :precision => 10, :scale => 0
    t.decimal "porcelain_clean_hv",   :precision => 10, :scale => 0
    t.decimal "porcelain_clean_lv",   :precision => 10, :scale => 0
    t.decimal "porcelain_clean_tv",   :precision => 10, :scale => 0
    t.decimal "porcelain_status_hv",  :precision => 10, :scale => 0
    t.decimal "porcelain_status_lv",  :precision => 10, :scale => 0
    t.decimal "porcelain_status_tv",  :precision => 10, :scale => 0
    t.decimal "transformer",          :precision => 10, :scale => 0
    t.integer "surge_counter_hv"
    t.integer "surge_counter_lv"
    t.integer "surge_counter_tv"
    t.integer "visual_inspection_id"
  end

  create_table "system_fault_levels", :force => true do |t|
    t.integer  "start"
    t.integer  "end"
    t.integer  "score"
    t.string   "score_message"
    t.integer  "bus_voltage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_locations", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "score_message"
  end

  create_table "system_stabilities", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "score_message"
  end

  create_table "tarrester", :force => true do |t|
    t.integer  "version"
    t.float    "currenth1"
    t.float    "currenth2"
    t.float    "currenth3"
    t.float    "currentx1"
    t.float    "currentx2"
    t.float    "currentx3"
    t.float    "currenty1"
    t.float    "currenty2"
    t.float    "currenty3"
    t.float    "leakage_firsth1"
    t.float    "leakage_firsth2"
    t.float    "leakage_firsth3"
    t.float    "leakage_firstx1"
    t.float    "leakage_firstx2"
    t.float    "leakage_firstx3"
    t.float    "leakage_firsty1"
    t.float    "leakage_firsty2"
    t.float    "leakage_firsty3"
    t.float    "leakageh1"
    t.float    "leakageh2"
    t.float    "leakageh3"
    t.float    "leakagex1"
    t.float    "leakagex2"
    t.float    "leakagex3"
    t.float    "leakagey1"
    t.float    "leakagey2"
    t.float    "leakagey3"
    t.float    "ohm_firsth1"
    t.float    "ohm_firsth2"
    t.float    "ohm_firsth3"
    t.float    "ohm_firstx1"
    t.float    "ohm_firstx2"
    t.float    "ohm_firstx3"
    t.float    "ohm_firsty1"
    t.float    "ohm_firsty2"
    t.float    "ohm_firsty3"
    t.float    "ohmh1"
    t.float    "ohmh2"
    t.float    "ohmh3"
    t.float    "ohmx1"
    t.float    "ohmx2"
    t.float    "ohmx3"
    t.float    "ohmy1"
    t.float    "ohmy2"
    t.float    "ohmy3"
    t.string   "serialh1"
    t.string   "serialh2"
    t.string   "serialh3"
    t.string   "serialx1"
    t.string   "serialx2"
    t.string   "serialx3"
    t.string   "serialy1"
    t.string   "serialy2"
    t.string   "serialy3"
    t.string   "test_by"
    t.datetime "test_date"
    t.integer  "test_kv"
    t.float    "watt_firsth1"
    t.float    "watt_firsth2"
    t.float    "watt_firsth3"
    t.float    "watt_firstx1"
    t.float    "watt_firstx2"
    t.float    "watt_firstx3"
    t.float    "watt_firsty1"
    t.float    "watt_firsty2"
    t.float    "watt_firsty3"
    t.float    "watth1"
    t.float    "watth2"
    t.float    "watth3"
    t.float    "wattx1"
    t.float    "wattx2"
    t.float    "wattx3"
    t.float    "watty1"
    t.float    "watty2"
    t.float    "watty3"
    t.string   "work_order"
    t.decimal  "perform_type",    :precision => 10, :scale => 0
    t.decimal  "transformer",     :precision => 10, :scale => 0
  end

  create_table "tbushing", :force => true do |t|
    t.integer  "version"
    t.float    "capc1h0"
    t.float    "capc1h1"
    t.float    "capc1h2"
    t.float    "capc1h3"
    t.float    "capc1x0"
    t.float    "capc1x1"
    t.float    "capc1x2"
    t.float    "capc1x3"
    t.float    "capc1y1"
    t.float    "capc1y2"
    t.float    "capc1y3"
    t.float    "capc2h0"
    t.float    "capc2h1"
    t.float    "capc2h2"
    t.float    "capc2h3"
    t.float    "capc2x0"
    t.float    "capc2x1"
    t.float    "capc2x2"
    t.float    "capc2x3"
    t.float    "capc2y1"
    t.float    "capc2y2"
    t.float    "capc2y3"
    t.float    "corb"
    t.float    "currentc1h0"
    t.float    "currentc1h1"
    t.float    "currentc1h2"
    t.float    "currentc1h3"
    t.float    "currentc1x0"
    t.float    "currentc1x1"
    t.float    "currentc1x2"
    t.float    "currentc1x3"
    t.float    "currentc1y1"
    t.float    "currentc1y2"
    t.float    "currentc1y3"
    t.float    "currentc2h0"
    t.float    "currentc2h1"
    t.float    "currentc2h2"
    t.float    "currentc2h3"
    t.float    "currentc2x0"
    t.float    "currentc2x1"
    t.float    "currentc2x2"
    t.float    "currentc2x3"
    t.float    "currentc2y1"
    t.float    "currentc2y2"
    t.float    "currentc2y3"
    t.string   "serialh0"
    t.string   "serialh1"
    t.string   "serialh2"
    t.string   "serialh3"
    t.string   "serialx0"
    t.string   "serialx1"
    t.string   "serialx2"
    t.string   "serialx3"
    t.string   "serialy1"
    t.string   "serialy2"
    t.string   "serialy3"
    t.string   "test_by"
    t.datetime "test_date"
    t.float    "test_kv"
    t.float    "wattc1h0"
    t.float    "wattc1h1"
    t.float    "wattc1h2"
    t.float    "wattc1h3"
    t.float    "wattc1x0"
    t.float    "wattc1x1"
    t.float    "wattc1x2"
    t.float    "wattc1x3"
    t.float    "wattc1y1"
    t.float    "wattc1y2"
    t.float    "wattc1y3"
    t.float    "wattc2h0"
    t.float    "wattc2h1"
    t.float    "wattc2h2"
    t.float    "wattc2h3"
    t.float    "wattc2x0"
    t.float    "wattc2x1"
    t.float    "wattc2x2"
    t.float    "wattc2x3"
    t.float    "wattc2y1"
    t.float    "wattc2y2"
    t.float    "wattc2y3"
    t.string   "work_order"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "thermo_scan", :force => true do |t|
    t.integer  "version"
    t.float    "delt"
    t.float    "load"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "perform_type", :precision => 10, :scale => 0
    t.decimal  "transformer",  :precision => 10, :scale => 0
  end

  create_table "thermo_scan_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "load_start"
    t.integer  "load_end"
    t.integer  "delta_start"
    t.integer  "delta_end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thermo_scans", :force => true do |t|
    t.float   "delt"
    t.float   "load"
    t.integer "visual_inspection_id"
  end

  create_table "tran_status", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "trans_control_cab", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "animal",           :precision => 10, :scale => 0
    t.decimal  "control_humidity", :precision => 10, :scale => 0
    t.decimal  "corrosion",        :precision => 10, :scale => 0
    t.decimal  "perform_type",     :precision => 10, :scale => 0
    t.decimal  "pragen",           :precision => 10, :scale => 0
    t.decimal  "transformer",      :precision => 10, :scale => 0
    t.decimal  "wiring_control",   :precision => 10, :scale => 0
  end

  create_table "transformer", :force => true do |t|
    t.integer  "version"
    t.string   "contract"
    t.string   "detail"
    t.string   "egatsn"
    t.datetime "first_energize"
    t.float    "hv"
    t.integer  "item"
    t.float    "lv"
    t.string   "manufacturingserial"
    t.float    "maxcapacity"
    t.string   "old_egatsn"
    t.integer  "phase"
    t.string   "picture"
    t.string   "transformer_name"
    t.float    "tv"
    t.string   "vector_group"
    t.decimal  "first_substation",    :precision => 10, :scale => 0
    t.decimal  "manufacturing",       :precision => 10, :scale => 0
    t.decimal  "status",              :precision => 10, :scale => 0
    t.decimal  "winding_type_id",     :precision => 10, :scale => 0
    t.integer  "brand_id"
    t.string   "position"
    t.string   "oltc_manufacturer"
    t.string   "oltc_type"
  end

  add_index "transformer", ["transformer_name"], :name => "transformer_name"

  create_table "transformer_control_cabinet_factors", :force => true do |t|
    t.integer  "hi_factor"
    t.string   "condition"
    t.integer  "start"
    t.integer  "end"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transformer_control_cabinets", :force => true do |t|
    t.decimal "animal",               :precision => 10, :scale => 0
    t.decimal "control_humidity",     :precision => 10, :scale => 0
    t.decimal "corrosion",            :precision => 10, :scale => 0
    t.decimal "pragen",               :precision => 10, :scale => 0
    t.decimal "wiring_control",       :precision => 10, :scale => 0
    t.integer "visual_inspection_id"
  end

  create_table "transformer_history_move", :force => true do |t|
    t.integer  "version"
    t.string   "move_by"
    t.datetime "move_date"
    t.string   "new_name"
    t.string   "old_name"
    t.decimal  "newstation",  :precision => 10, :scale => 0
    t.decimal  "oldstation",  :precision => 10, :scale => 0
    t.decimal  "transformer", :precision => 10, :scale => 0
  end

  create_table "transformer_informations", :force => true do |t|
    t.integer  "bus_voltage_hv_id"
    t.integer  "bus_voltage_lv_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "system_fault_level_hv"
    t.float    "system_fault_level_lv"
    t.integer  "probability_of_force_outage_id"
    t.integer  "social_aspect_id"
    t.integer  "system_location_id"
    t.integer  "application_use_id"
    t.integer  "system_stability_id"
    t.integer  "pollution_id"
    t.integer  "n1_criteria_id"
    t.integer  "public_image_id"
    t.integer  "system_fault_level_id"
    t.integer  "transformer_id"
    t.date     "recorded_date"
    t.integer  "bus_voltage_id"
    t.float    "overall_condition"
    t.integer  "probability_of_force_outage_value"
    t.boolean  "recent"
  end

  create_table "visual_bushing", :force => true do |t|
    t.integer  "version"
    t.string   "test_by"
    t.datetime "test_date"
    t.string   "work_order"
    t.decimal  "oil_color_hv",       :precision => 10, :scale => 0
    t.decimal  "oil_color_lv",       :precision => 10, :scale => 0
    t.decimal  "oil_color_tv",       :precision => 10, :scale => 0
    t.decimal  "oil_fail_hv",        :precision => 10, :scale => 0
    t.decimal  "oil_fail_lv",        :precision => 10, :scale => 0
    t.decimal  "oil_fail_tv",        :precision => 10, :scale => 0
    t.decimal  "oil_level_hv",       :precision => 10, :scale => 0
    t.decimal  "oil_level_lv",       :precision => 10, :scale => 0
    t.decimal  "oil_level_tv",       :precision => 10, :scale => 0
    t.decimal  "perform_type",       :precision => 10, :scale => 0
    t.decimal  "pocelain_clean_hv",  :precision => 10, :scale => 0
    t.decimal  "pocelain_clean_lv",  :precision => 10, :scale => 0
    t.decimal  "pocelain_clean_tv",  :precision => 10, :scale => 0
    t.decimal  "pocelain_status_hv", :precision => 10, :scale => 0
    t.decimal  "pocelain_status_lv", :precision => 10, :scale => 0
    t.decimal  "pocelain_status_tv", :precision => 10, :scale => 0
    t.decimal  "transformer",        :precision => 10, :scale => 0
  end

  create_table "visual_inspection_conditions", :force => true do |t|
    t.string   "description"
    t.integer  "start"
    t.integer  "end"
    t.string   "condition"
    t.string   "name"
    t.string   "table_name"
    t.integer  "score"
    t.string   "score_message"
    t.integer  "weight"
    t.integer  "visual_inspection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visual_inspection_conditions", ["name"], :name => "name"
  add_index "visual_inspection_conditions", ["table_name"], :name => "table_name"

  create_table "visual_inspections", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "test_type"
    t.string   "test_by"
    t.date     "test_date"
    t.string   "oltc_counter"
    t.string   "work_order"
    t.integer  "transformer_id"
  end

  create_table "web_link", :force => true do |t|
    t.integer "version"
  end

  create_table "web_tool", :force => true do |t|
    t.integer "version"
  end

  create_table "winding_type", :force => true do |t|
    t.integer "version"
    t.string  "description"
  end

  create_table "winding_types", :force => true do |t|
    t.string "description"
  end

end
