// Blueprint for all food types
// Each object has a foodType ID, foodType abbreviation, and a foodType description.

class FoodType {
  final int foodTypeId;
  final String foodTypeAbbr;
  final String foodTypeDesc;

  FoodType(
      {required this.foodTypeId,
      required this.foodTypeAbbr,
      required this.foodTypeDesc});

  Map<String, dynamic> toJson() => {
        'foodTypeId': foodTypeId,
        'foodTypeAbbr': foodTypeAbbr,
        'foodTypeDesc': foodTypeDesc
      };

  static FoodType fromJson(Map<String, dynamic> json) => FoodType(
      foodTypeId: json['foodTypeId'],
      foodTypeAbbr: json['foodTypeAbbr'],
      foodTypeDesc: json['foodTypeDesc']);
}
