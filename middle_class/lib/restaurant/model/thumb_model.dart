class ThumbModel {
  String id;
  int count;

  ThumbModel({required this.count, required this.id});

  ThumbModel copyWith({String? id, int? count}) {
    return ThumbModel(count: count ?? this.count, id: id ?? this.id);
  }
}
