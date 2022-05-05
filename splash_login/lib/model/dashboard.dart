class Dashboard {
  final String planet;
  final double chanGuru;
  final double lagShani;

  Dashboard({
    required this.planet,
    required this.chanGuru,
    required this.lagShani,
  });
  Dashboard.fromJson(Map<String, dynamic> item)
      : planet = item['planet'],
        chanGuru = double.parse(item['chanGuru'].toString()),
        lagShani = double.parse(item['lagShani'].toString());
}

class DashScore {
  List<Dashboard> dashList;
  List<Dashboard> happyList;
  DashScore.fromJson(Map<String, dynamic> data)
      : dashList = (data['dashList'] as List<dynamic>)
            .map(
              (item) => Dashboard.fromJson(item),
            )
            .toList(),
        happyList = (data['happyList'] as List<dynamic>)
            .map(
              (item) => Dashboard.fromJson(item),
            )
            .toList();
}

class YourDash {
  List<Dashboard> dashList = [
    Dashboard(planet: 'Surya', chanGuru: 5, lagShani: 7.5),
    Dashboard(planet: 'Budh', chanGuru: 5, lagShani: 7.5),
    Dashboard(planet: 'Shukra', chanGuru: -7, lagShani: 7.5),
    Dashboard(planet: 'Mangal', chanGuru: 10, lagShani: 7.5),
    Dashboard(planet: 'Guru', chanGuru: -7, lagShani: 7.5),
    Dashboard(planet: 'Shani', chanGuru: 7, lagShani: 7.5),
    Dashboard(planet: 'Rahu', chanGuru: 10, lagShani: 7.5),
    Dashboard(planet: 'Ketu', chanGuru: 10, lagShani: 7.5),
    Dashboard(planet: 'Total', chanGuru: 33, lagShani: 7.5),
  ];

  List<Dashboard> happinIndex = [
    Dashboard(planet: 'Lagna', chanGuru: 10, lagShani: -10),
    Dashboard(planet: 'Surya', chanGuru: 0, lagShani: -10),
    Dashboard(planet: 'Chandra', chanGuru: 0, lagShani: 0),
    Dashboard(planet: 'Mangal', chanGuru: 10, lagShani: -10),
    Dashboard(planet: 'Budha', chanGuru: 0, lagShani: -10),
    Dashboard(planet: 'Guru', chanGuru: 0, lagShani: -10),
    Dashboard(planet: 'Shukra', chanGuru: 10, lagShani: 0),
    Dashboard(planet: 'Shani', chanGuru: 0, lagShani: -10),
    Dashboard(planet: 'Rahu', chanGuru: 0, lagShani: 0),
    Dashboard(planet: 'Ketu', chanGuru: 10, lagShani: -10),
    Dashboard(planet: 'Total', chanGuru: 40, lagShani: -70),
  ];
}
