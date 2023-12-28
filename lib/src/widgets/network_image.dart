import 'package:ecommerce_app/src/widgets/data_loading.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;

  const NetworkImageWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Image.network(
        url,
        fit: BoxFit.fill,
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
