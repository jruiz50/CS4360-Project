//Blueprint for all region types

class RegionType {
  final int regionID;
  final String regionDesc;
  final String regionAbbr;

  RegionType(
      {required this.regionID,
      required this.regionDesc,
      required this.regionAbbr});

  Map<String, dynamic> toJson() => {
        'regionID': regionID,
        'regionDesc': regionDesc,
        'regionAbbr': regionAbbr
      };

  static RegionType fromJson(Map<String, dynamic> json) => RegionType(
      regionID: json['regionID'],
      regionDesc: json['regionDesc'],
      regionAbbr: json['regionAbbr']);
}
