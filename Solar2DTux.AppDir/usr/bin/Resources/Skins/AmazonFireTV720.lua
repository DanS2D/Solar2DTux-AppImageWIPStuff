------------------------------------------------------------------------------
--
-- This file is part of the Corona game engine.
-- For overview and more information on licensing please refer to README.md 
-- Home page: https://github.com/coronalabs/corona
-- Contact: support@coronalabs.com
--
------------------------------------------------------------------------------
-- Amazon Fire TV - 1280x720

simulator =
{
	device = "android-tv",
	screenOriginX = 0,
	screenOriginY = 0,
	screenWidth = 720,
	screenHeight = 1280,
	androidDisplayApproximateDpi = 320, -- xhdpi
	displayManufacturer = "Amazon",
	displayName = "AFTB",
	isUprightOrientationPortrait = false,
	supportsScreenRotation = false,
	windowTitleBarName = "Amazon Fire TV (Gen. 1)",

	safeScreenInsetTop = 64,
	safeScreenInsetLeft = 36,
	safeScreenInsetBottom = 64,
	safeScreenInsetRight = 36,
	safeLandscapeScreenInsetTop = 36,
	safeLandscapeScreenInsetLeft = 64,
	safeLandscapeScreenInsetBottom = 36,
	safeLandscapeScreenInsetRight = 64,
}
simulator.defaultFontSize = 18.0 * (simulator.androidDisplayApproximateDpi / 160)
