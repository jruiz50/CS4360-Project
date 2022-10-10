class regionType {
  final int regionID;
  final String regionDesc;
  final String regionAbbr;

  const regionType({
    required int regionID,
    required String regionDesc,
    required String regionAbbr,
  });

  Map<String, dynamic> toMap() {
    return {
      'regionID' : regionID,
      'regionDesc' : regionDesc,
      'regionAbbr' : regionAbbr,
    };
  }
}
