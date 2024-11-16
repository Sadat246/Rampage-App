import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class ArtistsPage extends StatelessWidget {
  // artists page
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // this widget allows one to have a scrolling mechanism in the page, prevents the weird pixel problem
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("graphics/starback.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(13.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('ARTISTS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'DeliciousHandrawn',
                color: Color.fromARGB(255, 103, 55, 177),
                fontSize: 55,
              )),
          Text('Check out our talented family!\n~~~~~',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.white,
                fontSize: 20,
              )),
          ArtistCard(
              name: 'Bianca',
              spotifyUrl:
                  'https://instagram.com/Biancaalbaperez?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Cal',
              spotifyUrl:
                  'https://instagram.com/thatkidCallan?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'DDK',
              spotifyUrl:
                  'https://www.instagram.com/DDK_4life/?igshid=YmMyMTA2M2Y%3D'),
          ArtistCard(
              name: 'ESAI',
              spotifyUrl:
                  'https://instagram.com/dante.fade?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Henry',
              spotifyUrl:
                  'https://instagram.com/justmyself167?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Jacob',
              spotifyUrl:
                  'https://instagram.com/Jacobecker11?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Kilonova',
              spotifyUrl:
                  'https://instagram.com/Kilonova47?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Luka',
              spotifyUrl:
                  'https://instagram.com/Lukasgravee?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'PXRALYSIS',
              spotifyUrl:
                  'https://instagram.com/pxralysis?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'PRESSURE',
              spotifyUrl:
                  'https://instagram.com/shesayymyname.dj?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Ryback',
              spotifyUrl:
                  'https://instagram.com/rybxckrules13?igshid=YmMyMTA2M2Y='),
          ArtistCard(
              name: 'Sway',
              spotifyUrl:
                  'https://instagram.com/Swaydadonn?igshid=YmMyMTA2M2Y='),
        ]),
      ),
    );
  }
}

class ArtistCard extends StatelessWidget {
  // used to organize each artist
  const ArtistCard(
      {super.key,
      required this.name,
      required this.spotifyUrl}); // required parameter is the name of the artist

  final String name;
  final String spotifyUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => ImageProducer('graphics/$name.png'));
        },
        child: Card(
          // cards separate the arists into their own little squares, also a concept taken from the codelab

          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('graphics/$name.png',
                  width: 400, height: 400), //displays artists' photos
              //MORE INFO ABOUT THE PARTICULAR ARTIST,
              //SPOTIFY LINK, OR SOMETHING
              Text('~~~', style: TextStyle(fontSize: 15)),
              ElevatedButton(onPressed: _launchUrl, child: Text('Meet $name!')),
              // GestureDetector(onDoubleTap: () {
              //   Image.asset('graphics/$name.png', width: 800, height: 800);
              // })
            ]),
          ),
        ));
  }

  Future<void> _launchUrl() async {
    if (!await launch(spotifyUrl)) {
      throw Exception('Could not launch spotify');
    }
  }
}

class ImageProducer extends StatelessWidget {
  final String img;
  const ImageProducer(this.img, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;
    final usedWidth;
    final usedHeight;
    if (width_ > height_) {
      usedWidth = height_;
      usedHeight = height_;
    } else {
      usedWidth = width_;
      usedHeight = width_;
    }

    return Dialog(
      child: Image.network(
        img,
        width: usedWidth / (6 / 5),
        height: usedHeight / (6 / 5),
        fit: BoxFit.cover,
      ),
    );
  }
}
