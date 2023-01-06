// ignore_for_file: unnecessary_null_comparison

class ProductWeightModel {
  String? weightValue , dateTime ;
  // String? weightId;

  ProductWeightModel(
      {this.weightValue = '',
      this.dateTime = '',
      // this.weightId
      });

  ProductWeightModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else {
      weightValue = map['weightValue'];
      dateTime = map['dateTime'];
      // weightId = map['weightId'];
    }
  }

  toJson() {
    return {
      'weightValue': weightValue,
      'dateTime': dateTime,
      // 'weightId': weightId,
    };
  }
}
