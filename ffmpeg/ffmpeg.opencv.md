# Record a video by default camera

use default camera to record video

```python
import cv2

cap = cv2.VideoCapture(0)

# Define the codec and create VideoWriter object
fourcc = cv2.VideoWriter_fourcc(*'avc1') #(*'MP42')
out = cv2.VideoWriter('output.avi', fourcc, 20.0, (640, 480))

while cap.isOpened():
    ret, frame = cap.read()
    if ret:

        frame = cv2.resize(frame, (640, 480))

        out.write(frame)
        cv2.imshow('Video', frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    else:
        break

# Release everything if job is finished
cap.release()
out.release()
cv2.destroyAllWindows()
```

# Get video info

get frame count, frame size,fps

```python
import cv2

vcap = cv2.VideoCapture('video.avi') # 0=camera

if vcap.isOpened(): 
    width  = vcap.get(cv2.CAP_PROP_FRAME_WIDTH)   # float
    height = vcap.get(cv2.CAP_PROP_FRAME_HEIGHT)  # float
    #print(cv2.CAP_PROP_FRAME_WIDTH, cv2.CAP_PROP_FRAME_HEIGHT) # 3, 4

    # or
    width  = vcap.get(3) # float
    height = vcap.get(4) # float

    print('width, height:', width, height)

    fps = vcap.get(cv2.CAP_PROP_FPS)
    print('fps:', fps)  # float
    #print(cv2.CAP_PROP_FPS) # 5

    frame_count = vcap.get(cv2.CAP_PROP_FRAME_COUNT)
    print('frames count:', frame_count)  # float
    #print(cv2.CAP_PROP_FRAME_COUNT) # 7
```