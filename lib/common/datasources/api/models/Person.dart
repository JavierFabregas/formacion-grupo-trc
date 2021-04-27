
class PersonRepo {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  PersonRepo({this.id, this.email, this.firstName, this.lastName, this.avatar});

  PersonRepo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> person = new Map<String, dynamic>();
    person['id'] = this.id;
    person['email'] = this.email;
    person['first_name'] = this.firstName;
    person['last_name'] = this.lastName;
    person['avatar'] = this.avatar;
    return person;
  }
}