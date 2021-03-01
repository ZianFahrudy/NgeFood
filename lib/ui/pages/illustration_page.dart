part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String picturePath;
  final String title;
  final String subtitle;
  final String buttonText1;
  final String buttonText2;
  final Function buttonTap1;
  final Function buttonTap2;
  final double heightPicture;
  final double widthPicture;

  IllustrationPage(
      {@required this.title,
      @required this.subtitle,
      @required this.picturePath,
      this.buttonTap1,
      this.buttonTap2,
      this.buttonText1,
      this.buttonText2,
      this.heightPicture,
      this.widthPicture});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(picturePath,
              width: widthPicture, height: heightPicture, fit: BoxFit.cover),
          SizedBox(height: 30),
          Text(title,
              style: blackTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w400)),
          SizedBox(height: 6),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w300)),
          SizedBox(height: 30),
          SizedBox(
              width: 200,
              height: 45,
              child: RaisedButton(
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    buttonText1,
                    style: blackTextStyle.copyWith(fontSize: 14),
                  ),
                  onPressed: buttonTap1)),
          SizedBox(height: 12),
          buttonTap2 == null
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: RaisedButton(
                      color: greyColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(buttonText2,
                          style: whiteTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      onPressed: buttonTap2)),
        ],
      ),
    );
  }
}
