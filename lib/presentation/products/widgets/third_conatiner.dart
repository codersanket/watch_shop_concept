import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:watch_shop_concept/models/product_model.dart';

class ThirdContainer extends StatefulWidget {
  ThirdContainer({
    Key? key,
    required this.onTap,
    required this.value,
    required this.productModel,
  }) : super(key: key);
  final VoidCallback onTap;
  final AnimationController value;
  final ProductModel productModel;

  @override
  State<ThirdContainer> createState() => _ThirdContainerState();

  static Widget getCharaterstics(CharacterStics characterStics) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(characterStics.title),
            Flexible(
                child: Divider(
              color: Colors.grey[100],
              endIndent: 3,
              indent: 3,
            )),
            Text(characterStics.feature)
          ],
        ),
      );
}

class _ThirdContainerState extends State<ThirdContainer> {
  ValueNotifier valueNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.value,
      builder: (context, _) {
        if (widget.value.value > 0.7 && valueNotifier.value != true) {
          valueNotifier.value = true;
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          margin: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Characterstics",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ...List.generate(
                CharacterStics.characterStics.length,
                (index) =>
                    ThirdContainer.getCharaterstics(CharacterStics.characterStics[index]),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width - 16,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Opacity(
                        opacity: widget.value.value,
                        child: FloatingActionButton(
                          elevation: 0,
                          heroTag: "xyz",
                          backgroundColor: Colors.deepOrange,
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width -
                          16 -
                          widget.value.value * 80,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          backgroundColor: MaterialStateProperty.all(
                              valueNotifier.value == false
                                  ? Colors.deepOrange
                                  : Colors.green),
                          elevation: MaterialStateProperty.all(6),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        onPressed: () {
                          widget.value.forward();
                        },
                        child: ValueListenableBuilder(
                          valueListenable: valueNotifier,
                          builder: (context, snapshot, _) {
                            return AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (valueNotifier.value == false) ...[
                                    Text(
                                      "Add to Cart",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.productModel.price,
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                  if (valueNotifier.value == true) ...[
                                    Text(
                                      "In cart:1pc.",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Go to",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CharacterStics {
  final String title;
  final String feature;

  CharacterStics(this.title, this.feature);

  static List<CharacterStics> characterStics = [
    CharacterStics("Case size", "41mm x 39mm x 9mm"),
    CharacterStics("Max. wrist size", "215 mm"),
    CharacterStics("Weight", "90 grams"),
    CharacterStics("Country", "Germany"),
    CharacterStics("Materials", "Stainless steel"),
  ];
}
