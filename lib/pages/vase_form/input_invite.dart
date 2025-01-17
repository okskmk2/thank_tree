import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/services/vase_service.dart';

class InputInvite extends StatefulWidget {
  const InputInvite({Key? key}) : super(key: key);

  @override
  InputInviteState createState() => InputInviteState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class InputInviteState extends State<InputInvite> {
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
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "롤링페이퍼를 함께할\n멤버를 초대해주세요!",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SizedBox(
                  height: 180,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0, right: 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffffe812), // background color
                      onPrimary: Colors.black, // text color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreen(
                                  selectedIndex: 1,
                                )),
                      );
                    },
                    child: Text("카카오톡 공유하기")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0, right: 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("편지를 쓸 시간이 5시간 20분 남았어요!"),
                      action: SnackBarAction(
                        label: '확인',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MainScreen(selectedIndex: 1)),
                          );
                        },
                      ),
                    ));
                  },
                  icon: Icon(Icons.save), //icon data for elevated button
                  label: Text("초대링크 복사하기"), //label text

                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, //elevated btton background color
                    onPrimary: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0, right: 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreen(selectedIndex: 1)),
                      );
                    },
                    child: Text("감사카드 쓰기")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
