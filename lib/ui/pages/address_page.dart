part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final UserModel user;
  final String password;
  final File pictureFile;
  AddressPage(this.user, this.password, this.pictureFile);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<String> cities = [];
  String selectedCity;
  bool isLoading = false;

  void initState() {
    super.initState();

    cities = ['Lombok', 'Bandung', 'Jogja'];
    selectedCity = cities[0];
  }

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
        title: "Address",
        subtitle: "Make sure it’s valid",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 26, 0, 6),
              child: Text(
                "Phone No.",
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
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Type your phone number",
                    hintStyle: greyTextStyle.copyWith(fontSize: 14),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 16, 0, 6),
              child: Text(
                "Address",
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
                controller: addressController,
                decoration: InputDecoration(
                    hintText: "Type your address",
                    hintStyle: greyTextStyle.copyWith(fontSize: 14),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 16, 0, 6),
              child: Text(
                "House No.",
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
                controller: houseController,
                decoration: InputDecoration(
                    hintText: "Type your password",
                    hintStyle: greyTextStyle.copyWith(fontSize: 14),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 16, 0, 6),
              child: Text(
                "City",
                style: blackTextStyle.copyWith(
                    fontSize: 16, color: "020202".toColor()),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: "020202".toColor()),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButton(
                  value: selectedCity,
                  isExpanded: true,
                  items: cities
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: blackTextStyle.copyWith(
                                fontSize: 16, color: "020202".toColor()),
                          )))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedCity = item;
                    });
                  }),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: isLoading
                  ? loadingIndicator
                  : RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: mainColor,
                      child: Text(
                        "Sign Up Now",
                        style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: "020202".toColor()),
                      ),
                      onPressed: () async {
                        UserModel user = widget.user.copyWith(
                          address: addressController.text,
                          phoneNumber: phoneController.text,
                          houseNumber: houseController.text,
                          city: selectedCity,
                        );

                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signUp(
                            user, widget.password,
                            pictureFile: widget.pictureFile);

                        UserState state = (context.read<UserCubit>().state);
                        if (state is UserLoaded) {
                          context.read<FoodCubit>().getFoods();

                          context.read<TransactionCubit>().getTransactions();

                          Get.to(() => MainPage());
                        } else {
                          Get.snackbar("", "",
                              titleText: Text("Sign Up Failed"),
                              backgroundColor: Colors.pink,
                              messageText: Text("Please try again"));

                          setState(() {
                            isLoading = false;
                          });
                        }
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
