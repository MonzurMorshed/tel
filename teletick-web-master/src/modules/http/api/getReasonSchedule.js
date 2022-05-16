import factory from './requestFactory';

export default (id) => {
    return factory()
        .get(`api/v1/reason/${ id }/schedule`)

};
