import factory from './requestFactory';

export default () => {
    return factory()
        .get(`api/v1/book`)

};
