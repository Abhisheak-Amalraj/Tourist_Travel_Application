import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yttravel/screens/places/logic/place_logic.dart';
import 'package:yttravel/screens/places/place_library_page.dart';
import 'package:yttravel/screens/places/place_museum_page.dart';
import 'package:yttravel/screens/places/place_park_page.dart';

import 'place_buildings_page.dart';

class PlatePage extends StatelessWidget {
  const PlatePage({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlateLogic>(
        create: (c) => PlateLogic(),
        builder: (context, child) {
          return PlateBody(index: index);
        });
  }
}

class PlateBody extends StatefulWidget {
  const PlateBody({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<PlateBody> createState() => _PlateBodyState();
}

class _PlateBodyState extends State<PlateBody>
    with SingleTickerProviderStateMixin {
  List<Tab> tabs = const [
    Tab(text: 'Park'),
    Tab(text: 'Museum'),
    Tab(text: 'Library'),
    Tab(text: 'Historic Places'),
  ];
  late TabController tabController =
      TabController(length: tabs.length, vsync: this);

  @override
  void initState() {
    super.initState();
    tabController.index = widget.index ?? 0;
    context.read<PlateLogic>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places nearby (1 mile radius)'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
            ),
            child: TabBar(
              tabs: tabs,
              isScrollable: false,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              splashFactory: NoSplash.splashFactory,
              controller: tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                PlateParkPage(),
                PlateMuseumPage(),
                PlateLibraryPage(),
                PlateBuildingsPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
