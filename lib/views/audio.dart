import 'package:flutter/material.dart';

class AudioScreen  extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Audio Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
