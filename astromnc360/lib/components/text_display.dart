import 'package:astromnc360/model/member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextDisplay extends StatelessWidget {
  final Member membData;
  final List<String> naks = [
    "Ashvini",
    "Bharani",
    "Krittika",
    "Rohini",
    "Mrigashīra",
    "Ardra",
    "Punarvasu",
    "Pushya",
    "Ashleshā",
    "Maghā",
    "Pūrva Phalgunī",
    "Uttara Phalgunī",
    "Hasta",
    "Chitra",
    "Swati",
    "Visakha",
    "Anuradha",
    "Jyeshtha",
    "Mula",
    "Purva Ashadha",
    "Uttara Ashadha",
    "Shravana",
    "Dhanishta",
    "Shatabhisha",
    "Purva Bhadrapada",
    "Uttara Bhadrapada",
    "Revathi"
  ];
  TextDisplay({Key? key, required this.membData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Table(
            border: TableBorder.all(color: const Color(0xFFFFFFFF)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(160),
              1: FixedColumnWidth(15),
              2: FixedColumnWidth(180),
            },
            children: [
              TableRow(
                children: [
                  Text(
                    'Nick Name: ${(membData.memName as String).substring(0, 6)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'End Date: ${DateFormat('dd-MMM-yyy').format(membData.memEndDate as DateTime)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Table(
            border: TableBorder.all(color: const Color(0xFFFFFFFF)),
            columnWidths: const {0: FixedColumnWidth(355)},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TableRow(children: [
                Text(
                  'Nakshatra: ${naks[(25) - 1]}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                )
              ]),
              const TableRow(children: [
                SizedBox(
                  height: 10,
                ),
              ]),
              TableRow(children: [
                Text(
                  'Birth City: ${(membData.memBcity as String).substring(0, 15)} ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}


// Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               child: Text('Nick Name: ${membData.memName}'),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child:
//                   Text('Nakshatra : ${naks[(membData.nakshtraID as int) - 1]}'),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               child: Text('Birth City: ${membData.memBcity}'),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               child: Text(
//                   'End Date: ${DateFormat('dd-MMM-yyy').format(membData.memEndDate as DateTime)}'),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//       ],
//     );
