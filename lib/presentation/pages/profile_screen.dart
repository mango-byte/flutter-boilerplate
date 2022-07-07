import 'package:boilerplate/config/util/TransitionUtil.dart';
import 'package:boilerplate/presentation/pages/login_screen.dart';
import 'package:boilerplate/presentation/widgets/view/profile_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  child: CachedNetworkImage(
                    imageUrl: "https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg",
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                                colorFilter:
                                ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
                          ),
                        ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cristiano Ronaldo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),
                    ),
                    TextButton(
                        onPressed: (){},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0)
                        ),
                        child: const Text(
                          "Edit Profile >",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 30.0),
            ListView.builder(

              itemBuilder: (context, index) {

                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Account",
                        style: TextStyle(
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      ),

                      const SizedBox(height: 15),
                      ProfileRow(title: "My Information", iconData: Icons.person, onRowTap: () {
                        TransitionUtil.push(context, const LoginScreen());
                      }),
                      const Divider(height: 3, color: Colors.grey),
                      ProfileRow(title: "Shipping Address", iconData: Icons.house_outlined,onRowTap: () {
                        TransitionUtil.push(context, const LoginScreen());
                      }),
                      const Divider(height: 3, color: Colors.grey),
                      ProfileRow(title: "Payment Methods", iconData: Icons.credit_card, onRowTap: () {
                        TransitionUtil.push(context, const LoginScreen());
                      }),

                    ],
                  );

                } else {

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Content & Activity",
                        style: TextStyle(
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      ),

                      const SizedBox(height: 15),
                      ProfileRow(title: "Languages", iconData: Icons.language_outlined, onRowTap: () {
                        TransitionUtil.push(context, const LoginScreen());
                      }),
                      const Divider(height: 3, color: Colors.grey),
                      ProfileRow(title: "My Favorite Products", iconData: Icons.add_shopping_cart, onRowTap: () {
                        TransitionUtil.push(context, const LoginScreen());
                      }),
                      const Divider(height: 3, color: Colors.grey),
                      ProfileRow(title: "Log Out", iconData: Icons.logout, onRowTap: () {
                        //TODO: Log Out
                      }),

                    ],
                  );
                }

              },
              itemCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
            )
          ],
        ),
      ),
    );
  }
}



