// Blueprint for all ingredients
// Each object has a ingredient ID, ingredient name, and a boolean indicating if it's an allergen.

class Ingredients {
  final int ingredientID;
  final String ingredientName;
  final bool isAllergen;

  Ingredients({
    required this.ingredientID,
    required this.ingredientName,
    required this.isAllergen,
  });

  Map<String, dynamic> toJson() => {
        'ingredientID': ingredientID,
        'ingredientName': ingredientName,
        'isAllergen': isAllergen,
      };

  static Ingredients fromJson(Map<String, dynamic> json) => Ingredients(
        ingredientID: json['ingredientID'],
        ingredientName: json['ingredientName'],
        isAllergen: json['isAllergen'],
      );
}
