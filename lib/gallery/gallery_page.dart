import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../global.dart';

class Gallery_app extends StatefulWidget {
  const Gallery_app({Key? key}) : super(key: key);

  @override
  State<Gallery_app> createState() => _Gallery_appState();
}

class _Gallery_appState extends State<Gallery_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Straggered Gallery"), centerTitle: true),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Tile(index: 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Tile(index: 2),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Tile(index: 3),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Tile(index: 4),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Tile(index: 5),
            ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 2,
            //   child: Tile(index: 6),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 2,
            //   child: Tile(index: 7),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 2,
            //   child: Tile(index: 8),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 2,
            //   child: Tile(index: 9),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 2,
            //   mainAxisCellCount: 2,
            //   child: Tile(index: 10),
            // ),
          ],
        ),
      ),
    );
  }

  Widget Tile({required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('gallery_detail_page', arguments: index);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 16,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage("${gallery[index].mainPicture}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    gallery[index].pictureName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
