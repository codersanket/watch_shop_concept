import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:watch_shop_concept/models/product_model.dart';

class FloatingTile extends StatelessWidget {
  const FloatingTile({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      
        Image.network(productModel.imageUrl),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel.watchName,
              style:
                  GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(productModel.price,
                style: GoogleFonts.roboto(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w600))
          ],
        ),
        const Expanded(child: SizedBox()),
        const Icon(
          Icons.favorite_outline_outlined,
          size: 40,
          color: Colors.grey,
        ),
        const Icon(
          Icons.file_upload_outlined,
          size: 40,
          color: Colors.grey,
        )
      ],
    );
  }
}
