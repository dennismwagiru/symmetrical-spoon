import 'package:flutter/material.dart';
import 'package:tuntigi/models/gamezone.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/common/logo_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/gamezone.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';
import 'package:tuntigi/utils/custom_style.dart';

class GameZonesScreen extends StatefulWidget {
  const GameZonesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameZonesScreen();
}

class _GameZonesScreen extends State<GameZonesScreen> {

  List<Gamezone> _allGamezones = [];
  List<Gamezone> _gamezones = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    UserNAO.gamezones()
        .then((NetworkResponse response) async {
      List<Gamezone> gamezones = [];
      if(response.isSuccessful) {

        for(var item in response.data) {
          gamezones.add(Gamezone.fromMap(item));
        }

      }
      setState(() {
        _allGamezones = gamezones;
        _gamezones = gamezones;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
            bottomNavigationBar: const BottomNavBar(index: 2),
            body: Padding(
                padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 30.0,
                    right: 30.0
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const ProfileHeaderWidget(),
                      const SizedBox(height: 20,),
                      const BalanceWidget(),
                      Row(
                        children: const [
                          Text(
                            "Gamezones",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15,),
                      SearchInputWidget(label: 'Search gamezones, county, ward', controller: searchController, onChanged: (String text) {
                        print(_allGamezones);
                        setState(() {
                          _gamezones = _allGamezones.where((Gamezone gamezone) =>
                             gamezone.gamezone.toLowerCase().contains(text.toLowerCase()) ||
                                gamezone.contact.toLowerCase().contains(text.toLowerCase()) ||
                                gamezone.county.toLowerCase().contains(text.toLowerCase()) ||
                                gamezone.constituency.toLowerCase().contains(text.toLowerCase()) ||
                            gamezone.constituency.toLowerCase().contains(text.toLowerCase())

                          ).toList();
                        });
                      },),
                      const SizedBox(height: 15,),
                      ..._gamezones.map((Gamezone gamezone) => GamezoneWidget(gamezone: gamezone))
                    ],
                  ),
                )
            )
        )
    );
  }
}
