import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  String? selectedSeat;
  bool isDetailExpanded = false;
  Widget seatLegendItem(String label, Color color, double seatSize) {
    return Row(
      children: [
        Container(
          width: seatSize * 0.8,
          height: seatSize * 0.8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: seatSize * 0.3),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: seatSize * 0.4),
        ),
      ],
    );
  }


  double getSeatPrice(String? seatId) {
    // Dummy logic for now
    if (seatId == null) return 0;
    if (seatId.endsWith('A') || seatId.endsWith('F')) return 400;
    if (seatId.endsWith('B') || seatId.endsWith('E')) return 200;
    return 100;
  }


  final List<String> columns = ['A', 'B', 'C', 'D', 'E', 'F'];
  final int rowCount = 30;

  final Map<String, String> seatMap = {
    '1A': 'X', '1B': 'P', '1E': 'XL', '1F': 'X',
    '2A': 'XL', '2B': 'B', '2C': 'X', '2D': 'P', '2E': 'XL', '2F': 'XL',
    '3A': 'P', '3B': 'XL', '3C': 'X', '3D': 'XL', '3E': 'B', '3F': 'X',
    '4A': 'X', '4C': 'P', '4D': 'XL', '4F': 'B',
    '5A': 'XL', '5B': 'XL', '5C': 'X', '5E': 'B', '5F': 'P',
    '6A': 'X', '6B': 'XL', '6C': 'P', '6D': 'X', '6E': 'XL', '6F': 'B',
    '7A': 'B', '7B': 'X', '7C': 'XL', '7D': 'P', '7F': 'XL',
    '8A': 'P', '8B': 'B', '8C': 'X', '8D': 'XL', '8E': 'X', '8F': 'P',
    '9A': 'P', '9B': 'X', '9C': 'XL', '9D': 'B', '9F': 'X',
    '10A': 'XL', '10B': 'B', '10C': 'X', '10D': 'P', '10E': 'XL', '10F': 'B',
    '11A': 'X', '11B': 'P', '11C': 'XL', '11D': 'B', '11F': 'X',
    '12A': 'XL', '12B': 'X', '12C': 'P', '12D': 'XL', '12E': 'B',
    '13A': 'B', '13C': 'X', '13D': 'XL', '13E': 'XL', '13F': 'P',
    '14A': 'X', '14B': 'P', '14C': 'B', '14D': 'XL', '14E': 'X', '14F': 'XL',
    '15A': 'XL', '15B': 'X', '15C': 'B', '15D': 'P', '15F': 'XL',
    '16A': 'P', '16B': 'XL', '16C': 'X', '16D': 'XL', '16E': 'B', '16F': 'X',
    '17A': 'B', '17B': 'XL', '17C': 'X', '17D': 'P', '17E': 'XL', '17F': 'X',
    '18A': 'X', '18C': 'XL', '18D': 'B', '18E': 'P', '18F': 'XL',
    '19A': 'XL', '19B': 'X', '19C': 'B', '19D': 'XL', '19F': 'P',
    '20A': 'P', '20B': 'XL', '20C': 'X', '20D': 'B', '20E': 'XL', '20F': 'X',
    '21A': 'X', '21B': 'P', '21C': 'XL', '21D': 'B', '21E': 'X', '21F': 'XL',
    '22A': 'B', '22C': 'XL', '22D': 'X', '22E': 'P',
    '23A': 'XL', '23B': 'X', '23C': 'P', '23D': 'XL', '23E': 'B', '23F': 'X',
    '24A': 'P', '24B': 'XL', '24C': 'X', '24D': 'B', '24F': 'XL',
    '25A': 'B', '25B': 'X', '25C': 'P', '25D': 'XL', '25E': 'X', '25F': 'XL',
    '26A': 'X', '26B': 'P', '26C': 'XL', '26D': 'B', '26E': 'XL', '26F': 'X',
    '27A': 'P', '27B': 'XL', '27C': 'X', '27D': 'XL', '27E': 'B',
    '28A': 'XL', '28B': 'X', '28D': 'P', '28E': 'XL', '28F': 'B',
  };


  Color getSeatColor(String type) {
    switch (type) {
      case 'XL':
        return Colors.orange.shade300;
      case 'B':
        return Colors.blue;
      case 'P':
        return Colors.pink;
      case 'X':
        return Colors.grey.shade400;
      default:
        return Colors.transparent;
    }
  }

  Widget seatBox(String seatId, String type, bool isSelected, double seatSize) {
    final color = type == 'X'
        ? Colors.grey.shade300
        : isSelected
        ? Colors.green
        : getSeatColor(type);

    return GestureDetector(
      onTap: type == 'X'
          ? null
          : () {
        setState(() {
          selectedSeat = seatId;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: seatSize * 0.08),
        width: seatSize,
        height: seatSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: type == 'X'
            ? Icon(Icons.close, size: seatSize * 0.55, color: Colors.white)
            : isSelected
            ? Icon(Icons.check, size: seatSize * 0.6, color: Colors.white)
            : Text(
          type,
          style: GoogleFonts.poppins(
            fontSize: seatSize * 0.35,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget buildRow(int displayRow, double seatSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: seatSize * 0.2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: seatSize * 1.3,
            child: Text(
              displayRow.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: seatSize * 0.4, fontWeight: FontWeight.w600),
            ),
          ),
          ...List.generate(3, (i) {
            String col = columns[i];
            String seatId = '$displayRow$col';
            String type = seatMap[seatId] ?? '';
            bool isSelected = selectedSeat == seatId;
            return seatBox(seatId, type, isSelected, seatSize);
          }),
          SizedBox(width: seatSize * 1.2),
          ...List.generate(3, (i) {
            String col = columns[i + 3];
            String seatId = '$displayRow$col';
            String type = seatMap[seatId] ?? '';
            bool isSelected = selectedSeat == seatId;
            return seatBox(seatId, type, isSelected, seatSize);
          }),
          SizedBox(
            width: seatSize * 1.3,
            child: Text(
              displayRow.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: seatSize * 0.4, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDelBomSelected = false;;
    final screenWidth = MediaQuery.of(context).size.width;
    final seatSize = screenWidth / 14;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
         // padding: EdgeInsets.all(seatSize * 0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                color: Color(0xFFD1E9FF),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDelBomSelected = !isDelBomSelected;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isDelBomSelected ? Color(0xFF2196F3) : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.flight_takeoff,
                            size: 18,
                            color:
                            isDelBomSelected ? Colors.white : Colors.redAccent,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "DEL-BOM",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: isDelBomSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: seatSize * 1.3),
                  SvgPicture.network(
                    'https://flight.easemytrip.com/M_Content/img/img_MB/toilet-icon.svg',
                    height: seatSize,
                  ),
                  Spacer(),
                  SvgPicture.network(
                    'https://flight.easemytrip.com/M_Content/img/img_MB/toilet-icon.svg',
                    height: seatSize,
                  ),
                  SizedBox(width: seatSize * 1.3),
                ],
              ),
              SizedBox(height: seatSize * 0.3),

              // Exit Icons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: seatSize * 1.3),
                  SvgPicture.network(
                    'https://flight.easemytrip.com/M_Content/img/img_MB/lft-exit.svg',
                    height: seatSize,
                  ),
                  Spacer(),
                  SvgPicture.network(
                    'https://flight.easemytrip.com/M_Content/img/img_MB/lft-exit.svg',
                    height: seatSize,
                  ),
                  SizedBox(width: seatSize * 1.3),
                ],
              ),
              SizedBox(height: seatSize * 0.4),

              // Column Headers
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: seatSize * 1.3),
                  ...columns.sublist(0, 3).map((c) => SizedBox(
                    width: seatSize,
                    child: Text(
                      c,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(width: seatSize * 1.2),
                  ...columns.sublist(3).map((c) => SizedBox(
                    width: seatSize,
                    child: Text(
                      c,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(width: seatSize * 1.3),
                ],
              ),

              // Seat Rows
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(rowCount, (rowIndex) {
                  int displayRow = rowIndex + 1;

                  if ([10, 15, 30].contains(displayRow)) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: seatSize * 0.3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: seatSize * 1.3),
                          SvgPicture.network(
                            'https://flight.easemytrip.com/M_Content/img/img_MB/lft-exit.svg',
                            height: seatSize,
                          ),
                          Spacer(),
                          SvgPicture.network(
                            'https://flight.easemytrip.com/M_Content/img/img_MB/lft-exit.svg',
                            height: seatSize,
                          ),
                          SizedBox(width: seatSize * 1.3),
                        ],
                      ),
                    );
                  } else {
                    return buildRow(displayRow, seatSize);
                  }
                }),
              ),
              SizedBox(height: seatSize * 2),
            ],
          ),
        ),
      ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: seatSize * 0.8,
            vertical: seatSize * 0.6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDetailExpanded = !isDetailExpanded;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      isDetailExpanded
                          ? Icons.keyboard_arrow_down // Points up visually when expanded
                          : Icons.keyboard_arrow_up,
                      size: seatSize * 1.2,
                    ),
                    SizedBox(width: seatSize * 0.5),
                    Expanded(
                      child: Text(
                        'Seat(s) Selected ${selectedSeat ?? ''}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: seatSize * 0.5,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₹${getSeatPrice(selectedSeat)}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: seatSize * 0.6,
                          ),
                        ),
                        Text(
                          'Added in total',
                          style: GoogleFonts.poppins(
                            fontSize: seatSize * 0.35,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedCrossFade(
                firstChild: SizedBox.shrink(),
                secondChild: Padding(
                  padding: EdgeInsets.only(top: seatSize * 0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${selectedSeat != null ? 1 : 0} out of 1 Selected',
                        style: GoogleFonts.poppins(
                          fontSize: seatSize * 0.4,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: seatSize * 0.4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          seatLegendItem('Free', Colors.grey.shade400, seatSize),
                          seatLegendItem('₹0 - ₹200', Colors.blue, seatSize),
                          seatLegendItem('₹200 - ₹400', Colors.orange.shade300, seatSize),
                        ],
                      ),
                    ],
                  ),
                ),
                crossFadeState: isDetailExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
            ],
          ),
        )


    );
  }
}
