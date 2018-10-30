<template>
  <v-app light>
    <v-navigation-drawer
      :clipped="clipped"
      v-model="drawer"
      fixed
      app 
    >
      <v-list>
        <v-list-tile
          router
          :to="item.to"
          :key="i"
          v-for="(item, i) in items"
          exact
        >
          <v-list-tile-action>
            <v-icon v-html="item.icon"></v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title v-text="item.title"></v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
       
        <v-list>
            <v-list-group
              :key="item.title"
              v-for="item in attr"
              v-model="item.active"
              :prepend-icon="item.icon"
              no-action
            >
              <v-list-tile slot="activator">
                <v-list-tile-content>
                  <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                </v-list-tile-content>
              </v-list-tile>
              <v-list-tile 
                router
                :to="subItem.to"
                :key="i"
                v-for="(subItem, i) in item.items"
                >
                <v-list-tile-content>
                  <v-list-tile-title>{{ subItem.title }}</v-list-tile-title>
                </v-list-tile-content>
                <v-list-tile-action>
                  <v-icon>{{ subItem.icon }}</v-icon>
                </v-list-tile-action>
              </v-list-tile>
            </v-list-group>
          </v-list>
        
      </v-list>
    </v-navigation-drawer>


    <v-toolbar fixed app :clipped-left="clipped">

       <v-toolbar-side-icon @click="drawer = !drawer">

       </v-toolbar-side-icon>
            
      <v-btn
        icon
        @click.stop="clipped = !clipped"
      >
        <v-icon>web</v-icon>
      </v-btn>

      <v-toolbar-title v-text="title"></v-toolbar-title>
      <v-spacer></v-spacer>
    
    </v-toolbar>

    <v-content id="top">
      <v-container>
        <nuxt />
      </v-container>
    </v-content>

    <v-btn
      color="black"
      key="keyboard_arrow_up"
      @click="$vuetify.goTo('#top')"
      dark
      small
      fab
      fixed
      bottom
      right
      
    >
      <v-icon>keyboard_arrow_up</v-icon>
    </v-btn>

    <v-footer :inset="true" :absolute="true"  height="auto" app>
      <v-card flat tile class="flex">
        <v-card-title class="blue white--text">
          <strong class="subheading">Made by Alexander Dunaevski {{ new Date().getFullYear() }} <i class="fas fa-fire"></i></strong>
          <v-spacer></v-spacer>
          <v-btn
            v-for="icon in icons"
            :key="icon"
            icon
            dark
            class="mr-3 social"
          >
            <v-icon size="25px">{{ icon }}</v-icon>
          </v-btn>
        </v-card-title>
      </v-card>
    </v-footer>

  </v-app>
</template>

<style scoped>
  .social:last-child {
    margin-right: 5vw !important;
  }

  .fa-fire {
    color: rgb(238, 98, 43);
    font-size: 1.5rem
  }
</style>


<script>
  export default {
    data () {
      return {
        clipped: true,
        fixed: true,
        drawer: false,
        items: [
          { icon: 'fas fa-home', title: 'Главная', to: '/' },
          { icon: 'fas fa-info', title: 'О нас', to: '/info' }
        ],
        attr: [
          {
            icon: 'account_balance',
            active: true,
            title: 'Дворцы',
            items: [
              { title: 'Воронцовский дворец', to: '/attractions/воронцовский_дворец' },
              { title: 'Ласточкино гнездо', to: '/attractions/ласточкино_гнездо' },
              { title: 'Ливадийский дворец', to: '/attractions/ливадийский_дворец' },
              { title: 'Дворец Эмира Бухарского', to: '/attractions/дворец_эмира_бухарского' },
              { title: 'Массандровский дворец', to: '/attractions/массандровский_дворец' }
            ]
          },
          {
            icon: 'terrain',
            title: 'Горы',
            items: [
              { title: 'Медведь Гора', to: '/attractions/медведь_гора' },
              { title: 'Гора кошка', to: '/attractions/гора_кошка' },
              { title: 'Гора Ай-Петри', to: '/attractions/ай-петри' }
            ]
          },
          {
            icon: 'wb_sunny',
            title: 'Пляжи',
            items: [
              { title: 'Массандровский пляж', to: '/attractions/массандровский_пляж' },
              { title: 'Ливодийский пляж', to: '/attractions/ливадийский_пляж' }
            ]
          },
          {
            icon: 'pool',
            title: 'Аквапарки',
            items: [
              { title: 'Аквапарк Атлантида', to: '/attractions/аквапарк_атлантида' },
              { title: 'Аквапарк Голубой Залив', to: '/attractions/аквапарк_голубой_залив' }
            ]
          },
          {
            icon: 'directions_walk',
            title: 'Парки',
            items: [
              { title: 'List Item' }
            ]
          },
          {
            icon: 'content_cut',
            title: 'Конатные дороги',
            items: [
              { title: 'Канатная дорога на Ай-Петри', to: '/attractions/кантная_дорога-ай-петри' },
              { title: 'Малая канатная дорога на холм Дарсан', to: '/attractions/канатная-дорога-дарсан' }
            ]
          },
          {
            icon: 'whatshot',
            title: 'Церкви',
            items: [
              { title: 'Римско-католический костел в Ялте', to: '/attractions/римская_церковь' },
              { title: 'Собор Александра Невского', to: '/attractions/невсого' },
              { title: 'Форосская церковь', to: '/attractions/фороская_церковь' }
            ]
          },
          {
            icon: 'local_bar',
            title: 'Виноделие',
            items: [
              { title: 'ФГУП "ПАО "Массандра"', to: '/attractions/массандровский_винзавод' },
              { title: 'Винодельческий центр Магарач', to: '/attractions/магарач_винзавод' }
            ]
          },
          {
            icon: 'star_rate',
            title: 'Другое',
            items: [
              { title: 'Водопад Учан-Су', to: '/attractions/водопад_учан-су' },
              { title: 'Ялтинская Набережная', to: '/attractions/ялтинская_набережная' },
              { title: 'Никитский ботанический сад', to: '/attractions/ботанический_сад' },
              { title: 'Артек', to: '/attractions/артек' },
              { title: 'Адалары - скалы-островки', to: '/attractions/адалары' },
              { title: 'Пушкинский грот', to: '/attractions/пушкинский_грот' },
              { title: 'Музей флористики «Поляна сказок» и зоопарк «Сказка»', to: '/attractions/сказка' },
              { title: 'Ялтинский порт', to: '/attractions/ялтинский_порт' },
              { title: 'Театр морских зверей "Акватория"', to: '/attractions/акватория' },
              { title: 'Органный зал в Ливадии', to: '/attractions/органный_зал' },
              { title: 'Канатная дорога на Ай-Петри', to: '/attractions/пушкинский грот' }
            ]
          }
        ],
        icons: ['fab fa-github', 'fab fa-facebook', 'fab fa-twitter', 'fab fa-instagram', 'fab fa-vk'],
        title: 'Интерактивная карта Большой Ялты'
      }
    }
  }
</script>



