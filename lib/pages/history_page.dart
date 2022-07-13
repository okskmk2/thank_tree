import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // constructor
  const HomePage({Key? key}) : super(key: key);
  final bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    /*return Container(
      alignment: AlignmentDirectional.center,
      child: Image.asset('assets/tree.jpg'),
    );*/
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("감사나무"),
            Container(
              width: 210,
              height: 100,
              margin: EdgeInsets.only(top: 40, bottom: 10, left: 10),
              child: Text(
                softWrap: true,
                textAlign: TextAlign.left,
                "홍길동님에게 새로운 감사인사가 전달됐어요!",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '확인하기',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/tree.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
