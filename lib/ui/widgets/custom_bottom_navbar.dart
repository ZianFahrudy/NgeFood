part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Image.asset(
              "assets/ic_home" +
                  ((selectedIndex == 0) ? ".png" : "_normal.png"),
              width: 32,
              height: 32,
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Image.asset(
              "assets/ic_order" +
                  ((selectedIndex == 1) ? ".png" : "_normal.png"),
              width: 32,
              height: 32,
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Image.asset(
              "assets/ic_profile" +
                  ((selectedIndex == 2) ? ".png" : "_normal.png"),
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
