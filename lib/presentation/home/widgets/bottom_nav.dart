import 'dart:developer';

import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav(
      {Key? key,
      required this.value,
      required this.selected,
      this.showCircle = false,
      this.animationController})
      : super(key: key);

  final double value;
  final int selected;
  final bool showCircle;
  final AnimationController? animationController;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentWidth = (width - widget.value * 500).clamp(width - 100, width);
    final currentheight = widget.value * 500;

    return SizedBox(
      height: (kToolbarHeight + currentheight).clamp(kToolbarHeight, 80),
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: (currentheight).clamp(0, 20)),
          width: currentWidth,
          height: kToolbarHeight + 20,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              borderRadius:
                  BorderRadius.circular((currentheight).clamp(0, 50))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _iconList.length,
              (index) => Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    _iconList[index],
                    color: widget.selected == index
                        ? Colors.deepOrange
                        : Colors.black,
                  ),
                  if (widget.showCircle == true && index == 2)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: AnimatedBuilder(
                          animation: widget.animationController!,
                          builder: (context, snapshot) {
                            final raduis =
                                (widget.animationController!.value * 10.0)
                                    .clamp(0, 10);
                            log(raduis.toString());
                            return Container(
                              height: raduis + 1,
                              width: raduis + 1,
                              decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final _iconList = [
  Icons.home_outlined,
  Icons.search_outlined,
  Icons.shopping_cart_outlined,
  Icons.person_outlined,
];
