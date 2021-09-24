# Raspberry Pi Drone

This is designed for a Navio2 + RPi flight controller and a power system similar to the [DJI Snail](https://www.dji.com/snail) with a 3S (11.1V) LiPo. It is a modified version of the drone found [on Thingiverse here](https://www.thingiverse.com/thing:2269010).

It is particularly good for scenarios with potentially rough landings, as it is flexible enough to ragdoll a bit, while being strong enough to fly nicely.

Initialize:
* Install OpenSCAD if you want to edit the source or re-generate files: `sudo apt-get install openscad`
* Clone the repo to your computer.
* Run the ./build.sh script (make sure you have OpenSCAD installed or else this step will obviously not work).

Printing (drone with gimbal):
* Print the drone body:`stl/body.stl`
* Print the arms: 4 x `stl/arm.stl`
* Print the connector plates: 2 x `stl/connector_plate.stl`
* Print the camera mount: `stl/gimbal_camera_mount.stl`

Assembly:
* Put one arm in each slot from the underside, angling them away from the center of the drone body.
* Connect the arms by pressing tab from the connector plates into the holes in the arms and the corresponding holes in the body. (You may need a vice for this. Make sure to do it slowly in order not to break anything.)
* Drill a hole through the connector plate and put a short M3 bolt through it with a nut for security.
* If using a snail propulsion system, you will need to increase the size of the slots in the arms for the required mounting screws. You can do this with a dremel or drill and a slightly larger bit. (This will eventually need to be fixed in the design itself, but is ok for now.)

Installation:
* Install the Raspberry Pi at the 4 mounting holes in the body, including spacers to separate it from the body. You can identify these holes unambiguously by the fact that they are the only 4 screw holes that line up with the holes in the Raspberry Pi. Install 4 x ~20mm M3 [countersink screws](https://m.media-amazon.com/images/I/41OX-HUqUYL.jpg) from the bottom up, and install the Raspberry Pi with the USB hub facing forward.
* Install a 40-pin header extension on the GPIO rail of the Raspberry Pi, and install 4 x ~10mm standoffs on the 4 RPi mounting screws.
* Install the Navio2 on the Raspberry Pi, with the GPIO pins fitting into the Navio2 GPIO sockets, with M3 washers on top to keep it tight against the standoffs.
* Install the motors into the arms using the (presumably included with your motors) mounting screws. (Don't install the propellers until the very end!)
* Install the [power distribution board](https://www.dronetrest.com/uploads/db5290/original/2X/0/03304f2ce1f00f086263f404fa10f85d59372267.jpg) at the rear of the drone body with wood screws.
* Install the Raspberry Pi camera module into the camera mount using M2 Allen head machine screws. (Be careful when tightening down - do not tighten too hard, and avoid touching the electronics on the rear of the camera module.) The lens of the camera fits into the square in the camera mount.
* Place the camera mount into its place at the front of the drone body.
* Insert the micro servo into its place at the front right of the drone body, press its head into the hole in camera mount, and install the servo with wood screws. Do not over-tighten - you can easily strip the screw hole.
* Install a 12mm M3 machine screw into the front left of the drone body while ensuring that the camera mount is locked onto the servo.
