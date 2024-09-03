class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? userType;
  String? about;
  String? salary;
  String? bDate;
  String? gender;
  List<String>? skills;
  List? favMedia;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.userType,
    this.about,
    this.salary,
    this.bDate,
    this.gender,
    this.skills,
    this.favMedia,
  });
}
