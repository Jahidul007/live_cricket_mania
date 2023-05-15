import 'package:cricket_mania/app/module/fixtures/controller/fixtures_controller.dart';
import 'package:cricket_mania/app/module/widget/custom_divider.dart';
import 'package:cricket_mania/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


Future<void> showFixturesFilter({
  required BuildContext context,
  required FixturesController fixturesController,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Filter",
                        style: recentFilterTitle1Style,
                      ),
                      InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/images/ic_cross_round.svg', color: green,),
                      ),
                    ],
                  ),
                ),
                customDividerGrey(),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: StreamBuilder<DateTime>(
                    stream: fixturesController.fromDate,
                    initialData: fixturesController.selectedFromDate,
                    builder: (context, snapshot) {
                      String selectedDate = "";
                      if (snapshot.hasData) {
                        selectedDate = DateFormat("yyyy-MM-dd").format(snapshot.data!);
                      }
                      return GestureDetector(
                        onTap: () async {
                          DateTime date = DateTime.now();
                          DateTime today = DateTime(date.year, date.month - 1, date.day);

                          DateTime? selected = await showDatePicker(
                              context: context,
                              initialDate: today,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000));



                          if (selected != null) {
                            String currentDate = DateFormat("yyyy-MM-dd").format(selected);
                            fixturesController.updateFromDate(selected);
                            fixturesController.getFixturesMatches(dateTime: currentDate);
                            Navigator.of(context).pop();
                          }
                        },
                        child: InputDecorator(
                          child: Text(
                            selectedDate,
                            style: const TextStyle(fontSize: 16),
                          ),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: "Date",
                              errorText: snapshot.hasError ? snapshot.error.toString() : null,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset("assets/images/ic_calendar.svg"),
                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12, vertical: 10)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: const <Widget>[],
      );
    },
  );
}

