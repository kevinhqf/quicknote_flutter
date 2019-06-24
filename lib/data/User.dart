class User {
  int user_id;
  String phone;
  String password;
  String create_time;
  String wechat;
  String qq;
  String name;
  String icon;
  User(this.user_id, this.phone, this.password, this.create_time, this.wechat,
      this.qq, this.name, this.icon);
  factory User.fromJson(Map<String, dynamic> map) {
    if (map==null) return null;
    return User(map['user_id'], map['phone'], map['password'],
        map['create_time'], map['wechat'], map['qq'], map['name'], map['icon']);
  }
}
