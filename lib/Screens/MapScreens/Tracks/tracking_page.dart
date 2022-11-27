// ignore_for_file: camel_case_types, unused_field, prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Mini-Widgets/highlightedbadges.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class trackingpage extends StatefulWidget {
  const trackingpage({Key? key}) : super(key: key);

  @override
  State<trackingpage> createState() => _trackingpageState();
}

class _trackingpageState extends State<trackingpage> {
  PageController pageController = PageController(viewportFraction: 1.0);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  final List<String> imgList = [
    'https://thumbor.thedailymeal.com/k4rBStgMgl_t4c0vGc6tUlE82Xw=/870x565/https://www.theactivetimes.com/sites/default/files/2019/07/10/places_to_visit_lifetime_hero.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-Maldives.jpg',
    'https://www.isango.com/theguidebook/wp-content/uploads/2018/07/Top-10-Places-I-Want-To-Visit-For-The-First-Time-New-Zealand.jpg',
  ];

  final ButtonStyle circular = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromRGBO(250, 17, 79, 1),
    minimumSize: Size(88, 50),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
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
  // ignore: must_call_super
  void dispose() {
    pageController.dispose();
  }

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
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('More')));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 200,
                child: PageView.builder(
                    itemCount: 3,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.network(
                            fit: BoxFit.cover,
                            imgList[pagePosition], frameBuilder: (context,
                                child, frame, wasSynchronouslyLoaded) {
                          return child;
                        }, loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Color.fromRGBO(255, 55, 95, 1),
                              ),
                            );
                          }
                        }),
                      );
                    }),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.route),
                    title: const Text('Saskatchewan Tour'),
                    subtitle: Text(
                      'Finish Point: Nipawin & District Regional Park',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
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
                ],
              ),
              SizedBox(
                height: 250,
                width: 380,
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
                  activeColor: const Color.fromRGBO(255, 55, 95, 1),
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          ),
        ],
      ),
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
                    size: 25,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.flag_outlined,
                    color: Colors.purple.shade400,
                    size: 25,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.ios_share,
                    color: Colors.blue.shade400,
                    size: 25,
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
        height: 80,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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

    return Transform(
      transform: matrix,
      child: Container(
        height: Dimensions.pageViewContainer,
        margin: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 255, 255, 255),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/img6.jpg"),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 255, 105, 135),
                blurRadius: 4.0,
              )
            ]),
      ),
    );
  }
}
