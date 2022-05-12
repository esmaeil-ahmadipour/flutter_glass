import 'package:flutter/material.dart';
import 'package:flutter_glass_example/model/model.dart';
import 'package:flutter_glass_example/widgets/card_content.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/widgets/list_view_body_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.pink,
                Colors.red,
                Colors.orange,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.8, 1],
            ),
          ),
          child: ListViewBody(children: [
            for (var i = 10; i > 0; --i)
              GlassContainer(
                cardHeight: 200,
                cardWidth: 360,
                children: [
                  CardContent(
                    cardModel: CardModel(
                      cNumber: "0000 1241 3698 7845",
                      name: "User $i",
                      cvv2: "$i""45",
                      date: "08/01",
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
  }
}
