import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _newThreadController = TextEditingController();

  String _thread = "";

  @override
  void initState() {
    super.initState();
    _newThreadController.addListener(
      () => setState(() {
        _thread = _newThreadController.text;
      }),
    );
  }

  @override
  void dispose() {
    _newThreadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'New thread',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.v16,
                Divider(
                  color: Colors.grey.shade300.withOpacity(0.7),
                  height: 1,
                  thickness: 1,
                ),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.v20,
                        IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                      child: const CircleAvatar(
                                        radius: 24,
                                        backgroundImage:
                                            AssetImage('assets/users/7.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: VerticalDivider(
                                        width: Sizes.size32,
                                        thickness: 0.5,
                                        color: Colors.grey.shade600,
                                        indent: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'naya',
                                            style: TextStyle(
                                              fontSize: Sizes.size18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Gaps.h4,
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    Gaps.v8,
                                    //글쓰기
                                    Expanded(
                                      child: TextField(
                                        controller: _newThreadController,
                                        cursorColor: Colors.blue.shade100,
                                        // keyboardType: TextInputType.multiline,
                                        // autocorrect: false,
                                        minLines: 1,
                                        maxLines: 20,
                                        cursorWidth: 2,
                                        decoration: InputDecoration(
                                          hintText: "Start a thread...",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              Sizes.size12,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey.shade100,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: Sizes.size10,
                                            horizontal: Sizes.size12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gaps.v20,
                                    const FaIcon(
                                      FontAwesomeIcons.paperclip,
                                      color: Colors.black38,
                                      size: Sizes.size20,
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.h8,
                            ],
                          ),
                        ),
                        //작은 이미지
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 35,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: 8,
                                      left: 9,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/users/7.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v16,
              ],
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Sizes.size20,
                          ),
                          child: Text(
                            'Anyone can reply',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: Sizes.size20,
                          ),
                          child: Text(
                            'Post',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: _thread.isEmpty
                                  ? Colors.grey.shade400
                                  : Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v16,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
