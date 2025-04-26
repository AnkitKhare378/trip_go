import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width * 0.8, // 80% width
      child: SafeArea(
        child: Column(
          children: [
            // Cross Icon at Top Right
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, size: 25, color: Colors.black,),
                  onPressed: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Lighter Gradient Box with Person Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFED726C), Color(0xFFEF9F73)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  // Login Texts
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login/Signup Now",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'poppins'),
                      ),
                      Text(
                        "Login for best deals & offers",
                        style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'poppins'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Body - List Items
            Expanded(
              child: ListView(
                children: [
                  _buildListItem(Icons.wechat_sharp, "My Bookings", "View and Manage your bookings"),
                  _buildListItem(Icons.airplane_ticket_outlined, "Upcoming Trips", null),
                  _buildListItem(Icons.wallet, "My Wallet Balance", null),
                  _buildListItem(Icons.help, "Help Center", "Contact our customer support"),
                ],
              ),
            ),
            Spacer(),
            _buildListItem2(),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Color(0xFFF3F6FD)], // lighter gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xFFF15842), // orange circle
            child: Icon(icon, color: Colors.white, size: 13),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'poppins'),
          ),
          subtitle: subtitle != null
              ? Text(
            subtitle,
            style: TextStyle(fontFamily: 'poppins', fontSize: 10),
          )
              : null, // subtitle will be hidden if null
          trailing: Icon(Icons.arrow_forward_ios, size: 18),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildListItem2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Color(0xFFF3F6FD)], // lighter gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,), // added bottom padding for balance
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xFFF15842), // orange circle
                    child: Icon(Icons.currency_rupee, color: Colors.white, size: 13),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "INR",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Image.network(
                    'https://flagcdn.com/w40/in.png', // Indian flag from internet
                    width: 25,
                    height: 18,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "India",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
