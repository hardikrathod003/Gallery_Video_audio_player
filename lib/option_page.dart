import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Option_page extends StatefulWidget {
  const Option_page({Key? key}) : super(key: key);

  @override
  State<Option_page> createState() => _Option_pageState();
}

class _Option_pageState extends State<Option_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('sign_up');

              Navigator.of(context).pushReplacementNamed('register_page');
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('gallery_page');
                },
                child: Text("Gallery")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('video_player_page');
                },
                child: Text("Video player")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Audio player")),
          ],
        ),
      ),
    );
  }
}
