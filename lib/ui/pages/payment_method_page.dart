part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;

  PaymentMethodPage(this.paymentURL);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
          title: "Finish Your Payment",
          subtitle: "Pelase select your favorite\npayment method",
          picturePath: "assets/Payment.png",
          widthPicture: 200,
          heightPicture: 176,
          buttonTap1: () async {
            await launch(paymentURL);
          },
          buttonText1: "Payment Method",
          buttonTap2: () {
            Get.to(SuccessOrderPage());
          },
          buttonText2: "Continue"),
    );
  }
}
