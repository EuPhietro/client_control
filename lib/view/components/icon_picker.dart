import 'package:flutter/material.dart';
import 'dart:async';

Future<IconData?> iconPicker(BuildContext context) async {
  Completer<IconData> completer = Completer();
   IconData? selectedIcon;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Center(
          child: Text(
            "Escolha um ícone",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: SizedBox(
          width: 320,
          height: 400,
          child: GridView.builder(
            itemCount: _listIcons.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 60.0,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                key: ValueKey(_listIcons[index].codePoint),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      completer.complete(selectedIcon = _listIcons[index]);
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      _listIcons[index],
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
  return completer.future;
}

List<IconData> _listIcons = [
  Icons.home,
  Icons.person,
  Icons.phone,
  Icons.email,
  Icons.star,
  Icons.favorite,
  Icons.settings,
  Icons.camera_alt,
  Icons.shopping_cart,
  Icons.work,
  Icons.school,
  Icons.pets,
  Icons.map,
  Icons.lock,
  Icons.alarm,
  Icons.calendar_today,
  Icons.directions_car,
  Icons.flight,
  Icons.restaurant,
  Icons.music_note,
  Icons.wifi,
  Icons.computer,
  Icons.print,
  Icons.lightbulb,
  Icons.book,
  Icons.cake,
  Icons.directions_bike,
  Icons.sports_soccer,
  Icons.local_hospital,
  Icons.beach_access,
  Icons.local_cafe,
  Icons.attach_money,
  Icons.build,
  Icons.bug_report,
  Icons.check_circle,
  Icons.cloud,
  Icons.code,
  Icons.delete,
  Icons.edit,
  Icons.face,
  Icons.group,
  Icons.language,
  Icons.mail,
  Icons.nightlife,
  Icons.palette,
  Icons.park,
  Icons.photo,
  Icons.security,
  Icons.send,
  Icons.thumb_up,
  Icons.visibility,
];
