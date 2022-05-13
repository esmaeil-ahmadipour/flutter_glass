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
        child: SizedBox(
          child: GradiantContainer(  // <=== utility widget for set gradiant
              child: ListViewBody(
            children: [
              for (var i = 10; i > 0; --i)
                GlassContainer(
                  height: 200,
                  width: 360,
                  children: [
                    CardContent(
                      cardModel: CardModel(
                        cNumber: "0000 1241 3698 7845",
                        name: "User $i",
                        cvv2: "$i" "45",
                        date: "08/01",
                      ),
                    ),
                  ],
                ),
            ],
          )),
        ),
      ),
    );
  }
}
