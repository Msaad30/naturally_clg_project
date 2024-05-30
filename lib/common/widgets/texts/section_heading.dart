import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, 
    this.onPressed, 
    this.textColor,
    this.buttonTitle = 'View all',
    required this.title,
    this.showActiononButton = true,
  });

  final Color? textColor;
  final bool showActiononButton;
  final String title,buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title, 
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), 
          maxLines: 1, 
          overflow: TextOverflow.ellipsis
        ),
        if(showActiononButton) TextButton(onPressed: onPressed, child: const Text('View all'))
      ],
    );
  }
}
