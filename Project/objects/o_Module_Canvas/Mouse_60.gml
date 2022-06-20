/// @description Zoom in
if !(ACTIVE) { exit; }

if (CANVAS_ZOOM_TO < 5) {
	CANVAS_ZOOM_TO += ( CANVAS_ZOOM_TO >= .50 ? .25 : .10 );
} else {
	CANVAS_ZOOM_TO += .50;
}

CANVAS_ZOOM_TO = min(10, CANVAS_ZOOM_TO);