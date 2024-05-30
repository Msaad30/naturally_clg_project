import 'package:flutter/material.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/features/shop/screens/order/widgets/orders_list.dart';
import 'package:naturally/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        // --Orders
        child: TOrderListItems(),
      ),
    );
  }
}