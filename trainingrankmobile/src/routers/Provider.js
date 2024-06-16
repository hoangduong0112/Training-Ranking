// src/routers/Provider.js
import React, { useEffect } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { AppState } from 'react-native';
import { DefaultTheme, Provider as PaperProvider } from 'react-native-paper';
import Theme from '../styles/MyTheme';
import Routers from './Routers';
import { UserProvider } from './../stores/contexts/UserContext';
import { GlobalProvider } from './../stores/contexts/GlobalContext';

const removeTokens = async () => {
    try {
        await AsyncStorage.multiRemove(['access-token', 'refresh-token']);
        console.log('Tokens removed');
    } catch (e) {
        console.error('Failed to remove tokens', e);
    }
};

const Provider = () => {
    useEffect(() => {
        const handleAppStateChange = async (nextAppState) => {
            if (nextAppState === 'background') {
                await removeTokens();
            }
        };

        AppState.addEventListener('change', handleAppStateChange);

        return () => {
            AppState.removeEventListener('change', handleAppStateChange);
        };
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
