import 'package:flutter/material.dart';

void main() {
  runApp(screen9());
}

class screen9 extends StatefulWidget {
  @override
  _screen9State createState() => _screen9State();
}

class _screen9State extends State<screen9> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: s9());
  }
}

class s9 extends StatefulWidget {
  @override
  _s9State createState() => _s9State();
}

class _s9State extends State<s9> {
  List<String> pics = ["IMG/s9_1.png", "IMG/s9_2.png", "IMG/s9_3.png"];
  List<String> titles = [
    "EASY EXCHANGE !",
    "EASY TO USE !",
    "CONNECT WITH OTHERS"
  ];
  List<String> subT1 = [
    "Lorem ipsum dolor sit amet, consectetur",
    "adipiscing elit. Nulla ultricies, erat vitae",
    "erat vitae porta consequat."
  ];


  PageController pageController =
      PageController(initialPage: 0,);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: pageController,
              onPageChanged: (pagepos) {
                setState(() {
                  index = pagepos;
                });
              },
              itemCount: pics.length,
              itemBuilder: (context, position) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:40.0,right:40.0),
                        child: Image(
                          image: AssetImage("${pics[position]}"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${titles[position]}",
                        style: TextStyle(
                            fontSize: 30,
                        //   fontFamily: "SF UI Display"
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${subT1[0]}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${subT1[1]}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${subT1[2]}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            left: MediaQuery.of(context).size.width - 100,
            child: FlatButton(
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                pageController.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.bounceInOut);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            left: MediaQuery.of(context).size.width - 400,
            child: FlatButton(
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height-90,
              left: 165,
              child: Row(
                children: <Widget>[
                  Circle(index, 0),
                  SizedBox(
                    width: 5,
                  ),
                  Circle(index, 1),
                  SizedBox(
                    width: 5,
                  ),
                  Circle(index, 2),
                ],
              ))
        ],
      ),
    );
  }
}

Circle(index, i) {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      color: index == i ? Colors.white : Colors.black12,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: index == i ? Colors.blue : Colors.white,
        width: 5,
      ),
    ),
  );
}
