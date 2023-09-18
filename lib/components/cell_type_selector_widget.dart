import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_of_life_design_patterns_solid/models/cell.dart';

class CellTypeSelector extends ConsumerWidget {
  const CellTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedCellType = ref.watch(cellTypeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Cell Type'),
            DropdownButton<CellType>(
              value: selectedCellType,
              onChanged: (CellType? newValue) {
                ref.read(cellTypeProvider.notifier).setCellType(newValue!);
              },
              items: CellType.values
                  .map<DropdownMenuItem<CellType>>((CellType value) {
                return DropdownMenuItem<CellType>(
                  value: value,
                  child: Text(value.toString().split('.').last),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
