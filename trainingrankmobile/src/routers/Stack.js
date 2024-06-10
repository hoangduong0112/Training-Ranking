import { createNativeStackNavigator } from '@react-navigation/native-stack';
import BottomTab from './BottomTab'
import HomeStack from './Stack/HomeStack';
import ProfileStack from './Stack/ProfileStack';

const Stack = createNativeStackNavigator();

const MainStack = () => {
    return (
        <Stack.Navigator screenOptions={{ headerShown: false }}>
            <Stack.Screen name="BottomTab" component={BottomTab} />
            <Stack.Screen name="HomeStack" component={HomeStack} />
            <Stack.Screen name="ProfileStack" component={ProfileStack} />
        </Stack.Navigator>
    );
};

export default MainStack;
