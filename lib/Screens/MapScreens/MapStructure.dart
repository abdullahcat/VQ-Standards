// ignore_for_file: file_names,prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart'
    show FirebaseFirestore, QuerySnapshot;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Mini-Widgets/highlightedbadges.dart';
import 'package:vqstandards_beta/Screens/MapScreens/Places/Places.dart';
import 'package:vqstandards_beta/Screens/MapScreens/Tracks/tracklist.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class MapStructure extends StatefulWidget {
  const MapStructure({Key? key}) : super(key: key);

  @override
  State<MapStructure> createState() => _MapStructureState();
}

class _MapStructureState extends State<MapStructure> {
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Header1(text: "Map"),
          backgroundColor: const Color.fromRGBO(250, 17, 79, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.travel_explore),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search Places')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Filter')));
              },
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection("Places").snapshots(),
            builder: (context, snapshot) {
              // ignore: curly_braces_in_flow_control_structures
              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;

                return PageView.builder(
                    itemBuilder: ((context, index) => Stack(
                          children: [
                            FlutterMap(
                              mapController: mapController,
                              options: MapOptions(
                                  minZoom: 5,
                                  maxZoom: 18,
                                  zoom: 13,
                                  center: LatLng(36.884804, 30.704044)),
                              layers: [
                                TileLayerOptions(
                                  urlTemplate:
                                      "https://api.mapbox.com/styles/v1/asdsaasd/cl9pk4b80001414qt91b8edqz/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXNkc2Fhc2QiLCJhIjoiY2w5aXRhamhnMnV5aDNvcXRiM2xxZWFwcCJ9.o1gJ5_G3QoNsOz77cQ064A",
                                ),
                                MarkerLayerOptions(markers: [
                                  Marker(
                                    width: 40,
                                    point: LatLng(36.884804, 30.704044),
                                    height: 40,
                                    builder: (context) => IconButton(
                                        icon: const Icon(Icons.location_on),
                                        color: const Color.fromRGBO(
                                            250, 17, 79, 1),
                                        iconSize: 40,
                                        onPressed: () {
                                          showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              )),
                                              context: this.context,
                                              builder: (context) => Card(
                                                    // ignore: sort_child_properties_last
                                                    child: InkWell(
                                                        splashColor: const Color
                                                                    .fromARGB(
                                                                255,
                                                                255,
                                                                105,
                                                                135)
                                                            .withAlpha(30),
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PlaceMenuForMapList(
                                                                doc: snapshot
                                                                        .data!
                                                                        .docs[
                                                                    index],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: <Widget>[
                                                              const SizedBox(
                                                                  height: 15),
                                                              ListTile(
                                                                leading:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10), //or 15.0
                                                                  child:
                                                                      SizedBox(
                                                                    height:
                                                                        70.0,
                                                                    width: 75.0,
                                                                    child: Image
                                                                        .network(
                                                                      docs[index]
                                                                          [
                                                                          "ProfilePicture"],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                title: Text(docs[
                                                                        index]
                                                                    ["Name"]),
                                                                subtitle:
                                                                    const Text(
                                                                        'Great design and burgers tastes nice.'),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              const Divider(),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: <
                                                                    Widget>[
                                                                  HighlightedBadges(
                                                                      text1:
                                                                          "Verified",
                                                                      text2:
                                                                          '₺₺₺₺',
                                                                      text3:
                                                                          "Fast Food",
                                                                      iconcolor1: const Color.fromRGBO(
                                                                          100,
                                                                          210,
                                                                          255,
                                                                          1),
                                                                      iconcolor2:
                                                                          const Color.fromRGBO(
                                                                              48,
                                                                              209,
                                                                              88,
                                                                              1),
                                                                      iconcolor3:
                                                                          Color.fromRGBO(
                                                                              255,
                                                                              159,
                                                                              10,
                                                                              1),
                                                                      icon1: Icons
                                                                          .verified,
                                                                      icon2: Icons
                                                                          .money_sharp,
                                                                      icon3: Icons
                                                                          .fastfood,
                                                                      spacing:
                                                                          30),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              )
                                                            ])),

                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7)),
                                                    ),
                                                  ));
                                        }),
                                  )
                                ]),
                              ],
                            ),
                          ],
                        )));
              } else {
                return Center(
                  child: const CircularProgressIndicator(
                    color: Color.fromRGBO(250, 17, 79, 1),
                  ),
                );
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            backgroundColor: const Color.fromRGBO(250, 17, 79, 1),
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ListViewMap()));
            },
            backgroundColor: const Color.fromRGBO(250, 17, 79, 1),
            child: const Icon(Icons.view_headline),
          ),
        ]));
  }
}

class ListViewMap extends StatefulWidget {
  const ListViewMap({Key? key}) : super(key: key);

  @override
  _ListViewMapState createState() => _ListViewMapState();
}

// This is where the interesting stuff happens
class _ListViewMapState extends State<ListViewMap>
    with SingleTickerProviderStateMixin {
  // We need a TabController to control the selected tab programmatically
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Header1(text: "Map"),
          backgroundColor: const Color.fromRGBO(250, 17, 79, 1),
          bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 110, 0, 116).withAlpha(30),
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.place),
                text: "Places",
              ),
              Tab(
                icon: const Icon(Icons.route),
                text: "Tracks",
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.travel_explore),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Search Places')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Filter')));
              },
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[PlaceList(), TrackList()],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Color.fromRGBO(250, 17, 79, 1),
            child: const Icon(Icons.map_outlined),
          ),
        ]));
  }
}

class PlaceMenuForMapList extends StatefulWidget {
  final index;
  final doc;
  const PlaceMenuForMapList({super.key, required this.doc, this.index});
  @override
  _PlaceMenuForMapListState createState() => _PlaceMenuForMapListState();
}

class _PlaceMenuForMapListState extends State<PlaceMenuForMapList> {
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
