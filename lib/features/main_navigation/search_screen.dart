import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          child: Icon(
        FontAwesomeIcons.magnifyingGlass,
        size: Sizes.size96,
      )),
    );
  }
}