class Login {
  String? password;
  String? email;

  Login({this.email, this.password});

  Login.fromjson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['email'] = email;
    data['password'] = password;

    return data;
  }

  static final user = [
    Login(password: '123456', email: 'nisreen.mando.20@gmail.com'),
    Login(password: '123123', email: 'raneem.mando.20@gmail.com'),
    Login(password: '123789', email: 'huda.mando.20@gmail.com'),
  ];
}
