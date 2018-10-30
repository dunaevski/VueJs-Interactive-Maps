<template>
  <v-container fluid grid-list-md>

    <v-layout row wrap>
      <v-flex lg12 xs12 mb-2>
        <yandex-map/>
      </v-flex>
       <v-flex lg12 xs12 mb-2>
        <h1>Самые популярные достопримечательности</h1>
      </v-flex>
          <v-flex lg4 md6 sm12  v-for="item in items" :key="item.id" :src="item.imageURL">
            <cards 
              :id=item.id
              :thumbnail=item.imageURL
              :title=item.title
              :previewText=item.previewText /> 
          </v-flex>
        </v-layout>
  
  </v-container>
</template>


<script>
import yandexMap from '~/components/yandexMap.vue'
import cards from '~/components/cards.vue'

export default {
  components: {
    yandexMap,
    cards
  },
  data () {
    return {
      items: [
        {
          id: 'воронцовский_дворец',
          title: 'Воронцовский дворец',
          previewText: 'Воронцо́вский дворе́ц расположен в г. Алупка у подножия горы Ай-Петри. Построен из диабаза, который добывался неподалёку. С 1956 года во дворце находится музей. При Воронцовском дворце находится парк — памятник садово-паркового искусства.',
          imageURL: 'https://lh5.googleusercontent.com/p/AF1QipPBbGN2i_CQIzj1lh-7OmoVHjhpZDeYXK5UcgX_=w242-h160-k-no'
        },
        {
          id: 'ласточкино_гнездо',
          title: 'Ласточкино гнездо',
          previewText: '«Ла́сточкино гнездо́» — памятник архитектуры и истории, расположенный на отвесной 40-метровой Аврориной скале мыса Ай-Тодор в посёлке Гаспра на южном берегу Крыма. «Ласточкино гнездо» стало эмблемой Южного берега Крыма.',
          imageURL: 'https://lh5.googleusercontent.com/p/AF1QipNl89FBHfVWRCm8JEMW-3XyQz94W4_ygUtKzs8w=w242-h160-k-no'
        },
        {
          id: 'ливадийский_дворец',
          title: 'Ливадийский дворец',
          previewText: 'Ливади́йский дворе́ц — бывшая южная резиденция российских императоров, расположенная на берегу Чёрного моря в посёлке Ливадия в Ялтинском регионе Крыма в 3 км от Ялты.',
          imageURL: 'https://lh5.googleusercontent.com/p/AF1QipPDQau7PMg7b3i9l8xfWXib3XtcMJ5cOuzoaxB4=w213-h160-k-no'
        },
        {
          id: 'дворец_эмира_бухарского',
          title: 'Дворец эмира Бухарского',
          previewText: 'Дворец эмира Бухарского — дворцовый ансамбль в городе Ялта на территории санатория «Ялта» КЧФ. ',
          imageURL: 'https://lh5.googleusercontent.com/p/AF1QipMzZQYwU1yzhhWKDS5ScUvmUT5Kq8kTSU0Bng52=w240-h160-k-no'
        },
        {
          id: 'массандровский_дворец',
          title: 'Массандровский дворец',
          previewText: 'Масса́ндровский дворе́ц императора Александра III расположен в Верхней Массандре на Южном берегу Крыма. Ныне это дворец-музей — филиал Алупкинского дворцово-паркового музея-заповедника.',
          imageURL: 'https://lh5.googleusercontent.com/p/AF1QipPwJRwkkWY6L_Zz_MGmtkskFy-GLdkxJJHCb3v3=w213-h160-k-no'
        },
        {
          id: 'водопад_учан-су',
          title: 'Водопад Учан-Су',
          previewText: 'Учан-Су́ — водопад в Крыму, расположенный на одноимённой реке, самый высокий водопад Крыма. Водопад находится на высоте 390 метров над уровнем моря на юго-западных склонах Ялтинской яйлы в шести километрах к западу от Ялты.',
          imageURL: 'http://yalta.larest.ru/uploads/sights/photos/20_800x445.jpg'
        }
      ]
    }
  }
}
</script>


