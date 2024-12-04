import 'package:dio/dio.dart';
import 'package:dusty_app/model/stat_model.dart';

class StatRepository {
  static Future<List<StatModel>> fetchData({
    required ItemCode itemCode,
  }) async {
    try {
      final itemCodeStr = itemCode == ItemCode.PM25 ? 'PM2.5' : itemCode.name;
      final response = await Dio().get(
          'https://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
          queryParameters: {
            'serviceKey':
                'gUStr3UG2n+YhUGzTwQgwJst1IxgruUax9FhVvnGhDA5uqec5ig/yEQK5WCWgvlOph/sACZqQaS8G+MjHu5biA==',
            'returnType': 'json',
            'numOfRows': 5,
            'pageNo': 1,
            'itemCode': itemCodeStr,
            'dataGubun': 'HOUR',
            'searchCondition': 'week'
          });

      final List<String> skipKeys = [
        'dataGubun',
        'dataTime',
        'itemCode',
      ];

      final rawItemsList = (response.data['response']['body']['items'] as List)
          .whereType<Map<String, dynamic>>()
          .where((item) => item['dataTime'] != null) // dataTime이 null이 아닌 항목만
          .map((item) => item)
          .toList();

      List<StatModel> stats = [];
      for (Map<String, dynamic> item in rawItemsList) {
        final dateTime = item['dataTime'];
        for (String key in item.keys) {
          if (skipKeys.contains(key)) {
            continue;
          }
          final reginStr = key;
          final stat = key == 'incheon' ? '25' : item[reginStr];

          stats = [
            ...stats,
            StatModel(
                region: Region.values.firstWhere((e) => e.name == reginStr),
                stat: double.parse(stat),
                dateTime: DateTime.parse(dateTime),
                itemCode: itemCode)
          ];
        }
      }

      return stats;
    } catch (err) {
      print(err);
      // return null;
      return [];
    }
  }
}
