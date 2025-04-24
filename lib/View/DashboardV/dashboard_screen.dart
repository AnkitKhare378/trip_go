import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_go/View/DashboardV/Widget/dashboard_app_bar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedCountry = 'India';

  final List<String> menuItems = ['Flight', 'Hotel', 'Tours', 'Cabs', 'Buses'];

  final List<IconData> menuIcons = [
    Icons.flight,
    Icons.hotel,
    Icons.tour,
    Icons.local_taxi,
    Icons.directions_bus
  ];

  final List<String> gridTitles = [
    "Mumbai Flights",
    "Delhi Flights",
    "Kolkata Flights",
    "Chennai Flights"
  ];

  final List<IconData> gridIcons = [
    Icons.flight_takeoff,
    Icons.location_city,
    Icons.airplanemode_active,
    Icons.airplanemode_on,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DashboardAppBar(
        selectedCountry: selectedCountry,
        onCountryChanged: (value) {
          if (value != null) {
            setState(() {
              selectedCountry = value;
            });
          }
        },
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey.shade300,
            thickness: 1.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(menuItems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Icon(menuIcons[index], size: 30, color: Colors.blue),
                        SizedBox(height: 5),
                        Text(menuItems[index], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: gridTitles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        // Add navigation or action
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(gridIcons[index], size: 40, color: Colors.blue),
                          SizedBox(height: 10),
                          Text(
                            gridTitles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}