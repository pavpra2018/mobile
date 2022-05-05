class YourPostData {
  final String title;
  final DateTime postDate;
  final String posting;

  YourPostData({
    required this.title,
    required this.postDate,
    required this.posting,
  });
  YourPostData.fromJson(Map<String, dynamic> item)
      : title = item['title'],
        postDate = item['postDate'].toDate(),
        posting = item['posting'];
}

class PostList {
  List<YourPostData> postDataList;
  PostList({required this.postDataList});

  PostList.fromJson(Map<String, dynamic> data)
      : postDataList = (data['membPosting'] as List<dynamic>)
            .map(
              (item) => YourPostData.fromJson(item),
            )
            .toList();
}

class YourPost {
  List<Map<String, dynamic>> postPub = [
    {
      'key': '01',
      'publDate': DateTime.now(),
      'title':
          'WEDNESDAY night 19:55PM JAN-05 to SATURDAY early-hours 12:15AM JAN-08',
    },
    {
      'key': '02',
      'publDate': DateTime.now(),
      'title':
          'TUESDAY evening 16:45PM DEC-28 to THURSDAY night 19:10PM DEC-30',
    },
    {
      'key': '03',
      'publDate': DateTime.now(),
      'title':
          'WEDNESDAY night 19:55PM JAN-05 to SATURDAY early-hours 12:15AM JAN-08',
    },
    {
      'key': '04',
      'publDate': DateTime.now(),
      'title': 'THURSDAY night 19:10PM DEC-30 to SATURDAY night 19:20PM JAN-01',
    },
    {
      'key': '05',
      'publDate': DateTime.now().subtract(const Duration(days: 55, hours: 10)),
      'title':
          'FRIDAY early-morning 02:40AM DEC-24 to SUNDAY morning 11:15AM DEC-26',
    },
    {
      'key': '06',
      'publDate': DateTime.now().subtract(const Duration(days: 155, hours: 10)),
      'title':
          'SUNDAY morning 11:15AM DEC-26 to TUESDAY evening 16:45PM DEC-28',
    },
    {
      'key': '07',
      'publDate': DateTime.now().subtract(const Duration(days: 255, hours: 10)),
      'title':
          'TUESDAY evening 16:45PM DEC-28 to THURSDAY night 19:10PM DEC-30',
    },
    {
      'key': '08',
      'publDate': DateTime.now().subtract(const Duration(days: 355, hours: 10)),
      'title': 'SATURDAY night 19:20PM JAN-01 to MONDAY night 18:55PM JAN-03',
    },
    {
      'key': '09',
      'publDate': DateTime.now().subtract(const Duration(days: 455, hours: 10)),
      'title':
          'WEDNESDAY night 19:55PM JAN-05 to SATURDAY early-hours 12:15AM JAN-08',
    },
    {
      'key': '10',
      'publDate': DateTime.now().subtract(const Duration(days: 555, hours: 10)),
      'title': 'SATURDAY night 19:20PM JAN-01 to MONDAY night 18:55PM JAN-03',
    },
  ];
}
