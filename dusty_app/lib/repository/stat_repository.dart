import 'package:dio/dio.dart';

class StatRepository {
  static Future<Map<String, dynamic>> fetchData() async {
    final response = await Dio().get(
        'https://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
        queryParameters: {
          'serviceKey':
              'gUStr3UG2n+YhUGzTwQgwJst1IxgruUax9FhVvnGhDA5uqec5ig/yEQK5WCWgvlOph/sACZqQaS8G+MjHu5biA==',
          'returnType': 'json',
          'numOfRows': 100,
          'pageNo': 1,
          'itemCode': 'PM10',
          'dataGubun': 'HOUR',
          'searchCondition': 'week'
        });
    return response.data;
  }
}
