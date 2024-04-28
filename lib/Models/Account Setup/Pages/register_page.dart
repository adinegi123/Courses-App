import 'dart:io';

import 'package:elera/Models/Account%20Setup/Controllers/register_controller.dart';
import 'package:elera/Utils/Wdgets/appbar.dart';
import 'package:elera/Utils/Wdgets/elevated_button.dart';
import 'package:elera/Utils/Wdgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController dateController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Fill Your Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Obx(() {
            controller.isLoading.value;
            return Column(children: [
              const SizedBox(height: 20),
              _header(),
              _body(),
              _footer()
            ]);
          }),
        ),
      ),
    );
  }

  Widget _footer() {
    return Column(
      children: [
        MyElevatedButton(
          label: "Continue",
          isLoading: controller.isLoading.value,
          onPressed: () {
            controller.registerUser(_image);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _header() {
    return GestureDetector(
      onTap: () async {
        XFile? image = await _picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          setState(() {
            _image = File(image.path);
          });
        }
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: _image != null
            ? FileImage(_image!)
            : const AssetImage("assets/person.png") as ImageProvider,
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        const SizedBox(height: 20),
        MyTextFormField(
          hintText: "Full Name",
          controller: controller.nameController,
        ),
        const SizedBox(height: 20),
        const MyTextFormField(hintText: "Nickname"),
        const SizedBox(height: 20),
        MyTextFormField(
          controller: dateController,
          hintText: "Date of Birth",
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('MM/dd/yyyy').format(pickedDate);
              setState(() {
                dateController.text = formattedDate;
              });
            }
          },
        ),
        const SizedBox(height: 20),
        MyTextFormField(
          hintText: "Email",
          controller: controller.emailController,
        ),
        const SizedBox(height: 20),
        MyTextFormField(
          hintText: "Password",
          controller: controller.passwordController,
        ),
        const SizedBox(height: 20),
        MyTextFormField(
          hintText: "Phone Number",
          controller: controller.mobileController,
        ),
        const SizedBox(height: 20),
        const MyTextFormField(hintText: "Gender"),
        const SizedBox(height: 60),
      ],
    );
  }
}
