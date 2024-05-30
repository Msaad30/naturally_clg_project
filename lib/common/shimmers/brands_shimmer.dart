import 'package:flutter/cupertino.dart';
import 'package:naturally/common/shimmer_effect/shimmer.dart';
import 'package:naturally/common/widgets/layout/grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount, 
      itemBuilder: (_, __) => TShimmerEffect(width: 300, height: 80),
    );
  }
}