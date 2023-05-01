import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';

class DashboardCard extends StatelessWidget {
  final Color color;
  final Color txtColor;
  final String icon;
  final String title;
  final String subTitle;
  final String routeName;
  const DashboardCard({Key? key, required this.color, required this.icon, required this.title, required this.subTitle, required this.routeName, required this.txtColor, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          elevation: 1.0,
          // margin: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5)
            ),
            constraints: const BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                          color: CustomColor.walletGreyColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Image.asset(
                        icon,
                        // size: 30.0,
                        // color: Colors.black,
                      ),
                      // child: Icon(
                      //   icon,
                      //   size: 30.0,
                      //   color: Colors.black,
                      // ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Text(
                      title,
                      style: CustomStyle.subHeadersStyle
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 18, left: 20, right: 15),
                    child: Text(
                        subTitle,
                        style: TextStyle(
                            color: txtColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w400

                        )
                    )
                ),
              ],
            ),
          )
      ),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
