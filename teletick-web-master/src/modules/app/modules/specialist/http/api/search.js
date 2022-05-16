import factory from '@/modules/http/api/requestFactory';

export default async(name = '', address = '', video = '', page = 1, perPage = 5) => {
    let url = '/api/v1/specialist/search?';

    if (name) {
        url += `name=${name}&`;
    }
    if (address) {
        url += `address=${address}&`;
    }
    if (page) {
        url += `page=${page}&`;
    }
    if (perPage !== 5) {
        url += `limit=${perPage}&`
    }

    return factory()
        .get(url);
}
