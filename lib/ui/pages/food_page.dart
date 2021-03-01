part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              height: 108,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("FoodMarket", style: blackTextStyle.copyWith()),
                        Text("Let’s get some foods", style: greyTextStyle)
                      ],
                    ),

                    // NOTE: IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: double.infinity,
              height: 234,
              child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (_, state) => (state is FoodLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            (state is FoodLoaded)
                                ? Row(
                                    children: state.foods
                                        .map((e) => Container(
                                            margin: EdgeInsets.only(
                                                right: defaultMargin,
                                                left: ((e == state.foods.first)
                                                    ? 24
                                                    : 0)),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Get.to(() => FoodDetailPage(
                                                      Transaction(
                                                          food: e,
                                                          user: (context
                                                                      .read<
                                                                          UserCubit>()
                                                                      .state
                                                                  as UserLoaded)
                                                              .user)));
                                                },
                                                child: FoodCard(e))))
                                        .toList())
                                : loadingIndicator
                          ],
                        )
                      : Center(
                          child: loadingIndicator,
                        )),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTabBars(
                selectedIndex: selectedIndex,
                titles: ["New Taste", "Popular", "Recommended"],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
            BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
              if (state is FoodLoaded) {
                List<Food> foods = state.foods
                    .where((e) => e.types.contains((selectedIndex == 0)
                        ? FoodTypes.new_food
                        : (selectedIndex == 1)
                            ? FoodTypes.popular
                            : FoodTypes.recommended))
                    .toList();

                return Container(
                  color: whiteColor,
                  padding: EdgeInsets.fromLTRB(
                    24,
                    0,
                    24,
                    0,
                  ),
                  width: double.infinity,
                  child: Column(
                      children: foods
                          .map((e) => Padding(
                                padding: EdgeInsets.only(
                                  top: (e == foods.first) ? 16 : 0,
                                  bottom: 16,
                                ),
                                child: FoodListItem(e, itemWidth),
                              ))
                          .toList()),
                );
              } else {
                return Center(
                  child: loadingIndicator,
                );
              }
            }),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
