// src/routers/MainStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import BottomTab from './BottomTab';
import ActivityStack from './Stack/ActivityStack';
import BulletinStack from './Stack/BulletinStack';
import ProfileStack from './Stack/ProfileStack';
import ManagementStack from './Stack/ManagementStack';

const Stack = createStackNavigator();

const MainStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      
      <Stack.Screen name="BottomTab" component={BottomTab} />
      <Stack.Screen name="ActivityStack" component={ActivityStack} />
      <Stack.Screen name="BulletinStack" component={BulletinStack} />
      <Stack.Screen name="ProfileStack" component={ProfileStack} />
      <Stack.Screen name="ManagementStack" component={ManagementStack} />
    </Stack.Navigator>
  );
};

export default MainStack;
