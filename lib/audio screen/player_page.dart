import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import '../global.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  initAudio() async {
    await Music.playSong['player'].open(
      Audio(Music.playSong['path']),
      autoStart: false,
    );

    setState(() {
      Music.playSong['totalDuration'] =
          Music.playSong['player'].current.value!.audio.duration;
    });
  }

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    await Music.playSong["player"].pause();
  }

  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Now Playing",
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "${Music.playSong["name"]}",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 15),
            const Divider(color: Colors.purple),
            const Spacer(),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${Music.playSong["image"]}"),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.purple,
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            StreamBuilder(
              stream: Music.playSong['player'].currentPosition,
              builder: (context, AsyncSnapshot<Duration> snapshot) {
                Duration? currentPosition = snapshot.data;

                return Column(
                  children: [
                    Text(
                      "${"$currentPosition".split(".")[0]} / ${"${Music.playSong['totalDuration']}".split(".")[0]}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Slider(
                      min: 0,
                      max: Music.playSong['totalDuration'].inSeconds.toDouble(),
                      value: (currentPosition != null)
                          ? currentPosition.inSeconds.toDouble()
                          : 0,
                      onChanged: (val) async {
                        await Music.playSong['player']
                            .seek(Duration(seconds: val.toInt()));
                      },
                    ),
                  ],
                );
              },
            ),
            // SizedBox(height: 30)
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    if (Music.index > 0) {
                      setState(() {
                        Music.playSong["player"].pause();
                        Music.index--;
                        Music.playSong = Music.songs[Music.index];
                      });
                      Navigator.of(context).pushReplacementNamed("player_page");
                    }
                  },
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                ),
                IconButton(
                  // padding: EdgeInsets.all(10),
                  iconSize: 55,
                  icon: Icon(
                    (isPlay) ? Icons.pause : Icons.play_arrow,
                    color: Colors.purple,
                  ),
                  onPressed: () async {
                    setState(() {
                      isPlay = (isPlay) ? false : true;
                    });
                    (isPlay)
                        ? await Music.playSong['player'].play()
                        : await Music.playSong['player'].pause();
                  },
                ),
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    if (Music.index < Music.songs.length - 1) {
                      setState(() {
                        Music.playSong["player"].pause();
                        Music.index++;
                        Music.playSong = Music.songs[Music.index];
                      });
                      Navigator.of(context).pushReplacementNamed("player_page");
                    }
                  },
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
