import factory from './requestFactory';

export default () => {
    return factory()
        .get('/search')

};
