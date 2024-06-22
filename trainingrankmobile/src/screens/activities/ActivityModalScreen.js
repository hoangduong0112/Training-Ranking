import React, { useState, useEffect } from 'react';
import { View, Text, TextInput, StyleSheet, Button, Alert, TouchableOpacity, ScrollView } from 'react-native';
import { getTokens } from '../../utils/utils';
import { authAPI, endpoints } from '../../configs/APIs';
import { Picker } from '@react-native-picker/picker';
import DateTimePicker from '@react-native-community/datetimepicker';

const ActivityModalScreen = ({ navigation, route }) => {
  const { activityId } = route.params || {};
  const [title, setTitle] = useState('');
  const [dateRegister, setDateRegister] = useState(new Date());
  const [location, setLocation] = useState('');
  const [description, setDescription] = useState('');
  const [points, setPoints] = useState('');
  const [statute, setStatute] = useState(null);
  const [statuteList, setStatuteList] = useState([]);
  const [showDatePicker, setShowDatePicker] = useState(false);
  const [showTimePicker, setShowTimePicker] = useState(false);

  useEffect(() => {
    fetchStatuteList();
    if (activityId) {
      fetchActivityDetails(activityId);
    }
  }, [activityId]);

  const fetchActivityDetails = async (id) => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['activity-detail'](id));
      const activity = response.data;
      setTitle(activity.title);
      setDateRegister(new Date(activity.date_register));
      setLocation(activity.location);
      setDescription(activity.description);
      setPoints(activity.points.toString());
      setStatute(activity.statute);
    } catch (error) {
      console.error('Error fetching activity details:', error);
      Alert.alert('Lỗi', 'Đã xảy ra lỗi khi tải thông tin hoạt động. Vui lòng thử lại sau.');
    }
  };

  const fetchStatuteList = async () => {
    try {
      const { accessToken } = await getTokens();
      const response = await authAPI(accessToken).get(endpoints['statute']);
      setStatuteList(response.data);
    } catch (error) {
      console.error('Error fetching statute list:', error);
      Alert.alert('Lỗi', 'Đã xảy ra lỗi khi tải danh sách statute. Vui lòng thử lại sau.');
    }
  };

  const showDatePickerDialog = () => {
    setShowDatePicker(true);
  };

  const showTimePickerDialog = () => {
    setShowTimePicker(true);
  };

  const onDateChange = (event, selectedDate) => {
    setShowDatePicker(false);
    if (selectedDate) {
      const currentDate = selectedDate || dateRegister;
      setDateRegister(currentDate);
    }
  };

  const onTimeChange = (event, selectedTime) => {
    setShowTimePicker(false);
    if (selectedTime) {
      const currentDate = selectedTime || dateRegister;
      setDateRegister(currentDate);
    }
  };

  const formatDateTime = (date) => {
    const pad = (number) => (number < 10 ? '0' + number : number);
    return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ${pad(date.getHours())}:${pad(date.getMinutes())}`;
  };


  const handleSubmit = async () => {
    try {
      const { accessToken } = await getTokens();
      const formData = new FormData();
      formData.append('title', title);
      formData.append('date_register', formatDateTime(dateRegister));
      formData.append('location', location);
      formData.append('description', description);
      formData.append('points', points);
      formData.append('statute', statute);
  
      let response;
      if (activityId) {
        
        response = await authAPI(accessToken).patch(endpoints['activity-detail'](activityId), formData);
        Alert.alert('Thông báo', 'Cập nhật hoạt động thành công!', [
          {
            text: 'OK',
            onPress: () => navigation.goBack(),
          },
        ]);
      } else {
        response = await authAPI(accessToken).post(endpoints['activities'], formData);
        Alert.alert('Thông báo', 'Tạo hoạt động thành công!', [
          {
            text: 'OK',
            onPress: () => navigation.goBack(),
          },
        ]);
      }
    } catch (error) {
      console.error('Error saving activity:', error);
      Alert.alert('Lỗi', 'Đã xảy ra lỗi khi lưu hoạt động. Vui lòng thử lại sau.');
    }
  };
  

  return (
    <ScrollView style={styles.container}>
      <Text style={styles.label}>Tiêu đề</Text>
      <TextInput
        style={styles.input}
        placeholder="Nhập tiêu đề"
        value={title}
        onChangeText={(text) => setTitle(text)}
      />

      <Text style={styles.label}>Ngày đăng ký</Text>
      <TouchableOpacity onPress={showDatePickerDialog}>
        <Text style={styles.dateTimeText}>{formatDateTime(dateRegister).split(' ')[0]}</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={showTimePickerDialog}>
        <Text style={styles.dateTimeText}>{formatDateTime(dateRegister).split(' ')[1]}</Text>
      </TouchableOpacity>
      {showDatePicker && (
        <DateTimePicker
          value={dateRegister}
          mode="date"
          display="default"
          onChange={onDateChange}
        />
      )}
      {showTimePicker && (
        <DateTimePicker
          value={dateRegister}
          mode="time"
          display="default"
          onChange={onTimeChange}
        />
      )}

      <Text style={styles.label}>Địa điểm</Text>
      <TextInput
        style={styles.input}
        placeholder="Nhập địa điểm"
        value={location}
        onChangeText={(text) => setLocation(text)}
      />

      <Text style={styles.label}>Mô tả</Text>
      <TextInput
        style={[styles.input, styles.multiline]}
        placeholder="Nhập mô tả"
        multiline
        numberOfLines={4}
        value={description}
        onChangeText={(text) => setDescription(text)}
      />

      <Text style={styles.label}>Điểm số</Text>
      <TextInput
        style={styles.input}
        placeholder="Nhập điểm số"
        keyboardType="numeric"
        value={points}
        onChangeText={(text) => setPoints(text)}
      />

      <Text style={styles.label}>Chọn statute</Text>
      <Picker
        style={styles.input}
        selectedValue={statute}
        onValueChange={(itemValue, itemIndex) => setStatute(itemValue)}
      >
        <Picker.Item label="Chọn statute" value={null} />
        {statuteList.map((item) => (
          <Picker.Item key={item.id} label={item.statute_name} value={item.id} />
        ))}
      </Picker>

      <View style={styles.buttonContainer}>
        <Button title={activityId ? "Cập nhật" : "Tạo mới"} onPress={handleSubmit} />
      </View>
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
  dateTimeText: {
    fontSize: 16,
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 4,
    padding: 10,
    marginBottom: 16,
  },
  buttonContainer: {
    marginTop: 20,
  },
});

export default ActivityModalScreen;
