import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedCountry;
  final Function(String?) onCountryChanged;

  DashboardAppBar({
    required this.selectedCountry,
    required this.onCountryChanged,
  });

  final List<Map<String, String>> countries = [
    {'name': 'India', 'flag': '🇮🇳'},
    {'name': 'USA', 'flag': '🇺🇸'},
    {'name': 'UK', 'flag': '🇬🇧'},
    {'name': 'Germany', 'flag': '🇩🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.list, color: Colors.black, size: 25),
                onPressed: () {
                  // Toggle drawer or perform action
                },
              ),
              SizedBox(width: 10),
              Image.asset("assets/images/trip_go.png", height: 40,),
              // Wrap the DropdownButton with an Expanded widget
              Expanded(
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      isDense: true, // Removes extra padding
                      items: countries.map((country) {
                        return DropdownMenuItem<String>(
                          value: country['name'],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Optional, adjust if needed
                            children: [
                              Text(country['flag'] ?? '', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 8),
                              Text(country['name'] ?? ''),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: onCountryChanged,
                      icon: Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.grey.shade400), // Customize the icon
                      iconSize: 24, // Size of the dropdown arrow
                      isExpanded: true, // Optional, expands the dropdown to fit the width
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight - 10);
}
