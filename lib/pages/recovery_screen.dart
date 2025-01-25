// recovery_screen.dart
import 'package:flutter/cupertino.dart';

class RecoveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Recover Password'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(placeholder: 'Email'),
            CupertinoButton(
              child: Text('Recover'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
