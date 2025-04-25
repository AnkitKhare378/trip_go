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
    {'name': 'France', 'flag': '🇫🇷'},
    {'name': 'Japan', 'flag': '🇯🇵'},
    {'name': 'Canada', 'flag': '🇨🇦'},
    {'name': 'Brazil', 'flag': '🇧🇷'},
    {'name': 'Australia', 'flag': '🇦🇺'},
    {'name': 'Italy', 'flag': '🇮🇹'},
  ];

  void _showCountryPopup(BuildContext context) {
    final overlay = Overlay.of(context);
    OverlayEntry? entry;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + 10,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 250,
            height: 300,
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),  // padding adjustments
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero, // Remove the default padding
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 36, // fixed height for uniformity and compactness
                        child: InkWell(
                          onTap: () {
                            onCountryChanged(countries[index]['name']);
                            entry?.remove();
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 8),
                              Text(countries[index]['flag'] ?? '', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 10),
                              Text(
                                countries[index]['name'] ?? '',
                                style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.list, color: Colors.black, size: 25),
                    onPressed: () {
                      // Toggle drawer or perform action
                    },
                  ),
                  SizedBox(width: 10),
                  Image.asset("assets/images/trip_go.png", height: 40),
                ],
              ),
              GestureDetector(
                onTap: () => _showCountryPopup(context),
                child: Row(
                  children: [
                    Text(
                      countries.firstWhere((c) => c['name'] == selectedCountry)['flag'] ?? '',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 4),
                    Text(
                      selectedCountry,
                      style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'poppins'),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight - 10);
}
