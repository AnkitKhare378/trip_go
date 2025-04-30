import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/AddOnsView/baggage_selection_page.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/AddOnsView/popular_add_ons.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/AddOnsView/seat_selection_page.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/FlightReviewScreen/traveller_details.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/common_widget/bottom_bar.dart';

class AddOnsPage extends StatefulWidget {
  const AddOnsPage({super.key});

  @override
  State<AddOnsPage> createState() => _AddOnsPageState();
}

class _AddOnsPageState extends State<AddOnsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = const [
    Tab(text: "SEATS"),
    Tab(text: "BAGGAGE"),
    Tab(text: "POPULAR ADD-ONS"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top section - fixed
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 12),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(onTap:()=>Navigator.pop(context),child: const Icon(Icons.arrow_back, color: Colors.black87)),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add ons",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "DEL  -  BOM  |  30Apr  |  1 Adult",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    Text(
                      "Skip to Payment",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Route info
                /*Text(
                  "DEL  -  BOM  |  30Apr  |  1 Adult",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),*/
              ],
            ),
          ),
          Divider(thickness: 1,color: Colors.black,),

          // Tabs
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: _tabs,
              indicatorColor: Colors.blue,
              indicatorWeight: 2.5,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black54,
              labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              isScrollable: true,
            ),
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SeatSelectionPage(),
                BaggageTabView(),
                PopularAddOnsSection()
              ],
            ),
          ),
        ],
      ),
      bottomSheet: buildBottomBar(context,()=>UpiPage()),
    );
  }
}
class UpiPage extends StatelessWidget {
  const UpiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("UPI PAGE")),
    );
  }
}
