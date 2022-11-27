// ignore_for_file: camel_case_types, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/highlightedbadges.dart';
import 'package:vqstandards_beta/Screens/MapScreens/Tracks/tracking_page.dart';

class trackcard extends StatelessWidget {
  trackcard({super.key});

  final ButtonStyle circular = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color.fromRGBO(250, 17, 79, 1),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset("assets/images/img6.jpg"),
            Divider(),
            ListTile(
              leading: Icon(Icons.route),
              title: const Text('Saskatchewan Tour'),
              subtitle: Text(
                'Finish Point: Nipawin & District Regional Park',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Divider(),
            HighlightedBadges(
              spacing: 30,
              text1: "Cold",
              text2: "8 Place",
              text3: "7h",
              iconcolor1: Colors.greenAccent,
              iconcolor2: Colors.deepPurpleAccent,
              iconcolor3: Colors.deepOrange,
              icon1: Icons.ac_unit,
              icon2: Icons.place,
              icon3: Icons.hourglass_full_outlined,
            ),
            Divider(),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      // Perform some action
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    )),
                IconButton(
                    onPressed: () {
                      // Perform some action
                    },
                    icon: Icon(
                      Icons.flag_outlined,
                      color: Colors.purple.shade400,
                    )),
                IconButton(
                    onPressed: () {
                      // Perform some action
                    },
                    icon: Icon(
                      Icons.ios_share,
                      color: Colors.blue.shade400,
                    )),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => trackingpage()));
                  },
                  style: circular,
                  child: Text("More"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
