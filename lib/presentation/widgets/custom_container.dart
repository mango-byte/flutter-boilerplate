import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/data/constants/ConstantColors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, @required this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: ConstantColors.white
        // color: ConstantColors.primary,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.white,
          //     ConstantColors.primary
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // )
      ),
    );
  }
}
