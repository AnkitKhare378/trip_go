import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FlightListScreen extends StatelessWidget {
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
                      Icon(Icons.arrow_upward)
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
                return FlightCard(
                  departure: "15:55",
                  duration: "07h 55m",
                  arrival: "23:50",
                  stops: "1-stop",
                  flightNo: "IX-1128",
                  price: "₹4510",
                  airlineName: "Air India Express",
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



