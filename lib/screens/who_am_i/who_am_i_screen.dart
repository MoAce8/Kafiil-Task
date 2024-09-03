import 'package:flutter/material.dart';
import 'package:kafiil_test/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:kafiil_test/helper/colors.dart';
import 'package:kafiil_test/helper/constants.dart';
import 'package:kafiil_test/helper/date_time.dart';
import 'package:kafiil_test/widgets/custom_radio.dart';
import 'package:kafiil_test/widgets/custom_text_field.dart';
import 'package:kafiil_test/widgets/icon_check_box.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({super.key});

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {
  bool passwordVisible = true;
  String userType = '';
  String gender = '';
  List<String> skills = [];
  List<String> favMedia = [];
  int salary = 1000;
  bool facebook = false;
  bool twitter = false;
  bool linkedIn = false;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController salaryCont = TextEditingController();
  TextEditingController bDate = TextEditingController();
  TextEditingController skillsCont = TextEditingController();

  @override
  void initState() {
    fName.text = UserDataCubit.get(context).user.firstName!;
    lName.text = UserDataCubit.get(context).user.lastName!;
    email.text = UserDataCubit.get(context).user.email!;
    password.text = UserDataCubit.get(context).user.password!;
    about.text = UserDataCubit.get(context).user.about!;
    salaryCont.text = UserDataCubit.get(context).user.salary!;
    bDate.text = UserDataCubit.get(context).user.bDate!;
    skills = UserDataCubit.get(context).user.skills!;
    userType = UserDataCubit.get(context).user.userType!;
    gender = UserDataCubit.get(context).user.gender!;
    facebook = UserDataCubit.get(context).user.favMedia!.contains('Facebook');
    twitter = UserDataCubit.get(context).user.favMedia!.contains('Twitter');
    linkedIn = UserDataCubit.get(context).user.favMedia!.contains('LinkedIn');

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Who Am I',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * .05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/whoAmI.png'),
                    radius: screenWidth(context) * .11,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 1,
                    child: GestureDetector(
                      child: Container(
                        width: screenWidth(context) * .061,
                        height: screenWidth(context) * .061,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryGreen),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: AppTextField(
                    title: 'First Name',
                    controller: fName,
                  ),
                ),
                SizedBox(
                  width: screenWidth(context) * .44,
                  child:  AppTextField(
                    title: 'Last Name',
                    controller: lName,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
             AppTextField(
              title: 'Email Address',
               controller: email,
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Password',
              controller: password,
              suffix: IconButton(
                icon: Icon(
                  passwordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'User Type',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            Row(
              children: [
                AppRadio(
                  groupValue: userType,
                  value: 'Seller',
                  onChanged: (val) {
                    setState(() {
                      userType = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: userType,
                  value: 'Buyer',
                  onChanged: (val) {
                    setState(() {
                      userType = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: userType,
                  value: 'Both',
                  onChanged: (val) {
                    setState(() {
                      userType = val!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
             AppTextField(
              title: 'About',
              controller: about,
              maxLines: 3,
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Salary',
              controller: salaryCont,
              readOnly: true,
              textCenter: true,
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth(context) * .1,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        salary -= 500;
                        salaryCont.text = 'SAR $salary';
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: screenWidth(context) * .06,
                      width: screenWidth(context) * .06,
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ),
                ],
              ),
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        salary += 500;
                        salaryCont.text = 'SAR $salary';
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: screenWidth(context) * .06,
                      width: screenWidth(context) * .06,
                      child: const Icon(
                        Icons.add,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth(context) * .1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Birth Date',
              controller: bDate,
              readOnly: true,
              suffix: const Icon(Icons.date_range_rounded),
              onTap: () async {
                final now = DateTime.now();
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(now.year - 100, now.month, now.day),
                  lastDate: now,
                );
                setState(() {
                  bDate.text = DateTimeFormatting.dateFormatter(newDate!);
                });
              },
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'Gender',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            Row(
              children: [
                AppRadio(
                  groupValue: gender,
                  value: 'Male',
                  onChanged: (val) {
                    setState(() {
                      userType = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: gender,
                  value: 'Female',
                  onChanged: (val) {
                    setState(() {
                      userType = val!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'Skills',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey50,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(screenWidth(context) * .02),
              child: Column(
                children: [
                  Wrap(
                    spacing: 6,
                    children: skills.map((chip) {
                      return Chip(
                        label: Text(
                          chip,
                          style: const TextStyle(
                            color: AppColors.primaryGreen,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: AppColors.green100,
                        deleteIconColor: AppColors.primaryGreen,
                        deleteIcon: const Icon(
                          Icons.close,
                          size: 18,
                        ),
                        padding: const EdgeInsets.all(0),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onDeleted: () {
                          setState(() {
                            skills.remove(chip);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  AppTextField(
                    controller: skillsCont,
                    onSubmitted: (p0) {
                      setState(() {
                        skills.add(p0);
                        skillsCont.clear();
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const Text(
              'Favourite Social Media',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey500),
            ),
            SizedBox(
              height: screenHeight(context) * .006,
            ),
            IconCheckBox(
              img: 'facebook',
              name: 'Facebook',
              value: facebook,
              onChanged: (val) {
                setState(() {
                  facebook = val!;
                  if (facebook) {
                    favMedia.add('Facebook');
                  } else {
                    favMedia.remove('Facebook');
                  }
                });
              },
            ),
            IconCheckBox(
              img: 'twitter',
              name: 'Twitter',
              value: twitter,
              onChanged: (val) {
                setState(() {
                  twitter = val!;
                  if (twitter) {
                    favMedia.add('Twitter');
                  } else {
                    favMedia.remove('Twitter');
                  }
                });
              },
            ),
            IconCheckBox(
              img: 'linked',
              name: 'LinkedIn',
              value: linkedIn,
              onChanged: (val) {
                setState(() {
                  linkedIn = val!;
                  if (linkedIn) {
                    favMedia.add('LinkedIn');
                  } else {
                    favMedia.remove('LinkedIn');
                  }
                });
              },
            ),
            SizedBox(
              height: screenHeight(context) * .08,
            )
          ],
        ),
      ),
    );
  }
}
