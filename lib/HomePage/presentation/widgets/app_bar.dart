import 'package:flutter/material.dart';

class InstaAppBar extends StatelessWidget {
  const InstaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        height: MediaQuery.of(context).size.height * .06,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.camera_alt_outlined),
              Image.asset("assets/insta_logo.png"),
              Icon(Icons.chat_bubble_outline_rounded)

            ],
          ),
        ),
      ),
    );
  }
}
