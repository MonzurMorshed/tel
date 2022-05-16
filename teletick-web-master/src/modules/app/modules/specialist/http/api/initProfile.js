import factory from '@/modules/http/api/requestFactory';

export default async(id) => {
    return factory()
        .get(`api/v1/specialist/${ id }/profile`);
}
