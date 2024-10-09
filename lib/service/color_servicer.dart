import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColorService {
  Future<Color> getDominantColor(String svgAsset) async {
    // Renderizar o SVG em uma superfície offscreen
    final boundary = RenderRepaintBoundary();
    await boundary.toImage();

    // Obter os pixels da imagem renderizada
    final image = await boundary.toImage();
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final pixels = bytes?.buffer.asUint32List();

    // Função auxiliar para calcular a frequência de cada cor
    Map<int, int> colorFrequency = {};
    for (var pixel in pixels!) {
      colorFrequency[pixel] = (colorFrequency[pixel] ?? 0) + 1;
    }

    // Encontrar a cor com maior frequência
    int mostFrequentColor =
        colorFrequency.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    // Converter o inteiro representando a cor para um objeto Color
    return Color(mostFrequentColor);
  }
}
