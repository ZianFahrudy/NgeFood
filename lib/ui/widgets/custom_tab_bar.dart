part of 'widgets.dart';

class CustomTabBars extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBars({this.selectedIndex = 0, this.titles, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 54,
      width: double.infinity,
      child: Stack(children: [
        // NOTE:GARIS ABU
        Container(
          margin: EdgeInsets.only(top: 52),
          color: "F2F2F2".toColor(),
          height: 1,
        ),
        Container(
          padding: EdgeInsets.only(),
          margin: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Row(
                  children: titles
                      .map((e) => Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (onTap != null) {
                                    onTap(titles.indexOf(e));
                                  }
                                },
                                child: Text(e,
                                    style: selectedIndex == titles.indexOf(e)
                                        ? blackTextStyle.copyWith(fontSize: 14)
                                        : greyTextStyle.copyWith(
                                            fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                  height: 4,
                                  width: 40,
                                  margin: EdgeInsets.only(top: 13),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == titles.indexOf(e)
                                        ? blackColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                            ],
                          )))
                      .toList()),
            ],
          ),
        )
      ]),
    );
  }
}
