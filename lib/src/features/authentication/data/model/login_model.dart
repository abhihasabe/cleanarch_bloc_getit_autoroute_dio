import 'package:bloc_clean/src/features/authentication/domain/entity/mobile_authentication_entity.dart';

class LoginModel extends LoginEntity {
  int? status;
  String? message;
  DataModel? dataModel;

  LoginModel({this.status, this.message, this.dataModel});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = dataModel!.toJson();
    }
    return data;
  }
}

class DataModel extends DataEntity {
  int? id;
  String? firstname;
  String? lastname;
  String? mobile;
  String? password;
  String? aadhar;
  String? license;
  String? address;
  String? city;
  String? state;
  String? pin;
  int? status;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.mobile,
      this.password,
      this.aadhar,
      this.license,
      this.address,
      this.city,
      this.state,
      this.pin,
      this.status,
      this.rememberToken,
      this.createdAt,
      this.updatedAt});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobile = json['mobile'];
    password = json['password'];
    aadhar = json['aadhar'];
    license = json['license'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pin = json['pin'];
    status = json['status'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['mobile'] = mobile;
    data['password'] = password;
    data['aadhar'] = aadhar;
    data['license'] = license;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['pin'] = pin;
    data['status'] = status;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
