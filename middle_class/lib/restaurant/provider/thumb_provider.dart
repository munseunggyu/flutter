import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middle_class/restaurant/model/thumb_model.dart';

final thumbListPrivider =
    StateNotifierProvider<ThumbListNotifier, List<ThumbModel>>(
        (ref) => ThumbListNotifier());

class ThumbListNotifier extends StateNotifier<List<ThumbModel>> {
  ThumbListNotifier()
      : super([
          ThumbModel(count: 0, id: '5ac83bfb-f2b5-55f4-be3c-564be3f01a5b'),
          ThumbModel(count: 0, id: '15480ad3-892f-50ce-ab39-540c34c6fb5a')
        ]);

  handleUpThumb(String id) {
    state = state
        .map((e) => e.id == id ? e.copyWith(count: e.count + 1) : e)
        .toList();
  }
}
