import 'package:flutter/material.dart';

class OnboardingSectionWidget extends StatelessWidget {
  const OnboardingSectionWidget({
    super.key,
    required this.imagePath,
    required this.description, // Adicione um parâmetro para a descrição
    this.textPosition =
        const Offset(0.5, 0.5), // Adicione um parâmetro para a posição do texto
  });

  final String imagePath;
  final String description; // Descrição a ser exibida sobre a imagem
  final Offset textPosition; // Posição do texto sobre a imagem (0.0 a 1.0)

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Stack(
          children: [
            // Imagem
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
            // Caixa de texto
            Positioned(
              left: MediaQuery.of(context).size.width * textPosition.dx,
              top: MediaQuery.of(context).size.height * textPosition.dy,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black.withOpacity(0.8),
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width -
                      (2 * textPosition.dx), // Define um maxWidth
                ),
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit
                      .scaleDown, // Garante que o texto se ajuste ao Container
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
