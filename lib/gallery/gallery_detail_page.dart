import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class CarouselSliderScreen extends StatefulWidget {
  const CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  State<CarouselSliderScreen> createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    int initalSliderPage = 0;
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("${gallery[args].pictureName}'s Photos"),
          backgroundColor: Color(0xff018577)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  initialPage: initalSliderPage,
                  onPageChanged: (val, _) {
                    setState(() {
                      initalSliderPage = val;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  height: 300,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlayCurve: Curves.bounceOut,
                ),
                items: gallery[args]
                    .subPicture
                    .map((e) => Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      image: NetworkImage("$e"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
