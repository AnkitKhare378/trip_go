import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/FlightReviewScreen/promo_section/promo_section.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/FlightReviewScreen/traveller_details.dart';

class FlightReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(
                color: Color(0xff006DFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Text("Flight Review",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
              child: Column(
                children: [
                  buildFlightReviewCard(),
                  const SizedBox(height: 16),
                  TravelInsuranceAndPromo(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(context),
    );
  }

  Widget buildFlightReviewCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delhi–Mumbai", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text("Tue–29Apr2025", style: GoogleFonts.poppins(color: Colors.grey)),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Depart", style: GoogleFonts.poppins(color: Color(0xff006DFF))),
              ),
            ],
          ),
          const Divider(),
          buildFlightTile("SpiceJet | SG 124", "Spice Saver", "DEL", "15:00", "DED", "16:05", "1D", "1D", "01h 05m"),
          buildLayover("2h:50m Layover in Dehradun (DED)"),
          buildFlightTile("SpiceJet | SG 510", "Spice Saver", "DED", "18:55", "BOM", "21:25", "1D", "1D", "02h 30m"),
        ],
      ),
    );
  }

  Widget buildFlightTile(String flight, String fare, String from, String depTime, String to, String arrTime, String depTerm, String arrTerm, String duration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://flight.easemytrip.com/Content/AirlineLogon/SG.png'),
            ),
            const SizedBox(width: 6),
            Text(flight, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("Refundable", style: GoogleFonts.poppins(color: Colors.green)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text("Spice Saver", style: GoogleFonts.poppins(color: Color(0xff000000), fontWeight: FontWeight.w500, fontSize: 10)),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildFlightTime(from, depTime, "Delhi", depTerm),
              buildDuration(duration),
              buildFlightTime(to, arrTime, to == "BOM" ? "Mumbai" : "Dehradun", arrTerm),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget buildLayover(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
          borderRadius: BorderRadius.circular(8),
          color: Colors.amber.shade50,
        ),
        padding: const EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        child: Text(text, style: GoogleFonts.poppins(color: Colors.orange, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget buildFlightTime(String code, String time, String city, String terminal) {
    return Column(
      children: [
        Text("Tue–29Apr2025", style: GoogleFonts.poppins(fontSize: 10)),
        Text("$code $time", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(city, style: GoogleFonts.poppins()),
        Text("Terminal - $terminal", style: GoogleFonts.poppins(fontSize: 10)),
      ],
    );
  }

  Widget buildDuration(String duration) {
    return Column(
      children: [
        const Icon(Icons.more_horiz, size: 16),
        Text(duration, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey)),
        const Icon(Icons.more_horiz, size: 16),
      ],
    );
  }

  Widget buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1F1F1F), Color(0xFF2C2C2C)],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Section - Grand Total
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Grand Total",
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "₹5,501",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.info_outline, size: 16, color: Colors.white70),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Right Section - Continue Button
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TravellerDetails()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Continue Booking",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class TravelInsuranceAndPromo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInsuranceSection(),
        const SizedBox(height: 12),
        PromoSection(),
        const SizedBox(height: 12),
        buildEaseMyTripReasons(),
      ],
    );
  }

  Widget buildInsuranceSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Travel Insurance", style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Image.network('https://flight.easemytrip.com/Content/img/acko-logo.png', height: 24),
            ],
          ),
          Divider(),
          const Text("Secure your trip with ACKO Travel Insurance at just Rs199/- per traveller"),
          const SizedBox(height: 6),
          const Text("View T&C", style: TextStyle(color: Colors.blue)),
          const SizedBox(height: 8),
          Column(
            children: [
              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (_) {},
                title: const Text("Yes Secure My Trip"),
                subtitle: const Text("More than 36% of our customer choose to secure their trip."),
              ),
              RadioListTile(
                value: false,
                groupValue: true,
                onChanged: (_) {},
                title: const Text("I am willing to risk my trip"),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget buildEaseMyTripReasons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Why book with TripGo?",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 140, // Ensure height accommodates all tiles
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            children: [
              buildReasonTile(Icons.support_agent, "24/7 Customer Support", "We’re here to help whenever you need us"),
              buildReasonTile(Icons.security, "Secure Booking", "Your privacy is our top priority"),
              buildReasonTile(Icons.thumb_up, "Trusted by Millions", "Millions of users trust EaseMyTrip"),
              buildReasonTile(Icons.airplanemode_active, "Best Deals", "Get the lowest prices on flights"),
              buildReasonTile(Icons.wallet, "No Convenience Fee", "Book tickets without extra charges"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildReasonTile(IconData icon, String title, String subtitle) {
    return Container(
      width: 160, // Fixed width to avoid overflow
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 11),
          ),
        ],
      ),
    );
  }



}
