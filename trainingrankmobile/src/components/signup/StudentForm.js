import React, { useState } from 'react';
import { View, TextInput, Button, StyleSheet } from 'react-native';
import { Dropdown } from 'react-native-material-dropdown'; // Assume a dropdown component is imported

const StudentForm = () => {
  const [studentCode, setStudentCode] = useState('');
  const [phone, setPhone] = useState('');
  const [studentClass, setStudentClass] = useState('');
  const [studentDepartment, setStudentDepartment] = useState('');

  const handleSaveStudent = () => {
    // Implement save student logic
    console.log('Student details:', { studentCode, phone, studentClass, studentDepartment });
  };

  // Dummy data for dropdowns, replace with actual API data
  const classes = [
    { label: 'Class A', value: 'A' },
    { label: 'Class B', value: 'B' },
    { label: 'Class C', value: 'C' },
  ];

  const departments = [
    { label: 'Department X', value: 'X' },
    { label: 'Department Y', value: 'Y' },
    { label: 'Department Z', value: 'Z' },
  ];

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        placeholder="Student Code"
        value={studentCode}
        onChangeText={setStudentCode}
      />
      <TextInput
        style={styles.input}
        placeholder="Phone"
        value={phone}
        onChangeText={setPhone}
        keyboardType="phone-pad"
      />
      <Dropdown
        label='Select Class'
        data={classes}
        onChangeText={setStudentClass}
        containerStyle={styles.dropdownContainer}
      />
      <Dropdown
        label='Select Department'
        data={departments}
        onChangeText={setStudentDepartment}
        containerStyle={styles.dropdownContainer}
      />
      <Button
        title="Save Student"
        onPress={handleSaveStudent}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    marginBottom: 16,
  },
  input: {
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    marginBottom: 8,
    paddingHorizontal: 8,
  },
  dropdownContainer: {
    marginBottom: 8,
  },
});

export default StudentForm;
