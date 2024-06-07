import 'dart:ui';

import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  final String imageUrl;
  const DialogContent({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 24,
        sigmaY: 24,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white.withOpacity(0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IT\'S A',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              'MATCH!!',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Image.network(imageUrl),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
