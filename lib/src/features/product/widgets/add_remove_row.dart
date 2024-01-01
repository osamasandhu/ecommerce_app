import 'package:ecommerce_app/src/features/product/provider/count/count_product_provider.dart';
import 'package:ecommerce_app/src/features/product/widgets/add_remove_button.dart';
import 'package:ecommerce_app/src/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddRemoveRow extends StatelessWidget {
  final int itemCount;
  final WidgetRef ref;
  final BuildContext context;

  const AddRemoveRow(
      {super.key,
      required this.context,
      required this.ref,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AbsorbPointer(
          absorbing: itemCount == 0 ? true : false,
          child: AddRemoveButtonWidget(
            color: itemCount < 1 ? Colors.grey : Colors.red,
            onTap: () {
              if (itemCount > 0) {
                ref.read(counterValueProvider.notifier).decrement();
              }
            },
          ),
        ),
        SizedBox(
          width: 35,
          child: Text(
            itemCount.toInt().toString(),
            textAlign: TextAlign.center,
          ),
        ),
        AddRemoveButtonWidget(
          onTap: () {
            if (itemCount < 10) {
              ref.read(counterValueProvider.notifier).increment();
            } else {
              AppSnackBar.snackBarWidget(
                  context: context, title: 'Limit Reached');
            }
          },
          color: Colors.green,
          icon: Icons.add,
        ),
      ],
    );
  }

// Widget addRemoveRow(
//     {required int itemCount,
//     required WidgetRef ref,
//     required BuildContext context}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       AddRemoveButtonWidget(
//         color: itemCount < 2 ? Colors.grey : Colors.red,
//         onTap: () {
//           if (itemCount > 1) {
//             ref.read(counterValueProvider.notifier).decrement();
//           }
//         },
//       ),
//       SizedBox(
//         width: 35,
//         child: Text(
//           itemCount.toInt().toString(),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       AddRemoveButtonWidget(
//         onTap: () {
//           if (itemCount < 10) {
//             ref.read(counterValueProvider.notifier).increment();
//           } else {
//             AppSnackBar.snackBarWidget(
//                 context: context, title: 'Limit Reached');
//           }
//         },
//         color: Colors.green,
//         icon: Icons.add,
//       ),
//     ],
//   );
// }
}
