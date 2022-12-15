import 'package:flutter/material.dart';

class LoadingWidjet extends StatelessWidget {
  const LoadingWidjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 8,
          ),
        )
      ],
    );
  }
}
