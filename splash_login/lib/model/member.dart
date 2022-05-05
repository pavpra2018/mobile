class Member {
  final int lagnaRashi;
  final double lagnaDegree;

  final int suryaRashi;
  final double suryaDegree;
  final bool surRetro;
  final int surHsg;

  final int chandraRashi;
  final double chandraDegree;
  final bool chaRetro;
  final int chaHsg;

  final int mangalRashi;
  final int budhRashi;
  final int guruRashi;
  final int shukraRashi;
  final int shaniRashi;
  final int rahuRashi;
  final int ketuRashi;
  final int uranuRashi;
  final int neptuneRashi;
  final int plutoRashi;

  final double mangalDegree;
  final double budhDegree;
  final double guruDegree;
  final double shukraDegree;
  final double shaniDegree;
  final double rahuDegree;
  final double ketuDegree;
  final double uranuDegree;
  final double neptuneDegree;
  final double plutoDegree;

  final bool manRetro;
  final bool budRetro;
  final bool gurRetro;
  final bool shuRetro;
  final bool shaRetro;
  final bool rahRetro;
  final bool ketRetro;
  final bool uraRetro;
  final bool nepRetro;
  final bool pluRetro;

  final int manHsg;
  final int budHsg;
  final int gurHsg;
  final int shuHsg;
  final int shaHsg;
  final int rahHsg;
  final int ketHsg;
  final int uraHsg;
  final int nepHsg;
  final int pluHsg;
  String? memID;
  String? memName;
  String? memBcity;
  int? nakshtraID;
  int? nakGraha;
  DateTime? memStartDate;
  DateTime? memEndDate;

  Member.fromJson(List<dynamic> member)
      : lagnaRashi = member[0]["zodiac_name"],
        lagnaDegree = double.parse(member[0]["zodiac_degree"]),
        suryaRashi = member[1]["zodiac_name"],
        suryaDegree = double.parse(member[1]["zodiac_degree"]),
        surRetro = member[1]["isRetroGrade"],
        surHsg = member[1]["planetHouse"],
        chandraRashi = member[2]["zodiac_name"],
        chandraDegree = double.parse(member[2]["zodiac_degree"]),
        chaRetro = member[2]["isRetroGrade"],
        chaHsg = member[2]["planetHouse"],
        mangalRashi = member[5]["zodiac_name"],
        mangalDegree = double.parse(member[5]["zodiac_degree"]),
        manRetro = member[5]["isRetroGrade"],
        manHsg = member[5]["planetHouse"],
        budhRashi = member[3]["zodiac_name"],
        budhDegree = double.parse(member[3]["zodiac_degree"]),
        budRetro = member[3]["isRetroGrade"],
        budHsg = member[3]["planetHouse"],
        guruRashi = member[6]["zodiac_name"],
        guruDegree = double.parse(member[6]["zodiac_degree"]),
        gurRetro = member[6]["isRetroGrade"],
        gurHsg = member[6]["planetHouse"],
        shukraRashi = member[4]["zodiac_name"],
        shukraDegree = double.parse(member[4]["zodiac_degree"]),
        shuRetro = member[4]["isRetroGrade"],
        shuHsg = member[4]["planetHouse"],
        shaniRashi = member[7]["zodiac_name"],
        shaniDegree = double.parse(member[7]["zodiac_degree"]),
        shaRetro = member[7]["isRetroGrade"],
        shaHsg = member[7]["planetHouse"],
        rahuRashi = member[11]["zodiac_name"],
        rahuDegree = double.parse(member[11]["zodiac_degree"]),
        rahRetro = member[11]["isRetroGrade"],
        rahHsg = member[11]["planetHouse"],
        ketuRashi = member[12]["zodiac_name"],
        ketuDegree = double.parse(member[12]["zodiac_degree"]),
        ketRetro = member[12]["isRetroGrade"],
        ketHsg = member[12]["planetHouse"],
        uranuRashi = member[8]["zodiac_name"],
        uranuDegree = double.parse(member[8]["zodiac_degree"]),
        uraRetro = member[8]["isRetroGrade"],
        uraHsg = member[8]["planetHouse"],
        neptuneRashi = member[9]["zodiac_name"],
        neptuneDegree = double.parse(member[9]["zodiac_degree"]),
        nepRetro = member[9]["isRetroGrade"],
        nepHsg = member[9]["planetHouse"],
        plutoRashi = member[10]["zodiac_name"],
        plutoDegree = double.parse(member[10]["zodiac_degree"]),
        pluRetro = member[10]["isRetroGrade"],
        pluHsg = member[10]["planetHouse"];

  Member.fromMap(Map<String, dynamic> member)
      : lagnaRashi = member["lagnaRashi"],
        lagnaDegree = member["lagnaDegree"],
        suryaRashi = member["suryaRashi"],
        suryaDegree = member["suryaDegree"],
        surRetro = member["surRetro"],
        surHsg = member["surHsg"],
        chandraRashi = member["chandraRashi"],
        chandraDegree = member["chandraDegree"],
        chaRetro = member["chaRetro"],
        chaHsg = member["chaHsg"],
        mangalRashi = member["mangalRashi"],
        mangalDegree = member["mangalDegree"],
        manRetro = member["manRetro"],
        manHsg = member["manHsg"],
        budhRashi = member["budhRashi"],
        budhDegree = member["budhDegree"],
        budRetro = member["budRetro"],
        budHsg = member["budHsg"],
        guruRashi = member["guruRashi"],
        guruDegree = member["guruDegree"],
        gurRetro = member["gurRetro"],
        gurHsg = member["gurHsg"],
        shukraRashi = member["shukraRashi"],
        shukraDegree = member["shukraDegree"],
        shuRetro = member["shuRetro"],
        shuHsg = member["shuHsg"],
        shaniRashi = member["shaniRashi"],
        shaniDegree = member["shaniDegree"],
        shaRetro = member["shaRetro"],
        shaHsg = member["shaHsg"],
        rahuRashi = member["rahuRashi"],
        rahuDegree = member["rahuDegree"],
        rahRetro = member["rahRetro"],
        rahHsg = member["rahHsg"],
        ketuRashi = member["ketuRashi"],
        ketuDegree = member["ketuDegree"],
        ketRetro = member["ketRetro"],
        ketHsg = member["ketHsg"],
        uranuRashi = member["uranuRashi"],
        uranuDegree = member["uranuDegree"],
        uraRetro = member["uraRetro"],
        uraHsg = member["uraHsg"],
        neptuneRashi = member["neptuneRashi"],
        neptuneDegree = member["neptuneDegree"],
        nepRetro = member["nepRetro"],
        nepHsg = member["nepHsg"],
        plutoRashi = member["plutoRashi"],
        plutoDegree = member["plutoDegree"],
        pluRetro = member["pluRetro"],
        pluHsg = member["pluHsg"],
        memName = member["memName"],
        memID = member["memID"],
        memBcity = member["memBcity"],
        nakshtraID = member["nakshtraID"],
        nakGraha = member["nakGraha"],
        memStartDate = member["memStartDate"].toDate(),
        memEndDate = member["memEndDate"].toDate();
  //memStartDate = member["memStartDate"].toDate(),
  //memEndDate = member["memEndDate"].toDate();
}
