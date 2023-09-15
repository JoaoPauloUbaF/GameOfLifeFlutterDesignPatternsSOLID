import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/grid.dart';

class GridRulesSelector extends ConsumerWidget {
  const GridRulesSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gridTypeSelected = ref.watch(gridTypeProvider);
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 4,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Grid Rules'),
          SizedBox(
            width: width / 4.5,
            child: DropdownButton<GridType>(
              value: gridTypeSelected,
              onChanged: (GridType? newValue) {
                ref.read(gridTypeProvider.notifier).setGridType(newValue!);
              },
              items: GridType.values
                  .map<DropdownMenuItem<GridType>>((GridType value) {
                return DropdownMenuItem<GridType>(
                  value: value,
                  child: Text(value.toString().split('.').last),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
