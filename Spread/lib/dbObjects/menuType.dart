class menuType {
  final int typeMenuID;
  final String typeName;

  menuType({
    required this.typeMenuID,
    required this.typeName,
  });

  Map<String, dynamic> toJson() =>
      {'typeMenuID': typeMenuID, 'typeName': typeName};

  static menuType fromJson(Map<String, dynamic> json) =>
      menuType(typeMenuID: json['typeMenuID'], typeName: json['typeName']);
}
