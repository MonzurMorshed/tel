import axios from 'axios';
import store from '@/modules/core/store'

export default () => {
    const Auth = store.getters["app/auth/Auth"];

    let axiosObject = axios.create({
        baseURL: `${process.env.VUE_APP_BASE_URL}`,
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Content-Type': 'application/json',
            'Authorization' : `Bearer ${Auth.token.token}`
        },

    });

    axiosObject.interceptors.response.use((response) => {
            if(response.headers['content-type'] === "application/pdf"){
                return response
            }

            return response.data
        },
        function (error) {
            return Promise.reject(error)

        })

    return axiosObject;
};
