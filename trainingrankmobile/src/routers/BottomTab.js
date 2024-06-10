import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Icon } from 'react-native-paper';
import Theme from '../styles/MyTheme';
import Activity from '../screens/home/Activity'
const Tab = createBottomTabNavigator();

const BottomTab = () => {
   return (
      <Tab.Navigator
         screenOptions={({ route }) => ({
            tabBarActiveTintColor: Theme.PrimaryColor,
            tabBarInactiveTintColor: 'black',
            tabBarHideOnKeyboard: true,
            headerShown: false,
            tabBarIcon: ({ focused }) => {
               let iconName, iconColor;

               switch (route.name) {
                  case 'Home':
                     iconName = focused ? 'home' : 'home-outline';
                     break;
                  case 'Notification':
                     iconName = focused ? 'bell' : 'bell-outline';
                     break;
                  case 'Profile':
                     iconName = focused ? 'account' : 'account-outline';
                     break;
                  default:
                     iconName = '';
               }

               iconColor = focused ? Theme.PrimaryColor : 'gray';

               return <Icon color={iconColor} size={36} source={iconName} />;
            },
         })}
      >
         <Tab.Screen name="Home" component={Activity} options={{ tabBarLabel: 'Trang chủ' }}></Tab.Screen>
        
      </Tab.Navigator>
   );
};

export default BottomTab;
