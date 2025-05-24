import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Retorna uma cor RGB a partir de uma string no formato "rgb(r, g, b)".
  Color parseRGBColor() {
    if (isEmpty || toString() == "null") return Colors.transparent;
    // Remove "rgb(" e ")" da string
    final String cleanedString = replaceAll(RegExp(r'rgb|\(|\)|\s'), '');

    // Divide os valores separados por vírgula
    final rgbValues = cleanedString.split(',').map(int.parse).toList();

    // Retorna um objeto Color
    return Color.fromARGB(255, rgbValues[0], rgbValues[1], rgbValues[2]);
  }

  /// Pega a data atual no formato de banco de dados e diz qual dia da semana é.
  ///
  /// ### Exemplos
  /// /// - `2021-09-30` -> `Quinta-feira`
  String diaSemana() {
    if (isEmpty) return '';
    final DateTime date = DateTime.parse(this);
    final String dia = DateFormat('EEEE', 'pt_BR').format(date);
    return dia.capitalize();
  }

  /// Transforma a string no formato de data do banco de dados para o formato brasileiro.
  ///
  /// ### Exemplos
  /// - `2021-09-30` -> `30/09/2021`
  /// - `1500-10-25` -> `25/10/1500`
  /// - `1912-12-12` -> `12/12/1912`
  /// - `2001-04-05` -> `25/01/2001`
  String formatBdToBr() {
    if (isEmpty) return '';
    final List<String> date = split('-');
    return '${date[2]}/${date[1]}/${date[0]}';
  }

  /// Transforma a string no formato convertido do DateTime para o formato brasileiro.
  ///
  /// ### Exemplos
  /// - `2021-09-30 00:00:00.000000Z` -> `30/09/2021`
  /// - `1500-10-25 00:00:00.000000Z` -> `25/10/1500`
  /// - `1912-12-12 00:00:00.000000Z` -> `12/12/1912`
  /// - `2001-04-05 00:00:00.000000Z` -> `05/04/2001`
  String formatDateTimeToBr() {
    if (isEmpty) return '';
    final List<String> date = split(' ');
    final List<String> dateTime = date[0].split('-');
    return '${dateTime[2]}/${dateTime[1]}/${dateTime[0]}';
  }

  /// Transforma a string no formato convertido do DateTime para o formato de banco de dados.
  ///
  /// ### Exemplos
  /// - `2021-09-30 00:00:00.000000Z` -> `2021-09-30`
  /// - `1500-10-25 00:00:00.000000Z` -> `1500-10-25`
  /// - `1912-12-12 00:00:00.000000Z` -> `1912-12-12`
  /// - `2001-04-05 00:00:00.000000Z` -> `2001-04-05`
  String formatDateTimeToBd() {
    if (isEmpty) return '';
    final List<String> date = split(' ');
    final List<String> dateTime = date[0].split('-');
    return '${dateTime[0]}-${dateTime[1]}-${dateTime[2]}';
  }

  /// format bd with timezone to BR
  ///
  /// ### Exemplos
  /// - `2024-08-01T03:00:00.000000Z` -> `01/08/2024`
  ///
  String formatBdWithTimezoneToBrWithTime() {
    if (isEmpty) return '';
    final List<String> date = split('T');
    final List<String> dateTime = date[0].split('-');
    final List<String> time = date[1].split(':');
    return '${dateTime[2]}/${dateTime[1]}/${dateTime[0]} ${time[0]}:${time[1]}';
  }

  /// format bd with timezone to BR
  ///
  /// ### Exemplos
  /// - `2024-08-01T03:00:00.000000Z` -> `01/08/2024`
  String formatBdWithTimezoneToBr() {
    if (isEmpty) return '';
    final List<String> date = split('T');
    final List<String> dateTime = date[0].split('-');
    return '${dateTime[2]}/${dateTime[1]}/${dateTime[0]}';
  }

  /// Transforma a string no formato de data brasileiro para o formato do banco de dados.
  ///
  /// ### Exemplos
  /// - `30/09/2021` -> `2021-09-30`
  /// - `25/10/1500` -> `1500-10-25`
  /// - `12/12/1912` -> `1912-12-12`
  /// - `25/01/2001` -> `2001-01-25`
  String formatBrToBd() {
    if (isEmpty) return '';
    final List<String> date = split('/');
    return '${date[2]}-${date[1]}-${date[0]}';
  }

  DateTime formatBrToDateTime() {
    if (isEmpty) return DateTime(1900);
    final List<String> date = split('/');
    return DateTime(int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
  }

  /// Transforma a string no formato de data e hora brasileiro para o formato do banco de dados com hora.
  ///
  /// ### Exemplos
  /// - `30/09/2021 12:00` -> `2021-09-30 12:00:00`
  /// - `25/10/1500 15:30` -> `1500-10-25 15:30:00`
  /// - `12/12/1912 18:45` -> `1912-12-12 18:45:00`
  /// - `25/01/2001 09:00` -> `2001-01-25 09:00:00`
  /// - `25/01/2001 09:00:30` -> `2001-01-25 09:00:30`
  /// - `25/01/2001 09:00:30.123` -> `2001-01-25 09:00:30.123`
  /// - `25/01/2001 09:00:30.123456` -> `2001-01-25 09:00:30.123456`
  String formatBrToBdWithTime() {
    if (isEmpty) return '';
    final List<String> dateTime = split(' ');
    final List<String> date = dateTime[0].split('/');
    final List<String> time = dateTime[1].split(':');
    final List<String> seconds = time[2].split('.');
    final String sec = seconds.length > 1 ? '.${seconds[1]}' : '';
    return '${date[2]}-${date[1]}-${date[0]} ${time[0]}:${time[1]}:${seconds[0]}$sec';
  }

  /// Transforma a string no formato de data e hora do banco de dados para o formato brasileiro com hora.
  ///
  /// ### Exemplos
  /// - `2021-09-30 12:00:00` -> `30/09/2021 12:00`
  /// - `1500-10-25 15:30:00` -> `25/10/1500 15:30`
  /// - `1912-12-12 18:45:00` -> `12/12/1912 18:45`
  /// - `2001-01-25 09:00:00` -> `25/01/2001 09:00`
  /// - `2001-01-25 09:00:30` -> `25/01/2001 09:00:30`
  /// - `2001-01-25 09:00:30.123` -> `25/01/2001 09:00:30.123`
  /// - `2001-01-25 09:00:30.123456` -> `25/01/2001 09:00:30.123456`
  String formatBdToBrWithTime() {
    if (isEmpty) return '';
    final List<String> dateTime = split(' ');
    final List<String> date = dateTime[0].split('-');
    final List<String> time = dateTime[1].split(':');
    final List<String> seconds = time[2].split('.');
    final String sec = seconds.length > 1 ? '.${seconds[1]}' : '';
    return '${date[2]}/${date[1]}/${date[0]} ${time[0]}:${time[1]}:${seconds[0]}$sec';
  }

  /// Transforma a string no formato de data brasileiro para o formato de `DateTime`.
  /// Caso a string não seja uma data válida, retorna a data mínima do Dart.
  ///
  /// ### Exemplos
  /// - `30/09/2021` -> `2021-09-30 00:00:00`
  /// - `25/10/1500` -> `1500-10-25 00:00:00`
  /// - `12/12/1912` -> `1912-12-12 00:00:00`
  /// - `25/01/2001` -> `2001-01-25 00:00:00`
  /// - `25/01/2001 09:00` -> `2001-01-25 09:00:00`
  /// - `25/01/2001 09:00:30` -> `2001-01-25 09:00:30`
  /// - `25/01/2001 09:00:30.123` -> `2001-01-25 09:00:30.123`
  /// - `25/01/2001 09:00:30.123456` -> `2001-01-25 09:00:30.123456`
  DateTime brToDateTime() {
    DateTime? dateTime = DateTime.tryParse(formatBrToBd());
    if (dateTime == null) {
      return DateTime(1900);
    } else {
      return dateTime;
    }
  }

  /// Transforma a string no formato de data brasileiro para o formato de `int`.
  /// Caso a string não seja um número válido, retorna 0.
  ///
  /// ### Exemplos
  /// - `2021-09-30 ` -> `2021-09-30 00:00:00`
  /// - `1500-10-25` -> `1500-10-25 00:00:00`
  /// - `1912-12-12` -> `1912-12-12 00:00:00`
  /// - `2001-01-25` -> `2001-01-25 00:00:00`
  /// - `2001-01-25 09:00` -> `2001-01-25 09:00:00`
  /// - `2001-01-25 09:00:30` -> `2001-01-25 09:00:30`
  /// - `2001-01-25 09:00:30.123` -> `2001-01-25 09:00:30.123`
  /// - `2001-01-25 09:00:30.123456` -> `2001-01-25 09:00:30.123456`
  DateTime bdToDateTime() {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime == null) {
      return DateTime(1900);
    } else {
      return dateTime;
    }
  }

  /// Transforma a string no formato de data brasileiro para o formato de `int`.
  /// Caso a string não seja um número válido, retorna 0.
  ///
  /// ### Exemplos
  /// - String: `123` -> int: `123`
  /// - String: `0` -> int: `0`
  /// - String: `1.23` -> int: `0`
  /// - String: `1,23` -> int: `0`
  /// - String: `Jorge` -> int: `0`
  int toInt() {
    int? numero = int.tryParse(this);
    if (numero == null) {
      return 0;
    } else {
      return numero;
    }
  }

  /// Transforma uma `DateTimeRange` em uma string no formato de data e hora brasileiro.
  ///
  /// ### Exemplos
  /// - `2021-09-30 12:00:00 - 2021-10-30 18:00:00` -> `30/09/2021 até 30/10/2021`
  /// - `1500-10-25 15:30:00 - 1500-11-25 18:00:00` -> `25/10/1500 até 25/11/1500`
  /// - `1912-12-12 18:45:00 - 1912-12-25 20:00:00` -> `12/12/1912 até 25/12/1912`
  /// - `2001-01-25 09:00:00 - 2001-01-30 12:00:00` -> `25/01/2001 até 30/01/2001`
  /// - `2001-01-25 09:00:30 - 2001-01-30 12:00:00` -> `25/01/2001 até 30/01/2001`
  String dateTimeRangeToBr() {
    if (isEmpty) return '';
    final List<String> date = split(' - ');
    String dataInicio = DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.parse(date[0]));
    String dataFinal = DateFormat('dd/MM/yyyy').format(DateTime.parse(date[1]));
    return '$dataInicio até $dataFinal';
  }

  /// Função que capitaliza a primeira letra de cada palavra.
  ///
  /// ### Exemplos
  /// - `joão da silva` -> `João Da Silva`
  /// - `MARIA DA SILVA` -> `Maria Da Silva`
  /// - `jOãO dA sIlVa` -> `João Da Silva`
  String capitalize() {
    if (isEmpty) return '';
    return split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          if (word.toLowerCase() == 'de' ||
              word.toLowerCase() == 'da' ||
              word.toLowerCase() == 'do' ||
              word.toLowerCase() == 'dos' ||
              word.toLowerCase() == 'das' ||
              word.toLowerCase() == 'e' ||
              word.toLowerCase() == 'ou' ||
              word.toLowerCase() == 'para') {
            return word.toLowerCase();
          } else {
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          }
        })
        .join(' ');
  }

  /// Função que capitaliza a primeira letra de cada palavra e remove os espaços em branco no início e no final.
  ///
  /// ### Exemplos
  /// - ` joão da silva ` -> `João Da Silva`
  /// - `  MARIA DA SILVA  ` -> `Maria Da Silva`
  /// - `  jOãO dA sIlVa  ` -> `João Da Silva`
  String capitalizeAndTrim() {
    return trim().capitalize();
  }
}
