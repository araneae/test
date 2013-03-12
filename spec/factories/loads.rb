# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :load do
    is_cross_country {false}

    # pickup 
    pickup_date {Date.new(2013, 01, 31)}
    pickup_start_time {36000}
    pickup_end_time {36360}
    pickup_start_time_utc {DateTime.new(2013, 01, 31, 10, 10, 10)}
    pickup_end_time_utc {DateTime.new(2013, 01, 01, 12, 10, 00)}
    is_pickup_flexible {false}
    pickup_flexible_days {0}

    # delivery
    delivery_date {Date.new(2013, 02, 15)}
    delivery_start_time {36000}
    delivery_end_time {36360}
    delivery_start_time_utc {DateTime.new(2013, 02, 15, 14, 10, 10)}
    delivery_end_time_utc {DateTime.new(2013, 02, 15, 18, 10, 10)}
    is_delivery_flexible {false}
    delivery_flexible_days {0}

    # equipments
    equipment_type {"FB"}
    equipment_user_comments {"Breakable"}

    # load details
    weight {928}
    weight_unit_type {"LB"}
    dimension_length {2.0}
    dimension_width {2.0}
    dimension_height {3.5}
    volume {14.0}
    volume_unit_type {"CFT"}
    quantity {5}
    load_type {"LTL"}
    ltl_feet {12.0}
    status_code {"OP"}
    is_team_load {false}

    # commodity details
    commodity_type {"OT"}
    commodity_user_comments {"This is a test load"}

    # offer details
    offer_amount {255.98}
    offer_currency_code {"USD"}

    # contact details
    contact_name {"Test User 1"}
    contact_phone {"212-762-0982"}
    contact_ext {"20"}
    contact_email {"random@domain.com"}

    # repeatable
    is_repeat {false}
    repeat_num_days {0}
    repeat_end_date {nil}

    # extra stop
    number_extra_stop {0}
  end
end
