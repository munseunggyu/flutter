import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_practice/models/makeup_model.dart';

class MakeupControllder extends GetxController {
  var makeupList = <MakeupModel>[].obs;
  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchMakeupData();
  }

  void fetchMakeupData() async {
    final response = await dio.get(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    final List<dynamic> rawData = response.data;

    final List<MakeupModel> data = rawData.map((e) {
      return MakeupModel.fromJson(e);
    }).toList();
    makeupList.assignAll(data);
  }

  void changeHeart(int id) {
    final index = makeupList.indexWhere((product) => product.id == id);
    if (index != -1) {
      makeupList[index].heart = !makeupList[index].heart; // 반응형 상태를 변경
    }
    makeupList.refresh();
  }
}
