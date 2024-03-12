import 'package:flutter/material.dart';

Widget cardPattern() => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          3,
          (rowIndex) => Row(
                children: List.generate(
                    rowIndex + 4,
                    (columnIndex) => Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(
                            left: columnIndex == 0 ? 3 : 0,
                            right: 3,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(
                                  0.05 * (rowIndex + 1) + 0.05,
                                ),
                                Colors.white.withOpacity(
                                  (0.05 * rowIndex) + 0.05,
                                ),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: columnIndex == 0 && rowIndex == 0
                                  ? const Radius.circular(10)
                                  : Radius.zero,
                              bottomLeft: columnIndex == 0 && rowIndex == 2
                                  ? const Radius.circular(10)
                                  : Radius.zero,
                            ),
                          ),
                        )),
              )),
    );
