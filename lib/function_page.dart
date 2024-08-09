import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<String?> extractAliveAck(final String urlname) async {
//   final url = Uri.parse(urlname);
//   try {
//     final response =
//         await http.get(url, headers: {'Content-Type': 'application/json'});

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       // Decode the body field which contains another JSON string
//       final bodyData = json.decode(data['body']);

//       // Extract the specific fields
//       final String aliveAck = bodyData['alive'];
//       print("a $aliveAck");
//       return aliveAck;
//     } else {
//       return "404 error";
//     }
//   } catch (e) {
//     return "failed";
//   }
// }

// Future<String?> extractStatusAck(String urlname) async {
//   final url = Uri.parse(urlname);
//   try {
//     final response =
//         await http.get(url, headers: {'Content-Type': 'application/json'});

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       // Decode the body field which contains another JSON string
//       final bodyData = json.decode(data['body']);

//       // Extract the specific fields
//       String statusAck = bodyData['status'];
//       print("b $statusAck");

//       return statusAck;
//     } else {
//       return null;
//     }
//   } catch (e) {
//     return "failed";
//   }
// }

Future<Map<String, String?>> extractAliveAndStatusAck(
    final String urlname) async {
  final url = Uri.parse(urlname);
  try {
    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Decode the body field which contains another JSON string
      final bodyData = json.decode(data['body']);

      // Extract the specific fields
      final String? aliveAck = bodyData['alive'];
      final String? statusAck = bodyData['status'];

      return {
        'alive': aliveAck,
        'status': statusAck,
      };
    } else {
      return {
        'alive': null,
        'status': null,
      };
    }
  } catch (e) {
    return {
      'alive': 'failed',
      'status': 'failed',
    };
  }
}
/*
void main() async {
  final result = await extractAliveAndStatusAck('https://example.com/api');

  final aliveAck = result['alive'];
  print("Alive Ack: $aliveAck");

  final statusAck = result['status'];
  print("Status Ack: $statusAck");
}
*/