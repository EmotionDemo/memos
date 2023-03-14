import 'package:flutter/material.dart';

typedef LoginTypeSelected = void Function(int loginType);

class LoginTypeSelectedButton extends StatefulWidget {
  const LoginTypeSelectedButton({Key? key, required this.onLoginTypeSelected})
      : super(key: key);
  final LoginTypeSelected onLoginTypeSelected;

  @override
  State<LoginTypeSelectedButton> createState() =>
      _LoginTypeSelectedButtonState();
}

class _LoginTypeSelectedButtonState extends State<LoginTypeSelectedButton> {
  @override
  Widget build(BuildContext context) {
    return _popupMenuButton(context);
  }

  PopupMenuButton _popupMenuButton(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.radio_button_checked,
        color: Colors.black54,
      ),
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(
            value: 0,
            child: Text('账号密码登录'),
          ),
          PopupMenuItem(
            value: 1,
            child: Text('Open Api登录'),
          )
        ];
      },
      onSelected: (value) {
        widget.onLoginTypeSelected(value);
      },
    );
  }
}
