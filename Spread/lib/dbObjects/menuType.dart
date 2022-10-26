//Blueprint for all menu types

class MenuType {
  final int typeMenuID;
  final String typeName;

  MenuType({
    required this.typeMenuID,
    required this.typeName,
  });

  Map<String, dynamic> toJson() =>
      {'typeMenuID': typeMenuID, 'typeName': typeName};

  static MenuType fromJson(Map<String, dynamic> json) =>
      MenuType(typeMenuID: json['typeMenuID'], typeName: json['typeName']);
}
