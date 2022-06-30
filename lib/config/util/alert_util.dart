import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AlertUtil {
  static void showProgressDialog(BuildContext context) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Container(
          child: Center(
            child: Platform.isAndroid
                ? const CircularProgressIndicator()
                : const CupertinoActivityIndicator(),
          ),
        ),
      );

  static void hideProgressDialog(BuildContext context) =>
      Navigator.of(context).pop();
}
