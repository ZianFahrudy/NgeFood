part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
          title: "You’ve Made Order",
          subtitle: "Just stay at home while we are\npreparing your best foods",
          picturePath: "assets/bike.png",
          widthPicture: 200,
          heightPicture: 176,
          buttonTap1: () {
            Get.offAll(() => MainPage());
          },
          buttonText1: "Order Other Foods",
          buttonTap2: () {
            Get.offAll(() => MainPage(initialPage: 1));
          },
          buttonText2: "View My Order"),
    );
  }
}
