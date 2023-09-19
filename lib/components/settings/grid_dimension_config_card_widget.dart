import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:game_of_life_design_patterns_solid/controllers/dimension_stepper.dart';

class GridDimensionConfigCard extends ConsumerWidget {
  const GridDimensionConfigCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int dimensionValue = ref.watch(dimensionStepperProvider);
    var dimension = ref.read(dimensionStepperProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 90,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Dimension',
                style: TextStyle(fontSize: 12),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        hoverColor: Colors.transparent,
                        color: Colors.white,
                        iconSize: 24, // Ajuste o tamanho do ícone aqui
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          dimension.decrement();
                        },
                      ),
                    ),
                    Container(
                      width: 30, // Ajuste a largura conforme necessário
                      child: Center(child: Text('$dimensionValue')),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        hoverColor: Colors.transparent,
                        color: Colors.white,
                        iconSize: 24, // Ajuste o tamanho do ícone aqui
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          dimension.increment();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  'Grid: $dimensionValue x $dimensionValue = '
                  '${dimensionValue * dimensionValue} Cells!',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
