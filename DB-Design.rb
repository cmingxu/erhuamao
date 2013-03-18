Travel
	have gallery
	have right top pic
	"name" :string
	"sub_name" :string
	"series_name" :string
	"series_cont"	:text
	"priced From" :integer
	"days_count"	:integer
	"departures" :integer
	"max_group_size" :integer
	"overview_desc" :text
	"overview_advantage" :text
	"notes" :text
	"extensions_ids" :text
	"itinerary_pic"	:text

Itinerary
	have gallery
	"name" 	:string
	"travel_id" :integer
	"sort" :integer
	"hotel_id" :integer
	"meals" :string
	"start_day_num" :integer
	"end_day_num"	:integer

Datesprice
	"travel_id" :integer
	"start_date" :datetime
	"end_date" :datetime
	"prices"	:integer
	"single_supplement" :integer
	"internal_air_from" :integer
	"availability" :integer(多种状态: "Available", "Call for Availability", "Limited Availability")
	"available_people_count"

Offers


Booking
	"travel_id" :integer
	"datesprice_id" :integer
	"people_count"	:integer

Hotel
	have gallery
	"name"
	"country_id"
	"city_id"

Question
	"preferred_contact_method" :integer
	"email"	:string
	"mrs_title"	:string
	"first_name" :string
	"last_name"	:string
	"country"	:string
	"phone"	:string
	"question"	:text
	"travel_id" :integer

Brochure(PDF)
	"name"
	"file"
	"travel_ids"

Destination
	have gallery
	"name" 	:string
	"desc_title" :string
	"desc"	:text
	"banner_pic" :string
	"map_pic" :string
	"flights"	:text
	"timezone" :string
	"climate"	:text
	"health_requirements" :text
	"voltage"	:text
	"currency"	:text

Destination_Travel


Interest


Interest_Travel


News


News_Travel


Page


Gallery
	"name" :string
	"photo" :string
	"type" :string
	"type_id" :integer

User


Saves_trip(Compare)


Setting
	400电话

::::::::::
金额用什么字段，整数还是货币