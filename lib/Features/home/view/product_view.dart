import 'package:flutter/material.dart';
import 'package:food_delivery_front_end/core/model/product_model.dart';
import 'package:food_delivery_front_end/core/shared/my_button.dart';
import 'package:food_delivery_front_end/core/theme/text_styles.dart';
import 'package:food_delivery_front_end/main.dart';
import 'package:get/get.dart';

class ProductViewPage extends StatefulWidget {
  final ProductModel product;
  const ProductViewPage({required this.product, super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  int quntity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.mediaQuery.size.height * 0.35,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.network(
                      widget.product.fullImageUrl,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.name,
                    style: AppStyles.normalStyleTitleBold(size: 30),
                  ),
                ),

                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "\$  ${widget.product.price.toString()}",
                    style: AppStyles.priceStyle(
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "\$  ${widget.product.deliveryPrice.toString()}",
                        style: AppStyles.priceStyle(
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.hourglass_empty,
                        color: Get.theme.colorScheme.primary,
                        size: 20,
                      ),

                      Text(
                        widget.product.makeTime,
                        style: AppStyles.subTitle(),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star_rate,
                        color: Get.theme.colorScheme.primary,
                        size: 20,
                      ),
                      Text(
                        widget.product.averageRating.toString(),
                        style: AppStyles.subTitle(),
                      ),
                    ],
                  ),
                ),

                Divider(thickness: 0.5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Description",
                    style: AppStyles.normalStyleTitleBold(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.product.description,
                    style: AppStyles.subTitle(),
                  ),
                ),
              ],
            ),

            Positioned(
              top: Get.mediaQuery.size.height * 0.04,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButtonWithIcon(
                    onTp: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Text(
                    "About This Menu",
                    style: AppStyles.normalStyleTitleBold(color: Colors.white),
                  ),
                  AppBarButtonWithIcon(
                    onTp: () {
                      Get.back();
                    },
                    icon: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quntity == 1) {
                        } else {
                          quntity--;
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.remove, size: 35),
                    ),
                    SizedBox(width: 16),
                    Text(
                      quntity.toString(),
                      style: AppStyles.normalStyleTitleBold(),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: () {
                        quntity++;
                        setState(() {});
                      },
                      icon: Icon(Icons.add, size: 35),
                    ),
                    Spacer(),
                    MyGenralButton(
                      onPressed: () {
                        cartControllerImpl.addToCart(
                          product: widget.product,
                          quntity: quntity,
                        );
                      },
                      name: "Add to Cart",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
