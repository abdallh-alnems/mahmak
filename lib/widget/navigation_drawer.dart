import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/pages/about_page.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/provider/menu_item_provider.dart';
import 'package:launch_review/launch_review.dart';
import 'package:to_do_list/widget/change_theme_button_widget.dart';

class ItemNavigationDrawer extends StatelessWidget {
const ItemNavigationDrawer({super.key});

@override
Widget build(BuildContext context) => SizedBox(
width: MediaQuery.of(context).size.width * 0.7,
child: AnimatedSwitcher(
duration: const Duration(milliseconds: 700),
child: Drawer(
key: Key(Theme.of(context).brightness.toString()),
backgroundColor: Theme.of(context).primaryColor,
child: ListView(
children: [
Padding(
padding: EdgeInsets.only(
top: MediaQuery.of(context).size.height * 0.25)),
Container(
padding: EdgeInsets.only(
left: MediaQuery.of(context).size.width * 0.06),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [

SizedBox(
width: MediaQuery.of(context).size.width * 0.5,
child: const Text('NiMs',
style: TextStyle(
fontWeight: FontWeight.w700,
fontSize: 28,
fontFamily: 'Vazirmatn'))),
const SizedBox(
height: 20,
)
],
),
),
buildMenuItems(context),
Padding(
padding: EdgeInsets.only(
top: MediaQuery.of(context).size.height * 0.30)),
SizedBox(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: const [
Icon(Icons.light_mode_outlined),
ChangeThemeButtonWidget(),
Icon(Icons.dark_mode_outlined),
],
),
),
],
)),
),
);

Widget buildMenuItems(BuildContext context) => Consumer<MenuItemProvider>(
builder: (context, status, _) => Container(
padding: EdgeInsets.symmetric(
horizontal: MediaQuery.of(context).size.width * 0.06),
child: Wrap(
children: [
ListTile(
tileColor: status.newStatus == 'task'
? Theme.of(context).iconTheme.color
: null,
horizontalTitleGap: -5,
leading: const Icon(
Icons.event_note_outlined,
color: Colors.grey,
),
title: const Text(
'المهام',
),
shape: const RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(5)),
),
contentPadding:
const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
onTap: () {
Provider.of<MenuItemProvider>(context, listen: false)
.changeStatus('task');
Navigator.of(context).pushAndRemoveUntil(
MaterialPageRoute(
builder: (BuildContext context) => const HomePage()),
(Route<dynamic> route) => false);
},
),
ListTile(
tileColor: status.newStatus == 'about'
? Theme.of(context).iconTheme.color
: null,
leading: const Icon(
Icons.info_outline,
color: Colors.grey,
),
horizontalTitleGap: -5,
title: const Text(
'عنا',
),
shape: const RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(5)),
),
contentPadding:
const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
onTap: () {
Provider.of<MenuItemProvider>(context, listen: false)
.changeStatus('about');
Navigator.of(context).pushAndRemoveUntil(
MaterialPageRoute(
builder: (BuildContext context) => const AboutPage()),
(Route<dynamic> route) => false);
},
),
ListTile(
leading: const Icon(
Icons.star,
color: Colors.yellow,
),
horizontalTitleGap: -5,
title: const Text(
'قيمنا',
),
contentPadding:
const EdgeInsets.symmetric(vertical: -10, horizontal: 10),
onTap: () {
LaunchReview.launch(androidAppId: "ni.nims.mahmak");
},
),
],
),
),
);
}