import 'package:flutter/material.dart';
import '../models/user_model.dart'; // Import the user model
import '../services/api_service.dart'; // Import the API service

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<UserModel>
      _userModel; // Declare a future to hold the fetched UserModel

  @override
  void initState() {
    super.initState();
    // Fetch random users when the screen initializes
    _userModel = ApiService().fetchUsers(10); // Fetch 10 random users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Users'),
      ),
      body: FutureBuilder<UserModel>(
        // Use FutureBuilder to handle asynchronous data fetching
        future: _userModel, // The future to wait for
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for data, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // If data is available, display the list of users
            return ListView.builder(
              itemCount: snapshot.data!.results.length,
              itemBuilder: (context, index) {
                final user =
                    snapshot.data!.results[index]; // Get a user from the list
                return ListTile(
                  leading: CircleAvatar(
                    // Show user's profile picture in a CircleAvatar
                    backgroundImage: NetworkImage(user.picture.large),
                  ),
                  title: Text(user.name.getFullName()), // Show user's full name
                  subtitle: Text(user.email), // Show user's email
                );
              },
            );
          } else {
            // If no data is available, display a message
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
