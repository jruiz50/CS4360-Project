// Blueprint for all food types
// Each object has a foodType ID, foodType abbreviation, and a foodType description.

class foodType {
  final int foodTypeId;
  final String foodTypeAbbr;
  final String foodTypeDesc;

  foodType({
    required this.foodTypeId,
    required this.foodTypeAbbr,
    required this.foodTypeDesc
  });

  Map<String, dynamic> toJson() => {
    'foodTypeId' : foodTypeId,
    'foodTypeAbbr' : foodTypeAbbr,
    'foodTypeDesc' : foodTypeDesc
  };

  static foodType fromJson(Map<String, dynamic> json) => foodType(
    foodTypeId: json['foodTypeId'],
    foodTypeAbbr: json['foodTypeAbbr'],
    foodTypeDesc: json['foodTypeDesc']
  );
}