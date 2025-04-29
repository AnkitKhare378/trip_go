import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/FlightReviewScreen/flight_review_screen.dart';


class FlightListScreen extends StatefulWidget {
  @override
  _FlightListScreenState createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  int? selectedFlightIndex;

  final List<Map<String, dynamic>> flights = [
    {
      "departure": "15:55",
      "duration": "07h 55m",
      "arrival": "23:50",
      "stops": "1-stop",
      "flightNo": "IX-1128",
      "price": "₹4510",
    },
    {
      "departure": "11:10",
      "duration": "09h 35m",
      "arrival": "20:45",
      "stops": "1-stop",
      "flightNo": "IX-1198",
      "price": "₹4510",
    },
    {
      "departure": "04:35",
      "duration": "10h 50m",
      "arrival": "15:25",
      "stops": "1-stop",
      "flightNo": "IX-1125",
      "price": "₹4510",
    },
  ];

  final List<Map<String, String>> dates = [
    {"date": "May 14", "price": "₹4510"},
    {"date": "May 15", "price": "₹4510"},
    {"date": "May 16", "price": "₹4510"},
    {"date": "May 17", "price": "₹4510"},
    {"date": "May 18", "price": "₹5018"},
    {"date": "May 19", "price": "₹4510"},
  ];

  void toggleFareOptions(int index) {
    setState(() {
      if (selectedFlightIndex == index) {
        selectedFlightIndex = null;
      } else {
        selectedFlightIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppBar(),
          Divider(),
          Container(
            color: Colors.white,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: index == 1 ? Colors.blueAccent : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dates[index]["date"]!, style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(dates[index]["price"]!, style: const TextStyle(fontSize: 14, color: Colors.orange)),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blue.withOpacity(0.2),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Center(child: Text("DEPARTURE", style: TextStyle(fontSize: 12))),
                  Center(child: Text("DURATION", style: TextStyle(fontSize: 12))),
                  Center(child: Row(
                    children: [
                      Text("PRICE", style: TextStyle(fontSize: 12)),
                      Icon(Icons.arrow_upward),
                    ],
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                return GestureDetector(
                  onTap: () => toggleFareOptions(index),
                  child: Column(
                    children: [
                      FlightCard(
                        departure: flight["departure"],
                        duration: flight["duration"],
                        arrival: flight["arrival"],
                        stops: flight["stops"],
                        flightNo: flight["flightNo"],
                        price: flight["price"],
                        airlineName: "Air India Express",
                      ),
                      if (selectedFlightIndex == index)
                        FareOptionsSection(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





class FlightCard extends StatelessWidget {
  final String departure;
  final String duration;
  final String arrival;
  final String stops;
  final String flightNo;
  final String price;
  final String airlineName;

  const FlightCard({
    super.key,
    required this.departure,
    required this.duration,
    required this.arrival,
    required this.stops,
    required this.flightNo,
    required this.price,
    required this.airlineName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            // Top section: logo + timings
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/trip_go.png', height: 30),
                const SizedBox(width: 8),
                Text(
                  departure,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      duration,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 2,
                      width: 50,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stops,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  arrival,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey.shade300, thickness: 1),
            const SizedBox(height: 8),
            // Bottom section: left and right
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side (Airline name and flight no.)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airlineName,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      flightNo,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Right side (+More Fare and discount)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "+ More Fare",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Get Rs.200 OFF | Code BOOKNOW",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back arrow
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: const Icon(Icons.arrow_back, size: 24, color: Colors.black87),
                ),
                const SizedBox(width: 8),

                // Column for both texts (Delhi to Mumbai + Date)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delhi to Mumbai",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Thu 15 May | 1 Adult",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // 3 Icons closer together
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.swap_vert, color: Colors.black87, size: 22),
                      onPressed: () {
                        // Sort logic
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_alt_outlined, color: Colors.black87, size: 22),
                      onPressed: () {
                        // Filter logic
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.black87, size: 22),
                      onPressed: () {
                        // More options logic
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class FareOptionsSection extends StatefulWidget {
  const FareOptionsSection({super.key});

  @override
  _FareOptionsSectionState createState() => _FareOptionsSectionState();
}

class _FareOptionsSectionState extends State<FareOptionsSection> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> fareOptions = [
    {
      'title': 'Spice Saver',
      'price': 5202,
      'originalPrice': 5552,
      'features': [
        {'icon': Icons.work_outline, 'text': 'Cabin Bag : 7Kgs'},
        {'icon': Icons.luggage, 'text': 'Check in : 15 KG'},
        {'icon': Icons.cancel_outlined, 'text': 'Cancellation : Rs 3200 onwards'},
        {'icon': Icons.date_range, 'text': 'Date Change : Rs 2999 onwards'},
      ]
    },
    {
      'title': 'Spicemax',
      'price': 7078,
      'originalPrice': 7428,
      'features': [
        {'icon': Icons.work_outline, 'text': 'Cabin Bag : 7Kgs'},
        {'icon': Icons.luggage, 'text': 'Check in : 15 Kgs'},
        {'icon': Icons.cancel_outlined, 'text': 'Cancellation : Rs 3200 onwards'},
        {'icon': Icons.date_range, 'text': 'Date Change : Rs 2999 onwards'},
        {'icon': Icons.event_seat, 'text': 'Seat : Free seat'},
        {'icon': Icons.restaurant, 'text': 'Meal : Complimentary meals'},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.purple.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        //borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: fareOptions.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> option = entry.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedIndex == index ? Colors.deepOrange : Colors.grey.shade300,
                  width: selectedIndex == index ? 1.8 : 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value!;
                      });
                    },
                    activeColor: Colors.deepOrange,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          option['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (option['features'] as List<Map<String, dynamic>>)
                              .map<Widget>((feature) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Row(
                                children: [
                                  Icon(
                                    feature['icon'],
                                    size: 16,
                                    color: Colors.grey[700],
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      feature['text'],
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹${option['originalPrice']}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '₹${option['price']}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightReviewScreen()));
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


/*
class FareSelectionCard extends StatefulWidget {
  const FareSelectionCard({super.key});

  @override
  State<FareSelectionCard> createState() => _FareSelectionCardState();
}

class _FareSelectionCardState extends State<FareSelectionCard> {
  int selectedIndex = 0;

  final fareOptions = [
    {
      "title": "Spice Saver",
      "oldPrice": "₹5,552",
      "newPrice": "₹5202",
      "features": [
        {"icon": Icons.luggage, "text": "Cabin Bag : 7Kgs"},
        {"icon": Icons.business_center, "text": "Check in : 15 KG"},
        {"icon": Icons.cancel, "text": "Cancellation : Rs 3200 onwards"},
        {"icon": Icons.calendar_today, "text": "Date Change : Rs 2999 onwards"},
      ],
    },
    {
      "title": "Spicemax",
      "oldPrice": "₹7,428",
      "newPrice": "₹7078",
      "features": [
        {"icon": Icons.luggage, "text": "Cabin Bag : 7Kgs"},
        {"icon": Icons.business_center, "text": "Check in : 15 Kgs"},
        {"icon": Icons.cancel, "text": "Cancellation : Rs 3200 onwards"},
        {"icon": Icons.calendar_today, "text": "Date Change : Rs 2999 onwards"},
        {"icon": Icons.event_seat, "text": "Seat : Free seat"},
        {"icon": Icons.restaurant, "text": "Meal : Complimentary meals"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(fareOptions.length, (index) {
        final option = fareOptions[index];
        final isSelected = selectedIndex == index;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 1.5,
            ),
            color: isSelected ? Colors.blue.shade50 : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: selectedIndex,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value!;
                      });
                    },
                  ),
                  Text(
                    option['title'].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        option['oldPrice'].toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        option['newPrice'].toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...(option['features'] as List<Map<String, dynamic>>).map<Widget>((feature) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Icon(
                        feature['icon'],
                        size: 18,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature['text'],
                          style: GoogleFonts.poppins(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Handle Book Now
                  },
                  child: const Text("Book Now"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}



*/

