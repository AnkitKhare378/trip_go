import 'package:flutter/material.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/flight_routes_view.dart';
import 'package:trip_go/View/DashboardV/HomeCategoryPages/FlightScreen/offers_view.dart';
import '../../../Widgets/gradient_button.dart';
import 'FlightWidgets/flight_checkbox_grid.dart';
import 'FlightWidgets/flight_widgets.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({super.key});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
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
                          onChanged: (index) => setState(() => tripTypeIndex = index),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: LocationBox(label: 'FROM', code: 'DEL', city: 'DELHI'),
                              ),
                              const SizedBox(width: 15), // Space for the overlapped icon
                              Expanded(
                                child: LocationBox(label: 'TO', code: 'BOM', city: 'MUMBAI'),
                              ),
                            ],
                          ),
                          Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 1),
                              color: Colors.blue.shade50,
                            ),
                            child: const Center(
                              child: Icon(Icons.swap_horiz, color: Colors.blue, size: 35),
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
                              onTap: () => _pickDate(false),
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
                        onNonStopChanged: (val) => setState(() => nonStop = val!),
                        onStudentFareChanged: (val) => setState(() => studentFare = val!),
                        onArmedForcesChanged: (val) => setState(() => armedForces = val!),
                        onSeniorCitizenChanged: (val) => setState(() => seniorCitizen = val!),
                      ),
                      const SizedBox(height: 10),
                      GradientButton(
                        label: 'SEARCH FLIGHT',
                        onPressed: () {
                          // Handle search flight
                        },
                      ),
                    ],
                  ),
                ),
              ),
              FlightRoutesView(),
              OffersView(),
            ],
          ),
        ),
      ),
    );
  }
}
