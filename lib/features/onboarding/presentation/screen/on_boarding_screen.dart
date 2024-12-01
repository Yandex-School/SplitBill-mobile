import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_bill/features/onboarding/presentation/widgets/page_data.dart';
import 'package:split_bill/features/onboarding/presentation/widgets/page_widget.dart';

final pages = [
  const PageData(
    imagePath: 'assets/images/1page.png',
    title: "SplitBill – Упростите совместные расходы",
    description: "Легко управляйте групповыми расходами, отслеживайте траты и рассчитывайтесь без лишних сложностей.",
    bgColor: Color(0xff051326),
    textColor: Colors.white,
  ),
  const PageData(
    imagePath: 'assets/images/2page.png',
    title: "Присоединяйтесь к событиям или создавайте свои",
    description:
        "Будь то ужин с друзьями, поездка или общий подписной сервис — SplitBill делает разделение расходов простым и справедливым.",
    bgColor: Color(0xfffab800),
    textColor: Color(0xff051326),
  ),
  const PageData(
    imagePath: 'assets/images/3page.png',
    title: "Будьте организованными и экономьте время",
    description: "Четкие отчёты, обновления в реальном времени и удобные платежи — всё в одном приложении.",
    bgColor: Color(0xffffffff),
    textColor: Color(0xff051326),
  ),
];

class ConcentricAnimationOnboarding extends StatelessWidget {
  const ConcentricAnimationOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        scaleFactor: 2,
        onFinish: () {
          context.go('/login');
        },
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: PageWidget(page: page),
          );
        },
      ),
    );
  }
}
