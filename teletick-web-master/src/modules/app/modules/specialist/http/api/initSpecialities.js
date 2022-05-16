import factory from '@/modules/http/api/requestFactory';

export default async() => {
    return factory()
        .get(`/speciality`);
}
