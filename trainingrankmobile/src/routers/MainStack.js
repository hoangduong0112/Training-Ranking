// src/routers/MainStack.js
import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import BottomTab from './BottomTab';
import HomeStack from './Stack/HomeStack';
import BulletinStack from './Stack/BulletinStack';

const Stack = createStackNavigator();

const MainStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="BottomTab" component={BottomTab} />
      <Stack.Screen name="HomeStack" component={HomeStack} />
      <Stack.Screen name="ProfileStack" component={BulletinStack} />
    </Stack.Navigator>
  );
};

export default MainStack;
