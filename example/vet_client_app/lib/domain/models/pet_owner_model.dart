// ignore_for_file: must_be_immutable
import 'package:web_ui_plugins/web_ui_plugins.dart';

/// Pet owner model — the minimal model a developer defines to onboard a new section.
class PetOwnerModel extends DataModel {
  String? id;
  String? name;
  String? address;
  String? mobile;
  String? alternateMobile;
  String? email;
  String? whatsapp;
  String? pincode;

  PetOwnerModel({
    this.id,
    this.name,
    this.address,
    this.mobile,
    this.alternateMobile,
    this.email,
    this.whatsapp,
    this.pincode,
  });

  PetOwnerModel copyWith({
    String? id,
    String? name,
    String? address,
    String? mobile,
    String? alternateMobile,
    String? email,
    String? whatsapp,
    String? pincode,
  }) {
    return PetOwnerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      mobile: mobile ?? this.mobile,
      alternateMobile: alternateMobile ?? this.alternateMobile,
      email: email ?? this.email,
      whatsapp: whatsapp ?? this.whatsapp,
      pincode: pincode ?? this.pincode,
    );
  }

  PetOwnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
    alternateMobile = json['alternateMobile'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    pincode = json['pincode'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['mobile'] = mobile;
    data['alternateMobile'] = alternateMobile;
    data['email'] = email;
    data['whatsapp'] = whatsapp;
    data['pincode'] = pincode;
    return data;
  }

  @override
  String? get uid => id;

  @override
  String? get title => name;

  @override
  String? get subTitle => mobile;
}
