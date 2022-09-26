import 'package:assets_audio_player/assets_audio_player.dart';

class Global {
  static String? RegisterEmail;
  static String? Registerpassword;
  static String? SignupEmail;
  static String? Signuppassword;
  static String? videoLink;
  static String? CateName;
}

class Videos {
  final int id;
  final String categories;
  final String image;
  final String video;
  String? videoLink;
  String? CateName;

  Videos({
    required this.id,
    required this.categories,
    required this.image,
    required this.video,
  });
}

List<Videos> videos = <Videos>[
  Videos(
      id: 1,
      categories: 'Funny Video',
      image:
          'https://cdn.dribbble.com/users/68238/screenshots/16625594/media/680d750d85b8c32b510789f523a6f906.png',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 2,
      categories: 'Motivational Video',
      image:
          'https://imageio.forbes.com/specials-images/dam/imageserve/982740466/960x0.jpg?format=jpg&width=960',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 3,
      categories: 'Gaming Video',
      image:
          'https://img.freepik.com/free-vector/skull-gaming-with-joy-stick-emblem-modern-style_32991-492.jpg?w=740&t=st=1662966550~exp=1662967150~hmac=64390c088ed26b773ff24867449c504612d0654253c42b0ea43e49880dd1403e',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 4,
      categories: 'Animals Vides',
      image:
          'https://imageio.forbes.com/specials-images/imageserve/5faad4255239c9448d6c7bcd/Best-Animal-Photos-Contest--Close-Up-Of-baby-monkey/960x0.jpg?format=jpg&width=960',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 5,
      categories: 'Travelling Video',
      image:
          'https://imageio.forbes.com/blogs-images/johnnyjet/files/2017/10/traveling-alone.jpg?format=jpg&width=960',
      video: 'assets/images/krishnaflute.mp4'),
  Videos(
      id: 6,
      categories: 'Mood Video',
      image:
          'https://images.unsplash.com/photo-1543789738-5f171d672e47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      video: 'assets/images/krishnaflute.mp4'),
];

class Gallery {
  final int? id;
  final String pictureName;
  final String mainPicture;
  final List<String> subPicture;

  Gallery({
    required this.id,
    required this.pictureName,
    required this.mainPicture,
    required this.subPicture,
  });
}

List<Gallery> gallery = <Gallery>[
  Gallery(
      id: 1,
      pictureName: "Hulk",
      mainPicture:
          'https://hips.hearstapps.com/digitalspyuk.cdnds.net/18/14/1522871567-aif3.jpg?resize=980:*',
      subPicture: [
        'https://hips.hearstapps.com/digitalspyuk.cdnds.net/18/14/1522871567-aif3.jpg?resize=980:*',
        'https://www.postoast.com/wp-content/uploads/2019/03/Everything-about-Hulk-Avengers.jpg',
        'https://images5.alphacoders.com/403/403519.jpg',
        'https://cdna.artstation.com/p/assets/images/images/003/119/916/large/matthew-masterson-hulk.jpg?1469937080',
      ]),
  Gallery(
      id: 2,
      pictureName: "Anime",
      mainPicture: 'https://i.redd.it/zmm8s0ls9gp71.jpg',
      subPicture: [
        'https://i.redd.it/zmm8s0ls9gp71.jpg',
        'https://cdna.artstation.com/p/assets/images/images/036/633/556/large/pol-mamaril-gojo-v12-a-w-spec.jpg?1618216971',
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ea37168f-58bf-43ec-b98d-f15c62f681dd/det6k0u-a43ad9b3-0377-4354-b303-b22b9f49f9c7.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2VhMzcxNjhmLTU4YmYtNDNlYy1iOThkLWYxNWM2MmY2ODFkZFwvZGV0NmswdS1hNDNhZDliMy0wMzc3LTQzNTQtYjMwMy1iMjJiOWY0OWY5YzcuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.sj2DQtGIC5rMRVRpKcgxUFT4TQl-1RPD8Co5Bl1x0JU',
        'https://c4.wallpaperflare.com/wallpaper/741/120/987/nql-art-makima-chainsaw-man-anime-girls-fan-art-drawing-hd-wallpaper-preview.jpg',
      ]),
  Gallery(
      id: 3,
      pictureName: "Anime 2",
      mainPicture:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvsnHsYhMVPdo79DhB5-AFqMiqC7UIm8cZsw&usqp=CAU',
      subPicture: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvsnHsYhMVPdo79DhB5-AFqMiqC7UIm8cZsw&usqp=CAU',
        'https://cdnb.artstation.com/p/assets/images/images/048/200/281/large/eery-abirdeer-zoro2.jpg?1649433558',
        'https://i.redd.it/2n7d4kex8wn51.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN958nrf2aIxBRSCtvk4i2S57YaQn9vh4O0w&usqp=CAU',
      ]),
  Gallery(
      id: 4,
      pictureName: "Anime Villain",
      mainPicture:
          'https://assets.puzzlefactory.com/puzzle/305/032/original.webp',
      subPicture: [
        'https://assets.puzzlefactory.com/puzzle/305/032/original.webp',
        'https://cdn-0.practicaltyping.com/wp-content/uploads/2022/05/hisoka.jpg',
        'https://images7.alphacoders.com/116/1163395.jpg',
        'https://64.media.tumblr.com/80f5402aa4166bab596e2075308540ff/tumblr_p9kzp6HBi61rt19uro1_1280.jpg',
      ]),
  Gallery(
      id: 5,
      pictureName: "Anime girls",
      mainPicture:
          'https://c4.wallpaperflare.com/wallpaper/587/447/805/anime-anime-girls-digital-art-artwork-2d-hd-wallpaper-preview.jpg',
      subPicture: [
        'https://c4.wallpaperflare.com/wallpaper/587/447/805/anime-anime-girls-digital-art-artwork-2d-hd-wallpaper-preview.jpg',
        'https://img.wattpad.com/98c7ce444ce5edf16d4db54a91ac4c98bd7d716d/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f4847524c656a356c77775a6647673d3d2d3135312e313634353332623266343063393865323431333535393431373737342e6a7067?s=fit&w=720&h=720',
        'https://exploringbits.com/wp-content/uploads/2021/11/anime-girl-pfp-2.jpg?ezimgfmt=ng%3Awebp%2Fngcb3%2Frs%3Adevice%2Frscb3-1',
        'https://thicc.mywaifulist.moe/waifus/18952/02937b2553cbd8d6975618a564fc97dcf34d57e5b164a13c3d597cbd3bdcce2d_thumb.jpg',
      ]),
  Gallery(
      id: 6,
      pictureName: "Hulk",
      mainPicture:
          'https://hips.hearstapps.com/digitalspyuk.cdnds.net/18/14/1522871567-aif3.jpg?resize=980:*',
      subPicture: [
        'https://hips.hearstapps.com/digitalspyuk.cdnds.net/18/14/1522871567-aif3.jpg?resize=980:*',
        'https://www.postoast.com/wp-content/uploads/2019/03/Everything-about-Hulk-Avengers.jpg',
        'https://images5.alphacoders.com/403/403519.jpg',
        'https://cdna.artstation.com/p/assets/images/images/003/119/916/large/matthew-masterson-hulk.jpg?1469937080',
      ]),
];

class Music {
  static Map playSong = {};
  static int index = 0;
  static List songs = [
    {
      'name': 'Baby',
      'path': 'assets/audio/Baby.mp3',
      'player': AssetsAudioPlayer(),
      'totalDuration': Duration.zero,
      'image':
          'https://snoidcdnems05.cdnsrv.jio.com/c.saavncdn.com/728/My-World-2-0-English-2010-20200606003742-500x500.jpg',
    },
    {
      'name': 'sajni',
      'path': 'assets/audio/sajni.mp3',
      'player': AssetsAudioPlayer(),
      'totalDuration': Duration.zero,
      'image':
          'https://sdlhivkecdnems04.cdnsrv.jio.com/c.saavncdn.com/912/Sajni-Unknown-2021-20220511014233-500x500.jpg',
    },
    {
      'name': 'Still With You',
      'path': 'assets/audio/stillwithyou.mp3',
      'player': AssetsAudioPlayer(),
      'totalDuration': Duration.zero,
      'image':
          'https://www.ringtonesbull.com/wp-content/uploads/2022/03/maxresdefault-88-150x150.jpg',
    },
  ];
}
