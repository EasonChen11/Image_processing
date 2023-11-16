import os
import matplotlib.pyplot as plt
# from data import DIV2K
# from model.edsr import edsr
# from train import EdsrTrainer
from model import resolve_single
# from utils import load_image, plot_sample
import cv2

# Number of residual blocks
depth = 16
# Super-resolution factor
scale = 4
# Downgrade operator
downgrade = 'bicubic'
# Location of model weights (needed for demo)
weights_dir = f'weights/edsr-{depth}-x{scale}'
weights_file = os.path.join(weights_dir, 'weights.h5')
os.makedirs(weights_dir, exist_ok=True)
model = edsr(scale=scale, num_res_blocks=depth)
model.load_weights(weights_file)



lr = cv2.imread('HW2-dataset/LR/LR1.jpg')
sr = resolve_single(model, lr)
#sr就是高分辨率的图
#保存sr（用opencv）
import cv2
sr_cv=sr.numpy()[...,::-1]
cv2.imwrite("ans/ans.png",sr_cv)