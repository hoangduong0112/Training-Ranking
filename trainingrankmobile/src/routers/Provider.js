import React, { useEffect, useRef } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { AppState } from 'react-native';
import { DefaultTheme, Provider as PaperProvider } from 'react-native-paper';
import Theme from '../styles/MyStyles'
import Routers from './Routers';
import { UserProvider } from './../stores/contexts/UserContext';
import { GlobalProvider } from './../stores/contexts/GlobalContext';

// const removeTokens = async () => {
//     try {
//         await AsyncStorage.multiRemove(['access-token', 'refresh-token']);
//         console.log('Tokens removed');
//     } catch (e) {
//         console.error('Failed to remove tokens', e);
//     }
// };

const Provider = () => {
    // const appState = useRef(AppState.currentState);
    // const timeoutRef = useRef(null);

    // useEffect(() => {
    //     const handleAppStateChange = (nextAppState) => {
    //         if (appState.current.match(/inactive|background/) && nextAppState === 'active') {
    //             // Clear the timeout when the app comes back to the foreground
    //             if (timeoutRef.current) {
    //                 clearTimeout(timeoutRef.current);
    //                 timeoutRef.current = null;
    //             }
    //         }

    //         if (nextAppState === 'background') {
    //             timeoutRef.current = setTimeout(() => {
    //                 removeTokens();
    //             }, 50000); 
    //         }

    //         appState.current = nextAppState;
    //     };

    //     AppState.addEventListener('change', handleAppStateChange);

    //     return () => {
    //         AppState.removeEventListener('change', handleAppStateChange);
    //         if (timeoutRef.current) {
    //             clearTimeout(timeoutRef.current);
    //         }
    //     };
    // }, []);

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
