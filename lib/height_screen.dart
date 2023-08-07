import 'package:fitness_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

int _currentvalue = 180;

class _HeightScreenState extends State<HeightScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'What is your Height?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16.h),
              Text(
                'Height in cm. Don\'t worry, you can always \nchange it later',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 43.w),
                child: NumberPicker(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              width: 3.w,
                              color: Theme.of(context).primaryColor))),
                  axis: Axis.vertical,
                  itemCount: 7,
                  minValue: 0,
                  // itemWidth: 64.w,
                  itemHeight: 55.h,
                  maxValue: 300,
                  selectedTextStyle: TextStyle(
                      fontSize: 38.sp,
                      color: const Color.fromARGB(255, 147, 70, 159)),
                  textStyle:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w100),
                  value: _currentvalue,
                  onChanged: (value) {
                    setState(() {
                      _currentvalue = value;
                    });
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReuseableButton(
                    title: 'Back',
                    type: '',
                    ontap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 16.w),
                  ReuseableButton(
                    title: 'Continue',
                    type: 'Continue',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HeightScreen()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
