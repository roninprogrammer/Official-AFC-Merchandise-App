import 'package:flutter/material.dart';
import 'package:afc_assignment/constants/app_color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
    );
  }
}
