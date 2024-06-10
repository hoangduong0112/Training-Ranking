import AsyncStorage from '@react-native-async-storage/async-storage';
import { useEffect } from 'react';
import { DefaultTheme, Provider as PaperProvider } from 'react-native-paper';
import Theme from '../styles/MyTheme';
import Routers from './Routers';
import { UserProvider } from './../stores/contexts/UserContext';
import { GlobalProvider } from './../stores/contexts/GlobalContext';

const Provider = () => {
    useEffect(() => {
        AsyncStorage.getAllKeys().then((key) => console.log(key));
        // AsyncStorage.clear().then(() => console.log('Cleared'));
    }, []);

    return (
        <PaperProvider theme={theme}>
            <GlobalProvider>
                <UserProvider>
                    <Routers />
                </UserProvider>
            </GlobalProvider>
        </PaperProvider>
    );
};

export const theme = {
    ...DefaultTheme,
    colors: {
        ...DefaultTheme.colors,
        primary: Theme.PrimaryColor,
        accent: Theme.PrimaryColor,
    },
};

export default Provider;
