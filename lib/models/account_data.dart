import 'dart:convert';

AccountData AccountDataFromJson(String str) =>
    AccountData.fromJson(json.decode(str));

String AccountDataToJson(AccountData data) => json.encode(data.toJson());

class AccountData {
  AccountData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.accountNumber,
    this.name,
    this.houseNumber,
    this.streetName,
    this.area,
    this.meterNumber,
    this.accountId,
    this.model,
    this.status,
    this.routeId,
    this.meterId,
    this.reading,
    this.reader,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int accountNumber;
  String name;
  String houseNumber;
  String streetName;
  String area;
  int meterNumber;
  int accountId;
  String model;
  String status;
  int routeId;
  int meterId;
  int reading;
  int reader;

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        accountNumber: json["account_number"],
        name: json["name"],
        houseNumber: json["house_number"],
        streetName: json["street_name"],
        area: json["area"],
        meterNumber: json["meter_number"],
        accountId: json["account_id"],
        model: json["model"],
        status: json["status"],
        routeId: json["route_id"],
        meterId: json["meter_id"],
        reading: json["reading"],
        reader: json["reader"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "account_number": accountNumber,
        "name": name,
        "house_number": houseNumber,
        "street_name": streetName,
        "area": area,
        "meter_number": meterNumber,
        "account_id": accountId,
        "model": model,
        "status": status,
        "route_id": routeId,
        "meter_id": meterId,
        "reading": reading,
        "reader": reader,
      };
}
