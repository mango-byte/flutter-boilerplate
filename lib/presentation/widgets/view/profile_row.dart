import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {

  final String title;
  final IconData iconData;
  final Function onRowTap;

  ProfileRow({required this.title, required this.iconData, required this.onRowTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onRowTap();
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed:(){},
              icon: Icon(
                this.iconData,
                size: 20.0,
                color: Colors.black,
              ),
              label: Text(title, style: const TextStyle(color: Colors.black)),
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
              color: Colors.grey,
            )
          ]
      ),
    );
  }

}// End of class
