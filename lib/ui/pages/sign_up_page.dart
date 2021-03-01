part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  File pictureFile;
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return;
      },
      child: GeneralPage(
        onBackButton: () {
          Get.back();
        },
        title: "Sign Up",
        subtitle: "Register and eat",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  PickedFile pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    pictureFile = File(pickedFile.path);
                    setState(() {});
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/photo_border.png"),
                    )),
                    child: (pictureFile != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Image.file(
                              pictureFile,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            "assets/photo.png",
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 26, 0, 6),
              child: Text(
                "Full Name",
                style: blackTextStyle.copyWith(
                    fontSize: 16, color: "020202".toColor()),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: "020202".toColor()),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Type your full name",
                    hintStyle: greyTextStyle.copyWith(fontSize: 14),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 16, 0, 6),
              child: Text(
                "Email Address",
                style: blackTextStyle.copyWith(
                    fontSize: 16, color: "020202".toColor()),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: "020202".toColor()),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Type your email address",
                    hintStyle: greyTextStyle.copyWith(fontSize: 14),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 16, 0, 6),
              child: Text(
                "Password",
                style: blackTextStyle.copyWith(
                    fontSize: 16, color: "020202".toColor()),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: "020202".toColor()),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Type your password",
                    hintStyle: greyTextStyle.copyWith(fontSize: 14),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: mainColor,
                  child: Text(
                    "Continue",
                    style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: "020202".toColor()),
                  ),
                  onPressed: () {
                    Get.to(() => AddressPage(
                        UserModel(
                          name: nameController.text,
                          email: emailController.text,
                        ),
                        passwordController.text,
                        pictureFile));
                  }),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
