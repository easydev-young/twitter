import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/experience_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final FocusNode _dateFocusNode = FocusNode();
  bool _showsDatePicker = false;
  bool _disabled = true;
  DateTime initialDate = DateTime.now();
  String _email = "";
  String _username = "";
  String _birthday = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _nextDisabled() {
    _disabled = ((_username.isEmpty ? true : false) ||
        ((_email.isEmpty || _isEmailValid() != null) ? true : false) ||
        ((_birthday.isEmpty) ? true : false));
  }

  bool get isNext => _disabled;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
        _nextDisabled();
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
        _nextDisabled();
      });
    });

    _birthdayController.text = 'Date of birth';
    _dateFocusNode.addListener(() {
      setState(() {
        _showsDatePicker = _dateFocusNode.hasFocus;
        _setTextFieldDate(initialDate);
        _nextDisabled();
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    _dateFocusNode.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthday = textDate;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _cancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onSubmitTap() {
    if (_username.isEmpty) return;
    if (_email.isEmpty || _isEmailValid() != null) return;
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExperienceScreen(
          userData: UserData(
            name: _username,
            phoneOrEmail: _email,
            dateOfBirth: _birthday,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.v60,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                GestureDetector(
                  onTap: () => _cancelTap(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.dove,
                    color: Theme.of(context).primaryColor,
                    size: Sizes.size24,
                  ),
                ),
              ],
            ),
            Gaps.v32,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create your account",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Gaps.v32,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color:
                        _username.isEmpty ? Colors.grey.shade400 : Colors.green,
                  ),
                ),
              ],
            ),
            Gaps.v28,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorText: _isEmailValid(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: (_email.isEmpty || _isEmailValid() != null)
                        ? Colors.grey.shade400
                        : Colors.green,
                  ),
                ),
              ],
            ),
            Gaps.v28,
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  enabled: true,
                  focusNode: _dateFocusNode,
                  controller: _birthdayController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color:
                        _birthday.isEmpty ? Colors.grey.shade400 : Colors.green,
                  ),
                ),
              ],
            ),
            Gaps.v60,
            Gaps.v20,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => _onSubmitTap(),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: FormButton(
                    disabled: isNext,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _showsDatePicker
          ? BottomAppBar(
              child: SizedBox(
                height: 100,
                child: CupertinoDatePicker(
                  maximumDate: initialDate,
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                ),
              ),
            )
          : null,
    );
  }
}
