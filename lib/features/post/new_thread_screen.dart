import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/post/widgets/camera_screen.dart';
import 'package:onboarding_flow_part1/utils.dart';

class NewThreadScreen extends StatefulWidget {
  const NewThreadScreen({super.key});

  @override
  State<NewThreadScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<NewThreadScreen> {
  final _newThreadController = TextEditingController();

  String _thread = "";
  final List<File> _attachedFiles = [];

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

  void _onTapAttach(BuildContext context) async {
    final files = await Navigator.of(context).push<List<XFile>>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const CameraScreen(),
      ),
    );

    if (files == null) {
      return;
    }

    setState(() {
      _attachedFiles.addAll(
        files.map((file) => File(file.path)).toList(),
      );
    });
  }

  void _onRemovePressed(int index) {
    setState(() {
      _attachedFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        //backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
          surfaceTintColor: isDark ? Colors.grey.shade900 : Colors.white,
          elevation: 1,
          title: const Text(
            'New thread',
            style: TextStyle(
              //color: Colors.black,
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
                                style: TextStyle(
                                    color: isDarkMode(context)
                                        ? Colors.white
                                        : Colors.black),
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
                                  fillColor: isDark
                                      ? Colors.grey.shade900
                                      : Colors.grey.shade100,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size10,
                                    horizontal: Sizes.size12,
                                  ),
                                ),
                              ),
                              Gaps.v20,
                              if (_attachedFiles.isNotEmpty)
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _attachedFiles.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: Sizes.size6),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Sizes.size16),
                                            clipBehavior: Clip.antiAlias,
                                            child: Image.file(
                                              _attachedFiles[index],
                                              fit: BoxFit.fill,
                                              width: 300,
                                              height: 200,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () =>
                                                _onRemovePressed(index),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.black38,
                                                shape: BoxShape.circle,
                                              ),
                                              padding: const EdgeInsets.all(4),
                                              child: const Icon(
                                                Icons.close_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              GestureDetector(
                                onTap: () => _onTapAttach(context),
                                child: FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: Colors.grey.shade400,
                                  size: Sizes.size20,
                                ),
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
              //color: Colors.white,
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
