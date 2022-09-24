import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      // height: size.height * 0.67,
      child: Column(
        children: [
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * 0.4,
            child: Image.asset(
              'assets/images/slepping.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
