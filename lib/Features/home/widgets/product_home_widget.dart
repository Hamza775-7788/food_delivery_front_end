import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/Features/home/view/product_view.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:get/get.dart';

class ProductHomeWidget extends StatelessWidget {
  final ProductModel product;
  final Function()? onTap;
  const ProductHomeWidget({this.onTap, required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductViewPage(product: product));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.network(
                    product.fullImageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium,
                  ),
                ),

                Positioned(
                  top: 5,
                  right: 10,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,

                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.favorite_border, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Flexible(
              child: FittedBox(
                child: Text(product.name, style: AppStyles.normalStyleTitle()),
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Get.theme.colorScheme.primary),
                Text(
                  product.averageRating.toString(),
                  style: AppStyles.normalStyleTitle(),
                ),
                Spacer(),
                Text(
                  product.makeTime.toString(),
                  style: AppStyles.normalStyleTitle(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "\$${product.price.toString()}",
              style: AppStyles.priceStyle(color: Get.theme.colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
