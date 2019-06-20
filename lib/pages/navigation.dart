import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:waste_monitor_app/pages/histogram_page.dart';

import 'home_page.dart';
import '../helpers/histogram_object.dart';
import '../helpers/connection.dart';
import 'waste_summary.dart';

import '../helpers/summary_object.dart';

class Navigation extends StatefulWidget {
  final double initialFillValue;
  HistogramObject histogramObject;
  final Connection connection;
  Navigation(
      {this.initialFillValue = 0, this.histogramObject, this.connection});
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex;
  List<Widget> _pages;
  //List<String> _titles;
  @override
  void initState() {
    List<SummaryObject> mock = [
      SummaryObject(1, 1),
      SummaryObject(5, 5),
      SummaryObject(7, 7),
      SummaryObject(12, 7),
      SummaryObject(4, 4),
      SummaryObject(3, 3),
      SummaryObject(2, 2),
      SummaryObject(11, 11),
      SummaryObject(9, 30),
      SummaryObject(10, 20),
    ];

    _pages = [
      HomePage(
        initialValue: widget.initialFillValue,
        connection: widget.connection,
      ),
      HistogramPage(data: widget.histogramObject),
      WasteSummary(mock)
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
              title: Text(
                "Home",
                style: TextStyle(fontFamily: 'Montserrat'),
              )),
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
              title: Text("Emptying Summary",
                  style: TextStyle(fontSize: 10, fontFamily: 'Montserrat'))),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepOrange,
              icon: Icon(
                Icons.assessment,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.assessment,
                color: Colors.deepOrange,
              ),
              title: Text("Waste Summary",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 10)))
        ],
      ),
    );
  }
}
