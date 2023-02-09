import 'package:ecommerce/api/model/response/ServerError.dart';

import 'User.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"ahmedadham@gmail.com","phone":"01010700700","password":"$2a$12$/FYcReMetKSRzoOVGviQFebSpMuOFTBquk2v17.SVTGpMz4QX3xMq","role":"user","_id":"63d58ae8e141ef86280d1011","createdAt":"2023-01-28T20:51:52.770Z","updatedAt":"2023-01-28T20:51:52.770Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDU4YWU4ZTE0MWVmODYyODBkMTAxMSIsImlhdCI6MTY3NDkzOTExMywiZXhwIjoxNjgyNzE1MTEzfQ.Hz7r8dS8rg7YLsk28Bvol6DPAmqGAB7ujsuWJYh1-Xo"

class RegisterResponse {
  RegisterResponse({
    this.user,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }
  User? user;
  String? token;
  List<ServerError>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }

  String mergeErrors() {
    String message = '';
    errors?.forEach((error) {
      message += '${error.msg ?? ''}\n';
    });
    return message;
  }
}
