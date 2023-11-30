import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // Light Theme
  static ThemeData lightTheme() => ThemeData(
        primaryColor: lightColorScheme.primary,
        // Primary color for light theme
        canvasColor: creamColor,

        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: creamColor,
        cardColor: Colors.white,
        // Card color for light theme
        appBarTheme: AppBarTheme(
          color: creamColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
              lishtBluishColor, // Floating button color for light theme
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // Background color of the button
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // Text color of the button
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.all(16.0), // Adjust padding as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Adjust border radius as needed
                // Red border for the button
              ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red.withOpacity(
                      0.5); // Adjust opacity or color for pressed state
                }
                return null; // No overlay color when not pressed
              },
            ),
          ),
        ),
        textTheme: TextTheme(
          // Text color for light theme
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
        ),
      );

  // Dark Theme
  static ThemeData darkTheme() => ThemeData(
        primaryColor: darkColorScheme.primary,
        canvasColor: darkcreamColor,
        scaffoldBackgroundColor: darkcreamColor,
        cardColor: Colors.black,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
          color: darkcreamColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
              darkBluishColor, // Floating button color for dark theme
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // Background color of the button
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // Text color of the button
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.all(16.0), // Adjust padding as needed
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8.0), // Adjust border radius as needed
                // Red border for the button
              ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.red.withOpacity(
                      0.5); // Adjust opacity or color for pressed state
                }
                return null; // No overlay color when not pressed
              },
            ),
          ),
        ),
        textTheme: TextTheme(
          // Text color for dark theme
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
        ),
      );

  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lishtBluishColor = Vx.purple400;

  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.deepPurple,
    // Secondary color for light mode
    surface: Colors.white,
    // Replace with surface color
    background: Colors.white,
    // Replace with background color
    error: Colors.red,
    // Replace with error color
    onPrimary: Colors.white,
    // Replace with text/icon color on primary color
    onSecondary: Colors.white,
    // Replace with text/icon color on secondary color
    onSurface: Colors.white,
    // Replace with text/icon color on surface color
    onBackground: Colors.white,
    // Replace with text/icon color on background color
    onError: Colors.white,
    // Replace with text/icon color on error color
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Colors.white,
    // Replace with a variant if needed
    secondary: Colors.green,
    // Replace with a variant if needed
    surface: Colors.black,
    // Replace with surface color
    background: Colors.black,
    // Replace with background color
    error: Colors.red,
    // Replace with error color
    onPrimary: Colors.black,
    // Replace with text/icon color on primary color
    onSecondary: Colors.black,
    // Replace with text/icon color on secondary color
    onSurface: Colors.black,
    // Replace with text/icon color on surface color
    onBackground: Colors.black,
    // Replace with text/icon color on background color
    onError: Colors.black,
    // Replace with text/icon color on error color
    brightness: Brightness.light,
  );
}
