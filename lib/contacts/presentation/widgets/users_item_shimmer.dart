import 'package:flutter/material.dart';

import '../../../core/widgets/shimmer_widget.dart';

class UsersShimmerWidget extends StatelessWidget {
  const UsersShimmerWidget({
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
          height: 45,
          margin: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerWidget.rectangle(
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                color: Colors.transparent,
                height: 20,
                width: 20,
                child: const Icon(Icons.person),
              ),
              const SizedBox(width: 30),
              ShimmerWidget.rectangle(
                shapeBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                color: Colors.white,
                height: 20,
                width: MediaQuery.of(context).size.width - 90,
              ),
            ],
          ),
        );
      },
    );
  }
}
