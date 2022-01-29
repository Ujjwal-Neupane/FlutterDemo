import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_learn_demo/models/flat_model.dart';
import 'package:flutter_learn_demo/services/flat_service.dart';
import 'package:flutter_learn_demo/utils/my_urls.dart';

class FetchFlat extends StatefulWidget {
  const FetchFlat({Key? key}) : super(key: key);

  @override
  _FetchFlatState createState() => _FetchFlatState();
}

class _FetchFlatState extends State<FetchFlat> {
  List<Flat> flatList = [];

  late ScrollController scrollController;
  bool showTagBar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    initScrollController();
    getFlatList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flatList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  tagBar(),
                  Expanded(child: flatListView()),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        elevation: 4.0,
        backgroundColor: Colors.green,
        onPressed: () {
          addFlat();
        },
      ),
    );
  }

//tag to select tag filter result
  Widget tagBar() {
    return AnimatedContainer(
      // color: Colors.greenAccent,
      height: showTagBar ? 50 : 0,
      duration: Duration(milliseconds: 200),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 10),
              tagView('Residental'),
              tagView('Office'),
              tagView('Grocery'),
              tagView('Residental'),
              tagView('Office'),
              tagView('Grocery'),
              tagView('Residental'),
              tagView('Office'),
              tagView('Grocery'),
            ],
          ),
        ),
      ),
    );
  }

//view for tag
  Widget tagView(String tagName) {
    return Row(children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tagName,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.green),
      ),
      SizedBox(width: 6)
    ]);
  }

//listview of flat
  Widget flatListView() {
    return ListView.builder(
      controller: scrollController,
      itemCount: flatList.length,
      itemBuilder: (BuildContext context, int index) {
        return listItemView(flatList[index]);
      },
    );
  }

  Widget listItemView(Flat flat) {
    return Card(
      child: Row(
        children: [
          Image.network(
            'https://png.pngtree.com/png-clipart/20190629/original/pngtree-vector-flat-icon-png-image_4091872.jpg',
            scale: 10,
          ),
          Column(
            children: [
              Text(flat.description),
              Text('${flat.dis_main_road}'),
              Text(flat.district)
            ],
          )
        ],
      ),
    );
  }

  Future<void> getFlatList() async {
    Map<String, dynamic> flatMap = await FlatService().fetchFlatList();
    log(flatMap.toString());
    flatList = flatMap['flatList'];

    setState(() {});
  }

  void initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showTagBar = false;
          setState(() {});
        }
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showTagBar = true;
          setState(() {});
        }
      }
    });
  }

  Future<void> addFlat() async {
    Flat flat = Flat(
        id: 111,
        room_no: 5,
        kitchen_no: 4,
        bathroom_no: 1,
        property_type: 'residental',
        dis_main_road: 500,
        adTitle: 'Flat on rent',
        description: 'flat for rent desc',
        price: 5000,
        district: 'kathmandu',
        mun_vdc: 'baneshwor',
        city_village: 'Minbhawan',
        tole: 'tole',
        ward_no: 5,
        firstname: 'Harry',
        lastname: 'Longfield',
        email: 'email@email',
        contact_no1: '123445',
        contact_no2: 'contact_no2',
        latitude: 'latitude',
        longitude: 'longitude');
    await FlatService().addFlat(flat);
    //getFlatList();
  }
}
