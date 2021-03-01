part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem(this.food, this.itemWidth);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            food.picturePath,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: itemWidth - 12 - 60 - 105,
              child: Text(food.name,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400)),
            ),
            Text(
              NumberFormat.currency(
                      locale: "id_ID", symbol: "IDR ", decimalDigits: 0)
                  .format(food.price),
              style: greyTextStyle.copyWith(
                  fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        RatingStars(food.rate),
      ],
    );
  }
}
