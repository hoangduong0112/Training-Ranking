
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { useEffect, useState } from 'react';
// import SignUp from '../../screens/auth/SignUp';
import SignIn from '../../screens/auth/SignIn';

const Stack = createNativeStackNavigator();

const AuthStack = () => {

   return (
      <Stack.Navigator screenOptions={{ headerShown: false, tabBarStyle: { display: 'none' } }}>
         <Stack.Screen name="SignIn" component={SignIn} />
         {/* <Stack.Screen name="SignUp" component={SignUp} /> */}
      </Stack.Navigator>
   );
};

export default AuthStack;
