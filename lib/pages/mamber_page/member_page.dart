import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Row(
      children: [
        //Navigator
        Expanded(flex: 1, child: _navigator()),
        //dashboard
        Expanded(flex: 5, child: _dashboard())
      ],
    ));
  }

  _navigator() {
    return Container(
      color: Colors.blue[900],
      child: Column(
        children: [
          //Navigator Header
          SizedBox(
            height: 50.0,
            child: Container(),
          ),
          const Divider()

          //Navigator Body
        ],
      ),
    );
  }

  _dashboard() {
    return Column(
      children: [
        //Dashboard Header
        SizedBox(
          height: 50.0,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (animationController.status ==
                        AnimationStatus.completed) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: animationController))
            ],
          ),
        ),
        const Divider()

        //Dashboard body
      ],
    );
  }
}
