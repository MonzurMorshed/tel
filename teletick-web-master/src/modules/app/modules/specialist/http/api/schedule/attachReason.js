import factory from '@/modules/http/api/requestFactory';

export default async(daily_schedule_id = null, reason_id = null) => {
    if (!daily_schedule_id || !reason_id) {
        return;
    }
    return factory()
        .get(`api/v1/specialist/daily-schedule/${daily_schedule_id}/reason/${reason_id}/attach`);
}
