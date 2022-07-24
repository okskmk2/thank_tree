import 'package:flutter/material.dart';
import 'package:thank_tree/pages/vase_form/input_invite.dart';

class InputCreate extends StatefulWidget {
  const InputCreate({Key? key}) : super(key: key);

  @override
  InputCreateState createState() => InputCreateState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class InputCreateState extends State<InputCreate> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "이제 감사화분을",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "만들어보세요!",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset(
                  'assets/base.png',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0, right: 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InputInvite()),
                      );
                    },
                    child: Text("멤버 초대하기")),
              ),
            )
          ],
        ),
      ),
    );
  }
}