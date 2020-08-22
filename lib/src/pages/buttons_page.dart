import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background(),
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_titles(), _roundedButtons()],
          ))
        ],
      ),
      bottomNavigationBar: _buttomNaviogationBar(context),
    );
  }

  Widget _background() {
    final gradientBG = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ])),
    );

    final pinkBox = Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1),
                Color.fromRGBO(241, 142, 172, 1)
              ])),
        ));

    return Stack(
      children: [gradientBG, Positioned(top: -100, left: -20, child: pinkBox)],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Hello this is the title',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.0,
              ),
              Text('And this is the subtitle of the this page',
                  style: TextStyle(color: Colors.white, fontSize: 16.0))
            ],
          )),
    );
  }

  Widget _buttomNaviogationBar(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1)))),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: 30.0), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, size: 30.0),
              title: Container())
        ]));
  }

  Widget _roundedButtons() {
    return Table(children: [
      TableRow(children: [
        _roundedButton(Colors.lightBlueAccent[200], Icons.favorite, 'Love'),
        _roundedButton(Colors.greenAccent, Icons.filter_hdr, 'Montains')
      ]),
      TableRow(children: [
        _roundedButton(Colors.orangeAccent, Icons.beach_access, 'Beach'),
        _roundedButton(Colors.deepPurple, Icons.directions_bike, 'Bikes')
      ]),
      TableRow(children: [
        _roundedButton(Colors.redAccent, Icons.fitness_center, 'Gym'),
        _roundedButton(Colors.pinkAccent, Icons.spa, 'Spa')
      ]),
      TableRow(children: [
        _roundedButton(Colors.blueGrey, Icons.movie_filter, 'Cinema'),
        _roundedButton(Colors.indigoAccent, Icons.blur_on, 'Disco')
      ])
    ]);
  }

  Widget _roundedButton(Color color, IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        print(text);
      },
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 1.5),
          child: Container(
            height: 180,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 5),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundColor: color,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(color: color, fontSize: 16),
                  ),
                  SizedBox(height: 5)
                ]),
          ),
        ),
      ),
    );
  }
}
