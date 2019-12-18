import "package:flutter/material.dart";

class TabbedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
            title: const Text("Tabbed AppBar"),
            bottom: new TabBar(
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
              isScrollable: true,
            )
        ),
        body: new TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new RenderTabView(choice: choice)
              );
            }).toList()
        )
      ),
    );
  }
}


class Choice {
  const Choice({
    this.title,
    this.icon,
    this.content,
    this.img
  });
  final String title;
  final IconData icon;
  final String content;
  final String img;
} // 定义Choice类


const List<Choice> choices = const <Choice> [
  const Choice (
      title: "鸟1",
      icon: Icons.directions_car,
      content:"Car1",
      img: "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
  ),
  const Choice (
      title: "鸟2",
      icon: Icons.directions_boat,
      content:"Boat1",
      img:'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
  )
];

class RenderTabView extends StatelessWidget {
  const RenderTabView({Key key, this.choice}) : super(key:key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      child: Image.network(choice.img)
    );
  }
} // 定义