import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/signup_page.dart';
import 'package:thank_tree/pages/vase_detail_page.dart';
import 'package:thank_tree/pages/vase_form/vase_form_page.dart';
import 'package:thank_tree/services/vase_service.dart';

class PostOfficePage extends StatefulWidget {
  const PostOfficePage({Key? key}) : super(key: key);

  @override
  State<PostOfficePage> createState() => _PostOfficePageState();
}

class _PostOfficePageState extends State<PostOfficePage>
    with SingleTickerProviderStateMixin {
  // custom tab bar controller
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // SingleTockerProviderStateMixin is used to control the animation of the tab bar controller
    controller = TabController(length: 2, vsync: this);
    // refresh the state of the tab bar to display index on app bar and tab bar controller on app bar
    controller.addListener(() {
      setState(() {});
    });
  }

  // dispose the tab controller when the app is closed to avoid memory leaks
  @override
  void dispose() {
    super.dispose(); // super는 항상 먼저 호출해야한다.
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myVases = Provider.of<VaseService>(context, listen: false).getMyVase();

    String email = '미접속';
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      email = currentUser.email!;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomStyles.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            color: CustomStyles.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  // clipBehavior: Clip.,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "화분 우체국",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            height: 1.4
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "화분은 작성된 잎편지들을\n모아서 전달하는 역할을 해요",
                          style: TextStyle(
                            color: CustomStyles.input,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.4
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(CustomStyles.grey2),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            )),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VaseFormPage()),
                            );
                          },
                          child: Text(
                            "화분 만들기",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     FirebaseAuth.instance.signOut().then((value) {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => SignUpPage()),
                        //       );
                        //     });
                        //   },
                        //   child: Text(
                        //     "로그아웃",
                        //   ),
                        // ),
                        // TextButton(
                        //   onPressed: () {
                        //     print(FirebaseAuth.instance.currentUser?.email);
                        //   },
                        //   child: Text(email),
                        // ),
                        SizedBox(
                          height: 23,
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: Image.asset('assets/화분보따리.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: CustomStyles.primaryColor,
              child: Container(
                color: CustomStyles.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          isScrollable: true,
                          controller: controller,
                          tabs: [
                            Tab(text: '진행 중 12'),
                            Tab(text: "보내기 완료 10"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller,
                          children: [
                            DoingTabView(),
                            DoneTabView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoingTabView extends StatelessWidget {
  const DoingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Provider.of<VaseService>(context).getMyVase(),
      builder: (context, snapshot) {
        final vases = snapshot.data?.docs ?? [];
        if (vases.isEmpty) {
          return Center(child: Text("작성 중인 화분이 없습니다."));
        }
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              Divider(thickness: 1),
          itemCount: vases.length,
          itemBuilder: (context, index) {
            final vase = vases[index];
            return vaseCard(context, index, vase);
          },
        );
      },
    );
  }
}

class DoneTabView extends StatelessWidget {
  const DoneTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Provider.of<VaseService>(context).getMyVase(),
      builder: (context, snapshot) {
        final vases = snapshot.data?.docs ?? [];
        if (vases.isEmpty) {
          return Center(child: Text("보낸 화분이 없습니다."));
        }
        return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                Divider(thickness: 1),
            itemCount: vases.length,
            itemBuilder: (context, index) {
              final vase = vases[index];
              return vaseCard(context, index, vase);
            });
      },
    );
  }
}

Widget vaseCard(context, index, vase) {
  var receiveUID = vase.get('receiveUID');
  var dueDateTime = vase.get('dueDateTime');
  var vaseStatus = vase.get('status');
  final diffTime = DateTime.now().difference(DateTime.parse(dueDateTime));
  final diffD = diffTime.inMinutes ~/ (60 * 24);
  final diffH = diffTime.inMinutes ~/ 60;
  final diffM = diffTime.inMinutes % 60;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VaseDetailPage()),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 116,
      padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Color(0xffDAD7D2),
              ),
              shape: BoxShape.circle,
              color: Color(0xffFDFAF5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset('assets/icons/vase1.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$receiveUID님에게 전달까지",
                  style: TextStyle(
                    color: Color(0xff36332E),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      "${diffD}일 ${diffH}시간 ${diffM}분",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: CustomStyles.primaryColor),
                    ),
                    Text(
                      " 남았어요",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1F1E1C),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
