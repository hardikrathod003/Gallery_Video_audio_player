import 'package:flutter/material.dart';
import 'package:intro_screen_app/gallery/gallery_page.dart';
import 'package:intro_screen_app/option_page.dart';
import 'package:intro_screen_app/video_player/Video_screen.dart';
import 'package:intro_screen_app/register_page.dart';
import 'package:intro_screen_app/sign_up.dart';
import 'package:intro_screen_app/video_player/video_player_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'audio screen/player_page.dart';
import 'gallery/gallery_detail_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final showhome = pref.getBool('Showhome') ?? false;
  final sign_up = pref.getBool('sign_up') ?? false;
  bool? isloggedIn = pref.getBool('isloggedIn') ?? false;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (showhome == false)
        ? '/'
        : (sign_up == false)
            ? 'register_page'
            : (isloggedIn == false)
                ? 'option_page'
                : 'sign_up',
    routes: {
      '/': (context) => Homepage(),
      'register_page': (context) => Register_page(),
      'sign_up': (context) => Sign_up_page(),
      'video_player_page': (context) => Video_player(),
      'Video_screen': (context) => VideoScreen(),
      'option_page': (context) => Option_page(),
      'gallery_page': (context) => Gallery_app(),
      'gallery_detail_page': (context) => CarouselSliderScreen(),
      "home_page": (context) => Homepage(),
      "player_page": (context) => PlayerPage(),
    },
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Controller = PageController();
  bool islastpage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: Controller,
          onPageChanged: (index) {
            setState(() {
              islastpage = index == 2;
            });
          },
          children: [
            Container(
              color: Colors.blue,
              child: Image.network(
                "https://img.freepik.com/free-vector/hand-drawn-namaste-gesture_23-2147694900.jpg?w=740&t=st=1662716527~exp=1662717127~hmac=d6097bd87687894f4a98a9b2ed14b6344a80597d5ee1fb8427ee89a911ca2867",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.green,
              child: Image.network(
                "https://img.freepik.com/free-vector/woman-with-glasses-welcome-concept-landing-page_52683-22966.jpg?w=740&t=st=1662716584~exp=1662717184~hmac=5a7f4c7bdca7deb62ad90a92b50698f644f1888f6c90d5cfb5728da5ab811b4e",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.purple,
              child: Image.network(
                "https://img.freepik.com/free-vector/welcome-concept-illustration_23-2148281791.jpg?w=740&t=st=1662716891~exp=1662717491~hmac=413b429951b215d1932ba8648ae8d38a79153c6278dd434437fa790031c380df",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: (islastpage)
          ? Container(
              height: 80,
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "Get Strated",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool('Showhome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Register_page()),
                  );
                },
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: Controller,
                      count: 3,
                      onDotClicked: (index) => Controller.animateToPage(index,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Controller.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
