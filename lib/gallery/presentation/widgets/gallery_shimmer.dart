import 'package:flutter/material.dart';

import '../../../core/widgets/shimmer_widget.dart';

class GalleryItemsShimmerWidget extends StatelessWidget {
  const GalleryItemsShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      padding: const EdgeInsets.only(top: 15),
      shrinkWrap: true,
      itemCount: 16,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16, left: 10, right: 10),
          child: ShimmerWidget.rectangle(
            shapeBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            height: 130,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
