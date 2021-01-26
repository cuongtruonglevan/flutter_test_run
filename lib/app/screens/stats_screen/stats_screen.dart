import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_run/shared/app_chart.dart';
import 'package:flutter_test_run/shared/app_colors.dart';
import 'package:get/get.dart';

class StatsScreen extends StatelessWidget {
  final _results = [145, 160, 120, 130];
  final RxString _selectedValue = 'Blood Sugar'.obs;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(child: _buildBody(context)),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            height: _size.height / 2 - 16.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.indigo.shade100, Colors.indigo.shade300]),
            ),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                Obx(() {
                  return FittedBox(
                    child: PopupMenuButton(
                      offset: Offset(0, 50),
                      color: Colors.indigo.shade200,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Tracker: ',
                                children: [
                                  TextSpan(
                                      text: _selectedValue.value,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700))
                                ],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                )),
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text('Blood Sugar'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('Blood Pressure'),
                        ),
                      ],
                      onSelected: (int value) {
                        if (value != null) {
                          if (value == 1) _selectedValue.value = 'Blood Sugar';
                          if (value == 2)
                            _selectedValue.value = 'Blood Pressure';
                        }
                        return;
                      },
                    ),
                  );
                }),
                SizedBox(height: 24.0),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white.withOpacity(0.5)),
                  child: DefaultTabController(
                    length: 3,
                    child: SizedBox(
                      height: 24.0,
                      child: TabBar(
                        isScrollable: true,
                        labelColor: AppColors.onPrimaryColor,
                        unselectedLabelColor: AppColors.primaryColor,
                        indicator: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ]),
                        tabs: [
                          Tab(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('TODAY'),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('WEEK'),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('MONTH'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                AppCustomizedChart(),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.white),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _results.length,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 1.0,
                color: AppColors.lineColor,
              ),
              itemBuilder: (context, index) {
                final _result = _results.elementAt(index);
                final _isFirst = index == 0;
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _isFirst
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Last reading',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )
                                  : SizedBox(),
                              Text(
                                'Today at 3:27pm',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ],
                          ),
                          _isFirst
                              ? CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  minSize: 20,
                                  child: Text(
                                    'SEE ALL',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () {},
                                )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Text(
                              _result.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0),
                            ),
                          ),
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraint) {
                                final _leftMargin = constraint.maxWidth *
                                    ((_result - 100) / 80);
                                return Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFF34eb4f),
                                          Color(0xFFebeb34),
                                          Color(0xFFeb5c34),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: _leftMargin),
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ]),
                                    )
                                  ],
                                  alignment: Alignment.centerLeft,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
