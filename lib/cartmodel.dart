import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.packId,
    required this.packName,
    required this.packImage,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });
  int id;
  String userId;
  int packId;
  String packName;
  String packImage;
  int price;
  int discount;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      userId: json["user_id"],
      packId: json["pack_id"],
      packName: json["pack_name"],
      packImage: json["pack_image"],
      price: json["price"],
      discount: json["discount"],
      quantity: json["quantity"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pack_id": packId,
        "pack_name": packName,
        "pack_image": packImage,
        "price": price,
        "discount": discount,
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
