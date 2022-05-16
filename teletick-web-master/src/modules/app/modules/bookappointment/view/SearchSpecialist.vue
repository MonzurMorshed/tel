<template>
  <div class="bookapintment__wrapper">
    <TopNavbar/>

    <div style="display: flex; flex-basis: 100%; flex-direction: column; justify-content: center; margin-top: 30px">

      <Breadcrumbs/>
      <div class="front__card">
                        <Stepper
                            v-if="Stepper.active !== Stepper.length"
                            style="margin-top: 13px; border-bottom: 1px solid #EEF3EB;"/>

        <!--        !!!!-->
        <div class="search-specialist__wrapper">
          <div class="row justify-content-center">
            <div class="col-md-10">
              <AppHomeMultisearch
                  @respond="(data) => handleSearchResponse(data)"
              ></AppHomeMultisearch>
            </div>
          </div>

          <div class="row" style="min-height: 500px;margin-top: 70px">
            <div :class="+SearchSpecialist.multisearch.type === 0 ? ['col-md-7'] : ['col-md-12']">
              <div id="specialist_div_physical" v-if="+SearchSpecialist.multisearch.type === 0">
                <div class="surgeonlist-row"
                     v-for="(specialist, index) in pagination.list"
                     @click="() => handleProfileSelected(index)"
                >
                  <SpecialistSearchCard
                      :specialist="specialist || {}"
                      class="row specialist__profile__card"
                      :key="specialist.user_id"
                  >
                  </SpecialistSearchCard>
                </div>
              </div>
              <div v-else class="row">
                <div class="surgeonlist-row col-lg-6"
                     v-for="(specialist, index) in pagination.list"
                     @click="() => handleProfileSelected(index)"
                >
                  <SpecialistSearchCard
                      :specialist="specialist || {}"
                      class="row specialist__profile__card"
                      :key="specialist.user_id"
                  >
                  </SpecialistSearchCard>
                </div>
              </div>

              <!--        PAGINATION-->
<!--              <div id="pagination-container">-->
<!--                <a href="#"-->
<!--                   @click="() => +pagination.current_page > 1 ? handlePaginate(+pagination.current_page - 1) : ('')">Prev</a>-->
<!--                <PaginationButton-->
<!--                    @handlePaginate="() => handlePaginate(1)"-->
<!--                    :key="1"-->
<!--                    :title="'1'"-->
<!--                    :value="'1'"-->
<!--                    :is-active="pagination.current_page === 1"-->
<!--                />-->
<!--                <PaginationButton-->
<!--                    v-if="pagination.current_page >= 4"-->
<!--                    :title="'...'"-->
<!--                    :value="null"-->
<!--                />-->

<!--                <PaginationButton-->
<!--                    @handlePaginate="() => handlePaginate(pagination.current_page < 4 ? 2 : (+pagination.current_page - 1))"-->
<!--                    :key="pagination.current_page < 4 ? '2' : (pagination.current_page - 1) + ''"-->
<!--                    :title="pagination.current_page < 4 ? '2' : (pagination.current_page - 1) + ''"-->
<!--                    :value="pagination.current_page < 4 ? '2' : (pagination.current_page - 1) + ''"-->
<!--                    :is-active="pagination.current_page < 4 ? (+pagination.current_page === 2) : false"-->
<!--                />-->
<!--                <PaginationButton-->
<!--                    @handlePaginate="() => pagination.current_page < 4 ? handlePaginate(3) : ('')"-->
<!--                    :key="pagination.current_page < 4 ? '3' : pagination.current_page + ''"-->
<!--                    :title="pagination.current_page < 4 ? '3' : pagination.current_page + ''"-->
<!--                    :value="pagination.current_page < 4 ? '3' : pagination.current_page + ''"-->
<!--                    :is-active="pagination.current_page >= 3"-->
<!--                />-->
<!--                <PaginationButton-->
<!--                    v-if="(+pagination.last_page - +pagination.current_page >= 2) && (+SearchSpecialist.pagination.last_page > 3)"-->
<!--                    @handlePaginate="() => handlePaginate(+pagination.current_page < 4 ? 4 : +pagination.current_page + 1)"-->
<!--                    :key="pagination.current_page < 4 ? '4' : +pagination.current_page + 1 + ''"-->
<!--                    :title="pagination.current_page < 4 ? '4' : +pagination.current_page + 1 + ''"-->
<!--                    :value="pagination.current_page < 4 ? '4' : +pagination.current_page + 1 + ''"-->
<!--                    :is-active="false"-->
<!--                />-->

<!--                <PaginationButton-->
<!--                    title="..."-->
<!--                    :value="null"-->
<!--                    v-if="(+pagination.last_page - +pagination.current_page )> 2 && (+SearchSpecialist.pagination.last_page > 3)"-->
<!--                />-->

<!--                <PaginationButton-->
<!--                    :key="'last'"-->
<!--                    @handlePaginate="() => handlePaginate(pagination.last_page)"-->
<!--                    v-if="(pagination.last_page - pagination.current_page > 0) && (SearchSpecialist.pagination.last_page > 3)"-->
<!--                    :title="pagination.last_page + ''"-->
<!--                    :value="pagination.last_page + ''"-->
<!--                    :is-active="+pagination.last_page === +pagination.current_page"-->
<!--                />-->
<!--                <a href="#"-->
<!--                   @click="() => +pagination.current_page < +pagination.last_page ? handlePaginate(+pagination.current_page + 1) : ('')">Next</a>-->
<!--              </div>-->
            </div>
            <div class="col-md-5" v-if="+SearchSpecialist.multisearch.type === 0">
              <div id="myHeader" class="before_head">
                <div id="map_canvas" style="min-height: 480px; width: 100%; position: relative; overflow: hidden;">
                  <div
                      style="height: 100%; width: 100%; position: absolute; top: 0; left: 0; background-color: rgb(229, 227, 223);">
                    <div class="gm-style"
                         style="position: absolute; z-index: 0; left: 0; top: 0; height: 100%; width: 100%; padding: 0; border-width: 0; margin: 0;">
                      <div>
                        <button draggable="false" aria-label="Быстрые клавиши" title="Быстрые клавиши" type="button"
                                style="background: none transparent; display: block; border: none; margin: 0; padding: 0; text-transform: none; appearance: none; position: absolute; cursor: pointer; user-select: none; z-index: 1000002; outline-offset: 3px; right: 0; bottom: 0; transform: translateX(100%);"></button>
                      </div>
                      <div tabindex="0" aria-label="Map" aria-roledescription="map" role="group"
                           style="position: absolute; z-index: 0; left: 0; top: 0; height: 100%; width: 100%; padding: 0; border-width: 0; margin: 0; touch-action: none;">
                        <div
                            style="z-index: 1; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);">
                          <div style="position: absolute; left: 0; top: 0; z-index: 100; width: 100%;">
                            <div style="position: absolute; left: 0; top: 0; z-index: 0;">
                              <div style="position: absolute; z-index: 990; transform: matrix(1, 0, 0, 1, -82, -42);">
                                <div style="position: absolute; left: 0; top: 0; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: -256px; top: 0; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div
                                    style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: 0; top: -256px; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: 256px; top: 0; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: 0; top: 256px; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                                <div style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px;">
                                  <div style="width: 256px; height: 256px;"></div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div style="position: absolute; left: 0; top: 0; z-index: 101; width: 100%;"></div>
                          <div style="position: absolute; left: 0; top: 0; z-index: 102; width: 100%;"></div>
                          <div style="position: absolute; left: 0; top: 0; z-index: 103; width: 100%;">
                            <div style="position: absolute; left: 0; top: 0; z-index: -1;">
                              <div style="position: absolute; z-index: 990; transform: matrix(1, 0, 0, 1, -82, -42);">
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0; top: 0;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 0;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: -256px;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0; top: -256px;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: -256px;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 0;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 256px; top: 256px;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: 0; top: 256px;"></div>
                                <div
                                    style="width: 256px; height: 256px; overflow: hidden; position: absolute; left: -256px; top: 256px;"></div>
                              </div>
                            </div>
                            <div
                                style="width: 40px; height: 40px; overflow: hidden; position: absolute; left: -20px; top: -40px; z-index: 0;">
                              <img alt="" src="http://docare.fr/portalassets/img/map_2.png" draggable="false"
                                   style="position: absolute; left: 0; top: 0; user-select: none; width: 40px; height: 40px; border: 0; padding: 0; margin: 0; max-width: none; opacity: 1;">
                            </div>
                            <div
                                style="width: 40px; height: 40px; overflow: hidden; position: absolute; left: -2869px; top: -344px; z-index: -304;">
                              <img alt="" src="http://docare.fr/portalassets/img/map_2.png" draggable="false"
                                   style="position: absolute; left: 0; top: 0; user-select: none; width: 40px; height: 40px; border: 0; padding: 0; margin: 0; max-width: none; opacity: 1;">
                            </div>
                            <div
                                style="width: 40px; height: 40px; overflow: hidden; position: absolute; left: -3614px; top: -3579px; z-index: -3539;">
                              <img alt="" src="http://docare.fr/portalassets/img/map_2.png" draggable="false"
                                   style="position: absolute; left: 0; top: 0; user-select: none; width: 40px; height: 40px; border: 0; padding: 0; margin: 0; max-width: none; opacity: 1;">
                            </div>
                            <div
                                style="width: 40px; height: 40px; overflow: hidden; position: absolute; left: -408px; top: -2579px; z-index: -2539;">
                              <img alt="" src="http://docare.fr/portalassets/img/map_2.png" draggable="false"
                                   style="position: absolute; left: 0; top: 0; user-select: none; width: 40px; height: 40px; border: 0; padding: 0; margin: 0; max-width: none; opacity: 1;">
                            </div>
                          </div>
                          <div style="position: absolute; left: 0; top: 0; z-index: 0;">
                            <div style="position: absolute; z-index: 990; transform: matrix(1, 0, 0, 1, -82, -42);">
                              <div
                                  style="position: absolute; left: -256px; top: 0; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i526!3i375!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=109859"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: 256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i528!3i376!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=58825"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: 0; top: 0; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i527!3i375!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=50620"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: 256px; top: 0; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i528!3i375!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=122452"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: -256px; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i526!3i376!4i256!2m3!1e0!2sm!3i589319826!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=74620"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: 0; top: 256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i527!3i376!4i256!2m3!1e0!2sm!3i589319898!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=11930"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: -256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i526!3i374!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=42415"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: 0; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i527!3i374!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=114247"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div
                                  style="position: absolute; left: 256px; top: -256px; width: 256px; height: 256px; transition: opacity 200ms linear 0s;">
                                <img draggable="false" alt="" role="presentation"
                                     src="https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i10!2i528!3i374!4i256!2m3!1e0!2sm!3i589319946!3m17!2sru-RU!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcy50OjV8cC5oOiNGRkJCMDB8cC5zOjYwfHAuZzoxLHMudDo1MHxwLmg6I0ZGMDMwMHxwLnM6LTEwMHxwLmw6NTEuMTk5OTk5OTk5OTk5OTl8cC5nOjEscy50OjUxfHAuaDojRkYwMzAwfHAuczotMTAwfHAubDo1MnxwLmc6MSxzLnQ6NnxwLmg6IzAwNzhGRnxwLnM6MTB8cC5sOjIuNDAwMDAwMDAwMDAwMDA1N3xwLmc6MQ!4e0&amp;key=AIzaSyCrdPk_2EfxYiob_P4mtHq46j7P9BIwPIA&amp;token=55008"
                                     style="width: 256px; height: 256px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div
                            style="z-index: 3; position: absolute; height: 100%; width: 100%; padding: 0; border-width: 0; margin: 0; left: 0; top: 0; touch-action: pan-x pan-y;">
                          <div
                              style="z-index: 4; position: absolute; left: 50%; top: 50%; width: 100%; transform: translate(0px, 0px);">
                            <div style="position: absolute; left: 0; top: 0; z-index: 104; width: 100%;"></div>
                            <div style="position: absolute; left: 0; top: 0; z-index: 105; width: 100%;"></div>
                            <div style="position: absolute; left: 0; top: 0; z-index: 106; width: 100%;">
                              <div title="" role="button" tabindex="0"
                                   style="width: 56px; height: 56px; overflow: hidden; position: absolute; cursor: pointer; touch-action: none; left: -28px; top: -48px; z-index: 0;">
                                <img alt="" src="https://maps.gstatic.com/mapfiles/transparent.png" draggable="false"
                                     style="width: 56px; height: 56px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div title="" role="button" tabindex="-1"
                                   style="width: 56px; height: 56px; overflow: hidden; position: absolute; cursor: pointer; touch-action: none; left: -2877px; top: -352px; z-index: -304;">
                                <img alt="" src="https://maps.gstatic.com/mapfiles/transparent.png" draggable="false"
                                     style="width: 56px; height: 56px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div title="" role="button" tabindex="-1"
                                   style="width: 56px; height: 56px; overflow: hidden; position: absolute; cursor: pointer; touch-action: none; left: -3622px; top: -3587px; z-index: -3539;">
                                <img alt="" src="https://maps.gstatic.com/mapfiles/transparent.png" draggable="false"
                                     style="width: 56px; height: 56px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                              <div title="" role="button" tabindex="-1"
                                   style="width: 56px; height: 56px; overflow: hidden; position: absolute; cursor: pointer; touch-action: none; left: -416px; top: -2587px; z-index: -2539;">
                                <img alt="" src="https://maps.gstatic.com/mapfiles/transparent.png" draggable="false"
                                     style="width: 56px; height: 56px; user-select: none; border: 0; padding: 0; margin: 0; max-width: none;">
                              </div>
                            </div>
                            <div style="position: absolute; left: 0; top: 0; z-index: 107; width: 100%;">
                              <div class="infoBox"
                                   style="position: absolute; visibility: visible; width: 200px; left: -95.3865px; bottom: 50.4784px;">
                                <div class="marker_info"><p class="map_name"><i class="fa fa-briefcase"
                                                                                aria-hidden="true"></i>Clémentine
                                  JOACHIM</p>
                                  <div class="marker_tools">
                                    <form action="http://maps.google.com/maps" method="get" target="_blank"
                                          style="display:inline-block"><input name="saddr" value="undefined"
                                                                              type="hidden"><input type="hidden"
                                                                                                   name="daddr"
                                                                                                   value="43.28368220000001,5.3855166">
                                    </form>
                                    <a class="btn_infobox_phone"><i class="fa fa-location-arrow" aria-hidden="true"></i>41
                                      Avenue du Prado, 13006 Marseille, France</a></div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="gm-style-moc"
                             style="z-index: 4; position: absolute; height: 100%; width: 100%; padding: 0; border-width: 0; margin: 0; left: 0; top: 0; opacity: 0;">
                          <p class="gm-style-mot"></p></div>
                      </div>
                      <iframe aria-hidden="true" frameborder="0" tabindex="-1"
                              style="z-index: -1; position: absolute; width: 100%; height: 100%; top: 0; left: 0; border: none;"></iframe>
                      <div
                          style="pointer-events: none; width: 100%; height: 100%; box-sizing: border-box; position: absolute; z-index: 1000002; opacity: 0; border: 2px solid rgb(26, 115, 232);"></div>
                      <div></div>
                      <div></div>
                      <div></div>
                      <div></div>
                      <div>
                        <button draggable="false" aria-label="Включить полноэкранный режим"
                                title="Включить полноэкранный режим" type="button"
                                class="gm-control-active gm-fullscreen-control"
                                style="background: none rgb(255, 255, 255); border: 0; margin: 10px; padding: 0; text-transform: none; appearance: none; position: absolute; cursor: pointer; user-select: none; border-radius: 2px; height: 40px; width: 40px; box-shadow: rgba(0, 0, 0, 0.3) 0 1px 4px -1px; overflow: hidden; top: 0; right: 0;">
                          <img
                              src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%200v6h2V2h4V0H0zm16%200h-4v2h4v4h2V0h-2zm0%2016h-4v2h6v-6h-2v4zM2%2012H0v6h6v-2H2v-4z%22/%3E%3C/svg%3E"
                              alt="" style="height: 18px; width: 18px;"><img
                            src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%200v6h2V2h4V0H0zm16%200h-4v2h4v4h2V0h-2zm0%2016h-4v2h6v-6h-2v4zM2%2012H0v6h6v-2H2v-4z%22/%3E%3C/svg%3E"
                            alt="" style="height: 18px; width: 18px;"><img
                            src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%200v6h2V2h4V0H0zm16%200h-4v2h4v4h2V0h-2zm0%2016h-4v2h6v-6h-2v4zM2%2012H0v6h6v-2H2v-4z%22/%3E%3C/svg%3E"
                            alt="" style="height: 18px; width: 18px;"></button>
                      </div>
                      <div></div>
                      <div></div>
                      <div></div>
                      <div></div>
                      <div>
                        <div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false"
                             data-control-width="40" data-control-height="153"
                             style="margin: 10px; user-select: none; position: absolute; bottom: 167px; right: 40px;">
                          <div class="gmnoprint" data-control-width="40" data-control-height="40"
                               style="display: none; position: absolute;">
                            <div
                                style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0 1px 4px -1px; border-radius: 2px; width: 40px; height: 40px;">
                              <button draggable="false" aria-label="Повернуть карту по часовой стрелке"
                                      title="Повернуть карту по часовой стрелке" type="button" class="gm-control-active"
                                      style="background: none; display: none; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; left: 0; top: 0; overflow: hidden; width: 40px; height: 40px;">
                                <img
                                    src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h24v24H0V0z%22/%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M12.06%209.06l4-4-4-4-1.41%201.41%201.59%201.59h-.18c-2.3%200-4.6.88-6.35%202.64-3.52%203.51-3.52%209.21%200%2012.72%201.5%201.5%203.4%202.36%205.36%202.58v-2.02c-1.44-.21-2.84-.86-3.95-1.97-2.73-2.73-2.73-7.17%200-9.9%201.37-1.37%203.16-2.05%204.95-2.05h.17l-1.59%201.59%201.41%201.41zm8.94%203c-.19-1.74-.88-3.32-1.91-4.61l-1.43%201.43c.69.92%201.15%202%201.32%203.18H21zm-7.94%207.92V22c1.74-.19%203.32-.88%204.61-1.91l-1.43-1.43c-.91.68-2%201.15-3.18%201.32zm4.6-2.74l1.43%201.43c1.04-1.29%201.72-2.88%201.91-4.61h-2.02c-.17%201.18-.64%202.27-1.32%203.18z%22/%3E%3C/svg%3E"
                                    style="width: 20px; height: 20px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h24v24H0V0z%22/%3E%3Cpath%20fill%3D%22%23333%22%20d%3D%22M12.06%209.06l4-4-4-4-1.41%201.41%201.59%201.59h-.18c-2.3%200-4.6.88-6.35%202.64-3.52%203.51-3.52%209.21%200%2012.72%201.5%201.5%203.4%202.36%205.36%202.58v-2.02c-1.44-.21-2.84-.86-3.95-1.97-2.73-2.73-2.73-7.17%200-9.9%201.37-1.37%203.16-2.05%204.95-2.05h.17l-1.59%201.59%201.41%201.41zm8.94%203c-.19-1.74-.88-3.32-1.91-4.61l-1.43%201.43c.69.92%201.15%202%201.32%203.18H21zm-7.94%207.92V22c1.74-.19%203.32-.88%204.61-1.91l-1.43-1.43c-.91.68-2%201.15-3.18%201.32zm4.6-2.74l1.43%201.43c1.04-1.29%201.72-2.88%201.91-4.61h-2.02c-.17%201.18-.64%202.27-1.32%203.18z%22/%3E%3C/svg%3E"
                                  style="width: 20px; height: 20px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h24v24H0V0z%22/%3E%3Cpath%20fill%3D%22%23111%22%20d%3D%22M12.06%209.06l4-4-4-4-1.41%201.41%201.59%201.59h-.18c-2.3%200-4.6.88-6.35%202.64-3.52%203.51-3.52%209.21%200%2012.72%201.5%201.5%203.4%202.36%205.36%202.58v-2.02c-1.44-.21-2.84-.86-3.95-1.97-2.73-2.73-2.73-7.17%200-9.9%201.37-1.37%203.16-2.05%204.95-2.05h.17l-1.59%201.59%201.41%201.41zm8.94%203c-.19-1.74-.88-3.32-1.91-4.61l-1.43%201.43c.69.92%201.15%202%201.32%203.18H21zm-7.94%207.92V22c1.74-.19%203.32-.88%204.61-1.91l-1.43-1.43c-.91.68-2%201.15-3.18%201.32zm4.6-2.74l1.43%201.43c1.04-1.29%201.72-2.88%201.91-4.61h-2.02c-.17%201.18-.64%202.27-1.32%203.18z%22/%3E%3C/svg%3E"
                                  style="width: 20px; height: 20px;"></button>
                              <div
                                  style="position: relative; overflow: hidden; width: 30px; height: 1px; margin: 0 5px; background-color: rgb(230, 230, 230); display: none;"></div>
                              <button draggable="false" aria-label="Повернуть карту против часовой стрелки"
                                      title="Повернуть карту против часовой стрелки" type="button"
                                      class="gm-control-active"
                                      style="background: none; display: none; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; left: 0; top: 0; overflow: hidden; width: 40px; height: 40px; transform: scaleX(-1);">
                                <img
                                    src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h24v24H0V0z%22/%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M12.06%209.06l4-4-4-4-1.41%201.41%201.59%201.59h-.18c-2.3%200-4.6.88-6.35%202.64-3.52%203.51-3.52%209.21%200%2012.72%201.5%201.5%203.4%202.36%205.36%202.58v-2.02c-1.44-.21-2.84-.86-3.95-1.97-2.73-2.73-2.73-7.17%200-9.9%201.37-1.37%203.16-2.05%204.95-2.05h.17l-1.59%201.59%201.41%201.41zm8.94%203c-.19-1.74-.88-3.32-1.91-4.61l-1.43%201.43c.69.92%201.15%202%201.32%203.18H21zm-7.94%207.92V22c1.74-.19%203.32-.88%204.61-1.91l-1.43-1.43c-.91.68-2%201.15-3.18%201.32zm4.6-2.74l1.43%201.43c1.04-1.29%201.72-2.88%201.91-4.61h-2.02c-.17%201.18-.64%202.27-1.32%203.18z%22/%3E%3C/svg%3E"
                                    style="width: 20px; height: 20px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h24v24H0V0z%22/%3E%3Cpath%20fill%3D%22%23333%22%20d%3D%22M12.06%209.06l4-4-4-4-1.41%201.41%201.59%201.59h-.18c-2.3%200-4.6.88-6.35%202.64-3.52%203.51-3.52%209.21%200%2012.72%201.5%201.5%203.4%202.36%205.36%202.58v-2.02c-1.44-.21-2.84-.86-3.95-1.97-2.73-2.73-2.73-7.17%200-9.9%201.37-1.37%203.16-2.05%204.95-2.05h.17l-1.59%201.59%201.41%201.41zm8.94%203c-.19-1.74-.88-3.32-1.91-4.61l-1.43%201.43c.69.92%201.15%202%201.32%203.18H21zm-7.94%207.92V22c1.74-.19%203.32-.88%204.61-1.91l-1.43-1.43c-.91.68-2%201.15-3.18%201.32zm4.6-2.74l1.43%201.43c1.04-1.29%201.72-2.88%201.91-4.61h-2.02c-.17%201.18-.64%202.27-1.32%203.18z%22/%3E%3C/svg%3E"
                                  style="width: 20px; height: 20px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2024%22%3E%3Cpath%20fill%3D%22none%22%20d%3D%22M0%200h24v24H0V0z%22/%3E%3Cpath%20fill%3D%22%23111%22%20d%3D%22M12.06%209.06l4-4-4-4-1.41%201.41%201.59%201.59h-.18c-2.3%200-4.6.88-6.35%202.64-3.52%203.51-3.52%209.21%200%2012.72%201.5%201.5%203.4%202.36%205.36%202.58v-2.02c-1.44-.21-2.84-.86-3.95-1.97-2.73-2.73-2.73-7.17%200-9.9%201.37-1.37%203.16-2.05%204.95-2.05h.17l-1.59%201.59%201.41%201.41zm8.94%203c-.19-1.74-.88-3.32-1.91-4.61l-1.43%201.43c.69.92%201.15%202%201.32%203.18H21zm-7.94%207.92V22c1.74-.19%203.32-.88%204.61-1.91l-1.43-1.43c-.91.68-2%201.15-3.18%201.32zm4.6-2.74l1.43%201.43c1.04-1.29%201.72-2.88%201.91-4.61h-2.02c-.17%201.18-.64%202.27-1.32%203.18z%22/%3E%3C/svg%3E"
                                  style="width: 20px; height: 20px;"></button>
                              <div
                                  style="position: relative; overflow: hidden; width: 30px; height: 1px; margin: 0 5px; background-color: rgb(230, 230, 230); display: none;"></div>
                              <button draggable="false" aria-label="Изменить угол обзора" title="Изменить угол обзора"
                                      type="button" class="gm-tilt gm-control-active"
                                      style="background: none; display: block; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; top: 0; left: 0; overflow: hidden; width: 40px; height: 40px;">
                                <img
                                    src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2016%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%2016h8V9H0v7zm10%200h8V9h-8v7zM0%207h8V0H0v7zm10-7v7h8V0h-8z%22/%3E%3C/svg%3E"
                                    style="width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2016%22%3E%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%2016h8V9H0v7zm10%200h8V9h-8v7zM0%207h8V0H0v7zm10-7v7h8V0h-8z%22/%3E%3C/svg%3E"
                                  style="width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2016%22%3E%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%2016h8V9H0v7zm10%200h8V9h-8v7zM0%207h8V0H0v7zm10-7v7h8V0h-8z%22/%3E%3C/svg%3E"
                                  style="width: 18px;"></button>
                            </div>
                          </div>
                          <div class="gm-svpc" dir="ltr"
                               title="Перетащите человечка на карту, чтобы перейти в режим просмотра улиц"
                               data-control-width="40" data-control-height="40"
                               style="background-color: rgb(255, 255, 255); box-shadow: rgba(0, 0, 0, 0.3) 0 1px 4px -1px; border-radius: 2px; width: 40px; height: 40px; touch-action: none; position: absolute; left: 0; top: 0;">
                            <div style="position: absolute; left: 50%; top: 50%;"></div>
                            <div style="position: absolute; left: 50%; top: 50%;"><img
                                src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2023%2038%22%3E%3Cpath%20d%3D%22M16.6%2038.1h-5.5l-.2-2.9-.2%202.9h-5.5L5%2025.3l-.8%202a1.53%201.53%200%2001-1.9.9l-1.2-.4a1.58%201.58%200%2001-1-1.9v-.1c.3-.9%203.1-11.2%203.1-11.2a2.66%202.66%200%20012.3-2l.6-.5a6.93%206.93%200%20014.7-12%206.8%206.8%200%20014.9%202%207%207%200%20012%204.9%206.65%206.65%200%2001-2.2%205l.7.5a2.78%202.78%200%20012.4%202s2.9%2011.2%202.9%2011.3a1.53%201.53%200%2001-.9%201.9l-1.3.4a1.63%201.63%200%2001-1.9-.9l-.7-1.8-.1%2012.7zm-3.6-2h1.7L14.9%2020.3l1.9-.3%202.4%206.3.3-.1c-.2-.8-.8-3.2-2.8-10.9a.63.63%200%2000-.6-.5h-.6l-1.1-.9h-1.9l-.3-2a4.83%204.83%200%20003.5-4.7A4.78%204.78%200%200011%202.3H10.8a4.9%204.9%200%2000-1.4%209.6l-.3%202h-1.9l-1%20.9h-.6a.74.74%200%2000-.6.5c-2%207.5-2.7%2010-3%2010.9l.3.1L4.8%2020l1.9.3.2%2015.8h1.6l.6-8.4a1.52%201.52%200%20011.5-1.4%201.5%201.5%200%20011.5%201.4l.9%208.4zm-10.9-9.6zm17.5-.1z%22%20style%3D%22isolation%3Aisolate%22%20fill%3D%22%23333%22%20opacity%3D%22.7%22/%3E%3Cpath%20d%3D%22M5.9%2013.6l1.1-.9h7.8l1.2.9%22%20fill%3D%22%23ce592c%22/%3E%3Cellipse%20cx%3D%2210.9%22%20cy%3D%2213.1%22%20rx%3D%222.7%22%20ry%3D%22.3%22%20style%3D%22isolation%3Aisolate%22%20fill%3D%22%23ce592c%22%20opacity%3D%22.5%22/%3E%3Cpath%20d%3D%22M20.6%2026.1l-2.9-11.3a1.71%201.71%200%2000-1.6-1.2H5.699999999999999a1.69%201.69%200%2000-1.5%201.3l-3.1%2011.3a.61.61%200%2000.3.7l1.1.4a.61.61%200%2000.7-.3l2.7-6.7.2%2016.8h3.6l.6-9.3a.47.47%200%2001.44-.5h.06c.4%200%20.4.2.5.5l.6%209.3h3.6L15.7%2020.3l2.5%206.6a.52.52%200%2000.66.31l1.2-.4a.57.57%200%2000.5-.7z%22%20fill%3D%22%23fdbf2d%22/%3E%3Cpath%20d%3D%22M7%2013.6l3.9%206.7%203.9-6.7%22%20style%3D%22isolation%3Aisolate%22%20fill%3D%22%23cf572e%22%20opacity%3D%22.6%22/%3E%3Ccircle%20cx%3D%2210.9%22%20cy%3D%227%22%20r%3D%225.9%22%20fill%3D%22%23fdbf2d%22/%3E%3C/svg%3E"
                                aria-label="Управление человечком в режиме просмотра улиц"
                                style="height: 30px; width: 30px; position: absolute; transform: translate(-50%, -50%); pointer-events: none;"><img
                                src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2024%2038%22%3E%3Cpath%20d%3D%22M22%2026.6l-2.9-11.3a2.78%202.78%200%2000-2.4-2l-.7-.5a6.82%206.82%200%20002.2-5%206.9%206.9%200%2000-13.8%200%207%207%200%20002.2%205.1l-.6.5a2.55%202.55%200%2000-2.3%202s-3%2011.1-3%2011.2v.1a1.58%201.58%200%20001%201.9l1.2.4a1.63%201.63%200%20001.9-.9l.8-2%20.2%2012.8h11.3l.2-12.6.7%201.8a1.54%201.54%200%20001.5%201%201.09%201.09%200%2000.5-.1l1.3-.4a1.85%201.85%200%2000.7-2zm-1.2.9l-1.2.4a.61.61%200%2001-.7-.3l-2.5-6.6-.2%2016.8h-9.4L6.6%2021l-2.7%206.7a.52.52%200%2001-.66.31l-1.1-.4a.52.52%200%2001-.31-.66l3.1-11.3a1.69%201.69%200%20011.5-1.3h.2l1-.9h2.3a5.9%205.9%200%20113.2%200h2.3l1.1.9h.2a1.71%201.71%200%20011.6%201.2l2.9%2011.3a.84.84%200%2001-.4.7z%22%20fill%3D%22%23333%22%20fill-opacity%3D%22.2%22/%3E%26quot%3B%3C/svg%3E"
                                aria-label="Человечек находится над картой"
                                style="display: none; height: 30px; width: 30px; position: absolute; transform: translate(-50%, -50%); pointer-events: none;"><img
                                src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2040%2050%22%3E%3Cpath%20d%3D%22M34-30.4l-2.9-11.3a2.78%202.78%200%2000-2.4-2l-.7-.5a6.82%206.82%200%20002.2-5%206.9%206.9%200%2000-13.8%200%207%207%200%20002.2%205.1l-.6.5a2.55%202.55%200%2000-2.3%202s-3%2011.1-3%2011.2v.1a1.58%201.58%200%20001%201.9l1.2.4a1.63%201.63%200%20001.9-.9l.8-2%20.2%2012.8h11.3l.2-12.6.7%201.8a1.54%201.54%200%20001.5%201%201.09%201.09%200%2000.5-.1l1.3-.4a1.85%201.85%200%2000.7-2zm-1.2.9l-1.2.4a.61.61%200%2001-.7-.3L28.4-36l-.2%2016.8h-9.4L18.6-36l-2.7%206.7a.52.52%200%2001-.66.31l-1.1-.4a.52.52%200%2001-.31-.66l3.1-11.3a1.69%201.69%200%20011.5-1.3h.2l1-.9h2.3a5.9%205.9%200%20113.2%200h2.3l1.1.9h.2a1.71%201.71%200%20011.6%201.2l2.9%2011.3a.84.84%200%2001-.4.7zM34%2029.6l-2.9-11.3a2.78%202.78%200%2000-2.4-2l-.7-.5a6.82%206.82%200%20002.2-5%206.9%206.9%200%2000-13.8%200%207%207%200%20002.2%205.1l-.6.5a2.55%202.55%200%2000-2.3%202s-3%2011.1-3%2011.2v.1a1.58%201.58%200%20001%201.9l1.2.4a1.63%201.63%200%20001.9-.9l.8-2%20.2%2012.8h11.3l.2-12.6.7%201.8a1.54%201.54%200%20001.5%201%201.09%201.09%200%2000.5-.1l1.3-.4a1.85%201.85%200%2000.7-2zm-1.2.9l-1.2.4a.61.61%200%2001-.7-.3L28.4%2024l-.2%2016.8h-9.4L18.6%2024l-2.7%206.7a.52.52%200%2001-.66.31l-1.1-.4a.52.52%200%2001-.31-.66l3.1-11.3a1.69%201.69%200%20011.5-1.3h.2l1-.9h2.3a5.9%205.9%200%20113.2%200h2.3l1.1.9h.2a1.71%201.71%200%20011.6%201.2l2.9%2011.3a.84.84%200%2001-.4.7z%22%20fill%3D%22%23333%22%20fill-opacity%3D%22.2%22/%3E%3Cpath%20d%3D%22M15.4%2038.8h-4a1.64%201.64%200%2001-1.4-1.1l-3.1-8a.9.9%200%2001-.5.1l-1.4.1a1.62%201.62%200%2001-1.6-1.4L2.3%2015.4l1.6-1.3a6.87%206.87%200%2001-3-4.6A7.14%207.14%200%20012%204a7.6%207.6%200%20014.7-3.1A7.14%207.14%200%200112.2%202a7.28%207.28%200%20012.3%209.6l2.1-.1.1%201c0%20.2.1.5.1.8a2.41%202.41%200%20011%201s1.9%203.2%202.8%204.9c.7%201.2%202.1%204.2%202.8%205.9a2.1%202.1%200%2001-.8%202.6l-.6.4a1.63%201.63%200%2001-1.5.2l-.6-.3a8.93%208.93%200%2000.5%201.3%207.91%207.91%200%20001.8%202.6l.6.3v4.6l-4.5-.1a7.32%207.32%200%2001-2.5-1.5l-.4%203.6zm-10-19.2l3.5%209.8%202.9%207.5h1.6V35l-1.9-9.4%203.1%205.4a8.24%208.24%200%20003.8%203.8h2.1v-1.4a14%2014%200%2001-2.2-3.1%2044.55%2044.55%200%2001-2.2-8l-1.3-6.3%203.2%205.6c.6%201.1%202.1%203.6%202.8%204.9l.6-.4c-.8-1.6-2.1-4.6-2.8-5.8-.9-1.7-2.8-4.9-2.8-4.9a.54.54%200%2000-.4-.3l-.7-.1-.1-.7a4.33%204.33%200%2000-.1-.5l-5.3.3%202.2-1.9a4.3%204.3%200%2000.9-1%205.17%205.17%200%2000.8-4%205.67%205.67%200%2000-2.2-3.4%205.09%205.09%200%2000-4-.8%205.67%205.67%200%2000-3.4%202.2%205.17%205.17%200%2000-.8%204%205.67%205.67%200%20002.2%203.4%203.13%203.13%200%20001%20.5l1.6.6-3.2%202.6%201%2011.5h.4l-.3-8.2z%22%20fill%3D%22%23333%22/%3E%3Cpath%20d%3D%22M3.35%2015.9l1.1%2012.5a.39.39%200%2000.36.42h.14l1.4-.1a.66.66%200%2000.5-.4l-.2-3.8-3.3-8.6z%22%20fill%3D%22%23fdbf2d%22/%3E%3Cpath%20d%3D%22M5.2%2028.8l1.1-.1a.66.66%200%2000.5-.4l-.2-3.8-1.2-3.1z%22%20fill%3D%22%23ce592b%22%20fill-opacity%3D%22.25%22/%3E%3Cpath%20d%3D%22M21.4%2035.7l-3.8-1.2-2.7-7.8L12%2015.5l3.4-2.9c.2%202.4%202.2%2014.1%203.7%2017.1%200%200%201.3%202.6%202.3%203.1v2.9m-8.4-8.1l-2-.3%202.5%2010.1.9.4v-2.9%22%20fill%3D%22%23e5892b%22/%3E%3Cpath%20d%3D%22M17.8%2025.4c-.4-1.5-.7-3.1-1.1-4.8-.1-.4-.1-.7-.2-1.1l-1.1-2-1.7-1.6s.9%205%202.4%207.1a19.12%2019.12%200%20001.7%202.4z%22%20style%3D%22isolation%3Aisolate%22%20fill%3D%22%23cf572e%22%20opacity%3D%22.6%22/%3E%3Cpath%20d%3D%22M14.4%2037.8h-3a.43.43%200%2001-.4-.4l-3-7.8-1.7-4.8-3-9%208.9-.4s2.9%2011.3%204.3%2014.4c1.9%204.1%203.1%204.7%205%205.8h-3.2s-4.1-1.2-5.9-7.7a.59.59%200%2000-.6-.4.62.62%200%2000-.3.7s.5%202.4.9%203.6a34.87%2034.87%200%20002%206z%22%20fill%3D%22%23fdbf2d%22/%3E%3Cpath%20d%3D%22M15.4%2012.7l-3.3%202.9-8.9.4%203.3-2.7%22%20fill%3D%22%23ce592b%22/%3E%3Cpath%20d%3D%22M9.1%2021.1l1.4-6.2-5.9.5%22%20style%3D%22isolation%3Aisolate%22%20fill%3D%22%23cf572e%22%20opacity%3D%22.6%22/%3E%3Cpath%20d%3D%22M12%2013.5a4.75%204.75%200%2001-2.6%201.1c-1.5.3-2.9.2-2.9%200s1.1-.6%202.7-1%22%20fill%3D%22%23bb3d19%22/%3E%3Ccircle%20cx%3D%227.92%22%20cy%3D%228.19%22%20r%3D%226.3%22%20fill%3D%22%23fdbf2d%22/%3E%3Cpath%20d%3D%22M4.7%2013.6a6.21%206.21%200%20008.4-1.9v-.1a8.89%208.89%200%2001-8.4%202z%22%20fill%3D%22%23ce592b%22%20fill-opacity%3D%22.25%22/%3E%3Cpath%20d%3D%22M21.2%2027.2l.6-.4a1.09%201.09%200%2000.4-1.3c-.7-1.5-2.1-4.6-2.8-5.8-.9-1.7-2.8-4.9-2.8-4.9a1.6%201.6%200%2000-2.17-.65l-.23.15a1.68%201.68%200%2000-.4%202.1s2.3%203.9%203.1%205.3c.6%201%202.1%203.7%202.9%205.1a.94.94%200%20001.24.49l.16-.09z%22%20fill%3D%22%23fdbf2d%22/%3E%3Cpath%20d%3D%22M19.4%2019.8c-.9-1.7-2.8-4.9-2.8-4.9a1.6%201.6%200%2000-2.17-.65l-.23.15-.3.3c1.1%201.5%202.9%203.8%203.9%205.4%201.1%201.8%202.9%205%203.8%206.7l.1-.1a1.09%201.09%200%2000.4-1.3%2057.67%2057.67%200%2000-2.7-5.6z%22%20fill%3D%22%23ce592b%22%20fill-opacity%3D%22.25%22/%3E%3C/svg%3E"
                                aria-label="Управление человечком в режиме просмотра улиц"
                                style="display: none; height: 40px; width: 40px; position: absolute; transform: translate(-60%, -45%); pointer-events: none;">
                            </div>
                          </div>
                          <div class="gmnoprint" data-control-width="40" data-control-height="81"
                               style="position: absolute; left: 0; top: 72px;">
                            <div draggable="false"
                                 style="user-select: none; box-shadow: rgba(0, 0, 0, 0.3) 0 1px 4px -1px; border-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 40px; height: 81px;">
                              <button draggable="false" aria-label="Увеличить" title="Увеличить" type="button"
                                      class="gm-control-active"
                                      style="background: none; display: block; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0; left: 0;">
                                <img
                                    src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M18%207h-7V0H7v7H0v4h7v7h4v-7h7z%22/%3E%3C/svg%3E"
                                    alt="" style="height: 18px; width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23333%22%20d%3D%22M18%207h-7V0H7v7H0v4h7v7h4v-7h7z%22/%3E%3C/svg%3E"
                                  alt="" style="height: 18px; width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23111%22%20d%3D%22M18%207h-7V0H7v7H0v4h7v7h4v-7h7z%22/%3E%3C/svg%3E"
                                  alt="" style="height: 18px; width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23d1d1d1%22%20d%3D%22M18%207h-7V0H7v7H0v4h7v7h4v-7h7z%22/%3E%3C/svg%3E"
                                  alt="" style="height: 18px; width: 18px;"></button>
                              <div
                                  style="position: relative; overflow: hidden; width: 30px; height: 1px; margin: 0 5px; background-color: rgb(230, 230, 230); top: 0;"></div>
                              <button draggable="false" aria-label="Уменьшить" title="Уменьшить" type="button"
                                      class="gm-control-active"
                                      style="background: none; display: block; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; overflow: hidden; width: 40px; height: 40px; top: 0; left: 0;">
                                <img
                                    src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23666%22%20d%3D%22M0%207h18v4H0V7z%22/%3E%3C/svg%3E"
                                    alt="" style="height: 18px; width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23333%22%20d%3D%22M0%207h18v4H0V7z%22/%3E%3C/svg%3E"
                                  alt="" style="height: 18px; width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23111%22%20d%3D%22M0%207h18v4H0V7z%22/%3E%3C/svg%3E"
                                  alt="" style="height: 18px; width: 18px;"><img
                                  src="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2018%2018%22%3E%3Cpath%20fill%3D%22%23d1d1d1%22%20d%3D%22M0%207h18v4H0V7z%22/%3E%3C/svg%3E"
                                  alt="" style="height: 18px; width: 18px;"></button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div>
                        <div style="margin: 0 5px; z-index: 1000000; position: absolute; left: 0; bottom: 0;"><a
                            target="_blank" rel="noopener" title="Открыть эту область в Google Картах (в новом окне)"
                            aria-label="Открыть эту область в Google Картах (в новом окне)"
                            href="https://maps.google.com/maps?ll=43.283682,5.385517&amp;z=10&amp;t=m&amp;hl=ru-RU&amp;gl=US&amp;mapclient=apiv3"
                            style="display: inline;">
                          <div style="width: 66px; height: 26px;"><img alt="Google"
                                                                       src="https://maps.gstatic.com/mapfiles/api-3/images/google_white5.png"
                                                                       draggable="false"
                                                                       style="position: absolute; left: 0; top: 0; width: 66px; height: 26px; user-select: none; border: 0; padding: 0; margin: 0;">
                          </div>
                        </a></div>
                      </div>
                      <div></div>
                      <div>
                        <div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 463px; bottom: 0;">
                          <div draggable="false" class="gm-style-cc"
                               style="user-select: none; height: 14px; line-height: 14px;">
                            <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                              <div style="width: 1px;"></div>
                              <div
                                  style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
                            </div>
                            <div
                                style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(0, 0, 0); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                              <button draggable="false" aria-label="Быстрые клавиши" title="Быстрые клавиши"
                                      type="button"
                                      style="background: none; display: inline-block; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; color: rgb(0, 0, 0); font-family: inherit; line-height: inherit;">
                                <img
                                    src="data:image/svg+xml,%3Csvg%20fill%3D%22none%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20viewBox%3D%220%200%2016%2010%22%3E%3Cpath%20fill-rule%3D%22evenodd%22%20clip-rule%3D%22evenodd%22%20d%3D%22M1.5%200C.671573%200%200%20.671573%200%201.5v7C0%209.32843.671573%2010%201.5%2010h13C15.3284%2010%2016%209.32843%2016%208.5v-7C16%20.671573%2015.3284%200%2014.5%200h-13zM5%207C4.44772%207%204%207.44772%204%208%204%208.55229%204.44772%209%205%209h6C11.5523%209%2012%208.55229%2012%208%2012%207.44772%2011.5523%207%2011%207H5zM1%204.25c0-.13807.11193-.25.25-.25h1.5c.13807%200%20.25.11193.25.25v1.5c0%20.13807-.11193.25-.25.25H1.5C1.22386%206%201%205.77614%201%205.5V4.25zM1.5%201c-.27614%200-.5.22386-.5.5v1.25c0%20.13807.11193.25.25.25h1.5c.13807%200%20.25-.11193.25-.25v-1.5C3%201.11193%202.88807%201%202.75%201H1.5zM4%204.25c0-.13807.11193-.25.25-.25h1.5c.13807%200%20.25.11193.25.25v1.5c0%20.13807-.11193.25-.25.25h-1.5C4.11193%206%204%205.88807%204%205.75v-1.5zM4.25%201c-.13807%200-.25.11193-.25.25v1.5c0%20.13807.11193.25.25.25h1.5c.13807%200%20.25-.11193.25-.25v-1.5C6%201.11193%205.88807%201%205.75%201h-1.5zM7%204.25c0-.13807.11193-.25.25-.25h1.5C8.88807%204%209%204.11193%209%204.25v1.5C9%205.88807%208.88807%206%208.75%206h-1.5C7.11193%206%207%205.88807%207%205.75v-1.5zM7.25%201c-.13807%200-.25.11193-.25.25v1.5c0%20.13807.11193.25.25.25h1.5C8.88807%203%209%202.88807%209%202.75v-1.5C9%201.11193%208.88807%201%208.75%201h-1.5zM10%204.25C10%204.11193%2010.1119%204%2010.25%204h1.5C11.8881%204%2012%204.11193%2012%204.25v1.5C12%205.88807%2011.8881%206%2011.75%206h-1.5C10.1119%206%2010%205.88807%2010%205.75v-1.5zM10.25%201C10.1119%201%2010%201.11193%2010%201.25v1.5C10%202.88807%2010.1119%203%2010.25%203h1.5C11.8881%203%2012%202.88807%2012%202.75v-1.5C12%201.11193%2011.8881%201%2011.75%201h-1.5zM13%204.25C13%204.11193%2013.1119%204%2013.25%204h1.5C14.8881%204%2015%204.11193%2015%204.25V5.5C15%205.77614%2014.7761%206%2014.5%206h-1.25C13.1119%206%2013%205.88807%2013%205.75v-1.5zM13.25%201C13.1119%201%2013%201.11193%2013%201.25v1.5C13%202.88807%2013.1119%203%2013.25%203h1.5C14.8881%203%2015%202.88807%2015%202.75V1.5C15%201.22386%2014.7761%201%2014.5%201h-1.25z%22%20fill%3D%22%233C4043%22/%3E%3C/svg%3E"
                                    alt="" style="height: 10px; width: 16px; vertical-align: middle;"></button>
                            </div>
                          </div>
                        </div>
                        <div class="gmnoprint"
                             style="z-index: 1000001; position: absolute; right: 308px; bottom: 0; width: 155px;">
                          <div draggable="false" class="gm-style-cc"
                               style="user-select: none; height: 14px; line-height: 14px;">
                            <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                              <div style="width: 1px;"></div>
                              <div
                                  style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
                            </div>
                            <div
                                style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(0, 0, 0); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                              <button draggable="false" aria-label="Картографические данные"
                                      title="Картографические данные"
                                      type="button"
                                      style="background: none; border: 0; margin: 0; padding: 0; text-transform: none; appearance: none; position: relative; cursor: pointer; user-select: none; color: rgb(0, 0, 0); font-family: inherit; line-height: inherit;">
                                Картографические данные
                              </button>
                              <span style="display: none;">Картографические данные © 2022 Google</span></div>
                          </div>
                        </div>
                        <div class="gmnoprint gm-style-cc" draggable="false"
                             style="z-index: 1000001; user-select: none; height: 14px; line-height: 14px; position: absolute; right: 171px; bottom: 0;">
                          <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                            <div style="width: 1px;"></div>
                            <div
                                style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
                          </div>
                          <div
                              style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(0, 0, 0); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                            <a href="https://www.google.com/intl/ru-RU_US/help/terms_maps.html" target="_blank"
                               rel="noopener"
                               style="text-decoration: none; cursor: pointer; color: rgb(0, 0, 0);">Условия
                              использования</a>
                          </div>
                        </div>
                        <div draggable="false" class="gm-style-cc"
                             style="user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0; bottom: 0;">
                          <div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;">
                            <div style="width: 1px;"></div>
                            <div
                                style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div>
                          </div>
                          <div
                              style="position: relative; padding-right: 6px; padding-left: 6px; box-sizing: border-box; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(0, 0, 0); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;">
                            <a target="_blank" rel="noopener" title="Сообщить об ошибке на карте или снимке" dir="ltr"
                               href="https://www.google.com/maps/@43.2836822,5.3855166,10z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3"
                               style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(0, 0, 0); text-decoration: none; position: relative;">Сообщить
                              об ошибке на карте</a></div>
                        </div>
                        <div class="gmnoscreen" style="position: absolute; right: 0; bottom: 0;">
                          <div
                              style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(0, 0, 0); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">
                            Картографические данные © 2022 Google
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row justify-content-center">

          </div>
          <div style="text-align: right; margin: 50px 0">
          </div>
        </div>


      </div>
    </div>
  </div>
</template>

<script>
import Search
                                  from "@/modules/app/modules/bookappointment/components/Search";
import { mapActions, mapGetters } from "vuex";
import initProfile                from "@/modules/app/modules/specialist/http/api/initProfile";
import Breadcrumbs         from "@/modules/app/modules/bookappointment/components/Breadcrumbs";
import TopNavbar           from "@/modules/app/modules/bookappointment/components/TopNavbar";
import Stepper             from "@/modules/app/modules/bookappointment/components/Stepper";
import SpecialistSearchCard
                           from "@/modules/app/modules/bookappointment/components/SearchSpecialist/SpecialistSearchCard";
import DefaultState        from '../store/SearchSpecialist/state';
import SpecialistMultisearch
                           from "@/modules/app/modules/bookappointment/components/SearchSpecialist/SpecialistMultisearch";
import PaginationButton
                           from "@/modules/app/modules/bookappointment/components/SearchSpecialist/PaginationButton";
import searchSpecialist    from "@/modules/app/modules/specialist/http/api/search";
import paginateSpecialists from "@/modules/http/api/specialist/bookappointment/paginateSpecialists";
import AppHomeMultisearch  from "@/modules/app/components/home/AppHomeMultisearch";

const defaultState = DefaultState;

export default {
  name      : "SearchSpecialist",
  components: {
    AppHomeMultisearch,
    PaginationButton,
    SpecialistMultisearch,
    SpecialistSearchCard,
    Search,
    Breadcrumbs,
    TopNavbar,
    Stepper
  },
  data() {
    return {
      ...defaultState,
      multisearch: {
        isTypeOnlineCheckbox: false,
        searchDialog: {
          isOpen          : false,
          practicesLimit  : 5,
          specialistsLimit: 5,
        },
        practices: [],
        dialogList: [],
        specialistsList: [],
        name: '',
        address: '',
        type: '0',
      },
      pagination: {
        list: [],
        current_page: 1,
        last_page: 1,
        per_page: 5,
        total: 5,
      },
    };
  },

  computed: {
    ...mapGetters('app/bookappointment', [
      'paginatedSpecialists', 'SearchSpecialist', 'Stepper'
    ]),
    ...mapGetters('app/bookappointment', {
    })
  },

  created() {
    const self = this;
    self.updateStepperState({ active: 1 })
  },

  methods: {
    handleSearchResponse(data) {
      console.log('MULTISEARCH_THROWS::data', data)
      this.pagination.list = data?.specialists || this.pagination.list;
    },

    handleNameInput() {
      const self = this;
      paginateSpecialists(this.multisearch.name, this.multisearch.address, 1, this.isTypeOnlineCheckbox ? '1' : '0', 5).then(
          (response) => {
            self.specialistsList = response.collection;
          }
      )
    },

    handleTypeOnlineButtonClick() {
      if (this.searchDialog.isOpen === true) {
        this.handleNameInput();
      }
      const self = this;
      this.isTypeOnlineCheckbox = !this.isTypeOnlineCheckbox;
      this.updateStepperState({ length: (self.isTypeOnlineCheckbox === false ? 5 : 6) });
      let type = this.isTypeOnlineCheckbox ? '1' : '0';
      this.$emit('multisearchChange', { type, name: self.multisearch.name, address: self.multisearch.address });
    },

    handleSearchButtonClick() {
      const type = this.isTypeOnlineCheckbox ? '1' : '0';
      const self = this;

      this.setDialogOpen(false);
      this.$emit('multisearchChange', { type, name: self.multisearch.name, address: self.multisearch.address });
    },

    setDialogOpen(bool) {
      if (this.searchDialog.isOpen === true) {
        this.handleNameInput();
      }
      this.searchDialog.isOpen = bool;
    },

    ...mapActions('app/bookappointment', [
      'paginateAction',
      'updateStepperState',
      'fetchSpecialistAction',
    ]),
    ...mapActions('app', [ 'pageLoading' ]),

    handleProfileSelected(index) {
      const self = this;
      console.clear();
      console.log('handleProfileSelected::index', index)
      self.updateStepperState({ active: 2 })
      self.$router.push({ name: 'appointment.specialist.book', params: { specialistId: self.pagination.list[index].user_id } });
    },

  },
}
</script>

<style scoped>
.current__step__content {
  border-top: 1px solid #EEF3EB;
  position: relative;
  padding-top: 30px;
  flex-basis: 100%;
}

.bookapintment__wrapper {
  display: flex;
  flex-direction: column;
  flex-basis: 100%;
  background: #f9f9f9 !important;
}

.front__card {
  max-width: 80%;
  margin-left: 10%;
  margin-right: 10%;
  min-height: 80%;
  background: #FFFFFF;
  display: flex;
  flex-direction: column;
}


.specialist__profile__card {
  width: 100% !important;
  cursor: pointer;
  border: 2px solid #E0E0E08F;
  margin-bottom: 20px;
}


.search-specialist__wrapper {
  min-height: auto;
  background: #fff;
  border-radius: 4px;
  padding: 0 10px 10px 10px;
  border-top: 0 solid #ccc;
  margin: 50px 120px 0 120px;
}

.surgeonlist-row {
  margin-top: 15px;
  margin-bottom: 17px;
}

#specialist_physical .step2_block {
  margin-bottom: 20px !important;
}

.button-show-link a {
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  text-align: center;
  opacity: 0;
  transition: opacity .35s ease;
  /*z-index: 100;*/
}

.victor-name a {
  font-style: normal;
  font-weight: 600;
  font-size: 18px;
  line-height: 24px;
  color: #2C3F34;
  opacity: 0.8;
  padding-top: 0;
  margin-bottom: 14px;
  margin-top: 5px;
  text-transform: capitalize;
}

.surgeonlist-row a.btn_infobox_phone {
  color: #A7D08E;
  font-size: 14px;
  line-height: 24px;
  border-radius: 30px;
  background-color: rgba(100, 193, 43, 0.07);
  background-image: url("data:image/svg+xml,%3Csvg width='15' height='15' viewBox='0 0 15 15' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M2.76532 6.00938L2.76531 6.00936L2.76509 6.00888L2.76504 6.00877L2.76487 6.0084L2.35434 5.10485C2.04488 4.42375 2.2584 3.61882 2.86462 3.18092L4.18079 2.23022C4.21763 2.2036 4.26885 2.21046 4.29741 2.24588L5.62972 3.8983C5.66029 3.93622 5.65315 3.99197 5.61407 4.02095L4.74688 4.66398C4.49845 4.84819 4.41215 5.18083 4.53962 5.46266C5.54266 7.68034 7.32367 9.46239 9.54009 10.466C9.82184 10.5936 10.1543 10.5072 10.3384 10.2586L10.9811 9.39094C11.0101 9.35184 11.0657 9.34474 11.1035 9.37528L12.7548 10.7082C12.7902 10.7368 12.7971 10.7881 12.7704 10.8251L11.8245 12.1349C11.3894 12.7375 10.5917 12.9523 9.91307 12.6498C9.91307 12.6498 9.91306 12.6498 9.91306 12.6498L9.34615 12.397L9.34616 12.397L9.34449 12.3963L9.33522 12.3923C6.42366 11.157 4.08152 8.87707 2.76532 6.00938ZM1.57133 6.55664L1.57133 6.55665C3.023 9.72019 5.60574 12.2355 8.81691 13.5997L9.37853 13.85C10.625 14.4057 12.09 14.011 12.8891 12.9044L13.835 11.5945C14.2705 10.9914 14.1582 10.1528 13.5794 9.68555L11.9282 8.35265C11.3093 7.8531 10.3993 7.96947 9.92592 8.60864L9.60852 9.03718C8.05761 8.21813 6.78629 6.94605 5.96773 5.39422L6.39607 5.0766C7.03487 4.60292 7.15113 3.69247 6.65192 3.07332L5.31961 1.4209C4.85279 0.841919 4.01486 0.729443 3.41202 1.16489L3.47058 1.24595L3.41202 1.16489L2.09586 2.11559C0.982538 2.91978 0.590495 4.39792 1.15875 5.6486L1.57031 6.55442L1.57046 6.55475L1.57133 6.55664Z' fill='%23A7D08E' stroke='%23A7D08E' stroke-width='0.2' stroke-linejoin='round'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: 10px center;
  padding: 3px 19px 3px 37px;
  margin-top: 11px;
  float: left;
  margin-bottom: 10px;
}

.marker_info {
  max-width: 200px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background-color: rgba(255, 255, 255, 0.9);
}

.surgeonlist-row .marker_info {
  max-width: unset;
}

.marker_info:after {
  right: 100%;
  top: 50%;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border: 10px solid transparent;
  border-right-color: rgba(255, 255, 255, 0.9);
  margin-top: -10px;
  -ms-transform: rotate(-90deg);
  transform: rotate(
      -90deg
  );
}

.before_head {
  right: 0 !important;
  position: relative;
  width: 100%;
  margin-top: 14px;
}

#pagination-container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  position: relative;
}

#pagination-container a {
  color: #537E36;
  font-weight: 500;
  font-size: 14px;
  line-height: 45px;
  border: 1px solid #A7D08E;
  border-radius: 40px;
  width: 45px;
  display: inline-block;
  margin: 0 5px;
  text-align: center;
}

#pagination-container a:first-child, #pagination-container a:last-child {
  font-weight: 500;
  font-size: 14px;
  display: flex;
  align-items: center;
  padding: 0 30px;
  width: 162px;
  border: 1px solid transparent;
  border-radius: 30px;
}

#pagination-container a:first-child {
  position: absolute;
  left: 0;
  justify-content: flex-start;
}

#pagination-container a:last-child {
  position: absolute;
  right: 0;
  justify-content: flex-end;
}

#pagination-container a:first-child:before, #pagination-container a:last-child:after {
  content: '';
  display: inline-block;
  height: 14px;
  width: 14px;
  margin: 0 7px;
  background-repeat: no-repeat;
  background-position: left center;
  background-size: auto;
  background-image: url("data:image/svg+xml,%3Csvg width='14' height='14' viewBox='0 0 14 14' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M7 0L8.225 1.225L3.325 6.125H14V7.875H3.325L8.225 12.775L7 14L-9.53674e-07 7L7 0Z' fill='%23537E36'/%3E%3C/svg%3E");
}

#pagination-container a:last-child:after {
  transform: scaleX(-1);
}

#pagination-container a.curPage {
  background: #A7D08E;
  color: #FFF;
}
.search__wrapper {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  position: relative;
  border-radius: 50px;
  background-color: #fff;
  padding: 10px;
  box-shadow: 0 4px 30px rgb(158 158 158 / 10%);
  border: 1px solid #F5F5F5;
}

.video__consult__button {
  border: unset;
  margin-right: 0 !important;
  margin-top: 0 !important;
  position: relative;
  color: #FFFFFF;
  background-color: #A7D08E !important;
  border-radius: 4px;
  font-size: 13px;
  line-height: 13px;
  font-weight: normal;
  max-width: 200px;
  cursor: pointer!important;
}

/*.video__consult__button:before {*/
/*}*/
.search__button {
  background: linear-gradient(
      90deg, #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  color: #fff;
  font-size: 16px;
  line-height: 21px;
  padding: 8px 24px !important;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  transition: all linear 400ms;
  border: none;
  box-shadow: unset !important;
}

.search__input__text {
  padding-left: 2.2rem;
  background-color: #FFFFFF !important;
  border: none;
  box-sizing: border-box;
  height: 40px;
  border-radius: 0 0 0 0;
  box-shadow: unset !important;
}

.search__address__input {
  border-right: 2px solid #E0E0E0;
  border-left: 2px solid #E0E0E0;
  padding-left: 2.2rem;
}

.search__dialog__wrap {
  top: 75px;
  position: absolute;
  background: #FFFFFF;
  z-index: 1;
  box-shadow: 6px 8px 17px 7px rgb(195 195 195 / 41%);
  padding: 10px 0 14px 0;
  width: 100%;
  border-radius: 10px;
  max-width: 100%;
  text-align: left;
}

.practices__list__wrapper {
}

.list__section__title {
  margin-top: 20px;
  font-weight: 500;
  font-size: 12px;
  line-height: 26px;
  color: #2C3F34;
  opacity: 0.5;
  margin-bottom: 0;
  margin-left: 30px;
}

.list__item {
  border-radius: 5px;
  width: 90%;
  margin-left: 5%;
  margin-right: 5%;
}

.list__item:hover {
  background-color: #a7d08e;
}

.list__item__text {
  padding: 12px 0 !important;
  margin: 0 5px 0 15px;
  font-weight: 500;
  font-size: 14px;
  line-height: 26px;
  color: #2C3F34;
  display: block;
  border-bottom: 1px solid #E0E0E0;

}

.list__item__text:hover {
  border-bottom: 1px solid #a7d08e;
  color: #FFFFFF;
}

.button__content {
  margin: 5px 3px;
  display: flex;
  flex-direction: row;
  overflow: visible;
  align-items: center;
}

.form-control-feedback {
  position: absolute;
  z-index: 2;
  font-size: 22px;
  display: block;
  line-height: 0;
  text-align: center;
  pointer-events: none;
  color: #A7D08E;
  top: 50%;
  left: 25px;
  transform: translate(-0%, -50%);
  width: 17px;
  height: 0;
}

.video__consult__button:after {
  content: '';
  border-radius: 4px;
  position: absolute;
  right: -22px;
  top: 2px;
  width: 30px;
  height: 30px;
  background: #FCECDB url("data:image/svg+xml,%3Csvg width='15' height='10' viewBox='0 0 15 10' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath fill-rule='evenodd' clip-rule='evenodd' d='M3.73645 0.230222C5.44221 0.0777067 7.15875 0.0910189 8.86194 0.269972L9.30254 0.316265C10.1435 0.404623 10.8203 1.04249 10.9611 1.87269L13.3379 0.609917C13.499 0.52434 13.6922 0.525222 13.8525 0.612265C14.0128 0.699308 14.1188 0.860916 14.1347 1.04261L14.1527 1.2484C14.355 3.55511 14.355 5.87509 14.1527 8.1818L14.1347 8.38759C14.1188 8.56929 14.0128 8.7309 13.8525 8.81794C13.6922 8.90498 13.499 8.90587 13.3379 8.82029L10.9611 7.55751C10.8203 8.38772 10.1435 9.02559 9.30255 9.11395L8.86195 9.16024C7.15875 9.3392 5.44221 9.35251 3.73645 9.19999L2.58966 9.09746C1.72553 9.02019 1.02734 8.36004 0.901832 7.50159C0.631681 5.65376 0.631681 3.77646 0.901832 1.92862C1.02734 1.07017 1.72553 0.410022 2.58965 0.332759L3.73645 0.230222ZM11.0952 6.4309C11.1534 6.44004 11.211 6.45885 11.266 6.48803L13.1183 7.47218C13.2498 5.63648 13.2498 3.79373 13.1183 1.95803L11.266 2.94218C11.211 2.97136 11.1534 2.99017 11.0952 2.99931C11.1968 4.14091 11.1968 5.2893 11.0952 6.4309Z' fill='%23FF9739'/%3E%3C/svg%3E") no-repeat center;
}
</style>
