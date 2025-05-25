import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/controllers/user_controller.dart';
import 'package:medicine_app/views/user%20views/dileviry_view.dart';
import 'package:medicine_app/views/user%20views/map_view.dart';
import 'package:medicine_app/widgets/custom_card.dart';
import 'package:medicine_app/widgets/custom_card_category.dart';
import 'package:medicine_app/widgets/custom_card_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: GetBuilder<UserController>(
          init: UserController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 27.0,
                horizontal: 19,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                        title: 'Chat with a pharmacist',
                        subTitle: 'Consultation with a specialist',
                        icon: Icons.chat,
                      ),
                      InkWell(
                        onTap: () => Get.to(MapView()),
                        child: CustomCard(
                          title: 'Pharmacy map',
                          subTitle: 'Pickup of order from pharmacies',
                          icon: Icons.location_on,
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(DileviryView()),
                        child: CustomCard(
                          title: 'Delivery',
                          subTitle: 'We will deliver your order quickly',
                          icon: Icons.car_crash_rounded,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33),
                  Text(
                    'Products of the day',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.products.length,
                        (index) => CustomCardProduct(product: controller.products[index]),
                      ),
                    ),
                  ),
                  SizedBox(height: 83),
                  Text(
                    'Collections',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    clipBehavior: Clip.none,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    children: List.generate(
                      controller.categories.length,
                      (index) =>
                          CustomCardCategory(category: controller.categories[index]),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
