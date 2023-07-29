class DataUsers {
  String? name;
  String? email;
  String? mobileno;
  String? address;
  String? password;
  String? confirmpassword;

  DataUsers(
      {this.address,
      this.confirmpassword,
      this.email,
      this.mobileno,
      this.name,
      this.password});

  DataUsers.fromjson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        mobileno = json['mobileno'],
        address = json['address'],
        password = json['password'],
        confirmpassword = json['confirmpassword'];

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['mobileno'] = mobileno;
    data['address'] = address;
    data['password'] = password;
    data['confirmpassword'] = confirmpassword;

    return data;
  }
}
