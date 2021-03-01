part of 'shared.dart';

Color greyColor = "8D92A3".toColor();
Color mainColor = "FFC700".toColor();
Color blackColor = "020202".toColor();
Color whiteColor = "FFFFFF".toColor();

double defaultMargin = 24;
Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins()
    .copyWith(fontSize: 22, color: blackColor, fontWeight: FontWeight.w500);

TextStyle greyTextStyle = GoogleFonts.poppins()
    .copyWith(fontSize: 14, color: greyColor, fontWeight: FontWeight.w300);

TextStyle whiteTextStyle = GoogleFonts.poppins()
    .copyWith(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500);
