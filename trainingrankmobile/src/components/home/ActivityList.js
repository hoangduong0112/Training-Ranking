import React, { useEffect, useState } from 'react';
import { View, Text, FlatList, StyleSheet, ActivityIndicator } from 'react-native';
import axios from 'axios';
import APIs, {endpoints} from '../../configs/APIs'
const ActivityItems = ({ activity }) => (
    <View style={styles.itemContainer}>
        <Text style={styles.title}>{activity.title}</Text>
        <Text style={styles.detail}>Ngày đăng ký: {new Date(activity.date_register).toLocaleString()}</Text>
        <Text style={styles.detail}>Địa điểm: {activity.location}</Text>
        <Text style={styles.detail}>Mô tả: {activity.description}</Text>
        <Text style={styles.detail}>Điểm: {activity.points}</Text>
        <Text style={styles.detail}>Trạng thái: {activity.statute}</Text>
        <Text style={styles.detail}>Người trợ giúp: {activity.assistant_creator}</Text>
    </View>
);

const activityList = () => {
    const [activitys, setactivitys] = useState([]);
    const [loading, setLoading] = useState(true);

    const loadActivity = async () =>{
        try{
            let res = await APIs.get(endpoints['activity'])
            setactivitys(res.data);
            setLoading(false);
        }
        catch(error) {
            console.error(error);
            setLoading(false);
        }
    }
    React.useEffect(() => {
        loadActivity();
    }, []);


    if (loading) {
        return <ActivityIndicator size="large" color="#0000ff" />;
    }

    return (
        <FlatList
            data={activitys}
            renderItem={({ item }) => <activityItem activity={item} />}
            keyExtractor={item => item.id.toString()}
        />
    );
};

const styles = StyleSheet.create({
    itemContainer: {
        padding: 10,
        marginVertical: 8,
        marginHorizontal: 16,
        borderWidth: 1,
        borderColor: '#ccc',
        borderRadius: 8,
    },
    title: {
        fontSize: 18,
        fontWeight: 'bold',
    },
    detail: {
        fontSize: 14,
    },
});

export default activityList;
