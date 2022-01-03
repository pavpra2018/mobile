import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:splash_login/model/member.dart';
import '../gene/colors.dart' as custcolor;

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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                custcolor.AppColor.gradientFirst.withOpacity(0.8),
                custcolor.AppColor.gradientSecond
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.09,
                  left: 30,
                  right: 30,
                  bottom: 10,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Chart',
                          style: TextStyle(
                            fontSize: 20,
                            color: custcolor.AppColor.pageTitle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 10,
            left: 30,
            right: 30,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${membData.memName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: RichText(
                            text: TextSpan(
                              text: 'Membership End : ',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(1.0),
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                    text: DateFormat('dd-MMM-yyy').format(
                                        membData.memEndDate as DateTime),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: custcolor.AppColor.pageTitle)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: RichText(
                            text: TextSpan(
                              text: 'Nakshatra : ',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(1.0),
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                    text: naks[(25) - 1],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: custcolor.AppColor.pageTitle)),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: RichText(
                            text: TextSpan(
                              text: 'Birth City : ',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(1.0),
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                    text: membData.memBcity,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: custcolor.AppColor.pageTitle)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildText() {
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
