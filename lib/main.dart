// import 'package:flutter/material.dart';
// import 'package:pills/pages/delay.dart';

// void main() async {
//   // Hive.registerAdapter(ContactAdapter(), 0);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Delay(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pills/contactData.dart';
import 'package:pills/model/contact.dart';
import 'package:pills/pages/AddContactPage.dart';
import 'package:pills/pages/add_event_page.dart';
import 'package:pills/pages/contactList.dart';
import 'package:pills/pages/delay.dart';
import 'package:provider/provider.dart';

void main() {
  Hive.registerAdapter(ContactAdapter());

  runApp(AssociateApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
}

class AssociateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Associates',
        // theme: ThemeData(primaryColor: Colors.lightGreenAccent),
        initialRoute: "/",
        routes: {
          "/": (context) => FutureBuilder(
              future: _initHive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.error != null) {
                    print(snapshot.error);
                    return Scaffold(
                      body: Center(
                        child: Text("Error establishing connection to hive"),
                      ),
                    );
                  } else {
                    return Delay();
                  }
                } else
                  return Scaffold();
              }),
          "/AddAssociatePage": (context) => AddContactPage()
        },
      ),
    );
  }
}
