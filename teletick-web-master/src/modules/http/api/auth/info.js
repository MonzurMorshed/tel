import axios from 'axios';

export default (token = '') => {
    let axiosObject = axios.create({
        baseURL: `${ process.env.VUE_APP_BASE_URL }`,
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Content-Type': 'application/json',
            'Authorization' : `Bearer ${ token }`
        },

    });

    // console.log('store.getters[\'app/auth/api_token\']', store.getters['app/auth/api_token'])
    // return axiosObject.get('/me')
    return axiosObject.get('/api/v1/me')
};
