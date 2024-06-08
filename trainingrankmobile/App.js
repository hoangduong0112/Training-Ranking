import React from 'react';
import { SafeAreaView, StyleSheet } from 'react-native';
import EventList from './src/components/home/ActivityList.js';

const App = () => {
    return (
        <SafeAreaView style={styles.container}>
            <EventList />
        </SafeAreaView>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
    },
});

export default App;
