
class User {
  String name = "";
  String lastname = "";
  String phone = "";

  User(name, lastname, phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }

  User.fromJSON(Map<String, dynamic> jsonMap) {
    
  }
}