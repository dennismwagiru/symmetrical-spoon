import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';

class DashboardCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subTitle;

  const DashboardCard({Key? key, required this.color, required this.icon, required this.title, required this.subTitle, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.0,
        margin: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(color: color),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 40.0,
                    color: CustomColor.primaryColor,
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                    child: Text(title,
                        style:
                        const TextStyle(fontSize: 18.0, color: Colors.black)
                    ),
                  ),
                  Center(
                    child: Text(subTitle,
                        style:
                        TextStyle(fontSize: 18.0, color: Colors.black)
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
