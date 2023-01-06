// ignore_for_file: unnecessary_null_comparison

class UserModel {
  String? userId, email, name, pic;

  UserModel({this.userId, this.email, this.name, this.pic});

  UserModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else {
      userId = map['userId'];
      email = map['email'];
      name = map['name'];
      pic = map['pic'];
    }
  }

  toJson() {
    return {
      'userId' : userId ,
      'email' : email ,
      'name' : name ,
      'pic' : pic ,
    };
  }
}
