import 'package:flutter/material.dart';
import 'package:flutter_application_1/fourth_screen.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SNEWS Категории',
            theme: ThemeData(primarySwatch: Colors.blue),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: MyListView(),
          );
        });
  }
}

class MyListView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SNEWS Категории'),
        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.brightness_3
                  : Icons.brightness_7),
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              })
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Политика'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstScreenRSS(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Экономика'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreenRSS(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Общество'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdScreenRSS(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('События'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FourthScreenRSS(),
                ),
              );
            },
          ),
          AboutListTile(
                child: Text('Об приложении'),
                applicationIcon: const FlutterLogo(),
                applicationName: 'SNEWS',
                applicationVersion: '1.0.2',
                applicationLegalese: '© 2022 Your BunnY Wrote Company',
                
              ),
        ],
      ),
    );
  }

}
