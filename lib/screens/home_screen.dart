import 'package:auth_starter/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final AuthProvider auth =
          Provider.of<AuthProvider>(context, listen: false);

      auth.fetchUser();

      if (!await auth.loggedIn) {
        print('[Authentication] You are not logged in, please login.');
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }

      print('[Authentication] ...');
      print('is logged in? ${await auth.loggedIn}');
    });
  }

  void redirect() {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = Provider.of<AuthProvider>(context);

    String fullName = auth.fullName;

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
                onPressed: () async {
                  if (await auth.logout() == 200) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                  }
                },
                child: Text(
                  'LOGOUT',
                  style: TextStyle(color: Colors.white),
                )),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
            child: Center(
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Text('Welcome back, ' + fullName,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ))),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50.0,
                  width: 200,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () => Navigator.of(context).pushNamed('/tasks'),
                    child: Text('See all Tasks'),
                    textColor: Colors.white,
                    color: Colors.indigo,
                  ),
                )
              ],
            ),
          ),
        )));
  }
}

class NavigationCard extends StatelessWidget {
  final String title;
  final String image;
  final String routeName;

  NavigationCard({this.title, this.image, this.routeName});

  @override
  Widget build(BuildContext context) {
    final String assetName = this.image ?? '/children.svg';

    return Container(
      padding: EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(this.routeName);
        },
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Center(
              child: Column(
            children: <Widget>[
              WebsafeSvg.asset(assetName, placeholderBuilder: (context) {
                return Image.asset('/icon.png', height: 100.0, width: 100.0);
              }, height: 100.0, width: 100.0),
              Text(
                this.title ?? 'None',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
