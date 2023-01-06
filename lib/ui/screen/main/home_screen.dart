import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:coffecustomer/ui/screen/main/components/slider_widget.dart';
import 'package:coffecustomer/ui/screen/main/components/star_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      children:  [
        const SliderWidget(),
        Padding(
          padding: FxSpacing.fromLTRB(16, 16, 16, 0),
          child: Column(children: const [
            StarHomeWidget(),
          ],),
        ),
      ],
    );
  }
}
