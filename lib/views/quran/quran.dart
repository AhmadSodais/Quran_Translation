import 'package:flutter/material.dart';
import 'package:quran_translation/views/quran/widgets/custom_tabbar.dart';
import 'package:quran_translation/views/quran/widgets/search.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(children: [
          SearchField(),
          SizedBox(height: 16),
          CustomTabBar()
        ],),
      )
    );
  }
}
