<template>
  <v-card>
    <v-card-media :src= thumbnail height="200px">
    </v-card-media>
    <v-card-title primary-title>
      <div>
        <h3 class="headline mb-0">{{title}}</h3>
        <div>{{previewText}}</div>
      </div>
    </v-card-title>
    <v-card-actions>
      <nuxt-link :to="'/attractions/'+ id"><v-btn flat color="orange">Узнать Больше</v-btn></nuxt-link>
    </v-card-actions>
  </v-card>
</template>

<script>
import { Carousel, Slide } from 'vue-carousel'

export default {
  props: {
    id: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    previewText: {
      type: String,
      required: true
    },
    thumbnail: {
      type: String,
      required: true
    }
  },
  components: {
    Carousel,
    Slide
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>

