import 'package:flutter/material.dart';

class AmalaPage extends StatefulWidget {
  const AmalaPage({super.key});

  @override
  State<AmalaPage> createState() => _AmalaPageState();
}

class _AmalaPageState extends State<AmalaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

_amalaContentPage() {
  return Container(
    child: Row(
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Expanded(child: SizedBox())
      ],
    ),
  );
}
