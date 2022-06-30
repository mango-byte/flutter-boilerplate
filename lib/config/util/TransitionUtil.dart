import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransitionUtil {
  static void push(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  static void replace(BuildContext context, Widget screen, bool noAnim) {
    Navigator.popUntil(context, (r) => r.isFirst);

    if(noAnim){
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => screen,
          transitionDuration: Duration.zero,
        ),
      );
    }
    else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => screen,
        ),
      );
    }
  }

  static void pop(BuildContext context) => Navigator.pop(context);

}
