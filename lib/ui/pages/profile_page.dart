part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;

  ProfilePage(this.user);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(child: Container(color: "FAFAFC".toColor())),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      color: Colors.white,
                      height: 230,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 110,
                            width: 110,
                            child: Stack(
                              children: [
                                Image.asset("assets/photo_border.png",
                                    height: 110, width: 110, fit: BoxFit.cover),
                                Center(
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                // ignore: deprecated_member_use
                                                (context.bloc<UserCubit>().state
                                                        as UserLoaded)
                                                    .user
                                                    .picturePath),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                              // ignore: deprecated_member_use
                              (context.bloc<UserCubit>().state as UserLoaded)
                                  .user
                                  .name,
                              style: blackTextStyle.copyWith(fontSize: 18)),
                          SizedBox(height: 6),
                          Text(
                              // ignore: deprecated_member_use
                              (context.bloc<UserCubit>().state as UserLoaded)
                                  .user
                                  .email,
                              style: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w300))
                        ],
                      )),
                  CustomTabBars(
                      titles: ["Account", "FoodMarket"],
                      selectedIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin, vertical: 16),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  selectedIndex == 0
                                      ? "Edit Profile"
                                      : "Rate App",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              Image.asset("assets/right_arrow.png",
                                  height: 24, width: 24)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  selectedIndex == 0
                                      ? "Home Address"
                                      : "Help Center",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              Image.asset("assets/right_arrow.png",
                                  height: 24, width: 24)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  selectedIndex == 0
                                      ? "Security"
                                      : "Privacy & Policy",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              Image.asset("assets/right_arrow.png",
                                  height: 24, width: 24)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  selectedIndex == 0
                                      ? "Payments"
                                      : "Terms & Conditions",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              Image.asset("assets/right_arrow.png",
                                  height: 24, width: 24)
                            ],
                          ),
                          SizedBox(height: 10),
                          RaisedButton(
                              child: Text("Sign Out"),
                              onPressed: () {
                                // ignore: deprecated_member_use
                                context.bloc<UserCubit>().signOut();
                                Get.offAll(() => SignInPage());
                              })
                        ],
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
