import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/components/buttons/custom_button.dart';
import 'package:pos/ui/components/texts/display_text.dart';
import 'package:pos/ui/view_models/cart_view_model.dart';
import 'package:pos/ui/view_models/home_view_model.dart';
import 'package:pos/ui/widgets/order_item.dart';

import 'top_menu.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key});

  final HomeViewModel hvm = Get.put(HomeViewModel());

  final CartViewModel cvm = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          TopMenu(
            title: 'Order',
            action: Container(),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: hvm.cart.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    books: hvm.cart[index],
                    index: index,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xff1f2029),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DisplayText(
                        text: 'Sub Total',
                      ),
                      Obx(
                        () => DisplayText(
                          text:
                              "RM${cvm.subTotal.value.toStringAsFixed(2)}",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DisplayText(
                        text: 'Tax',
                      ),
                      DisplayText(
                        text: '6%',
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 2,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DisplayText(
                        text: 'Total',
                      ),
                      Obx(
                        () => DisplayText(
                          text: "RM${cvm.total.value.toStringAsFixed(2)}",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.print,
                          size: 16,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Print Bills')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () => null,
                        text: 'Cash',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        onPressed: () => null,
                        text: 'Online',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        onPressed: () => null,
                        text: 'Card',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
