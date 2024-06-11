import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/app_bar.dart';
import 'package:onboarding_flow_part1/views/experience_screen.dart';
import 'package:onboarding_flow_part1/features/authentication/widgets/form_button.dart';
import 'package:onboarding_flow_part1/models/user_data.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final Map<String, String> _formData = {};

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

  void _nextDisabled() {
    _disabled = _username.isEmpty ||
        _email.isEmpty ||
        _isEmailValid() != null ||
        _birthday.isEmpty;
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
    if (_disabled) return;
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

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBarWidget(
          leadingType: LeadingType.cancel,
          onLeadingTap: () => _cancelTap(context),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    suffixIcon: Icon(
                      Icons.check_circle,
                      color: _username.isEmpty
                          ? Colors.grey.shade400
                          : Colors.green,
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v28,
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "Phone number or email address",
                    suffixIcon: Icon(
                      Icons.check_circle,
                      color: (_email.isEmpty || _isEmailValid() != null)
                          ? Colors.grey.shade400
                          : Colors.green,
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v28,
                TextField(
                  enabled: true,
                  focusNode: _dateFocusNode,
                  controller: _birthdayController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    labelText: "Date of birth",
                    suffixIcon: Icon(
                      Icons.check_circle,
                      color: _birthday.isEmpty
                          ? Colors.grey.shade400
                          : Colors.green,
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v80,
              ],
            ),
          ),
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.white,
          height: _showsDatePicker ? 300 : 80,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size36,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _onSubmitTap(),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: FormButton(
                          disabled: isNext,
                          buttonName: 'Next',
                        ),
                      ),
                    ),
                  ),
                ),
                _showsDatePicker
                    ? SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          maximumDate: initialDate,
                          initialDateTime: initialDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: _setTextFieldDate,
                          backgroundColor: Colors.white,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
