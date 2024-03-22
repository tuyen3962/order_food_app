// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String? id;
  @JsonKey(name: 'fullname')
  String? fullName;
  String? email;
  @JsonKey(name: 'avatar')
  String? avatat;
  @JsonKey(name: 'phone')
  String? phoneNumber;
  @JsonKey(name: 'fcm_token')
  String? fcmToken;
  String? description;

  Account({
    this.id,
    this.fullName,
    this.email,
    this.avatat,
    this.phoneNumber,
    this.fcmToken,
    this.description,
  });

  Account copyWith({
    String? id,
    String? fullName,
    String? email,
    String? avatat,
    String? phoneNumber,
    String? fcmToken,
    String? description,
  }) {
    return Account(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatat: avatat ?? this.avatat,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fcmToken: fcmToken ?? this.fcmToken,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
