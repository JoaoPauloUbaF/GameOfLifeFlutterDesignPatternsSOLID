import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';
import 'package:game_of_life_design_patterns_solid/models/game_of_life.dart';

class CellTypeSelector extends ConsumerWidget {
  const CellTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var selectedCellType = ref.watch(cellTypeProvider);
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
          const Text('Cell Type'),
          SizedBox(
            width: width / 4.5,
            child: DropdownButton<CellType>(
              value: selectedCellType,
              onChanged: (CellType? newValue) {
                ref.read(cellTypeProvider.notifier).setCellType(newValue!);
                //ref.read(gameOfLifeProvider.notifier).stopGame();
              },
              items: CellType.values
                  .map<DropdownMenuItem<CellType>>((CellType value) {
                return DropdownMenuItem<CellType>(
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