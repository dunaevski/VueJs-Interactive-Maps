<template>
    <v-container fluid>
        <v-layout row wrap>
            <v-flex xs12 >
                <v-parallax :src="loadedPost.imageURL">
                </v-parallax>
                <h1>{{loadedPost.title}}</h1>
                <p>{{loadedPost.previewText}}</p>
            </v-flex>

            <v-layout row wrap>
                <v-flex lg6 xs12 >
                    <v-carousel  hide-controls>
                        <v-carousel-item :src="loadedPost.imageURL1"></v-carousel-item>
                        <v-carousel-item :src="loadedPost.imageURL2"></v-carousel-item>
                        <v-carousel-item :src="loadedPost.imageURL"></v-carousel-item>
                    </v-carousel>
                </v-flex>
                <v-flex lg5 xs12 ml-5>
                    <div class="expand_more">
                      <h2>Информация</h2>
                        <p>{{loadedPost.content}}</p>
                    </div>
                </v-flex>
            </v-layout>

            <v-flex mt-5>
              <v-tabs icons-and-text centered color="transparent">
                <v-tabs-slider color="blue"></v-tabs-slider>
                <v-flex lg6>
                    <v-tab href="#tab-1">
                    Обзор
                    <v-icon color="blue">fas fa-search</v-icon>
                    </v-tab>
                    <v-tab href="#tab-2">
                    Отзывы
                    <v-icon color="blue">far fa-thumbs-up</v-icon>
                    </v-tab>
                    <v-tab href="#tab-3">
                    Местоположение
                    <v-icon color="blue">fas fa-map-pin</v-icon>
                    </v-tab>
                </v-flex>
                <v-tab-item :id="'tab-' + 1">
                  <v-card flat>
                     <v-card-text> Часы работы сегодня: {{ loadedPost.time }}</v-card-text>
                    <img :src="loadedPost.overview" alt="" class="img_overview">
                  </v-card>
                </v-tab-item>
                <v-tab-item :id="'tab-' + 2">
                  <v-card flat>
                    <v-card-text> <widget />  </v-card-text>
                  </v-card>
                </v-tab-item>
                <v-tab-item :id="'tab-' + 3">
                  <v-card flat>
                    <v-card-text> Адрес: {{ loadedPost.address }}</v-card-text>
                    <v-card-text> Телефон: {{ loadedPost.phone }}</v-card-text>
                  </v-card>
                </v-tab-item>
              </v-tabs>
            </v-flex>

        </v-layout>
    </v-container>
</template>

<script>
import widget from '~/components/widget.vue'
import axios from 'axios'
export default {
  data () {
    return {
      items: [
        {
          src: 'https://vuetifyjs.com/static/doc-images/carousel/squirrel.jpg'
        },
        {
          src: 'https://vuetifyjs.com/static/doc-images/carousel/sky.jpg'
        },
        {
          src: 'https://vuetifyjs.com/static/doc-images/carousel/bird.jpg'
        },
        {
          src: 'https://vuetifyjs.com/static/doc-images/carousel/planet.jpg'
        }
      ]
    }
  },
  asyncData (context) {
    return axios.get('https://yandex-map.firebaseio.com/attractions/' + context.params.id + '.json')
      .then(res => {
        return {
          loadedPost: res.data
        }
      })
      .catch(e => context.error(e))
  },
  components: {
    widget
  }
}
</script>


<style scoped>
.card__text {
  padding: 0px
}
.parallax {
    height: 81vh;
    width: 99vw;
    position: relative;
    bottom: 30px;
    right: 11vw;
}
@media screen and (min-width: 320px) and (max-width: 567px) {
  .parallax {
    width: 100vw;
    position: relative;
    bottom: 43px;
    right: 48px;
  }
}
.img_overview {
  height: 40%;
  width: 40%;
}
body {
  color: black;
}
</style>

