from sklearn.decomposition import DictionaryLearning
import numpy as np
from skimage import data, color, io
from sklearn.feature_extraction.image import extract_patches_2d, reconstruct_from_patches_2d

# 載入一個範例圖像
image = color.rgb2gray(data.astronaut())
image = io.imread('test/t1_4.jpg')

# 提取圖像塊
patch_size = (8, 8)
data = extract_patches_2d(image, patch_size)

# 將每個圖像塊拉平為一維
data = data.reshape(data.shape[0], -1)

# 初始化字典學習模型
n_atoms = 100  # 字典中原子的數量
model = DictionaryLearning(n_components=n_atoms, transform_algorithm='omp', transform_n_nonzero_coefs=3)

# 使用fit進行訓練和字典學習
model.fit(data)

# 對低分辨率圖像進行超解析
low_resolution_image = io.imread('test/low_resolution_image.bmp')  # 假設有一個低分辨率圖像
low_resolution_patches = extract_patches_2d(low_resolution_image, patch_size)
low_resolution_patches = low_resolution_patches.reshape(low_resolution_patches.shape[0], -1)

# 使用訓練好的字典進行轉換
high_resolution_patches = model.transform(low_resolution_patches)

# 重建高分辨率圖像
high_resolution_image = reconstruct_from_patches_2d(high_resolution_patches.reshape(-1, *patch_size), image.shape)

# 顯示結果
io.imshow(high_resolution_image)
io.show()
io.save(high_resolution_image, filename='ans/ans.jpg')