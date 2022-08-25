import 'package:flutter/material.dart';


import '../../../core/widgets/shimmer_widget.dart';

class NewsItemsShimmerWidget extends StatelessWidget {
  const NewsItemsShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
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
