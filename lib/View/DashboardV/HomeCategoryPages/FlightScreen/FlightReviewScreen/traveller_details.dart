import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/AddOnsView/top_add_one.dart';
import '../../../../../constants.dart';

class TravellerDetails extends StatefulWidget {
  const TravellerDetails({super.key});

  @override
  State<TravellerDetails> createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                      Text("Travellers Details",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),child: Column(
                  children: [
                    _buildFlightInfoCard(),
                    _buildTravellerSection(),
                    _buildContactDetails(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.withOpacity(.4)),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (val) {},
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Use GST for this booking (OPTIONAL)", style:GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700
                                  ),),
                                  Text("To claim credit of GST charged by airlines/EaseMyTrip, please enter your company's GST number.",style:  GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Terms & Conditions
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        children: [
                          Checkbox(value: true, onChanged: (val) {}),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(color: Colors.black),
                              children: [
                                const TextSpan(text: "I Accept "),
                                TextSpan(
                                  text: "T&C ",
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                const TextSpan(text: "and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),)
              ],
            ),


          ],
        ),
      ),
      bottomNavigationBar: buildBottomBar(context),
    );
  }

  Widget _buildFlightInfoCard() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(.4)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://flight.easemytrip.com/Content/AirlineLogon/SG.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  constants.titleOne,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  constants.subTitleOne,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  constants.descriptionOne,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTravellerSection() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(.4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Travellers",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _travellerType(
                      count: "1",
                      label: "ADULT",
                      iconUrl:
                      "https://flight.easemytrip.com/M_Content/img/adult-nw-icon.png"),
                  const SizedBox(width: 10),
                  _travellerType(
                      count: "0",
                      label: "CHILDREN",
                      iconUrl:
                      "https://flight.easemytrip.com/M_Content/img/adult-nw-icon.png"),
                  const SizedBox(width: 10),
                  _travellerType(
                      count: "0",
                      label: "INFANT(S)",
                      iconUrl:
                      "https://www.easemytrip.com/M_Content/img/infant-nw-icon.png"),
                ],
              ),
              const SizedBox(height: 15),
              Divider(color: Colors.grey.withOpacity(.2)),
              const SizedBox(height: 15),
              Container(
                color: Colors.blue.withOpacity(0.1),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      "https://flight.easemytrip.com/M_Content/img/g-id-icon.png",
                      height: 25,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Name should be same as in Government ID proof",
                        style: GoogleFonts.poppins(
                          color: Colors.blue.shade800,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (val) {}),
                  const SizedBox(width: 5),
                  Text(
                    "Mr ajkdj kmssk",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(Icons.edit, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 5),
              Divider(color: Colors.grey.withOpacity(.2)),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.add, size: 20, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(
                      "ADD ADULT",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddOnsPage()));
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

  Widget _travellerType({required String count, required String label, required String iconUrl}) {
    return Column(
      children: [
        Image.network(iconUrl, height: 25),
        const SizedBox(height: 2),
        Text(count, style: GoogleFonts.poppins(fontSize: 16)),
        Text(label, style: GoogleFonts.poppins(fontSize: 12)),
      ],
    );
  }

  Widget _buildContactDetails() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(.4)),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Information",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Your mobile number will be used only for flight related communication",
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Please enter your email address",
                hintStyle: GoogleFonts.poppins(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                  width: 55,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "91",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter Mobile No",
                      hintStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
