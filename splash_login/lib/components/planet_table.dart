import 'package:flutter/material.dart';
import 'package:splash_login/components/horizontal_scrollable.dart';
import 'package:splash_login/model/birth_chart.dart';
import 'package:splash_login/model/member.dart';

class PlanetTable extends StatelessWidget {
  final Member memData;
  final List<String> rashi = [
    "Mesha",
    "Vrushabha",
    "Mithuna",
    "Karka",
    "Simha",
    "Kanya",
    "Tula",
    "Vrushchika",
    "Dhanu",
    "Makara",
    "Kumbha",
    "Meena"
  ];
  PlanetTable({Key? key, required this.memData}) : super(key: key);

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<BirthChart> birthCharts) =>
      birthCharts.map((BirthChart birthChart) {
        final cells = [
          birthChart.planets,
          birthChart.rashi,
          birthChart.longitude,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  Future<List<BirthChart>> _createBirthChart() {
    return Future(
      () {
        List<BirthChart> birthChart = [];

        birthChart.add(
          BirthChart(
            planets: 'ASC',
            rashi: rashi[memData.lagnaRashi - 1],
            longitude: lon2dmsz(memData.lagnaDegree),
          ),
        );
        birthChart.add(
          BirthChart(
            planets: 'Surya ${memData.surRetro ? '(R)' : ''}',
            rashi: rashi[memData.suryaRashi - 1],
            longitude: lon2dmsz(memData.suryaDegree),
          ),
        );

        birthChart.add(
          BirthChart(
            planets: 'Chandra ${memData.chaRetro ? '(R)' : ''}',
            rashi: rashi[memData.chandraRashi - 1],
            longitude: lon2dmsz(memData.chandraDegree),
          ),
        );

        birthChart.add(
          BirthChart(
              planets: 'Mangal ${memData.manRetro ? '(R)' : ''}',
              rashi: rashi[memData.mangalRashi - 1],
              longitude: lon2dmsz(memData.mangalDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Budha ${memData.budRetro ? '(R)' : ''}',
              rashi: rashi[memData.budhRashi - 1],
              longitude: lon2dmsz(memData.budhDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Guru ${memData.gurRetro ? '(R)' : ''}',
              rashi: rashi[memData.guruRashi - 1],
              longitude: lon2dmsz(memData.guruDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Shukra ${memData.shuRetro ? '(R)' : ''}',
              rashi: rashi[memData.shukraRashi - 1],
              longitude: lon2dmsz(memData.shukraDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Shani ${memData.shaRetro ? '(R)' : ''}',
              rashi: rashi[memData.shaniRashi - 1],
              longitude: lon2dmsz(memData.shaniDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Rahu ${memData.rahRetro ? '(R)' : ''}',
              rashi: rashi[memData.rahuRashi - 1],
              longitude: lon2dmsz(memData.rahuDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: "Ketu ${memData.ketRetro ? '(R)' : ''}",
              rashi: rashi[memData.ketuRashi - 1],
              longitude: lon2dmsz(memData.ketuDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Uran ${memData.uraRetro ? '(R)' : ''}',
              rashi: rashi[memData.uranuRashi - 1],
              longitude: lon2dmsz(memData.uranuDegree)),
        );

        birthChart.add(
          BirthChart(
              planets: 'Nept ${memData.nepRetro ? '(R)' : ''}',
              rashi: rashi[memData.neptuneRashi - 1],
              longitude: lon2dmsz(memData.neptuneDegree)),
        );
        return birthChart;
      },
    );
  }

  String lon2dmsz(x) {
    var x1 = x.abs();
    //let z = Math.floor(x / 30);
    var d = x1.floor();
    var ss0 = ((x1 - d) * 3600).round();
    var m = (ss0 / 60).floor();
    var s = (ss0 % 60) % 60;
    d = d % 30;
    //var str = d.toString() + " " + m.toString() + "'" + s.toString() + "\" ";
    var str = d.toString() + ":" + m.toString();
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollable(
      child: FutureBuilder(
        future: Future.wait([_createBirthChart()]),
        builder: (BuildContext context, AsyncSnapshot projectSnap) {
          final columns = ['Planets', 'Rashi', 'Longitude'];
          Widget child;
          if (projectSnap.hasData) {
            child = DataTable(
                columns: getColumns(columns),
                rows: getRows(projectSnap.data[0]),
                columnSpacing: 40,
                headingRowHeight: 40,
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) {
                    return Colors.grey.shade100;
                  },
                ));
          } else {
            child = Container();
          }
          return child;
        },
      ),
    );
  }
}
