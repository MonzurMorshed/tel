import factory from '@/modules/http/api/requestFactory';

export default async(name = '', address = '') => {
    let url = '/api/v1/practice/search?';

    if (name) {
        url += `name=${name}`;
    }
    if (address) {
        url += `address=${address}`;
    }

    return factory()
        .get(url);
}
