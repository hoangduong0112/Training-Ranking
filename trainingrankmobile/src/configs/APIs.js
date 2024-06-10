import axios from 'axios';

const BASE_URL = 'http://192.168.1.204:8000/';

export const endpoints = {

    token: '/o/token/',
    me: 'users/current-user/',
    'activity': '/activities/', 
}

export const authAPI = (token) => {
    return axios.create({
       baseURL: BASE_URL,
       headers: {
          Authorization: `Bearer ${token}`,
       },
    });
 };
 
 export default axios.create({
    baseURL: BASE_URL,
 });
 