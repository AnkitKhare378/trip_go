import 'package:flutter/material.dart';

import 'Widget/hotel_search_filter.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HotelSearchFilter()
            /*Container(
              height: size.height*.5,
              width: double.infinity,
              color: Colors.grey,
            )*/
          ],
        ),
      ),
    );
  }
}