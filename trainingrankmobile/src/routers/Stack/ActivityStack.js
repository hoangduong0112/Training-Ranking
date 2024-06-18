// src/routers/Stack/HomeStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import ActivityListScreen from '../../screens/activities/ActivityListScreen';
import ActivityModalScreen from '../../screens/activities/ActivityModalScreen';
import ReportForm from './../../screens/report/ReportForm';
const Stack = createStackNavigator();

const ActivityStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="ActivityList" component={ActivityListScreen}/>
      
      <Stack.Screen name="ActivityModal" component={ActivityModalScreen}/>
      
      <Stack.Screen name="ReportForm" component={ReportForm}/>
    </Stack.Navigator>
  );
};

export default ActivityStack;
