import 'package:cridet_hour_system/pressentaion/resources/Lists_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';


class OnBording extends StatefulWidget {
  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  final PageController _pageController = PageController();
  int _currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.height * 0.22,
                height: MediaQuery.of(context).size.height * 0.22,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: Lists_Manager.onBorading.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    child: Text(
                      Lists_Manager.onBorading[index],
                      textAlign: TextAlign.center,
                    ));
              },
            ),
          ),
          _getBottomSheetWidget(),

        ],
      ),
    );
  }
  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: ColorManager.error,
          borderRadius: BorderRadius.circular(15)
        ),
        margin: EdgeInsets.all(10),
      );
    } else {
      return   Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(15)
        ),
        margin: EdgeInsets.all(10),
      );
    }
  }
  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          if (_currentIndex == 0) Skip(),
          if (_currentIndex != 0)
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                    width: AppSize.s44,
                    height: AppSize.s44,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorManager.primary,
                        ),
                        padding: const EdgeInsets.all(AppPadding.p14),
                        child: Icon(Icons.arrow_forward))),
                onTap: () {
                  // go to previous slide
                  _pageController.animateToPage(_getPreviousIndex(),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceInOut);
                },
              ),
            ),
          // circle indecator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < Lists_Manager.onBorading.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          // right arrow
          if (Lists_Manager.onBorading.length - 1 == _currentIndex) Skip(),
          if (Lists_Manager.onBorading.length - 1 != _currentIndex)
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  width: AppSize.s44,
                  height: AppSize.s44,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: ColorManager.primary,
                      ),
                      padding: const EdgeInsets.all(AppPadding.p14),
                      child: Icon(Icons.arrow_forward)),
                ),
                onTap: () {
                  // go to previous slide
                  _pageController.animateToPage(_getNextIndex(),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceInOut);
                },
              ),
            )
        ],
      ),
    );
  }

  Widget Skip() => Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            // cashHelper.SavaData(key: 'onboard', value: true).then((value) {
            //   if (value) {
            //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
            //   }
            // });
          },
          child: Text(
            'skip',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );

  int _getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = Lists_Manager.onBorading.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == Lists_Manager.onBorading.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }
}
