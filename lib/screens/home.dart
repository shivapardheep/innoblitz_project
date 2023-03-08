import 'package:flutter/material.dart';
import 'package:innoblitz_project/screens/instagram_clone.dart';
import 'package:innoblitz_project/screens/photo_screen.dart';
import 'package:innoblitz_project/screens/users_list_screen.dart';
import 'package:innoblitz_project/widgets/screen_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          screenButtonWidget(
              context, Icons.people, "USERS SCREEN", const UsersListScreen()),
          screenButtonWidget(
              context, Icons.photo, "IMAGES SCREEN", const PhotoCameraScreen()),
          screenButtonWidget(context, Icons.design_services, "INSTAGRAM CLONE",
              const InstagramScreen()),
        ],
      ),
    );
  }
}
