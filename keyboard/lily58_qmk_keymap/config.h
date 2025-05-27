#pragma once

#define MASTER_LEFT

// When the user holds a key after tapping it, the tapping function
// is repeated by default, rather than activating the hold function.
// This allows keeping the ability to auto-repeat the tapping
// function of a dual-role key. If set to 0, it will remove the
// auto-repeat ability and activate the hold function instead.
#define QUICK_TAP_TERM 150

// If the key is held for up to this time, it is considered a tap.
// If the key is held longer than this time, it is considered a hold.
// 200ms is a good default value for most users.
#define TAPPING_TERM 200
