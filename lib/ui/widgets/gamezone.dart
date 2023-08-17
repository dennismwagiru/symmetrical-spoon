import 'package:flutter/material.dart';
import 'package:tuntigi/models/gamezone.dart';
import 'package:tuntigi/utils/custom_style.dart';

class GamezoneWidget extends StatelessWidget {
  final Gamezone gamezone;
  const GamezoneWidget({Key? key, required this.gamezone});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            bottom: 4,
            top: 4
        ),
        child:
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Gamezone: ${gamezone.gamezone}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            )
                        ),
                        const SizedBox(height: 2,),
                        Text(
                            "County: ${gamezone.county}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            )
                        ),
                        const SizedBox(height: 2,),
                        Text(
                            "Constituency: ${gamezone.constituency}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            )
                        ),
                        const SizedBox(height: 2,),
                        Text(
                            "Contact: ${gamezone.contact}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                )
              ],
            )
    );
  }
}
