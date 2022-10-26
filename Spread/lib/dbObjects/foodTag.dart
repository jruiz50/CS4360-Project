// Blueprint for all food tags
// Each object has a food tag ID, food tag name, food tag description, food tag count

class FoodTag {
  final int foodTagId;
  final String foodTagName;
  final String foodTagDesc;
  final int foodTagCount;

  FoodTag(
      {required this.foodTagId,
      required this.foodTagName,
      required this.foodTagDesc,
      required this.foodTagCount});

  Map<String, dynamic> toJson() => {
        'foodTagId': foodTagId,
        'foodTagName': foodTagName,
        'foodTagDesc': foodTagDesc,
        'foodTagCount': foodTagCount
      };

  static FoodTag fromJson(Map<String, dynamic> json) => FoodTag(
      foodTagId: json['foodTagId'],
      foodTagName: json['foodTagName'],
      foodTagDesc: json['foodTagDesc'],
      foodTagCount: json['foodTagCount']);
}
