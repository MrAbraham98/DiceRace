import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Zar Yarisi'),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var firstPlayerScore = 0;
  var secondPlayerScore = 0;
  var firstLeftDiceeNumber = 1;
  var firstRightDiceeNumber = 1;
  var secondLeftDiceeNumber = 1;
  var secondRightDiceeNumber = 1;
  void firstPlayerDicee() {
    setState(() {
      firstLeftDiceeNumber = Random().nextInt(6) + 1;
      firstRightDiceeNumber = Random().nextInt(6) + 1;
      firstPlayerScore =
          firstLeftDiceeNumber + firstRightDiceeNumber + firstPlayerScore;
    });
  }

  void secondPlayerDicee() {
    setState(() {
      secondLeftDiceeNumber = Random().nextInt(6) + 1;
      secondRightDiceeNumber = Random().nextInt(6) + 1;
      secondPlayerScore =
          secondLeftDiceeNumber + secondRightDiceeNumber + secondPlayerScore;
    });
  }

  var counter = 0;
  var winner;

  void roundCounter() {
    counter++;
    if (counter == 6) {
      if (firstPlayerScore > secondPlayerScore) {
        winner = 'First Player won';
      } else {
        winner = 'Second Player won';
      }
      firstPlayerScore = 0;
      secondPlayerScore = 0;
      playButtonShow();
      counter = 0;
    }
  }

  bool playButtonVisible = true;
  bool nextRoundButtonVisible = false;
  bool winnerTextVisible = false;
  void playButtonHide() {
    setState(() {
      playButtonVisible = false;
      nextRoundButtonVisible = true;
      winnerTextVisible = false;
    });
  }

  void playButtonShow() {
    setState(() {
      playButtonVisible = true;
      nextRoundButtonVisible = false;
      winnerTextVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'First Player Score: $firstPlayerScore',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$firstLeftDiceeNumber.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$firstRightDiceeNumber.png'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$secondLeftDiceeNumber.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('images/dice$secondRightDiceeNumber.png'),
                ),
              ),
            ],
          ),
          Text(
            'Second Player Score: $secondPlayerScore',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Visibility(
            visible: winnerTextVisible,
            child: Text(
              '$winner',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          Visibility(
            visible: playButtonVisible,
            child: FlatButton(
              color: Colors.white,
              textColor: Colors.red,
              splashColor: Colors.orange,
              onPressed: () {
                firstPlayerDicee();
                secondPlayerDicee();
                playButtonHide();
                roundCounter();
              },
              child: Text('Play'),
            ),
          ),
          Visibility(
            visible: nextRoundButtonVisible,
            child: FlatButton(
              color: Colors.white,
              textColor: Colors.red,
              splashColor: Colors.orange,
              onPressed: () {
                firstPlayerDicee();
                secondPlayerDicee();
                roundCounter();
              },
              child: Text('Next Round'),
            ),
          )
        ],
      ),
    );
  }
}
