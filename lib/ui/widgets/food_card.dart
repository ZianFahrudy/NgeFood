part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard(this.food);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 5, color: Colors.black12)
          ]),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.network(
              food.picturePath,
              height: 140,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            margin: EdgeInsets.only(top: 152),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                RatingStars(food.rate),
              ],
            ),
          )
        ],
      ),
    );
  }
}
