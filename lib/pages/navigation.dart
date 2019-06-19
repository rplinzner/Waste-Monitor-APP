import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:waste_monitor_app/pages/histogram_page.dart';

import 'home_page.dart';
import 'charts_demo.dart';
import '../helpers/histogram_object.dart';

class Navigation extends StatefulWidget {
  final double initialFillValue;
  HistogramObject histogramObject = HistogramObject.noData();
  Navigation({this.initialFillValue = 0, this.histogramObject});
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex;
  List<Widget> _pages;
  //List<String> _titles;
  @override
  void initState() {
    _pages = [
      HomePage(initialValue: widget.initialFillValue),
      HistogramPage(data: widget.histogramObject),
      ChartsDemo.withSampleData()
    ];
    //_titles = ["Some title", "Some title 2"];
    currentIndex = 0;
    super.initState();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Monitor'),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Another Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepOrange,
              icon: Icon(
                Icons.check_circle,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.check_circle,
                color: Colors.deepOrange,
              ),
              title: Text("Animated Charts"))
        ],
      ),
    );
  }
}
