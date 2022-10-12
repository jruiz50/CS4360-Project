class menuType {
  final int typeMenuID;
  final String typeName;

  const menuType({
    required int typeMenuID,
    required String typeName,
  });

  Map<String, dynamic> toMap() {
    return {
      'typeMenuID' : typeMenuID,
      'typeName' : typeName,
    };
  }
}
