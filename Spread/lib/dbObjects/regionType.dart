class regionType {
  final int regionID;
  final String regionDesc;
  final String regionAbbr;

  regionType(
      {required this.regionID,
      required this.regionDesc,
      required this.regionAbbr});

  Map<String, dynamic> toJson() => {
        'regionID': regionID,
        'regionDesc': regionDesc,
        'regionAbbr': regionAbbr
      };

  static regionType fromJson(Map<String, dynamic> json) => regionType(
      regionID: json['regionID'],
      regionDesc: json['regionDesc'],
      regionAbbr: json['regionAbbr']);
}
