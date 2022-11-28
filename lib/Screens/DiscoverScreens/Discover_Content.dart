// ignore_for_file: camel_case_types, unused_field, avoid_function_literals_in_foreach_calls, avoid_print, prefer_const_constructors, unused_local_variable, unnecessary_import, avoid_renaming_method_parameters, file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables, depend_on_referenced_packages, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Mini-Widgets/highlightedbadges.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class DiscoverContent extends StatefulWidget {
  const DiscoverContent({Key? key}) : super(key: key);

  @override
  State<DiscoverContent> createState() => _DiscoverContentState();
}

class _DiscoverContentState extends State<DiscoverContent> {
  PageController pageController = PageController(viewportFraction: 1.0);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  late PaletteGenerator generator;
  Color colorasphoto = const Color.fromRGBO(250, 17, 79, 1);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.height30,
        ),
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 7,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 7,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: const Color.fromRGBO(250, 17, 79, 1),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Places').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: CircularProgressIndicator(
            color: Color.fromRGBO(250, 17, 79, 1),
          ));
        }

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          final profilepic = docs[index]['ProfilePicture'];

          return Transform(
            transform: matrix,
            child: Stack(
              children: [
                InkWell(
                  onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    barrierColor: Color.fromARGB(92, 0, 0, 0),
                    backgroundColor: Color.fromARGB(0, 0, 0, 0),
                    context: context,
                    builder: (context) => DraggableScrollableSheet(
                      maxChildSize: 0.87,
                      initialChildSize: 0.87,
                      builder: ((context, scrollController) =>
                          PlaceMenuForDiscoverPage(
                              doc: snapshot.data!.docs[index])),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.pageViewContainer,
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: Dimensions.height20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profilepic),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colorasphoto,
                            offset: Offset(-5, 5),
                            blurRadius: 5.0,
                          )
                        ]),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Dimensions.pageViewTextContainer,
                    margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: Dimensions.height30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: colorasphoto,
                            offset: Offset(5, 5),
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header3(text: docs[index]['Name']),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  docs[index]['Star'],
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Header2(
                                text: docs[index]['Star'].toString(),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                            ],
                          ),
                          const Divider(),
                          HighlightedBadges(
                              text1: docs[index]["Highlight 1"],
                              text2: docs[index]["Highlight 2"],
                              text3: docs[index]["Type"],
                              iconcolor1:
                                  const Color.fromRGBO(100, 210, 255, 1),
                              iconcolor2: const Color.fromRGBO(48, 209, 88, 1),
                              iconcolor3: Color.fromRGBO(255, 159, 10, 1),
                              icon1: Icons.verified,
                              icon2: Icons.money,
                              icon3: Icons.fastfood,
                              spacing: 30),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: Text("Loading..."),
        );
      },
    );
  }
}

class PlaceMenuForDiscoverPage extends StatefulWidget {
  final doc;
  PlaceMenuForDiscoverPage({required this.doc});
  @override
  _PlaceMenuForDiscoverPageState createState() =>
      _PlaceMenuForDiscoverPageState();
}

class _PlaceMenuForDiscoverPageState extends State<PlaceMenuForDiscoverPage> {
  late var doc;

  @override
  void initState() {
    super.initState();
    doc = widget
        .doc; // Access the document that was passed through the constructor here.
  }

  final ButtonStyle circular = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromRGBO(250, 17, 79, 1),
    minimumSize: Size(88, 50),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
  final List<String> imgList = [
    'https://thumbor.thedailymeal.com/k4rBStgMgl_t4c0vGc6tUlE82Xw=/870x565/https://www.theactivetimes.com/sites/default/files/2019/07/10/places_to_visit_lifetime_hero.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-Maldives.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-New-Zealand.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20)),
        ),
        child: Scaffold(
          body: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Places')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return ListView(
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
                                            color: const Color.fromARGB(
                                                0, 0, 0, 0),
                                            margin: EdgeInsets.all(0),
                                            child: Image.network(
                                                fit: BoxFit.cover,
                                                imgList[pagePosition],
                                                frameBuilder: (context,
                                                    child,
                                                    frame,
                                                    wasSynchronouslyLoaded) {
                                              return child;
                                            }, loadingBuilder: (context, child,
                                                    loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              } else {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Color.fromRGBO(
                                                        250, 17, 79, 1),
                                                  ),
                                                );
                                              }
                                            }));
                                      }),
                                ),
                                Material(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.transparent,
                                    child: IconButton(
                                        splashRadius: 22,
                                        splashColor:
                                            Color.fromARGB(121, 255, 255, 255),
                                        alignment: Alignment.center,
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(
                                          CupertinoIcons.clear,
                                          color: Colors.black,
                                          size: 30,
                                        )))
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
                    );
                  })),
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 105, 135),
                    blurRadius: 5.0,
                  ),
                ]),
          ),
        ));
  }
}
