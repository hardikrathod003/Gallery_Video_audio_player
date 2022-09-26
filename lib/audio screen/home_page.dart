import 'package:flutter/material.dart';

import '../global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Music Player",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Music.songs.length,
          itemBuilder: (context, i) => Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Card(
              elevation: 10,
              color: Colors.black,
              child: ListTile(
                onTap: () {
                  setState(() {
                    Music.index = i;
                    Music.playSong = Music.songs[i];
                  });
                  Navigator.of(context).pushNamed("player_page");
                },
                leading: Image.network(
                  "${Music.songs[i]["image"]}",
                  alignment: Alignment.center,
                ),
                title: SizedBox(
                  height: 20,
                  child: Text(
                    "${Music.songs[i]["name"]}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
