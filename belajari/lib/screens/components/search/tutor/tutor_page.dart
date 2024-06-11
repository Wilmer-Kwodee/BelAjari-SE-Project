import 'package:flutter/material.dart';
import 'package:flutter_app_testing/backend/model/user/tutor.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart';
import 'package:flutter_app_testing/backend/repository/user/tutor_repository.dart';
import 'package:flutter_app_testing/screens/components/search/tutor/tutor_card.dart';

class TutorPage extends StatefulWidget {
  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  late Future<List<Map<String, dynamic>>> _tutorsWithUserDetails;

  @override
  void initState() {
    super.initState();
    _tutorsWithUserDetails = TutorRepository.getTutorsWithUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutors'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _tutorsWithUserDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tutors available'));
          }

          List<Map<String, dynamic>> tutorsWithUserDetails = snapshot.data!;


          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75, // Adjust the aspect ratio as needed
            ),
            padding: EdgeInsets.all(8.0),
            itemCount: tutorsWithUserDetails.length,
            itemBuilder: (context, index) {
              Tutor tutor = tutorsWithUserDetails[index]['tutor'] as Tutor;
              User user = tutorsWithUserDetails[index]['user'] as User;
              return TutorCard(tutor: tutor, user: user);
            },
          );
        },
      ),
    );
  }
}
