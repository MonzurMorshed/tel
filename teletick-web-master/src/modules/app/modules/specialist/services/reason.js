import apiCreateReason from "@/modules/app/modules/specialist/http/api/reason/create";
import apiReasonList   from "@/modules/app/modules/specialist/http/api/reason/getList";
import apiDeleteReason   from "@/modules/app/modules/specialist/http/api/reason/deleteReason";
import apiReasonAttachSchedule   from "@/modules/app/modules/specialist/http/api/schedule/attachReason";
import apiReasonDetachSchedule   from "@/modules/app/modules/specialist/http/api/schedule/detachReason";

export class ReasonService
{
    reason

    constructor() {}

    getReasonList() {
        return apiReasonList();
    }

    createReasonApi(reason) {
        return apiCreateReason(reason);
    }

    deleteReason(id) {
        return apiDeleteReason(id);
    }

    scheduleAttach(reason_id, daily_schedule_id) {
        return apiReasonAttachSchedule(daily_schedule_id, reason_id);
    }

    scheduleDetach(reason_id, daily_schedule_id) {
        return apiReasonDetachSchedule(daily_schedule_id, reason_id);
    }
}
