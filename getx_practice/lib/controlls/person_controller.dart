import 'package:get/get.dart';
import 'package:getx_practice/models/person_model.dart';

class PersonController extends GetxController {
  final person = PersonModel().obs;

  void updateInfo() {
    // state의 현재 값에 접근 가능
    person.update((val) {
      val?.age++;
      val?.name = 'MSG';
    });
    update(); // rx일 떄는 하지 않아도 된다.
  }
}
