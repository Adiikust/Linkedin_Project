import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/AppColors.dart';
import 'AllPost/all_post.dart';
import 'Profile_Screen/porfile.dart';

class AppPostScreen extends StatefulWidget {
  const AppPostScreen({Key? key}) : super(key: key);

  @override
  State<AppPostScreen> createState() => _AppPostScreenState();
}

class _AppPostScreenState extends State<AppPostScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primarycolor,
        leading: const Icon(
          Icons.dehaze,
          color: Colors.white,
        ),
        title: const Text(
          'Lorem Ipsum',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        actions: [
          const Icon(
            Icons.search_rounded,
            color: Colors.white38,
          )
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "ALL POSTS",
            ),
            Tab(
              text: "PROFILE",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          AllPostScreen(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: AppColors.primarycolor,
        onPressed: () {
          Get.to(_showDialog(context));
        },
      ),
    );
  }
}

_showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: new Text("Add"),
        content: Container(
          height: 100,
          child: Column(
            children: [
              TextField(
                onChanged: (value) {},
                // controller: _textFieldController,
                decoration: InputDecoration(hintText: "Enter the Title"),
              ),
              TextField(
                onChanged: (value) {},
                // controller: _textFieldController,
                decoration: InputDecoration(hintText: "Enter the description"),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: AppColors.primarycolor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: AppColors.primarycolor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
