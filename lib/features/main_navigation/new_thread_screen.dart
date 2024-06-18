import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class NewThreadScreen extends StatefulWidget {
  const NewThreadScreen({super.key});

  @override
  State<NewThreadScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<NewThreadScreen> {
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 1,
          title: const Text(
            'New thread',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          leading: Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.only(left: Sizes.size20),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          leadingWidth: 100,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size14,
                  horizontal: Sizes.size12,
                ),
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 140,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              TextField(
                                controller: _newThreadController,
                                cursorColor: Colors.blue.shade100,
                                scrollPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size96),
                                minLines: 1,
                                maxLines: 20,
                                decoration: InputDecoration(
                                  hintText: "Start a thread...",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      Sizes.size12,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size10,
                                    horizontal: Sizes.size12,
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
                  Gaps.v16,
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
                                      image: AssetImage('assets/users/7.png'),
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
            BottomAppBar(
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
          ],
        ),
      ),
    );
  }
}
