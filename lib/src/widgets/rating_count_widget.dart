import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int count;
  final Color? color;

  const RatingWidget({
    super.key,
    required this.count,
    required this.rating,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 17,
        ),
        const SizedBox(width: 3),
        Text(
          "${rating.toString()} (${count.toString()})",
          style: TextStyle(
            fontSize: 11,
            color: color ?? Colors.black,
          ),
        )
      ],
    );
  }
}
