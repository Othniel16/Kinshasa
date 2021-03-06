import 'package:flutter/material.dart';
import 'package:kinshasa/widgets/DrinkModel.dart';
import 'package:kinshasa/widgets/InheritedWidget.dart';
import 'package:kinshasa/widgets/tab.dart';

class ShakeTabContents extends StatefulWidget {
  @override
  _ShakeTabContentsState createState() => _ShakeTabContentsState();
}

class _ShakeTabContentsState extends State<ShakeTabContents> {
  var provider;
  List<Drink> selectedDrinks;
  List<Drink> set1;
  List<Drink> set2;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      provider = MyInheritedWidget.of(context);
      selectedDrinks = List.generate(provider.shakeList.length ~/ 3, (i) {
        return provider.shakeList[i];
      });
      set1 = List.generate(provider.shakeList.length ~/ 2, (i) {
        return provider.shakeList[i];
      });
      set2 = provider.shakeList
          .getRange(provider.shakeList.length ~/ 2, provider.shakeList.length)
          .toList();
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return BuildTab(
      title: 'shake',
      drinkCount: provider.shakeCount,
      set1: set1,
      set2: set2,
      selectedDrinks: selectedDrinks,
    );
  }
}
