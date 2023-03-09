import 'package:flutter/material.dart';
import 'package:innoblitz_project/widgets/bottom_navbar_widget.dart';
import 'package:innoblitz_project/widgets/insta_post_widget.dart';
import 'package:innoblitz_project/widgets/story_widget.dart';

class InstagramScreen extends StatefulWidget {
  const InstagramScreen({Key? key}) : super(key: key);

  @override
  State<InstagramScreen> createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {
  List<String> instagramIds = [
    "instagram",
    "cristiano",
    "beyonce",
    "therock",
    "selenagomez",
    "arianagrande",
    "leomessi",
    "katyperry"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.black54,
              size: 30,
            )),
        title: Image.asset(
          "assets/instagram.png",
          height: 50,
        ),
        actions: [
          SizedBox(width: 20, child: Image.asset("assets/icons/search.png")),
          Container(width: 15),
          SizedBox(width: 28, child: Image.asset("assets/icons/direct.png")),
          Container(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const storyWidget(),
            const Divider(
              height: 1,
              thickness: 0.3,
              color: Colors.grey,
            ),
            InstaPostWidget(instagramIds: instagramIds)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
