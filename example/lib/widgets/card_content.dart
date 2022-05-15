import 'package:flutter/material.dart';
import 'package:flutter_glass_example/model/model.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
    required this.cardModel,
  }) : super(key: key);
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Bank ',
                  style: TextStyle(color: Colors.white.withOpacity(0.75))),
              SizedBox(
                  width: 48,
                  height: 48,
                  child: Icon(Icons.payment,
                      color: Colors.white.withOpacity(0.75))),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cardModel.name,
                  style: TextStyle(color: Colors.white.withOpacity(0.75))),
              Text(
                  'Date: '
                  '${cardModel.date}',
                  style: TextStyle(color: Colors.white.withOpacity(0.75))),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cardModel.cNumber,
                  style: TextStyle(color: Colors.white.withOpacity(0.75))),
              Text(
                  'CVV2: '
                  '${cardModel.cvv2}',
                  style: TextStyle(color: Colors.white.withOpacity(0.75))),
            ],
          ),
        ],
      ),
    );
  }
}
