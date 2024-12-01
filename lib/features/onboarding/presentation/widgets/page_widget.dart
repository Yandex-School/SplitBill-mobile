import 'package:flutter/material.dart';
import 'package:split_bill/features/onboarding/presentation/widgets/page_data.dart';

class PageWidget extends StatelessWidget {
  final PageData page;

  const PageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (page.imagePath != null)
          ClipOval(
            child: Image.asset(
              page.imagePath!,
              height: screenHeight * 0.12,
              width: screenHeight * 0.12,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(height: 16.0),

        // Заголовок
        Text(
          page.title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: page.textColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            page.description,
            style: TextStyle(
              fontSize: 16.0,
              color: page.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
