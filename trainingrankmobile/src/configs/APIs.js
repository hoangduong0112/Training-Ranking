import axios from 'axios';

const BASE_URL = 'http://192.168.1.204:8000/';

export const endpoints = {

   //activity
   activities: '/activities/',
   'activity-detail': (activityID) => `/activities/${activityID}/`,
   'activity-register': (activityID) => `/activities/${activityID}/register/`,
   'activity-report': (activityID) => `/activities/${activityID}/report/`,
   'activity-student': (activityID) => `/activities/${activityID}/students/`,
   'activity-upload-attendance': (activityID) => `/activities/${activityID}/upload-attendance/`,


   //token 
    token: '/o/token/',

    //bulletins
    bulletins: '/bulletins/',
    'bulletins-detail': (bulletinsID) => `/bulletins/${bulletinsID}/`,
    'bulletins-comments': (bulletinsID) => `/bulletins/${bulletinsID}/comments/`,
    'bulletins-like': (bulletinsID) => `/bulletins/${bulletinsID}/likes/`,

    //classes
    class: '/classes/',

    //departments
    departments: '/departments/',

    //reports
    reports: '/reports/',
    'reports-details': (reportsID) => `/reports/${reportsID}/`,
    'reports-approve': (reportsID) => `/reports/${reportsID}/approve/`,
    'reports-reject': (reportsID) => `/reports/${reportsID}/reject/`,

    //semester
    semester: '/semester/',
    'semester-present': '/semester/present/',

    //statute
    statute: '/statute/',
    'statute-detail': (statute_id) => `/statute/${statute_id}/`,

    //user
    users: '/users/',
    'user-details': (userID) => `/users/${userID}/`,
    me: 'users/current-user/',
    'user-profile': '/users/profile/',
    'user-activities': (userID) => `/users/${userID}/activities/`,
    'user-total-points': (userID) => `/users/${userID}/total-points/`,
    'user-created-activities': '/users/created-activities/',
}

export const authAPI = (token) => {
    return axios.create({
       baseURL: BASE_URL,
       headers: {
          Authorization: `Bearer ${token}`,
          'Content-Type': 'multipart/form-data',
       },
    });
 };
 
 export default axios.create({
    baseURL: BASE_URL,
 });
 