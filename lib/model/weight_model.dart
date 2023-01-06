// ignore_for_file: unnecessary_null_comparison

class WeightModel {
  int? weightValue;
  String? dateTime;
  String? weightId;

  WeightModel({this.weightValue, this.dateTime='', this.weightId=''});

  WeightModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else {
      weightValue = map['weightValue'];
      dateTime = map['dateTime'];
      weightId = map['weightId'];
    }
  }

  toJson() {
    return {
      'weightValue': weightValue,
      'dateTime': dateTime,
      'weightId': weightId,
    };
  }
}
