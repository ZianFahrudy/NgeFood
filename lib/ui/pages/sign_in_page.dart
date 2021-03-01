part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign In",
      subtitle: "Find your best ever meal",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(defaultMargin, 26, 0, 6),
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
          isLoading
              ? loadingIndicator
              : Container(
                  height: 45,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: mainColor,
                      child: Text(
                        "Sign In",
                        style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: "020202".toColor()),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signIn(
                            emailController.text, passwordController.text);

                        UserState state = (context.read<UserCubit>().state);
                        if (state is UserLoaded) {
                          context.read<FoodCubit>().getFoods();

                          context.read<TransactionCubit>().getTransactions();

                          Get.to(() => MainPage());
                        } else {
                          Get.snackbar("", "",
                              titleText: Text("Sign In Failed"),
                              backgroundColor: Colors.pink,
                              messageText: Text("Email and Password Wrong"));

                          setState(() {
                            isLoading = false;
                          });
                        }
                      }),
                ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: greyColor,
                child: Text(
                  "Create New Account",
                  style: whiteTextStyle.copyWith(color: whiteColor),
                ),
                onPressed: () {
                  Get.to(() => SignUpPage());
                }),
          )
        ],
      ),
    );
  }
}
