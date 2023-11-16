import os
import zipfile
import numpy as np
from PIL import Image
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, UpSampling2D, Cropping2D, ZeroPadding2D, Conv2DTranspose

# import enlarge as enlarge
# enlarge.resize_image('Super-Resolution-master/Data/Train/1.bmp', 'Super-Resolution-master/Data/Train/1_4.bmp', scale_factor=4)


# Direct link to the ZIP file
url = 'https://github.com/wangxuewen99/Super-Resolution/archive/master.zip'
filename = 'data.zip'
# urllib.request.urlretrieve(url, filename)

# # Extract the data from the zip file
# with zipfile.ZipFile(filename, 'r') as zip_ref:
#     zip_ref.extractall()

# Preprocess the data by resizing the images to a smaller size
data_dir = 'Super-Resolution-master/Data/Train'
image_size = (64, 64)
for filename in os.listdir(data_dir):
    if filename.endswith('.bmp'):
        image = Image.open(os.path.join(data_dir, filename))
        image = image.resize(image_size)
        image.save(os.path.join(data_dir, filename))

# Load the data into memory
X = []
for filename in os.listdir(data_dir):
    if filename.endswith('.bmp'):
        image = Image.open(os.path.join(data_dir, filename))
        X.append(np.array(image))
X = np.array(X)

# Split the data into training and validation sets
X_train, X_val = train_test_split(X, test_size=0.2)

# Define a CNN model for image super resolution with UpSampling2D layer
model = Sequential()
model.add(Conv2D(64, kernel_size=3, activation='relu', padding='same', input_shape=(None, None, 3)))
model.add(Conv2D(64, kernel_size=3, activation='relu', padding='same'))
model.add(Conv2D(32, kernel_size=3, activation='relu', padding='same'))
model.add(Conv2D(3, kernel_size=3, activation='relu', padding='same'))
model.add(UpSampling2D(size=(1, 1)))  # Adjust size based on your desired output size

# Train the model on the training set
model.compile(optimizer='adam', loss='mse')
model.fit(X_train, X_train, epochs=10, batch_size=32, validation_data=(X_val, X_val))

# Evaluate the model on the validation set
score = model.evaluate(X_val, X_val, verbose=0)
print('Validation loss:', score)

# Save the trained model for future use
model.save('super_resolution_model.h5')
