import 'package:ecommerce_app/src/widgets/data_loading.dart';
import 'package:flutter/material.dart';

class AppNetworkImageWidget extends StatelessWidget {
  final String url;
  final double? radius;

  const AppNetworkImageWidget({super.key, required this.url, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? 10),
          bottomLeft: Radius.circular(radius ?? 10),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(5),
      child: Image.network(
        url,
        // fit: BoxFit.fitHeight,
        height: 70,
        width: 70,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;

          return const SizedBox(height: 70, width: 70, child: DataLoading());
        },
      ),
    );
  }
}
