import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cupertino y Material',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino y Material'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Cupertino Button 1
            CupertinoButton(
              child: Text('Botón de alerta simple Cupertino 1'),
              onPressed: () {
                _showCupertinoAlert(context, 'Alerta de Cupertino 1');
              },
              color: Color.fromARGB(255, 255, 123, 0),
              borderRadius: BorderRadius.circular(8.0),
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 50.0,
              ),
            ),
            SizedBox(height: 20.0),
            // Material Button 1
            ElevatedButton(
              onPressed: () {
                _showMaterialAlertWithOptions(context, 'Alerta de Material 1');
              },
              child: Text('Botón de alerta con opciones Material 1'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 243, 226, 33),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Cupertino Timer Picker
            CupertinoButton(
              child: Text('Mostrar Temporizador'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 250,
                      color: Colors.white,
                      child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hms,
                        onTimerDurationChanged: (Duration newDuration) {
                          print(newDuration);
                        },
                      ),
                    );
                  },
                );
              },
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(8.0),
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 50.0,
              ),
            ),
            SizedBox(height: 20.0),
            // Material Button 2 changed to show SimpleDialog
            ElevatedButton(
              onPressed: () {
                _showMaterialSimpleDialog(context);
              },
              child: Text('Mostrar Diálogo Simple'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 115, 192, 255),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCupertinoAlert(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(message),
          content: Text('Esta es una alerta simple de Cupertino.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMaterialAlertWithOptions(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: Text('Esta es una alerta de Material con opciones.'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMaterialSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Diálogo Simple'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Opción 1'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Opción 2'),
            ),
          ],
        );
      },
    );
  }
}

class CupertinoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Cupertino'),
      ),
      body: Center(
        child: CupertinoButton(
          child: Text('Mostrar Alerta de Cupertino'),
          onPressed: () {
            _showCupertinoAlert(context, 'Alerta de Cupertino');
          },
          color: CupertinoColors.activeBlue,
          borderRadius: BorderRadius.circular(8.0),
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 50.0,
          ),
        ),
      ),
    );
  }

  void _showCupertinoAlert(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(message),
          content: Text('Esta es una alerta simple de Cupertino.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
