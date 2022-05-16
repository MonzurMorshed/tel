import factory from '@/modules/http/api/requestFactory';

export default async(id) => {
    return factory()
        .get('/specialist/' + id + '/address');
}
