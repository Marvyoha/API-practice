// USING DIO PACKAGE

import 'package:dio/dio.dart'; // Import the Dio package for making HTTP requests
import '../models/user_model.dart'; // Import the user model to parse the JSON response

class ApiService {
  final Dio _dio = Dio(); // Create a Dio instance for making HTTP requests

  // A method to fetch random users from the API
  Future<UserModel> fetchUsers(int results) async {
    try {
      // Send a GET request to the specified API endpoint
      final response =
          await _dio.get("https://randomuser.me/api/?results=$results");

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // If the response is successful (status code 200), parse the JSON data
        // and create a UserModel object using the fromJson factory method
        return UserModel.fromJson(response.data);
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception("Failed to load users");
      }
    } catch (e) {
      // Catch any errors that occur during the API request and throw an exception
      throw Exception("Failed to load users: $e");
    }
  }
}




//  USING HTTP PACKAGE

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user_model.dart';

// class ApiService {
//   final String baseUrl = "https://randomuser.me/api";

//   // A method to fetch random users from the API
//   Future<UserModel> fetchUsers(int results) async {
//     try {
//       // Send a GET request to the specified API endpoint
//       final response = await http.get(Uri.parse("$baseUrl/?results=$results"));

//       // Check if the response status code is 200 (OK)
//       if (response.statusCode == 200) {
//         // If the response is successful (status code 200), parse the JSON data
//         // and create a UserModel object using the fromJson factory method
//         final Map<String, dynamic> jsonResponse = json.decode(response.body);
//         return UserModel.fromJson(jsonResponse);
//       } else {
//         // If the response status code is not 200, throw an exception
//         throw Exception("Failed to load users");
//       }
//     } catch (e) {
//       // Catch any errors that occur during the API request and throw an exception
//       throw Exception("Failed to load users: $e");
//     }
//   }
// }
