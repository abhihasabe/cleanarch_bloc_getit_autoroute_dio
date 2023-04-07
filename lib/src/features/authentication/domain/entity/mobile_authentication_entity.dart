import 'package:equatable/equatable.dart';

class MobileAuthenticationEntity extends Equatable {
  List<DataEntity>? data;

  MobileAuthenticationEntity({this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class DataEntity extends Equatable {
  int? userCode;
  String? message;
  int? status;
  String? oTPMessage;
  int? sendMessage;
  String? mobileNumber;
  String? userType;

  DataEntity(
      {this.userCode,
      this.message,
      this.status,
      this.oTPMessage,
      this.sendMessage,
      this.mobileNumber,
      this.userType});

  @override
  // TODO: implement props
  List<Object?> get props => [
        userCode,
        message,
        status,
        oTPMessage,
        sendMessage,
        mobileNumber,
        userType
      ];
}
