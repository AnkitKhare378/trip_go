
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FlightReviewScreen/flight_review_screen.dart';

class FlightListScreen extends StatefulWidget {
  @override
  _FlightListScreenState createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  // ... [Keep all existing state variables and methods] ...
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const ResponsiveAppBar(),
          Divider(),
          Container(
            color: Colors.white,
            height: screenHeight * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.22,
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
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
                      Text(dates[index]["date"]!,
                          style: TextStyle(fontSize: screenWidth * 0.035)),
                      SizedBox(height: screenHeight * 0.005),
                      Text(dates[index]["price"]!,
                          style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.orange
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.blue.withOpacity(0.2),
            height: screenHeight * 0.055,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Text("DEPARTURE",
                      style: TextStyle(fontSize: screenWidth * 0.03))),
                  Center(child: Text("DURATION",
                      style: TextStyle(fontSize: screenWidth * 0.03))),
                  Center(child: Row(
                    children: [
                      Text("PRICE",
                          style: TextStyle(fontSize: screenWidth * 0.03)),
                      Icon(Icons.arrow_upward, size: screenWidth * 0.04),
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
                      ResponsiveFlightCard(
                        departure: flight["departure"],
                        duration: flight["duration"],
                        arrival: flight["arrival"],
                        stops: flight["stops"],
                        flightNo: flight["flightNo"],
                        price: flight["price"],
                        airlineName: "Air India Express",
                        screenWidth: screenWidth,
                      ),
                      if (selectedFlightIndex == index)
                        ResponsiveFareOptionsSection(screenWidth: screenWidth),
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

class ResponsiveFlightCard extends StatelessWidget {
  final String departure;
  final String duration;
  final String arrival;
  final String stops;
  final String flightNo;
  final String price;
  final String airlineName;
  final double screenWidth;

  const ResponsiveFlightCard({
    super.key,
    required this.departure,
    required this.duration,
    required this.arrival,
    required this.stops,
    required this.flightNo,
    required this.price,
    required this.airlineName,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenWidth * 0.02,
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/trip_go.png',
                    height: screenWidth * 0.075),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  departure,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      duration,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Container(
                      height: 2,
                      width: screenWidth * 0.12,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      stops,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  arrival,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.03),
            Divider(color: Colors.grey.shade300, thickness: 1),
            SizedBox(height: screenWidth * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      airlineName,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.038,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.005),
                    Text(
                      flightNo,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "+ More Fare",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      "Get Rs.200 OFF | Code BOOKNOW",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.03,
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

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.03,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(30),
                  child: Icon(Icons.arrow_back,
                      size: screenWidth * 0.06,
                      color: Colors.black87),
                ),
                SizedBox(width: screenWidth * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delhi to Mumbai",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.005),
                    Text(
                      "Thu 15 May | 1 Adult",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.swap_vert,
                          size: screenWidth * 0.055),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_alt_outlined,
                          size: screenWidth * 0.055),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert,
                          size: screenWidth * 0.055),
                      onPressed: () {},
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

class ResponsiveFareOptionsSection extends StatefulWidget {
  final double screenWidth;

  const ResponsiveFareOptionsSection({super.key, required this.screenWidth});

  @override
  State<ResponsiveFareOptionsSection> createState() => _ResponsiveFareOptionsSectionState();
}

class _ResponsiveFareOptionsSectionState extends State<ResponsiveFareOptionsSection> {
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
      padding: EdgeInsets.all(widget.screenWidth * 0.03),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.purple.shade50],
        ),
      ),
      child: Column(
        children: fareOptions.map((option) {
          int index = fareOptions.indexOf(option);
          return Container(
            margin: EdgeInsets.only(bottom: widget.screenWidth * 0.03),
            padding: EdgeInsets.all(widget.screenWidth * 0.03),
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
                  onChanged: (value) => setState(() => selectedIndex = value!),
                  activeColor: Colors.deepOrange,
                ),
                SizedBox(width: widget.screenWidth * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option['title'],
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: (option['features'] as List<Map<String, dynamic>>)
                            .map(
                              (feature) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: widget.screenWidth * 0.005),
                            child: Row(
                              children: [
                                Icon(feature['icon'],
                                    size: widget.screenWidth * 0.04),
                                SizedBox(width: widget.screenWidth * 0.02),
                                Expanded(
                                  child: Text(
                                    feature['text'],
                                    style: TextStyle(
                                      fontSize: widget.screenWidth * 0.033,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${option['originalPrice']}',
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.033,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '₹${option['price']}',
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: widget.screenWidth * 0.02),
                    /*ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.screenWidth * 0.04,
                          vertical: widget.screenWidth * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.035,
                        ),
                      ),
                    ),*/
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FlightReviewScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.screenWidth * 0.02, // smaller padding for responsiveness
                          vertical: widget.screenWidth * 0.012,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(widget.screenWidth * 0.02),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // prevents extra height padding
                      ),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: widget.screenWidth * 0.03, // responsive font size
                        ),
                      ),
                    )

                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}















/*
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




*/
