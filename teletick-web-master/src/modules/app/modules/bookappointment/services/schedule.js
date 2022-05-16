import moment            from "moment";
import getReasonSchedule from "@/modules/http/api/getReasonSchedule";

export class ScheduleService
{
    getSchedule(reason_id) {
        return getReasonSchedule(reason_id);
    }
}
