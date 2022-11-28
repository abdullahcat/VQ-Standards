// ignore_for_file: camel_case_types, unused_field, avoid_function_literals_in_foreach_calls, avoid_print, prefer_const_constructors, unused_local_variable, unnecessary_import, avoid_renaming_method_parameters, file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Mini-Widgets/highlightedbadges.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Places").snapshots(),
        builder: (context, snapshot) {
          // ignore: curly_braces_in_flow_control_structures
          if (snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return Container(
                color: const Color.fromRGBO(247, 223, 228, 1),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final docs = snapshot.data!.docs[index];
                    return Card(
                      // ignore: sort_child_properties_last
                      child: InkWell(
                          splashColor: const Color.fromARGB(255, 255, 105, 135)
                              .withAlpha(30),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceMenuForPlaceList(
                                      doc: snapshot.data!.docs[index]))),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: <
                                  Widget>[
                            const SizedBox(height: 15),
                            ListTile(
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10), //or 15.0
                                child: SizedBox(
                                  height: 70.0,
                                  width: 75.0,
                                  child: Image.network(
                                    docs["ProfilePicture"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(docs["Name"]),
                              subtitle: const Text(
                                  'Sandy stretch with beach bars & dining'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                HighlightedBadges(
                                    text1: docs["Highlight 1"],
                                    text2: docs["Highlight 2"],
                                    text3: docs["Type"],
                                    iconcolor1:
                                        const Color.fromRGBO(100, 210, 255, 1),
                                    iconcolor2:
                                        const Color.fromRGBO(48, 209, 88, 1),
                                    iconcolor3: Color.fromRGBO(255, 159, 10, 1),
                                    icon1: Icons.verified,
                                    icon2: Icons.money,
                                    icon3: Icons.fastfood,
                                    spacing: 30),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ])),

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      margin: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    );
                  },
                ));
          if (snapshot.hasError) {
            return const Text('There is an error. Try to refresh.');
          } else {
            return const CircularProgressIndicator(
              color: Color.fromRGBO(250, 17, 79, 1),
            );
          }
        },
      ),
    );
  }
}

class PlaceMenuForPlaceList extends StatefulWidget {
  final index;
  final doc;
  PlaceMenuForPlaceList({required this.doc, this.index});
  @override
  _PlaceMenuForPlaceListState createState() => _PlaceMenuForPlaceListState();
}

class _PlaceMenuForPlaceListState extends State<PlaceMenuForPlaceList> {
  var doc;
  var index;

  @override
  void initState() {
    super.initState();
    doc = widget.doc;
    // Access the document that was passed through the constructor here.
  }

  final List<String> imgList = [
    'https://thumbor.thedailymeal.com/k4rBStgMgl_t4c0vGc6tUlE82Xw=/870x565/https://www.theactivetimes.com/sites/default/files/2019/07/10/places_to_visit_lifetime_hero.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-Maldives.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-New-Zealand.jpg',
  ];

  final ButtonStyle circular = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromRGBO(255, 55, 95, 1),
    minimumSize: Size(88, 50),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header1(text: "Map"),
        backgroundColor: const Color.fromRGBO(250, 17, 79, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: 310,
                        child: PageView.builder(
                            itemCount: 3,
                            pageSnapping: true,
                            itemBuilder: (context, pagePosition) {
                              return Container(
                                margin: EdgeInsets.all(0),
                                child: Image.network(
                                    fit: BoxFit.cover, imgList[pagePosition],
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                  return child;
                                }, loadingBuilder:
                                        (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Color.fromRGBO(250, 17, 79, 1),
                                      ),
                                    );
                                  }
                                }),
                              );
                            }),
                      ),
                    ],
                  )),
              Positioned(
                left: 0,
                right: 0,
                top: Dimensions.DetailImgSize - 30,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: Dimensions.height10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Header3(text: doc["Name"])],
                  ),
                ),
              ),
            ],
          )),
      bottomNavigationBar: Container(
        // ignore: sort_child_properties_last
        child: Center(
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: Dimensions.height30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.flag_outlined,
                    color: Colors.purple.shade400,
                    size: Dimensions.height30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.ios_share,
                    color: Colors.blue.shade400,
                    size: Dimensions.height30,
                  )),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                style: circular,
                child: Text("Go", style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        height: Dimensions.height60,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 105, 135),
                blurRadius: 5.0,
              ),
            ]),
      ),
    );
  }
}
