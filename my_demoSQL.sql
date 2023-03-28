-- SELECT * FROM `sql-project-381218.data_analysis.joined_hotel`;

-- revenue Growth by Year
SELECT arrival_date_year, SUM((stays_in_week_nights + stays_in_weekend_nights)* adr) Revenue
FROM `sql-project-381218.data_analysis.joined_hotel`
GROUP BY arrival_date_year;

-- By Hotel Type
SELECT arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights)* adr), 2) Revenue
FROM `sql-project-381218.data_analysis.joined_hotel`
GROUP BY arrival_date_year, hotel;

-- Joining market_segment and meal_cost to the table

  SELECT * FROM `sql-project-381218.data_analysis.joined_hotel` hotels
  LEFT JOIN `sql-project-381218.data_analysis.hotel_management_marketSegment` marketSeg
  ON hotels.market_segment = marketSeg.market_segment
  LEFT JOIN `sql-project-381218.data_analysis.hotel_management_mealCost` mealCost
  ON hotels.meal = mealCost.meal;

-- Importing to PowerBi rrequired specification
WITH full_hotel_management AS (
  SELECT hotels.hotel, hotels.is_canceled, hotels.lead_time, hotels.arrival_date_year, hotels.arrival_date_month, hotels.arrival_date_week_number, hotels.arrival_date_day_of_month, hotels.stays_in_weekend_nights, hotels.stays_in_week_nights, hotels.adults, hotels.children, hotels.babies, hotels.meal, hotels.country	, hotels.market_segment, hotels.distribution_channel	, hotels.is_repeated_guest, hotels.previous_cancellations, hotels.previous_bookings_not_canceled, hotels.reserved_room_type, hotels.assigned_room_type, hotels.booking_changes, hotels.deposit_type, hotels.agent, hotels.company, hotels.days_in_waiting_list, hotels.customer_type, hotels.adr, hotels.required_car_parking_spaces, hotels.total_of_special_requests, hotels.reservation_status, hotels.reservation_status_date,
marketSeg.Discount, mealCost.Cost
  FROM `sql-project-381218.data_analysis.joined_hotel` hotels
  LEFT JOIN `sql-project-381218.data_analysis.hotel_management_marketSegment` marketSeg
  ON hotels.market_segment = marketSeg.market_segment
  LEFT JOIN `sql-project-381218.data_analysis.hotel_management_mealCost` mealCost
  ON hotels.meal = mealCost.meal
)
SELECT * FROM full_hotel_management