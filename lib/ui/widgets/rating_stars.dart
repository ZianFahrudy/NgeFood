part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double rate;
  RatingStars(this.rate);
  @override
  Widget build(BuildContext context) {
    int numberOfStar = rate.round();

    return Row(
      children: List<Widget>.generate(
              5,
              (index) => index < numberOfStar
                  ? Icon(
                      Icons.star,
                      size: 16,
                      color: mainColor,
                    )
                  : Icon(
                      Icons.star,
                      size: 16,
                      color: "ECECEC".toColor(),
                    )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: greyTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
    );
  }
}
