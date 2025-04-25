import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingDestinations extends StatefulWidget {
  const TrendingDestinations({super.key});

  @override
  State<TrendingDestinations> createState() => _TrendingDestinationsState();
}

class _TrendingDestinationsState extends State<TrendingDestinations> {
  final PageController _pageController = PageController(viewportFraction: 0.95);
  int _currentPage = 0;
  Timer? _autoScrollTimer;


  final List<List<Map<String, String>>> _citiesGrouped = [
    [
      {'name': 'Bhutan', 'image': 'https://plus.unsplash.com/premium_photo-1661952578770-79010299a9f9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ymh1dGFufGVufDB8fDB8fHww'},
      {'name': 'Australia', 'image': 'https://images.unsplash.com/photo-1624138784614-87fd1b6528f8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QXVzdHJhbGlhfGVufDB8fDB8fHww'},
    ],
    [
      {'name': 'Dubai', 'image': 'https://images.unsplash.com/photo-1694834394112-efef3fbb26f2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fER1YmFpfGVufDB8fDB8fHww'},
      {'name': 'Japan', 'image': 'https://images.unsplash.com/photo-1683120057335-440c32aa38ff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8SmFwYW58ZW58MHx8MHx8fDA%3D'},
    ],
    [
      {'name': 'Switzerland', 'image': 'https://media.istockphoto.com/id/1826593744/photo/snow-falling-and-train-passing-through-famous-mountain-in-filisur-switzerland-train-express.webp?a=1&b=1&s=612x612&w=0&k=20&c=s0ueBC8p3Y01Fi7zxd_8x5YcbOEPJf0A5ZflPf9fQCY='},
      {'name': 'Singapore', 'image': 'https://plus.unsplash.com/premium_photo-1697729432930-3f11644e9184?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c2luZ2Fwb3JlfGVufDB8fDB8fHww'},
    ],
    [
      {'name': 'Bali', 'image': 'https://plus.unsplash.com/premium_photo-1677829177642-30def98b0963?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8QmFsaXxlbnwwfHwwfHx8MA%3D%3D'},
      {'name': 'Thailand', 'image': 'https://plus.unsplash.com/premium_photo-1661962958462-9e52fda9954d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8VGhhaWxhbmR8ZW58MHx8MHx8fDA%3D'},
    ],
  ];

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });

    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page!.round() + 1) % _citiesGrouped.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }


  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Top',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.red,
              ),
              children: [
                TextSpan(
                  text: ' Trending Destinations',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explore the hottest travel spots around the globe and experience the best of holidays.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _citiesGrouped.length,
              itemBuilder: (context, index) {
                final group = _citiesGrouped[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      group.map((city) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                city['image']!,
                                width: 140,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              city['name']!,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                );
              },
            ),
          ),

          const SizedBox(height: 12),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _citiesGrouped.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index
                            ? Colors.blue
                            : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Text(
                  "DESTINATION",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    letterSpacing: 1.5,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Popular ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'Indian Destination',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                /*Image.asset(
                  'assets/images/twinspecs.png',
                  width: 40,
                ),*/
              ],
            ),
          ),
          const SizedBox(height: 12),
          CityBuilder(
            img:
                'https://images.unsplash.com/photo-1561359313-0639aad49ca6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmFyYW5hc2l8ZW58MHx8MHx8fDA%3D',
            title: 'Varanasi',
          ),
          const SizedBox(height: 12),
          CityBuilder(
            img:
                'https://static2.tripoto.com/media/filter/nl/img/1706196/TripDocument/1619425826_cq5dam_web_1280_765.jpeg',
            title: 'Kaimur Hills',
          ),
          const SizedBox(height: 12),
          CityBuilder(
            img:
                'https://www.holidify.com/images/cmsuploads/compressed/shutterstock_402506581_20191024172033_20191024172055.jpg',
            title: 'Gaya',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://cdn.getyourguide.com/img/tour/2f6fe4e17edef2ae.jpeg/145.jpg',
            title: 'Ayodhya',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://www.buddhisttourism.online/assets/images/rajgir-banner4.webp',
            title: 'Rajgiri',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://www.holidify.com/images/cmsuploads/compressed/15267714_20200120114034.jpg',
            title: 'Kerela',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://travelsetu.com/apps/uploads/new_destinations_photos/destination/2023/12/13/b9e1b5bbf87f3ec75c09613f9378b564_1000x1000.jpg',
            title: 'Spiti Valley',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://punetours.com/wp-content/uploads/2017/10/kashmir-tour-honeymoon-package-booking.jpg',
            title: 'Kashmir',
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE94057), Color(0xFF4A00E0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: CircleBorder(),
                ),
                child: Text(
                  'Explore More',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Popular ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'International Destination',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                /*Image.asset(
                  'assets/images/twinspecs.png',
                  width: 40,
                ),*/
              ],
            ),
          ),
          const SizedBox(height: 12),
          CityBuilder(
            img:
                'https://tripoholidays.in/public/img/media_gallery/cd6eec6b-731b-4f79-91b5-e1f8b74b886e_mANtvQfPHI.jpg',
            title: 'Italy',
          ),
          const SizedBox(height: 12),
          CityBuilder(
            img:
                'https://tripoholidays.in/public/img/media_gallery/Museumsinsel_Berlin_Juli_2021_1_(cropped)_rruh3Pt1lN.jpg',
            title: 'Austria',
          ),
          const SizedBox(height: 12),
          CityBuilder(
            img:
                'https://tripoholidays.in/public/img/media_gallery/Norway_y6d1tks3nw.png',
            title: 'Switzerland',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://tripoholidays.in/public/img/media_gallery/eiffel-tower-and-fountains_1440x_wmBbC6nG0D.jpg',
            title: 'France',
          ),
          SizedBox(height: 12),
          CityBuilder(
            img:
                'https://tripoholidays.in/public/img/media_gallery/Amsterdam%201_agMopUBBzk.jpg',
            title: 'Netherlands',
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: 200,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE94057), Color(0xFF4A00E0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: CircleBorder(),
                ),
                child: Text(
                  'Explore More',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CityBuilder extends StatelessWidget {
  final String img;
  final String title;

  const CityBuilder({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Image.network(
              img,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 100),
              // loadingBuilder: (context, child, progress) {
              //   if (progress == null) return child;
              //   return Container(
              //     height: 180,
              //     width: double.infinity,
              //     child: const Center(child: CircularProgressIndicator()),
              //   );
              // },
            ),
            Positioned(
              left: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

