class UserModel {
  String? age;
  String? username;

  UserModel({this.age, this.username});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    age = json['age'] ;
    username = json['username'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['username'] = this.username;
    return data;
  }
}
