import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).secondaryHeaderColor, width: 2)),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.5)),
              icon: Icon(
                Icons.person,
                color: Theme.of(context).secondaryHeaderColor,
              )),
          validator: (String? value) {
            if (value != null) {
              return 'Username is required';
            }
            return null;
          },
          onChanged: (String? value) {},
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).secondaryHeaderColor, width: 2)),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'password',
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:
                      Theme.of(context).secondaryHeaderColor.withOpacity(0.5)),
              icon: Icon(
                Icons.password,
                color: Theme.of(context).secondaryHeaderColor,
              )),
          obscureText: true,
          validator: (String? value) {
            if (value != null) {
              return 'Username is required';
            }
            return null;
          },
          onChanged: (String? value) {},
        ),
      ),
    ]);
  }
}
