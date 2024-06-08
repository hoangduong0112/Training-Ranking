import axios from 'axios';

const BASE_URL = 'http://192.168.1.30:8000/';

export const endpoints = {

    activities: '/activities/', 
}

export default axios.create({
    baseURL: BASE_URL
});