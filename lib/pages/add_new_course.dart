import 'package:flutter/material.dart';
import 'package:study_planner/widgets/custom_button.dart';
import 'package:study_planner/widgets/custom_input.dart';

class AddNewCourse extends StatelessWidget {
  AddNewCourse({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();
  final TextEditingController _courseDurationController =
      TextEditingController();
  final TextEditingController _courseScheduleController =
      TextEditingController();
  final TextEditingController _courseInstructorController =
      TextEditingController();
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      print(_courseDescriptionController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add New Course',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),

                //description
                const Text(
                  'Fill in the details below to add a new course.And start managing your study planner.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 5),
                CustomInput(
                  controller: _courseNameController,
                  labelText: "Course Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course name';
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseDescriptionController,
                  labelText: "Course Description",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course description';
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseDurationController,
                  labelText: "Course Duration",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course duration';
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseScheduleController,
                  labelText: "Course Schedule",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course schedule';
                    }
                    return null;
                  },
                ),
                CustomInput(
                  controller: _courseInstructorController,
                  labelText: "Course Instructor",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course instructor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Add Course",
                  onPressed: () => _submitForm(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
