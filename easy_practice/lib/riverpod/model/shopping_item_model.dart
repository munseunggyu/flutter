class ShoppingItemModel {
  final String name;
  final int quantity;
  final bool hasBount;
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBount,
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({
    String? name,
    int? quantity,
    bool? hasBount,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        hasBount: hasBount ?? this.hasBount,
        isSpicy: isSpicy ?? this.isSpicy);
  }
}
