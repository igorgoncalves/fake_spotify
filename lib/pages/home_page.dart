import 'package:flutter/material.dart';

const disco1Url = "assets/album1.jpg";

const disco2Url = "assets/album2.jpg";

class Album {
  String name;
  String pathImage;
  String? artist;

  Album({
    required this.name,
    required this.pathImage,
    this.artist,
  });
}

final listAlbums = <Album>[
  Album(name: "Run it Down", pathImage: "assets/album1.jpg"), // 0
  Album(name: "Awake EP", pathImage: "assets/album2.jpg"), // 1
  Album(name: "Brainwash", pathImage: "assets/album3.jpg"), // 2
  Album(name: "Ophelia", pathImage: "assets/album4.jpg"), // 3
  Album(name: "Silence", pathImage: "assets/album5.jpg"), // 4
  Album(name: "Devil's Gun", pathImage: "assets/album6.jpg"), // ...
  Album(name: "Magdalena", pathImage: "assets/album7.jpg"),
  Album(name: "Sound Wave", pathImage: "assets/album8.jpg"),
  Album(name: "Music is my therapy", pathImage: "assets/album9.jpg"),
  Album(name: "Starboy", pathImage: "assets/album10.jpg"),
  Album(name: "Starboy", pathImage: "assets/album11.jpg"),
  Album(name: "First Aid Kit", pathImage: "assets/album12.jpg"),
  Album(name: "Nothin but the beat", pathImage: "assets/album13.jpg"),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    const defaultBgColor = Color(0xFF0c0910);

    return Scaffold(
      backgroundColor: defaultBgColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: defaultBgColor,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.greenAccent[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Biblioteca"),
        ],
      ),
      appBar: AppBar(
        titleTextStyle: titleStyle,
        title: const Text("Good Morning"),
        backgroundColor: defaultBgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            _LastedView(),
            _MadeForYou(),
            _PopularPlayList(),
          ],
        ),
      ),
    );
  }
}

class _PopularPlayList extends StatelessWidget {
  const _PopularPlayList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlists = listAlbums.map((e) => e).toList();
    playlists.shuffle();
    return _SectionPlaylist(
      title: "Playlists populares",
      playlists: playlists,
    );
  }
}

class _SectionPlaylist extends StatelessWidget {
  const _SectionPlaylist(
      {Key? key, required this.playlists, required this.title})
      : super(key: key);

  final List<Album> playlists;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        _ListAlbumsHorizontal(
          albums: playlists,
        ),
      ],
    );
  }
}

class _MadeForYou extends StatelessWidget {
  const _MadeForYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SectionPlaylist(
      title: "Feito para você",
      playlists: listAlbums,
    );
  }
}

class _ListAlbumsHorizontal extends StatelessWidget {
  const _ListAlbumsHorizontal({
    Key? key,
    required this.albums,
  }) : super(key: key);

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return SizedBox(
            child: _CardMusicVertical(
              discoName: album.name,
              urlImage: album.pathImage,
            ),
          );
        },
      ),
    );
  }
}

class _LastedView extends StatelessWidget {
  const _LastedView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          child: Row(
            children: [
              Flexible(
                  child: Column(
                children: const [
                  _CardMusicHorizontal(
                    discoName: "Da lama ao Caos",
                    urlImage: disco1Url,
                  ),
                  _CardMusicHorizontal(
                    discoName: "Radiola NZ",
                    urlImage: disco2Url,
                  ),
                  _CardMusicHorizontal(
                    discoName: "Da lama ao Caos",
                    urlImage: disco1Url,
                  ),
                ],
              )),
              Flexible(
                child: Column(
                  children: const [
                    _CardMusicHorizontal(
                      discoName: " Outro Da lama ao Caos",
                      urlImage: disco1Url,
                    ),
                    _CardMusicHorizontal(
                      discoName: " Outro Radiola NZ",
                      urlImage: disco2Url,
                    ),
                    _CardMusicHorizontal(
                      discoName: "Da lama ao Caos",
                      urlImage: disco1Url,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _CardMusicHorizontal extends StatelessWidget {
  const _CardMusicHorizontal({
    Key? key,
    required this.discoName,
    required this.urlImage,
  }) : super(key: key);

  final String discoName;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    const styleTextCard = TextStyle(
      color: Colors.white,
    );

    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFF282529),
      ),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                urlImage,
                height: 60,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(discoName, style: styleTextCard),
              ))
        ],
      ),
    );
  }
}

class _CardMusicVertical extends StatelessWidget {
  const _CardMusicVertical({
    Key? key,
    required this.discoName,
    required this.urlImage,
  }) : super(key: key);

  final String discoName;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    const styleTextCard = TextStyle(
      color: Colors.white,
    );

    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFF282529),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              child: Image.asset(
                urlImage,
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(discoName,
                    style: styleTextCard.copyWith(fontWeight: FontWeight.bold)),
              ))
        ],
      ),
    );
  }
}
