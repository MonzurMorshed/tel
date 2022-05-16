import clientRoutes     from '@/modules/app/modules/client/http/router/routes';
import specialistRoutes from '@/modules/app/modules/specialist/http/router/routes';
import bookRoutes       from '@/modules/app/modules/bookappointment/http/routes/routes'

/**
 * Every route becomes a chunk, loaded only when used.
 * Reduces size of initial App load.
 *
 * Here you can bind data to routes and call the dispatcher from "./router.js" file
 */
const routes = [
    ...specialistRoutes, ...clientRoutes, ...bookRoutes,
    {
        name     : 'home',
        path     : '/',
        component: () => import('@/modules/app/views/TheHome'),
        title    : 'Teletick',
        layout   : 'CommonLayout',
    },
    {
        name     : 'auth',
        path     : '/auth',
        replace  : true,
        component: () => import('@/modules/app/modules/auth/views/AuthIndex'),
        title    : 'Teletick Login',
        layout   : 'EmptyLayout',
    },
    {
        name     : 'login',
        path     : '/login',
        replace  : true,
        component: () => import('@/modules/app/modules/auth/views/AuthIndex'),
        title    : 'Teletick Login',
        layout   : 'EmptyLayout',
    },
    {
        name     : 'enterprise',
        path     : '/enterprise',
        replace  : true,
        component: () => import('@/modules/app/views/Enterprise'),
        title    : 'Enterprise Offer',
        layout   : 'CommonLayout',
    },
    {
        name     : 'events',
        path     : '/events',
        replace  : true,
        component: () => import('@/modules/app/views/Events'),
        title    : 'Events',
        layout   : 'CommonLayout',
    },
    {
        name     : 'event',
        path     : '/event/:id',
        replace  : true,
        component: () => import('@/modules/app/views/Event'),
        title    : 'Event Details',
        layout   : 'CommonLayout',
    },
    {
        name     : 'speciality-signup',
        path     : '/speciality-signup',
        replace  : true,
        component: () => import('@/modules/app/views/SpecialitySignUp'),
        title    : 'Event Details',
        layout   : 'CommonLayout',
    },
    {
        name     : 'individual',
        path     : '/individual',
        replace  : true,
        component: () => import('@/modules/app/views/Individual'),
        title    : 'Enterprise Offer',
        layout   : 'CommonLayout',
    },
];

export default routes;
