import "package:flutter/material.dart";
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(
      {Key? key, required this.onSettingsChanged, required this.settings})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configurações"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Filtros",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                      "Sem Glutém",
                      "So Exibe Refeições sem glutém",
                      settings.isGlutenFree,
                      (value) => setState(
                            (() => settings.isGlutenFree = value),
                          )),
                  _createSwitch(
                      "Sem Lactose",
                      "So Exibe Refeições sem Lactose",
                      settings.isLactoseFree,
                      (value) => setState(
                            (() => settings.isLactoseFree = value),
                          )),
                  _createSwitch(
                      "Vegetariana",
                      "So Exibe Refeições Vegetariana",
                      settings.isVegetarian,
                      (value) => setState(
                            (() => settings.isVegetarian = value),
                          )),
                  _createSwitch(
                      "Vegana",
                      "So Exibe Refeições Veganas",
                      settings.isVegan,
                      (value) => setState(
                            (() => settings.isVegan = value),
                          )),
                ],
              ),
            )
          ],
        ));
  }
}
