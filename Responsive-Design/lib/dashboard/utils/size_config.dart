class SizeConfig {
  // Layout Breakpoints
  static const double desktop = 1200.0;
  static const double tablet = 880.0;

  // ------------------------------------
  //! To use this feature, you need to run it on any platform other than [ web or desktop ]
  //! because manually resizing the screen by the user won’t trigger a UI update.
  //! This method doesn’t work like MediaQuery, which rebuilds the UI instantly.

  //? static late double width, height;

  //? static init(BuildContext context) {
  //?   width = MediaQuery.sizeOf(context).width;
  //?   height = MediaQuery.sizeOf(context).height;
  //? }
}
