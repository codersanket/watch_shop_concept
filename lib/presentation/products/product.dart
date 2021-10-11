import 'package:flutter/material.dart';
import 'package:watch_shop_concept/models/product_model.dart';
import 'package:watch_shop_concept/presentation/home/widgets/bottom_nav.dart';
import 'package:watch_shop_concept/presentation/products/widgets/first_container.dart';
import 'package:watch_shop_concept/presentation/products/widgets/floating_tile.dart';
import 'package:watch_shop_concept/presentation/products/widgets/second_container.dart';

import 'widgets/third_conatiner.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    required this.index,
    required this.productModel,
  }) : super(key: key);
  final int index;
  final ProductModel productModel;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  static late AnimationController _animationController;

  bool showAppBar = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 200) {
        valueNotifier.value = true;
      } else {
        valueNotifier.value = false;
      }
    });
  }

  ValueNotifier valueNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Hero(
          tag: "bottomNav",
          child: BottomNav(
            value: 0,
            selected: 8,
            showCircle: true,
            animationController: _animationController,
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              children: [
                Hero(
                    tag: "${widget.index}",
                    child: FirstContainer(
                      productModel: widget.productModel,
                    )),
                const SecondContainer(),
                ThirdContainer(
                    onTap: () {
                      _animationController.forward();
                    },
                    productModel: widget.productModel,
                    value: _animationController)
              ],
            ),
            ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (context, snapshot, _) {
                return AnimatedPositioned(
                  top: valueNotifier.value == false ? -80 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: _!,
                );
              },
              child: Container(
                height: 70,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: FloatingTile(
                  productModel: widget.productModel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
