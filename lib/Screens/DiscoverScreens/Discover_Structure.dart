// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Screens/DiscoverScreens/discover_content.dart';

class DiscoverStructure extends StatelessWidget {
  const DiscoverStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header1(text: "Discover"),
        backgroundColor: Color.fromRGBO(250, 17, 79, 1),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.location_fill),
            tooltip: 'Edit Location',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Edit Location')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Filter')));
            },
          ),
        ],
      ),
      body: const DiscoverContent(),
    );
  }
}
