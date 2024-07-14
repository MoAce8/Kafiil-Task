import 'package:flutter/material.dart';
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
  String groupVal = '';
  TextEditingController pickedDate = TextEditingController();
  List<String> selectedChips = [];

  List<String> allChips = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
  ];

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
                  child: const AppTextField(
                    title: 'First Name',
                  ),
                ),
                SizedBox(
                  width: screenWidth(context) * .44,
                  child: const AppTextField(
                    title: 'Last Name',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const AppTextField(
              title: 'Email Address',
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Password',
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
                  groupValue: groupVal,
                  value: 'Seller',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: groupVal,
                  value: 'Buyer',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: groupVal,
                  value: 'Both',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            const AppTextField(
              title: 'About',
              maxLines: 3,
            ),
            SizedBox(
              height: screenHeight(context) * .015,
            ),
            AppTextField(
              title: 'Salary',
              readOnly: true,
              textCenter: true,
              prefix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth(context) * .1,
                  ),
                  Container(
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
                ],
              ),
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
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
              controller: pickedDate,
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
                  pickedDate.text = DateTimeFormatting.dateFormatter(newDate!);
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
                  groupValue: groupVal,
                  value: 'Male',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
                    });
                  },
                ),
                AppRadio(
                  groupValue: groupVal,
                  value: 'Female',
                  onChanged: (val) {
                    setState(() {
                      groupVal = val!;
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
                    children: allChips.map((chip) {
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
                            allChips.remove(chip);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  AppTextField(
                    onSubmitted: (p0) {
                      setState(() {
                        allChips.add(p0);
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
            const IconCheckBox(img: 'facebook', name: 'Facebook'),
            const IconCheckBox(img: 'twitter', name: 'Twitter'),
            const IconCheckBox(img: 'linked', name: 'LinkedIn'),
            SizedBox(
              height: screenHeight(context)*.08,
            )
          ],
        ),
      ),
    );
  }
}
