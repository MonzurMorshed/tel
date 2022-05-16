import initProfile from "@/modules/app/modules/specialist/http/api/initProfile";

export class SpecialistService
{
    constructor() {}

    apiInitProfile(id) {
        return initProfile(id);
    }
}
