part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
          title: "Yeay! Completed",
          subtitle: "Now you are able to order\nsome foods as a self-reward",
          picturePath: "assets/food_wishes.png",
          heightPicture: 289,
          widthPicture: 200,
          buttonTap1: () {},
          buttonText1: "Find Foods"),
    );
  }
}
