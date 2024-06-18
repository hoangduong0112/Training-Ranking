import React, { useState, useEffect } from 'react';
import { View, Text, TextInput, StyleSheet, TouchableOpacity, Button, Image, ScrollView, Alert } from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import { Picker } from '@react-native-picker/picker';
import { getTokens } from '../../utils/utils';
import { authAPI, endpoints } from '../../configs/APIs';

const CreateBulletinScreen = ({ navigation }) => {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [image, setImage] = useState(null);
  const [selectedActivity, setSelectedActivity] = useState(null);
  const [activities, setActivities] = useState([]);

  useEffect(() => {
    fetchAllActivities();
  }, []);

  const fetchAllActivities = async () => {
    try {
      const { accessToken } = await getTokens();
      let nextPage = endpoints['activities'];
      let allActivities = [];

      while (nextPage) {
        const response = await authAPI(accessToken).get(nextPage);
        allActivities = allActivities.concat(response.data.results);
        nextPage = response.data.next;
      }

      setActivities(allActivities);
    } catch (error) {
      console.error('Error fetching activities:', error);
    }
  };

  const selectImage = async () => {
    try {
      let permissionResult = await ImagePicker.requestMediaLibraryPermissionsAsync();
      if (permissionResult.granted === false) {
        alert('Permission to access camera roll is required!');
        return;
      }

      let pickerResult = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        allowsEditing: true,
        aspect: [4, 3],
        quality: 1,
      });

      if (!pickerResult.cancelled) {
        setImage(pickerResult.uri);
      }
    } catch (error) {
      console.error('Error selecting image:', error);
    }
  };

  const handleSubmit = async () => {
    try {
      const { accessToken } = await getTokens();
      const formData = new FormData();
      formData.append('title', title);
      formData.append('content', content);
      formData.append('activity', selectedActivity);

      if (image) {
        const localUri = image;
        const filename = localUri.split('/').pop();
        const match = /\.(\w+)$/.exec(filename);
        const type = match ? `image/${match[1]}` : `image`;
        formData.append('image', {
          uri: localUri,
          name: filename,
          type: type,
        });
      }

      const response = await authAPI(accessToken).post(endpoints['bulletins'], formData);

      Alert.alert('Thông báo', 'Bulletin đã được tạo thành công!', [
        {
          text: 'OK',
          onPress: () => navigation.goBack(),
        },
      ]);
    } catch (error) {
      console.error('Error creating bulletin:', error.message);
      if (error.response) {
        console.error('Response data:', error.response.data);
        console.error('Response status:', error.response.status);
        console.error('Response headers:', error.response.headers);
      } else if (error.request) {
        console.error('Request data:', error.request);
      } else {
        console.error('Error message:', error.message);
      }
      Alert.alert('Lỗi', 'Đã xảy ra lỗi khi tạo bulletin. Vui lòng thử lại sau.');
    }
  };

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.label}>Tiêu đề</Text>
      <TextInput
        style={styles.input}
        placeholder="Nhập tiêu đề"
        value={title}
        onChangeText={(text) => setTitle(text)}
      />

      <Text style={styles.label}>Nội dung</Text>
      <TextInput
        style={[styles.input, styles.multiline]}
        placeholder="Nhập nội dung"
        multiline
        numberOfLines={4}
        value={content}
        onChangeText={(text) => setContent(text)}
      />
      
      <Text style={styles.label}>Hình ảnh:</Text>
      <TouchableOpacity style={styles.imagePicker} onPress={selectImage}>
        <Text style={styles.imagePickerText}>Chọn ảnh</Text>
        {image && (
          <>
            <Text style={styles.imageName}>{image.split('/').pop()}</Text>
            <Image source={{ uri: image }} style={styles.image} />
          </>
        )}
      </TouchableOpacity>

      <Text style={styles.label}>Hoạt động</Text>
      <View style={styles.pickerContainer}>
        <Picker
          selectedValue={selectedActivity}
          onValueChange={(itemValue) => setSelectedActivity(itemValue)}
        >
          <Picker.Item label="Chọn hoạt động" value={null} />
          {activities.map((activity) => (
            <Picker.Item key={activity.id} label={activity.title} value={activity.id} />
          ))}
        </Picker>
      </View>

      <Button title="Gửi thông tin" onPress={handleSubmit} />
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 16,
  },
  label: {
    fontSize: 16,
    marginBottom: 8,
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 4,
    padding: 10,
    marginBottom: 16,
    fontSize: 16,
  },
  multiline: {
    height: 120,
    textAlignVertical: 'top',
  },
  imagePicker: {
    alignItems: 'center',
    marginBottom: 16,
  },
  imagePickerText: {
    fontSize: 16,
    color: '#007bff',
    marginBottom: 8,
  },
  imageName: {
    fontSize: 14,
    color: '#333',
  },
  image: {
    width: 200,
    height: 200,
    resizeMode: 'contain',
  },
  pickerContainer: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 4,
    marginBottom: 16,
  },
});

export default CreateBulletinScreen;
