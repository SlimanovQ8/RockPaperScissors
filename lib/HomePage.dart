import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String player1 = "";
  String player2 = "";
   List<String> randomImages = [
    "assets/images/paper.png",
     "assets/images/rock.png",
     "assets/images/scissors.png",
  ];
   String wins = "";
   int getRandomElement (List list) {
    final random = new Random();
    int i = random.nextInt(list.length);
    return i;
  }

  @override
  var Ran = new Random();
   String getPic(int p1){

     if (p1 == 1)
       return randomImages[0];
     else if (p1 == 2)
       return randomImages[1];
     else return randomImages[2];

   }


   int p1 = 0; int p2 = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ROCK PAPER SCISSORS"),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Color(0xFFFEEFDB),
      body: Container(
        child: Column(
          children: [
            Row(


              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset(getPic(p1), scale: 1.6,),
                    Text("Player1"),



                  ],
                ),
                Column(
                  children: [
                    Image.asset(getPic(p2), scale: 1.6,),
                    Text("Player2"),



                  ],
                ),




              ],
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                p1 = getRandomElement(randomImages);
                p2 = getRandomElement(randomImages);
                print(p1);
                print(p2);
                if (p1 == p2)
                  wins = "tie";
                else if ((p1 == 2 && p2 == 0) || (p1 == 1 && p2 == 2 || (p1 == 0 && p2 == 1)))
                  wins = "player 1 wins";
                else
                  wins = "player 2 wins";

              });
            }, child: Text("Play", ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange
              ),
            ),
            Text(wins),

          ]
          ,
        ),
      ),
    );
  }
}
