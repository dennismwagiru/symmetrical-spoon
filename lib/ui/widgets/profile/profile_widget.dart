
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/form/message_widget.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [share, logout];

  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const logout = MenuItem(text: 'Logout', icon: Icons.outbond_outlined);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: CustomColor.primaryColor,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: CustomColor.primaryColor,
          ),
        ),
      ],
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileWidget();

}

class _ProfileWidget extends State<ProfileWidget> {

  late AppPreferences _appPreferences;
  late AppDatabase _appDatabase;
  final ImagePicker _picker = ImagePicker();
  String? _message;
  bool _loading = false;
  late Map<String, dynamic> _errors = {};

  @override
  void initState() {
    _appPreferences = const App().getAppPreferences();
    _appDatabase = const App().getAppDatabase();
    super.initState();
  }

  void logout(context) async {
    _appDatabase.clearUser();
    await _appPreferences.isPreferenceReady;
    _appPreferences.setLoggedIn(isLoggedIn: false);
    _appPreferences.setAccessToken(
        accessToken: ''
    );

    Navigator.popAndPushNamed(context, AppRoutes.appRouteLogin);
  }

  void uploadAvatar(XFile file) {
    UserNAO.uploadAvatar(file: file)
        .then((NetworkResponse response) async {
      if(response.isSuccessful) {

        Fluttertoast.showToast(msg: "Profile Picture Updated");
        await Provider.of<ProfileProvider>(context, listen: false).loadFromNetwork();
      } else {
        const JsonDecoder decoder = JsonDecoder();
        try {
          final Map<String, dynamic> res = decoder.convert(
              response.error ?? '');
          if(res.containsKey('error')) {
            setState(() {
              _errors = {
                'mobileno': [res['error']],
                'pin': [res['error']]
              };
            });
          } else {
            setState(() => _errors = res);
          }
        } on Exception catch (e) {
          setState(() => _message = response.error);
        }
        Fluttertoast.showToast(msg: response.error ?? "Profile Picture Update Failed: ${response.error}");
      }
    });
  }

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickMedia();

    print(pickedFile?.path ?? '....');
    uploadAvatar(pickedFile!);
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   }
    // });
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    print(pickedFile?.path ?? '....');

    uploadAvatar(pickedFile!);
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   }
    // });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: CustomColor.primaryColor,
            child: CircleAvatar(
              backgroundColor: CustomColor.primaryColor,
              radius: 30,
              child: Image.network(profileProvider.profile?.profpic ?? 'https://tun-tigi.com/public/images/profpics/no-image.png', width: 60, height: 60),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      MessageWidget(message: _message),
                      LoadableWidget(
                        loading: _loading,
                        widget: ListTile(
                          leading: const Icon(Icons.photo),
                          title: const Text('Add Profile Photo'),
                          onTap: showOptions,
                        ),
                      ),
                      GestureDetector(
                        child: ListTile(
                          leading: const Icon(
                            Icons.attribution_outlined,
                            weight: 29,
                            size: 29,
                          ),
                          title: const Text('Logout',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          onTap: () {
                            logout(context);
                          },
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
        // DropdownButtonHideUnderline(
        //     child: DropdownButton2(
        //       customButton: CircleAvatar(
        //         backgroundColor: CustomColor.primaryColor,
        //         child: CircleAvatar(
        //           backgroundColor: CustomColor.primaryColor,
        //           radius: 30,
        //           child: Image.network(profileProvider.profile?.profpic ?? 'https://tun-tigi.com/public/images/profpics/no-image.png', width: 60, height: 60),
        //         ),
        //       ),
        //       items: [
        //         // DropdownMenuItem<MenuItem>(
        //         //   value: MenuItems.share,
        //         //   child: MenuItems.buildItem(MenuItems.share),
        //         // ),
        //         DropdownMenuItem<MenuItem>(
        //           value: MenuItems.logout,
        //           child: MenuItems.buildItem(MenuItems.logout),
        //         ),
        //
        //       ],
        //       onChanged: (value) {
        //         switch (value) {
        //           case MenuItems.share:
        //           //Do something
        //             break;
        //           case MenuItems.logout:
        //             logout(context);
        //             break;
        //         }
        //       },
        //       dropdownStyleData: DropdownStyleData(
        //         width: 160,
        //         padding: const EdgeInsets.symmetric(vertical: 6),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(4),
        //           color: Colors.white,
        //         ),
        //         elevation: 8,
        //         offset: const Offset(40, -4),
        //       ),
        //     )
        // ),
        // Container(
        //   height: 45,
        //   width: 45,
        //   decoration: const BoxDecoration(
        //       color: CustomColor.accentColor,
        //       borderRadius: BorderRadius.all(Radius.circular(50))
        //   ),
        // ),
        // GestureDetector(
        //   child: const Icon(
        //     Icons.account_circle,
        //     color: CustomColor.primaryColor,
        //     size: 40.0,
        //   ),
        // ),
        const SizedBox(height: 13),
        Text(
          '${Strings.greeting} ${profileProvider.profile?.name ?? '-'}',
          style: CustomStyle.greetingStyle,
        ),
        const SizedBox(height: 5),
        Text(
          '${profileProvider.profile?.rank ?? '-'}, ${profileProvider.profile?.position ?? '_'}',
          style: CustomStyle.designationStyle,
        ),
      ],
    );
  }
}
