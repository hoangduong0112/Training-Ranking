// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack'
import ManagementScreen from '../../screens/management/ManagementScreen';
import CreatedActivitiesScreen from '../../screens/management/CreatedActivitiesScreen';
import RegisteredStudentsScreen from './../../screens/management/RegisteredStudentScreen'
import ReportScreen from '../../screens/management/ReportScreen';
const Stack = createStackNavigator();

const ManagementStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="ManagementScreen" component={ManagementScreen} />
      <Stack.Screen name="CreatedActivitiesScreen" component={CreatedActivitiesScreen} />
      <Stack.Screen name="RegisteredStudentScreen" component={RegisteredStudentsScreen}/>
      
      <Stack.Screen name="ReportScreen" component={ReportScreen}/>
    </Stack.Navigator>
  );
};

export default ManagementStack;
