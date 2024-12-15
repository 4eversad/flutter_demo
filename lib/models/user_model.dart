class Social {
  String? email;
  String? website;
  String? username;
  Map<String, dynamic>? address;
  Social.fromMap(Map<String, dynamic> json) {
    email = json['email'];
    website = json['website'];
    username = json['username'];
    address = json['address'];
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;

  Address.fromMap(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
  }
}

class UserModels {
  int? id;
  String? realName;
  String? phone;
  Address? address;
  Social? social;
  UserModels.fromMap(Map<String, dynamic> json) {
    realName = json['name'];
    phone = json['phone'];
    social = Social.fromMap(json);
    address = Address.fromMap(json);
    id = json['id'];
  }
}
