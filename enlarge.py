from PIL import Image
from tqdm import tqdm  # 導入tqdm
def resize_image(input_path, output_path, scale_factor=4):
    # 開啟圖片
    with Image.open(input_path) as img:
        # 獲取原始圖片大小
        width, height = img.size

        # 計算放大後的大小
        new_width = width * scale_factor
        new_height = height * scale_factor

        # 使用NEAREST鄰近插值方法進行放大
        resized_img = img.resize((new_width, new_height), Image.BICUBIC)

        # 保存放大後的圖片
        resized_img.save(output_path)

# 輸入
for i in tqdm(range(1, 28)):
    resize_image('HW2-dataset/LR/LR'+str(i)+'.jpg', './test/t' + str(i) + '_4.jpg', scale_factor=4)
