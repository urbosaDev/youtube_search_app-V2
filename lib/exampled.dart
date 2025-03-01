import 'package:flutter/material.dart';

class Exampled extends StatelessWidget {

  const Exampled({super.key});


  @override
  Widget build(BuildContext context) {
    calculate(1).listen(
          (event) {
        print('$event');
      },
    );
    return const Placeholder();
  }
}
Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i * number; // return은 종료가 되서 yield로 표기 ?

    await Future.delayed(Duration(seconds: 1));
  }
}