import 'package:flutter/material.dart';

import 'circular_loading_widget.dart';

class LoadableWidget extends StatelessWidget {
  final loading;
  final Widget widget;
  const LoadableWidget({Key? key, required this.loading, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading ? const CircularLoadingWidget() : widget;
  }
}
