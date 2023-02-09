/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedadham@gmail.com"
/// phone : "01010700700"
/// password : "$2a$12$/FYcReMetKSRzoOVGviQFebSpMuOFTBquk2v17.SVTGpMz4QX3xMq"
/// role : "user"
/// _id : "63d58ae8e141ef86280d1011"
/// createdAt : "2023-01-28T20:51:52.770Z"
/// updatedAt : "2023-01-28T20:51:52.770Z"
/// __v : 0

class User {
  User({
      this.name, 
      this.email, 
      this.phone, 
      this.password,
      this.id,
      });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
  }
  String? name;
  String? email;
  String? phone;
  String? password;
  String? id;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;

    return map;
  }

}