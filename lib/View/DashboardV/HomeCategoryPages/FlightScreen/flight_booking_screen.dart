import 'package:flutter/material.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/select_origin_city_screen.dart';
import '../../../Widgets/gradient_button.dart';
import 'FlightPartSections/benefit_section_widget.dart';
import 'FlightPartSections/bottom_widget.dart';
import 'FlightPartSections/more_lik_section.dart';
import 'FlightPartSections/offers_view.dart';
import 'FlightPartSections/search_destination_section.dart';
import 'FlightPartSections/where2_go_section.dart';
import 'FlightWidgets/calender_screen.dart';
import 'FlightWidgets/class_selection_bottom_sheet.dart';
import 'FlightWidgets/flight_checkbox_grid.dart';
import 'FlightWidgets/flight_widgets.dart';
import 'FlightWidgets/traveller_selection_bottom_sheet.dart';
import 'flight_list_screen.dart';
import 'flight_routes_view.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({super.key});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  Map<String, String> fromCity = {'city': 'DELHI', 'code': 'DEL'};
  Map<String, String> toCity = {'city': 'MUMBAI', 'code': 'BOM'};

  int tripTypeIndex = 0;
  DateTime? departureDate = DateTime.now();
  DateTime? returnDate;
  String selectedClass = 'Economy';
  int travellerCount = 2;
  bool _showErrorMessage = false;
  bool nonStop = false;
  bool studentFare = false;
  bool armedForces = false;
  bool seniorCitizen = false;

  int adultsCount = 2;
  int childrenCount = 0;
  int infantsCount = 0;

  void _onSearchPressed() {
    // Check if FROM and TO cities are the same
    if (fromCity['city'] == toCity['city']) {
      // Show error message if cities are the same
      setState(() {
        _showErrorMessage = true;
      });
    } else {
      // Proceed to FlightListScreen if cities are different
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FlightListScreen()),
      );
    }
  }

  void _showTravellerBottomSheet() async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(5), // Reduced corner radius
        ),
      ),
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.45, // Set 60% height of screen
        child: TravellerBottomSheet(
          initialAdultsCount: adultsCount,
          initialChildrenCount: childrenCount,
          initialInfantsCount: infantsCount,
          onDone: (adults, children, infants) {
            setState(() {
              adultsCount = adults;
              childrenCount = children;
              infantsCount = infants;
              travellerCount = adults + children + infants;
            });
          },
        ),
      ),
    );
  }

  void _showClassSelectionBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) => ClassSelectionBottomSheet(
        initialClass: selectedClass,
        onClassSelected: (classSelected) {
          setState(() {
            selectedClass = classSelected;
          });
        },
      ),
    );
  }

  Future<void> _pickDate(bool isDeparture) async {
    final picked = await Navigator.push<DateTime>(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenCalendar(isDeparture: isDeparture),
      ),
    );
    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECF2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFFFFCDD2), // light red
                      Color(0xFFBBDEFB), // light blue
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.blue],
                          ),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: TripSelector(
                          tripTypeIndex: tripTypeIndex,
                          onChanged:
                              (index) => setState(() => tripTypeIndex = index),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      final selectedCity = await Navigator.push<
                                          Map<String, String>
                                      >(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                              SelectOriginCityScreen(),
                                        ),
                                      );
                                      if (selectedCity != null) {
                                        setState(() {
                                          fromCity = selectedCity;
                                        });
                                      }
                                    },
                                    child: LocationBox(
                                      label: 'FROM',
                                      code: fromCity?['code'] ?? 'DEL',
                                      city: fromCity?['city'] ?? 'DELHI',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  flex:1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      final selectedCity = await Navigator.push<
                                          Map<String, String>
                                      >(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                              SelectOriginCityScreen(),
                                        ),
                                      );
                                      if (selectedCity != null) {
                                        setState(() {
                                          toCity = selectedCity;
                                        });
                                      }
                                    },
                                    child: LocationBox(
                                      label: 'TO',
                                      code: toCity?['code'] ?? 'DEL',
                                      city: toCity?['city'] ?? 'DELHI',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              setState(() {
                                final temp = fromCity;
                                fromCity = toCity;
                                toCity = temp;
                              });
                            },
                            child: Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blue, width: 1),
                                color: Colors.blue.shade50,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.swap_horiz,
                                  color: Colors.blue,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      if (_showErrorMessage)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'FROM and TO cities cannot be the same!',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),

                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: DateBox(
                              label: 'DEPARTURE DATE',
                              date: departureDate,
                              isDeparture: true,
                              enabled: true,
                              onTap: () => _pickDate(true),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DateBox(
                              label: 'RETURN DATE',
                              date: returnDate,
                              isDeparture: false,
                              enabled: tripTypeIndex != 0,
                              onTap: () {
                                if (tripTypeIndex == 0) {
                                  setState(() {
                                    tripTypeIndex = 1; // Switch to "Round Trip"
                                  });
                                }
                                _pickDate(false); // Open the date picker
                              },
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _showTravellerBottomSheet(),
                              child: TravellerBox(travellerCount: travellerCount),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _showClassSelectionBottomSheet();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFF6F6FA),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CLASS',
                                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey, fontFamily: 'poppins'),
                                    ),
                                    // SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedClass,
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'poppins'),
                                        ),
                                        Icon(Icons.keyboard_arrow_down_outlined)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      FlightCheckboxGrid(
                        nonStop: nonStop,
                        studentFare: studentFare,
                        armedForces: armedForces,
                        seniorCitizen: seniorCitizen,
                        onNonStopChanged:
                            (val) => setState(() => nonStop = val!),
                        onStudentFareChanged:
                            (val) => setState(() => studentFare = val!),
                        onArmedForcesChanged:
                            (val) => setState(() => armedForces = val!),
                        onSeniorCitizenChanged:
                            (val) => setState(() => seniorCitizen = val!),
                      ),
                      const SizedBox(height: 10),
                      GradientButton(
                        label: 'SEARCH FLIGHT',
                        onPressed: _onSearchPressed,
                      ),
                    ],
                  ),
                ),
              ),
              FlightRoutesView(),
              OffersView(),
              SearchDestinationsSection(),
              Where2GoSection(),
              BenefitSectionWidget(),
              BottomWidget(),
              MoreLinksSection()
            ],
          ),
        ),
      ),
    );
  }
}
