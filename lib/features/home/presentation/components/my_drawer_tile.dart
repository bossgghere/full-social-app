import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String titleName;
  final IconData icon;
  final void Function()? onTap;

  const MyDrawerTile({
    super.key,
    required this.titleName,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleName, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      leading: Icon(icon , color: Theme.of(context).colorScheme.primary,),
      onTap: onTap,
    );
  }
}
