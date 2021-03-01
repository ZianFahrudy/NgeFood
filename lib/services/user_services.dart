part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<UserModel>> signIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + "login";

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      UserModel.token = data['data']['access_token'];
      UserModel user = UserModel.fromJson(data['data']['user']);

      return ApiReturnValue(value: user);
    } else {
      return ApiReturnValue(message: "User Gagal Login");
    }

    // return ApiReturnValue(message: "Email atau Password salah");
  }

  static Future<ApiReturnValue<UserModel>> signUp(
      UserModel user, String password,
      {File profilePath, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + "register";

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "name": user.name,
          "email": user.email,
          "password": password,
          "password_confirmation": password,
          "address": user.address,
          "city": user.city,
          "houseNumber": user.houseNumber,
          "phoneNumber": user.phoneNumber,
        }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      UserModel.token = data["data"]["access_token"];

      UserModel value = UserModel.fromJson(data["data"]["user"]);

      if (profilePath != null) {
        ApiReturnValue<String> result = await uploadProfilePicture(profilePath);

        if (result.value != null) {
          value = value.copyWith(
              picturePath:
                  "http://foodmarket-backend.buildwithangga.id/storage/" +
                      result.value);
        }
      }

      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: "Please Try Again");
    }
  }

  static Future signOut({http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "logout";
    var response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${UserModel.token}'
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    } else {
      var data = jsonDecode(response.body);

      bool value = data['data'];

      return ApiReturnValue(value: value);
    }
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseURL + "user/photo";

    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = "Bearer ${UserModel.token}";
    }

    var multiPartFile =
        await http.MultipartFile.fromPath("file", pictureFile.path);

    request.files.add(multiPartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: "Upload foto failed");
    }
  }
}
