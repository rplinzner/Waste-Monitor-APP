import 'package:flutter/material.dart';
import '../painters/progress_painter.dart';
import 'dart:ui';
import 'dart:async';
import '../helpers/data_extractor.dart';

class HomePage extends StatefulWidget {
  final double initialValue;
  HomePage({this.initialValue = 0});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _percentage;
  double _nextPercentage;
  Timer _timer;
  AnimationController _progressAnimationController;
  double _wasteLevel;
  Color _stateColor;
  DataExtractor _dataExtractor;

  @override
  void initState() {
    _percentage = 0.0;
    _nextPercentage = 0.0;
    _wasteLevel = 0.0;
    _dataExtractor = DataExtractor();
    setColors();
    initAnimationController();
    _timer = null;
    loadFirst(widget.initialValue);
    super.initState();
  }

  setColors() {
    if (_wasteLevel <= 70.0) {
      _stateColor = Colors.green;
      return;
    }
    if (_wasteLevel < 90) {
      _stateColor = Colors.yellow;
      return;
    }
    _stateColor = Colors.red;
  }

  getProgressText() {
    return Text(
      '${_nextPercentage.toInt()}%',
      style: TextStyle(
          fontSize: 50, fontWeight: FontWeight.w400, color: _stateColor),
    );
  }

  progressView() {
    return CustomPaint(
      child: Center(
        child: getProgressText(),
      ),
      foregroundPainter: ProgressPainter(
        defaultCircleColor: Colors.deepPurple,
        percentageCompletedCircleColor: _stateColor,
        completedPercentage: _percentage,
        circleWidth: 30.0,
      ),
    );
  }

  initAnimationController() {
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 240),
    )..addListener(
        () {
          setState(() {
            _percentage = lerpDouble(_percentage, _nextPercentage,
                _progressAnimationController.value);
          });
        },
      );
  }

  start() {
    Timer.periodic(Duration(milliseconds: 20), handleTicker);
  }

  publishProgress() {
    setState(() {
      _percentage = _nextPercentage;
      if (_nextPercentage > _wasteLevel - 2) {
        _nextPercentage += 0.1;
      } else if (_nextPercentage > _wasteLevel - 6) {
        _nextPercentage += 0.3;
      } else if (_nextPercentage > _wasteLevel - 12) {
        _nextPercentage += 0.8;
      } else {
        _nextPercentage += 1.4;
      }

      if (_nextPercentage > 100.0) {
        _percentage = 0.0;
        _nextPercentage = 0.0;
      }
      _progressAnimationController.forward(from: 0.0);
    });
  }

  handleTicker(Timer timer) {
    _timer = timer;
    if (_nextPercentage < _wasteLevel) {
      publishProgress();
    } else {
      timer.cancel();
    }
  }

  startProgress() {
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      _percentage = 0.0;
      _nextPercentage = 0.0;
      start();
    });
  }

  loadFirst(double value) {
    _wasteLevel = value * 100;
    setColors();
    startProgress();
  }

  loadData() {
    _dataExtractor.getLatestWasteLevel().then((value) {
      _wasteLevel = value * 100;
      setColors();
      startProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Monitor'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(35.0),
              child: progressView(),
            ),
            OutlineButton(
              child: Text("Refresh"),
              onPressed: () {
                loadData();
              },
            )
          ],
        ),
      ),
    );
  }
}
