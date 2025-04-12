import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/physics.dart';
import 'package:study_planner/models/course_model.dart';

class CourseServices {
  //create the firestore collection refference
  final CollectionReference courseCollection = FirebaseFirestore.instance
      .collection("courses");

  //add new course
  Future<void> createNewCourse(Course course) async {
    try {
      //Convert the course object to a map
      final Map<String, dynamic> data = course.toJson();
      //add the course to the collection
      final DocumentReference docRef = await courseCollection.add(data);

      await docRef.update({"id": docRef.id});
    } catch (Error) {
      print("Error creating course:$Error");
    }
  }

  //get all courses as a stream list of courses
  Stream<List<Course>> get courses {
    try {
      return courseCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => Course.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (error) {
      print(error);
      return Stream.empty();
    }
  }
}
