import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { getTokens } from '../../utils/utils';
import { authAPI, endpoints } from '../../configs/APIs';
import { useUser } from '../../stores/contexts/UserContext';

const MyPoints = () => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const { data: userData } = useUser();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const { accessToken } = await getTokens();
        const response = await authAPI(accessToken).get(endpoints['user-points'](userData.id));
        setData(response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [userData.id]);

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <Text>Loading...</Text>
      </View>
    );
  }

  return (
    <ScrollView>
      <View style={styles.container}>
        {data.map((semester, index) => {
          const totalPoints = semester.points_by_statute.reduce((total, statute) => total + statute.total_points, 0);

          return (
            <View key={index} style={styles.semesterContainer}>
              <Text style={styles.semesterTitle}>{semester.semester_name}</Text>
              <View style={styles.headerRow}>
                <Text style={styles.headerCell}>Statute</Text>
                <Text style={styles.headerCell}>Total Points</Text>
              </View>
              {semester.points_by_statute.map((statute) => (
                <View key={statute.statute} style={styles.row}>
                  <Text style={styles.cell}>{statute.statute}</Text>
                  <Text style={styles.cell}>{statute.total_points}</Text>
                </View>
              ))}
              <View style={styles.totalRow}>
                <Text style={styles.totalCell}>Total</Text>
                <Text style={styles.totalCell}>{totalPoints}</Text>
              </View>
            </View>
          );
        })}
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    backgroundColor: '#fff',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  semesterContainer: {
    marginBottom: 20,
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 5,
    padding: 10,
  },
  semesterTitle: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 10,
    textAlign: 'center',
  },
  headerRow: {
    flexDirection: 'row',
    backgroundColor: '#f1f1f1',
    padding: 8,
  },
  headerCell: {
    flex: 1,
    fontWeight: 'bold',
    textAlign: 'center',
    padding: 4,
  },
  row: {
    flexDirection: 'row',
    borderBottomWidth: 1,
    borderBottomColor: '#ddd',
  },
  cell: {
    flex: 1,
    textAlign: 'center',
    padding: 8,
  },
  totalRow: {
    flexDirection: 'row',
    backgroundColor: '#e0e0e0',
    padding: 8,
    borderTopWidth: 1,
    borderTopColor: '#ddd',
  },
  totalCell: {
    flex: 1,
    fontWeight: 'bold',
    textAlign: 'center',
    padding: 8,
  },
});

export default MyPoints;
