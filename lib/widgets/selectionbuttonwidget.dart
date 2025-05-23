import 'package:flutter/material.dart';

class SelectionButtonWidget extends StatelessWidget {
  const SelectionButtonWidget({
    super.key,
    required this.ontap,
    required this.buttontitle,
    required this.iconCondition,
  });
  final Function ontap;
  final String buttontitle;
  final bool iconCondition;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: () => ontap(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              buttontitle,
            ),
            iconCondition
                ? Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
          ],
        ),
      ),
    );
  }
}
