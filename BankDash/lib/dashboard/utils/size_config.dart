// ignore_for_file: unused_local_variable


class SizeConfig {
  // Layout Breakpoints
  static const double desktop = 1024.0;
  static const double tablet = 375.0;

  // ------------------------------------
  //! To use this feature, you need to run it on any platform other than [ web or desktop ]
  //! because manually resizing the screen by the user won’t trigger a UI update.
  //! This method doesn’t work like MediaQuery, which rebuilds the UI instantly.

  // static late double width, height;

  // static init(BuildContext context) {
  //   width = MediaQuery.sizeOf(context).width;
  //   height = MediaQuery.sizeOf(context).height;
  // }

  //! This method is used to get the size of container or any widget have height & width based on the screen width (Screen Size).
  //! use it with clamp method. like this: 
  //? double svgIconSize = (screenWidth * .5).clamp(30.0, 45.0); (min size, max size,)
  // static double size = (width * .5);
}
