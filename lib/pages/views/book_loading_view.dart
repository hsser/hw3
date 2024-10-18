import 'package:flutter/material.dart';

class BookLoadingView extends StatelessWidget {
  const BookLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            color: ThemeData.light().colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
