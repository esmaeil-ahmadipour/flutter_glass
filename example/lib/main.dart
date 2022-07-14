import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:flutter_glass_example/model/model.dart';
import 'package:flutter_glass_example/widgets/card_content.dart';
import 'package:flutter_glass_example/widgets/list_view_body_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Glass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          child: GradiantContainer(
              // in here, used utility & pretty widget (for set background gradiant).
              child: ListViewBody(
            children: [
              for (var i = 9; i > 0; --i)
                GlassContainer(
                  // from here, set glass widget.
                  // for using [decorationImage] , better is reduce blur on image , recommended set values of sigmaX & sigmaX on 0.0 .
                  sigmaX: 0,
                  sigmaY: 0,
                  decorationImage: const DecorationImage(
                      // in here, set your image for background  of glass widget.
                      // you can use AssetImage , NetworkImage or CachedNetworkImageProvider .
                      image: NetworkImage("http://via.placeholder.com/200x150"),
                      fit: BoxFit.fill,
                      // you can set manually opacity for background image .
                      opacity: 0.2),
                  children: [
                    // in here, put your widgets in glass widget.
                    CardContent(
                      cardModel: CardModel(
                        cNumber: "6${i}00 1241 3698 7845",
                        name: "User $i",
                        cvv2: "$i" "45",
                        date: "2022/0$i",
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
