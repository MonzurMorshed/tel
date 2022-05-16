export default [
    {
        path    : '/client',
        name     : 'client.dashboard',
        title    : 'Client Dashboard',
        layout   : 'ClientPanelLayout',
        meta: { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientDashboard')
    },
    {
        path    : '/client/appointments',
        name     : 'client.appointments',
        title    : 'Client Appointments',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientAppointments')
    },
    {
        path    : '/client/notifications',
        name     : 'client.notifications',
        title    : 'Client Appointments',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientNotifications')
    },
    {
        path    : '/client/consultations',
        name     : 'client.consultations',
        title    : 'Client Consultations',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientConsultations')
    },
    {
        path    : '/client/consultations/history',
        name     : 'client.consultations.history',
        title    : 'Client Consultations history',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientConsultationHistory')
    },
    {
        path    : '/client/payment/method',
        name     : 'client.payment.method',
        title    : 'Client Payment Method',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientPaymentMethod')
    },
    {
        path    : '/client/payment/history',
        name     : 'client.payment.history',
        title    : 'Client Payment History',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientPaymentHistory')
    },
    {
        path    : '/client/profile',
        name     : 'client.profile',
        title    : 'Teletick - Client profile',
        layout   : 'ClientPanelLayout',
        meta     : { requiresAuth: true },
        component: () => import('@/modules/app/modules/client/views/ClientProfile')
    },
]
