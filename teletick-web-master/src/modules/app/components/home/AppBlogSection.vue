<template>
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-3">
        <div class="blog-center-div">
          <div class="">
            <h3 class="blog-text">
              Blog </h3>
          </div>
          <div class="">
            <p class="blog-second-line">
              Restez à l’écoute de l’actualité bien-être en continu                        </p>
          </div>
          <div class="view-more-btn-div">
            <a href="/">
              <button type="button" class="btn btn-primary top-button custom-mt-0 h-50"> Voir tout</button>
            </a>
          </div>
        </div>
      </div>

      <div class="col-md-3">
        <div class="blog-grid">
          <div class="blog-grid-img position-relative">
            <a href="/" style="background-image: url('http://docare.fr/uploadimages/1639039730-alone1.jpg')" class="blog-img-custom">
            </a>
          </div>
          <div class="blog-grid-text sm-padding-20px-all border-color-medium-gray">
            <div class="">
              <h5 class="blog-actual-date"> 09 décembre 2021 </h5>
            </div>
            <h4 class="blog-header-custom"><a class="blog-header" href="/">test blog </a>
            </h4>
            <div class="blog-writer-main-div">
              <div class="image-outer-div">
                <img class="blog-writer-image" alt="img" src="http://docare.fr/uploadimages/1639039730-A1.png">
              </div>
              <div class="">
                <h4 class="blog-writer-name">RD</h4>
                <h5 class="blog-writer-post"> Psychologie </h5>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="blog-grid">
          <div class="blog-grid-img position-relative">
            <a href="/" style="background-image: url('http://docare.fr/uploadimages/1631698078-photo-1552196563-55cd4e45efb3.png')" class="blog-img-custom">
            </a>
          </div>
          <div class="blog-grid-text sm-padding-20px-all border-color-medium-gray">
            <div class="">
              <h5 class="blog-actual-date"> 14 septembre 2021 </h5>
            </div>
            <h4 class="blog-header-custom"><a class="blog-header" href="/">Les médecines douces : Les grands gagnants de la crise de la covid </a>
            </h4>
            <div class="blog-writer-main-div">
              <div class="image-outer-div">
                <img class="blog-writer-image" alt="img" src="http://docare.fr/uploadimages/1631634713-1614773110549_(1).png">
              </div>
              <div class="">
                <h4 class="blog-writer-name">Jules BE KUTI</h4>
                <h5 class="blog-writer-post">  Bien-être </h5>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="blog-grid">
          <div class="blog-grid-img position-relative">
            <a href="/" style="background-image: url('http://docare.fr/uploadimages/1631048194-photo-1521633602573-190eaa25b787.png')" class="blog-img-custom">
            </a>
          </div>
          <div class="blog-grid-text sm-padding-20px-all border-color-medium-gray">
            <div class="">
              <h5 class="blog-actual-date"> 07 septembre 2021 </h5>
            </div>
            <h4 class="blog-header-custom"><a class="blog-header" href="/">CRISE DE LA SANTÉ MENTALE : LES BÉNÉFICES DE LA SOPHROLOGIE </a>
            </h4>
            <div class="blog-writer-main-div">
              <div class="image-outer-div">
                <img class="blog-writer-image" alt="img" src="http://docare.fr/uploadimages/1631048194-1614773110549.png">
              </div>
              <div class="">
                <h4 class="blog-writer-name">Jules BE KUTI</h4>
                <h5 class="blog-writer-post">  Bien-être </h5>
              </div>
            </div>
          </div>
        </div>
      </div>


    </div>
  </div>
</template>

<script>
export default {
  name: "AppBlogSection"
}
</script>

<style scoped>
.blog-text {
  font-style: normal;
  font-weight: 600;
  font-size: 36px;
  line-height: 50px;
  display: flex;
  align-items: center;
  color: #2C3F34;
}
.blog-second-line {
  font-style: normal;
  font-weight: normal;
  font-size: 20px;
  line-height: 32px;
  display: flex;
  align-items: center;
  color: #2C3F34;
  opacity: 0.8;
}
.blog-center-div button {
  font-size: 14px;
  line-height: 44px;
  width: 200px;
  padding: 0 20px!important;
}
.top-button {
  background: linear-gradient(
      90deg
      , #A7D08E 0%, #537E36 100%);
  font-weight: 600;
  color: #fff;
  border-radius: 30px;
  text-transform: uppercase;
  display: inline-block;
  vertical-align: middle;
  transform: perspective(1px) translateZ(0);
  position: relative;
  -webkit-transition: all linear 400ms;
  transition: all linear 400ms;
  border: none;
  box-shadow: unset!important;
}
.top-button:before {
  background: #537E36;
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  display: inline-block;
  -ms-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: 51%;
  transform-origin: 51%;
  -webkit-transition-property: -webkit-transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  border-radius: 22px;
  border: none;
}
.blog-grid {
  position: relative;
  background: #fff;
  overflow: hidden;
  -webkit-transition: all 0.2s ease-in-out;
  -moz-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  -ms-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}
.blog-img-custom {
  height: 250px;
  display: block;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  background-color: grey;
  border-radius: 4px 4px 0 0;
}
.blog-grid-text {
  position: relative;
  padding: 25px 30px;
}
.blog-actual-date {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 32px;
  display: flex;
  align-items: center;
  color: rgba(44, 63, 52, 0.5);
  opacity: 0.8;
  margin-bottom: 5px;
}
.blog-grid-text h4 {
  font-size: 16px;
  line-height: 18px;
  margin-bottom: 0;
}
.blog-header-custom {
  height: 61px;
}
.blog-header {
  font-style: normal;
  font-weight: 600;
  font-size: 22px;
  line-height: 32px;
  color: #2C3F34;
  opacity: 0.8;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.blog-writer-main-div {
  display: flex;
  margin-top: 10px;
  align-items: center;
}
.image-outer-div {
  flex: 0 0 40px;
}
.blog-grid img {
  max-width: 100%;
  object-fit: cover;
  border-radius: 4px 4px 0 0;
  position: relative;
}
.blog-writer-image {
  width: 40px !important;
  height: auto;
  max-width: 40px;
  border-radius: 50%!important;
}
.blog-grid-text h4 {
  font-size: 16px;
  line-height: 18px;
  margin-bottom: 0;
}
.blog-writer-name {
  font-style: normal;
  font-weight: 500;
  font-size: 16px!important;
  line-height: 32px!important;
  display: flex;
  align-items: center;
  text-transform: uppercase;
  color: #2C3F34;
  opacity: 0.8;
  padding-left: 20px;
}
.blog-writer-post {
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  display: flex;
  align-items: center;
  color: rgba(44, 63, 52, 0.5);
  opacity: 0.8;
  padding-left: 20px;
  margin-bottom: 0;
  line-height: 14px;
}
</style>