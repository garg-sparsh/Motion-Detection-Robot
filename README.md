# Motion-Detection-Robot
1. We consider the standard background image or the first frame of the video as the
reference image for comparing the other frames of the video in order to detect any
kind of motion.
2. Reference (or background) to foreground subtraction to identify any sufficient
change in the pixel values. If the change is performed in the pixel value is sufficient
enough such that the change can be marked as an indicator of motion.
3. The difference between reference image and the current frame of the video. First
video is converted to binary and then the total number of 1‟s will identify the change
whether it is good enough value to declare motion detected or the change is too
small to be considered as a motion of insignificant amount.
4. If some motion is detected, then the next few consecutive frames will be analysed.
If the difference comes out to be zero or equal for the next frames, it will indicate that
the object has stopped. And hence it is this frame which will be considered as the new
reference frame for detecting any kind of motion after that
These above steps are coded in MATLAB and executed to detect any kind of motion
with respect to the input video. The motion tracking continues throughout the video
with respect to the standard background which changes as per the motion of the
moving object in the captured video. This satisfies the aim of the project where we
consider an indoor surveillance system. This system aims to find any kind of
unwanted disturbance in a highly secure zone such as bank vaults or military weapon
hanger, and many other such highly secure zones.
