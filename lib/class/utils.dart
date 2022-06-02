import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Titulo de Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Contenido del AlertDialog'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          );
        });
  }

    void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text('Titulo de Alert'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Este es el contenido de alerta'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          );
        });
  }