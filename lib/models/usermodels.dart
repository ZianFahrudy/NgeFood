part of 'models.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  UserModel(
      {this.address,
      this.city,
      this.email,
      this.houseNumber,
      this.id,
      this.name,
      this.phoneNumber,
      this.picturePath});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        address: json['address'],
        city: json['city'],
        email: json['email'],
        houseNumber: json['houseNumber'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        picturePath: json['profile_photo_url']);
  }

  UserModel copyWith(
          {int id,
          String name,
          String email,
          String address,
          String houseNumber,
          String phoneNumber,
          String city,
          String picturePath}) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        email: email ?? this.email,
        city: city ?? this.city,
        houseNumber: houseNumber ?? this.houseNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        picturePath: picturePath ?? this.picturePath,
      );

  @override
  List<Object> get props =>
      [id, name, address, email, city, houseNumber, phoneNumber, picturePath];
}

UserModel mockUser = UserModel(
    id: 1,
    name: "Zian Fahrudy",
    email: "zian@ganteng.com",
    address: "Jalan Akasia",
    houseNumber: "21",
    phoneNumber: "088123548499",
    city: "Bandung",
    picturePath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpgAPh5lfD9K1SNbjO9edqHQPZhZR2VFkN8g&usqp=CAU");
