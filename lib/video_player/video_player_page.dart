import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class Video_player extends StatefulWidget {
  const Video_player({Key? key}) : super(key: key);

  @override
  State<Video_player> createState() => _Video_playerState();
}

class _Video_playerState extends State<Video_player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Video Player",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 7,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: videos
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                Global.videoLink = e.video;
                                Global.CateName = e.categories;
                              });
                              Navigator.of(context).pushNamed('Video_screen');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: const Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            blurRadius: 10.0,
                                            spreadRadius: 5.0,
                                          ), //BoxShadowBoxShadow
                                        ],
                                        borderRadius: BorderRadius.circular(18),
                                        image: DecorationImage(
                                          image: NetworkImage(e.image),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      e.categories,
                                      style: const TextStyle(
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
