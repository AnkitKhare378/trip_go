import 'package:flutter/material.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/select_origin_city_screen.dart';
import '../../../Widgets/gradient_button.dart';
import 'FlightPartSections/benefit_section_widget.dart';
import 'FlightPartSections/bottom_widget.dart';
import 'FlightPartSections/more_lik_section.dart';
import 'FlightPartSections/offers_view.dart';
import 'FlightPartSections/search_destination_section.dart';
import 'FlightPartSections/where2_go_section.dart';
import 'FlightWidgets/flight_checkbox_grid.dart';
import 'FlightWidgets/flight_widgets.dart';
import 'flight_list_screen.dart';
import 'flight_routes_view.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({super.key});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  Map<String, String>? fromCity;
  Map<String, String>? toCity;

  int tripTypeIndex = 0;
  DateTime? departureDate = DateTime.now();
  DateTime? returnDate;
  String selectedClass = 'Economy';
  int travellerCount = 2;

  bool nonStop = false;
  bool studentFare = false;
  bool armedForces = false;
  bool seniorCitizen = false;

  Future<void> _pickDate(bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
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
                          Row(
                            children: [
                              Expanded(
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
                            child: TravellerBox(travellerCount: travellerCount),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownBox(
                              label: 'CLASS',
                              value: selectedClass,
                              onChanged: (value) {
                                setState(() => selectedClass = value);
                              },
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightListScreen()));
                        },
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
