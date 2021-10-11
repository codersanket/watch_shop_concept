import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_shop_concept/models/product_model.dart';
import 'package:watch_shop_concept/presentation/home/widgets/bottom_nav.dart';
import 'package:watch_shop_concept/presentation/home/widgets/product_card.dart';
import 'package:watch_shop_concept/presentation/products/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late AnimationController _animationController;
  double value = 0;
  
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration.zero);
    scrollController.addListener(() {
      _animationController.value = scrollController.position.pixels / 1000;
    });
    super.initState();
  }

  final List<String> _categories = [
    "Best Seller",
    "Trending",
    "Popular",
    "Followed"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (_, val) {
            return [
              SliverAppBar(
                toolbarHeight: kToolbarHeight + 20,
                backgroundColor: Colors.white,
                title: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 40,
                  color: Colors.white,
                  child: ListView(
                    physics: const PageScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        _categories.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                _categories[index],
                                style: GoogleFonts.yesevaOne(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: index == 0
                                        ? Colors.black
                                        : Colors.grey[400],
                                    decoration: index == 0
                                        ? TextDecoration.underline
                                        : TextDecoration.none),
                              ),
                            )),
                  ),
                ),
              )
            ];
          },
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductsPage(
                      index: index,
                      productModel: ProductModel.watches[index],
                    ),
                  ),
                ),
                child: Hero(
                    tag: "$index",
                    child: Material(
                      child: ProductCard(
                        productModel: ProductModel.watches[index],
                      ),
                    )),
              );
            },
            itemCount: ProductModel.watches.length,
          ),
        ),
        bottomNavigationBar: Hero(
          tag: "bottomNav",
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return BottomNav(
                value: _animationController.value,
                selected: 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
