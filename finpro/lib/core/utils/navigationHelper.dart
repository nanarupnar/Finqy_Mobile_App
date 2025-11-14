import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static Future<T?> push<T>(
      BuildContext context,
      Widget page,
      ) {
    final Route<T> route = Platform.isIOS
        ? CupertinoPageRoute<T>(builder: (_) => page)
        : MaterialPageRoute<T>(builder: (_) => page);

    return Navigator.push<T>(context, route);
  }
}
