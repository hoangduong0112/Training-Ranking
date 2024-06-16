import { NavigationContainer } from '@react-navigation/native';
import { StatusBar } from 'react-native';
import Loading from '../components/common/Loading';
import Theme from '../styles/MyTheme';
import AuthStack from './Stack/AuthStack';
import { useUser } from './../stores/contexts/UserContext';
import MainStack from './MainStack';

const Routers = () => {
   const user = useUser();

   if (user.loading) return <Loading />;

   return (
      <>
         <StatusBar animated={true} backgroundColor={Theme.PrimaryColor} />
         <NavigationContainer>{!user.isLoggedIn ? <AuthStack /> : <MainStack />}</NavigationContainer>
      </>
   );
};

export default Routers;
