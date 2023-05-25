import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String? message;
  const MessageWidget({required this.message, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: message == null ? null : Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 8.0
        ),
        margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 24.0),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0)
            ),
            child: Center(
              child: Text(
                message!,
                style: Theme.of(context)
                    .textTheme.subtitle1!.copyWith(color: Colors.white),
              ),
            )
        ),
      ),
    );
  }
}