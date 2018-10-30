<template>
  <div id="map"></div>
</template>

<style scoped>

/* Размер карты */
#map {
  height: 81vh;
  width: 99vw;
  position: relative;
  bottom: 25px;
  right: 145px;
}

@media screen and (min-width: 320px) and (max-width: 567px) {
  #map {
    width: 95vw;
    position: relative;
    bottom: 41px;
    right: 41px;
  }
}
</style>


<script>
export default {
  head: {
    script: [
      {
        src: 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'
      }
    ]
  },
  data  () {
    return {
      map: {}
    }
  },
  mounted () {
    $.getScript('//api-maps.yandex.ru/2.1/?lang=ru_RU').then(() => {
      $.getScript('/round-buttons.js').then(() => {
        const ymaps = global.ymaps
        ymaps.ready(init => {
          var myMap = new ymaps.Map('map', {
            center: [44.47710842, 34.07933485],
            zoom: 12
          })

          // Удаление элементов из карты
          myMap.controls
            .remove('searchControl')
            .remove('trafficControl')
            .remove('rulerControl')
            .remove('geolocationControl')
            .remove('zoomControl')
            .remove('typeSelector')
            .remove('fullscreenControl')

          // Инициализация кнопки для зума
          var zoomControl = new ymaps.control.ZoomControl({
            options: {
              layout: 'round#zoomLayout'
            }
          })

          // Инициализация кнопки для смены слоя
          var typeSelector = new ymaps.control.TypeSelector({
            options: {
              layout: 'round#listBoxLayout',
              itemLayout: 'round#listBoxItemLayout',
              itemSelectableLayout: 'round#listBoxItemSelectableLayout',
              float: 'none',
              position: {
                bottom: '40px',
                right: '10px'
              }
            }
          })

          // Инициализация кнопки для полного экрана
          var fullscreenControl = new ymaps.control.FullscreenControl({
            data: {
              iconType: 'expand',
              title: 'Полный экран'
            },
            options: {
              layout: 'round#buttonLayout',
              maxWidth: 120
            }
          })

          // Инициализация кнопки для определения маршрута
          var routeButton = new ymaps.control.RouteButton({
            data: {
              iconType: 'routes'
            },
            options: {
              layout: 'round#buttonLayout',
              size: 'small',
              lazy: 'true'
            }
          })

          // Добавление элементов на карту
          myMap.controls
            .add(zoomControl)
            .add(typeSelector)
            .add(fullscreenControl)
            .add(routeButton)

          // Отключение функций карты
          myMap.behaviors.disable([
            'rightMouseButtonMagnifier', // Правой кнопкой мыши увеличение
            'scrollZoom' // Скрол мышкой
          ])

          // Геоколекция меток
          var myPalace = new ymaps.GeoObjectCollection(
            {},
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/palace-48.png',
              iconImageSize: [30, 30], // размер
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var myGora = new ymaps.GeoObjectCollection(
            {},
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/alps-48.png',
              iconImageSize: [30, 30], // размер
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var myVine = new ymaps.GeoObjectCollection(
            {},
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/wine_tour-48.png',
              iconImageSize: [30, 30], // размер
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var myCableCar = new ymaps.GeoObjectCollection(
            {},
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/cable_car-48.png',
              iconImageSize: [30, 30], // размер
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var myWaterPark = new ymaps.GeoObjectCollection(
            {},
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/water_park-48.png',
              iconImageSize: [30, 30], // размер
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          // Метки для коллекции
          // Замки
          var plmTower1 = new ymaps.Placemark([44.43062279, 34.12857117], {
            balloonContentHeader:
            '<a href="/attractions/ласточкино_гнездо"><img class="img-link" src="http://www.sudak.pro/wp-content/uploads/2013/06/zxVzNBmfkY.jpg"></img></a>',
            balloonContentBody:
            '<a href="#"  class="name-link link" @click="push">Ласточкино гнездо</a>',
            balloonContentFooter:
            '<p class="link"> Крым, г. Ялта, пгт. Гаспра, Алупкинское шоссе, 9а; Добраться можно с автовокзала Ялты автобусами №27, 32, ( остановка санаторий «Парус»).</p> <a href="tel:(3654) 23-28-24" class="name-link link"><i class="fas fa-phone"></i>  (3654) 23-28-24</a>',
            hintContent: 'Ласточкино гнездо'
          })

          var plmTower2 = new ymaps.Placemark([44.517015, 34.202692], {
            balloonContentHeader:
            '<a href="#"><img class="img-link" src="https://static.tonkosti.ru/images/0/04/%D0%9C%D0%B0%D1%81%D1%81%D0%B0%D0%BD%D0%B4%D1%80%D0%BE%D0%B2%D1%81%D0%BA%D0%B8%D0%B9_%D0%B4%D0%B2%D0%BE%D1%80%D0%B5%D1%86%2C_%D0%AF%D0%BB%D1%82%D0%B0.jpg"></img></a>',
            balloonContentBody:
            '<a href="#" class="name-link link" >Массандровский дворец</a>',
            balloonContentFooter:
            '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
            hintContent: 'Массандровский дворец'
          })

          var plmTower3 = new ymaps.Placemark([44.467687, 34.143509], {
            balloonContentHeader:
            '<a href="#"><img class="img-link" src="https://firebasestorage.googleapis.com/v0/b/yandex-map.appspot.com/o/photo%2FIMG_5450.jpg?alt=media&token=20b80e15-c330-4c22-b30b-96af02349c45"></img></a>',
            balloonContentBody:
            '<a href="#" class="name-link link" >Ливадийский дворец</a>',
            balloonContentFooter:
            '<p class="link"> До Ливадийского дворца можно добраться на автобусе №100 ул. Стахановская(Массандра) — Ливадия (Дворец).</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  +7 (3654) 31-55-81</a>',
            hintContent: 'Ливадийский дворец'
          })

          var plmTower4 = new ymaps.Placemark([44.419727, 34.055325], {
            balloonContentHeader:
            '<a href="#"><img class="img-link" src="https://img.tourister.ru/files/3/4/7/5/0/7/2/3475072.jpg"></img></a>',
            balloonContentBody:
            '<a href="#" class="name-link link" >Воронцовский дворец</a>',
            balloonContentFooter:
            '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
            hintContent: 'Воронцовский дворец'
          })

          var plmTower5 = new ymaps.Placemark([44.486845, 34.157827], {
            balloonContentHeader:
            '<a href="#"><img class="img-link" src="https://www.tourprom.ru/site_media/images/poiphoto/emir1_1.jpg"></img></a>',
            balloonContentBody:
            '<a href="#" class="name-link link" >Дворец эмира Бухарского</a>',
            balloonContentFooter:
            '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
            hintContent: 'Дворец эмира Бухарского'
          })

          var plmTower6 = new ymaps.Placemark([44.486845, 34.157827], {
            balloonContentHeader:
            '<a href="#"><img class="img-link" src="https://www.tourprom.ru/site_media/images/poiphoto/emir1_1.jpg"></img></a>',
            balloonContentBody:
            '<a href="#" class="name-link link" >Кореизский Юсуповский дворецо</a>',
            balloonContentFooter:
            '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
            hintContent: 'Кореизский Юсуповский дворец'
          })

          // Вино
          var plmYaltaMagarach = new ymaps.Placemark(
            [44.4941176, 34.1556036],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Винодельческий центр Магарач</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Винодельческий центр Магарач'
            })

          var plmWine = new ymaps.Placemark(
            [44.520772, 34.188075],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://massandra.su/uploads/posts/2018-03/1520923675_dsc_6675.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >ФГУП "ПАО "Массандра"</a>',
              balloonContentFooter:
              '<p class="link">  298650, РФ, ФГУП «ПАО «Массандра» Крым, г.Ялта, ул. Винодела Егорова, д.9</p> <a href="tel: +7 978 972 73 03" class="name-link link"><i class="fas fa-phone"></i>   +7 978 972 73 03</a>',
              hintContent: 'ФГУП "ПАО "Массандра"'
            })

          // Горы
          var plmMedvedGora = new ymaps.Placemark(
            [44.558752, 34.332377],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Аю-даг (Медведь-гора)</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Аю-даг (Медведь-гора)'
            })

          var plmAiPetri = new ymaps.Placemark(
            [44.4480966, 34.056952],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Гора Ай-Петри</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Гора Ай-Петри'
            })

          var plmKoshka = new ymaps.Placemark(
            [44.4039555, 33.9931583],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Гора Кошка (Чатал-Кая)</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Гора Кошка (Чатал-Кая)'
            })

          // Канатная дорога
          var plmKanatkan = new ymaps.Placemark(
            [44.4257046, 34.0705991],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Канатная дорога на Ай-Петри, нижняя станция</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Канатная дорога на Ай-Петри, нижняя станция'
            }
          )

          var plmKanatkav = new ymaps.Placemark(
            [44.4517499, 34.0604925],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Канатная дорога на Ай-Петри, верхняя станцияк</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Канатная дорога на Ай-Петри, верхняя станция'
            }
          )

          var plmKanatka = new ymaps.Placemark(
            [44.49517, 34.16603],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Малая канатная дорога на холм Дарсан</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Малая канатная дорога на холм Дарсан'
            }
          )

          // Аквапарки
          var plmWaterPark1 = new ymaps.Placemark(
            [44.4014586, 33.984295],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >"Атлантида" - новый аквапарк в Ялте</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: '"Атлантида" - новый аквапарк в Ялте'
            }
          )

          var plmWaterPark2 = new ymaps.Placemark(
            [44.48166, 34.15189],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >"Атлантида" - новый аквапарк в Ялте</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: '"Атлантида" - новый аквапарк в Ялте'
            }
          )

          // Метки обычные
          var plmWaterfall = new ymaps.Placemark(
            [44.49191, 34.092017],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://журналкрым.рф/uploads/posts/2015-12/1449841320_vodopad-uchan-su-1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Водопад Учан-Су</a>',
              balloonContentFooter:
              '<p class="link">Воспользуйтесь услугами маршрутного такси под номером 30. В летнее время несколько машин курсируют по маршруту, зимой количество рейсов значительно уменьшается. Время в пути составит около получаса.</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  +74912950125</a>',
              hintContent: 'Учан-Су '
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/waterfall-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-5, -15] // лево вниз
            }
          )

          var plmPort = new ymaps.Placemark(
            [44.495104, 34.171778],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Ялтинский порт</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Ялтинский порт'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/water_transportation-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

          var plmPushkinGrot = new ymaps.Placemark(
            [44.5469308, 34.2960602],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Пушкинский грот</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Пушкинский грот'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/cave-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmAdakar = new ymaps.Placemark(
            [44.5421594, 34.2958403],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Адалары - скалы-островки"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Адалары - скалы-островки'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/earth_element-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmBesVetrov = new ymaps.Placemark(
            [44.5781838, 34.224692],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Беседка Ветров</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Беседка Ветров'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/pavilion-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmArtek = new ymaps.Placemark(
            [44.546977, 34.293464],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Артек</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Артек'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/children-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmNikitsBotSad = new ymaps.Placemark(
            [44.5124822, 34.2342997],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Никитский ботанический сад</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Никитский ботанический сад'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/lotus-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmMassandPlaj = new ymaps.Placemark(
            [44.497263, 34.176431],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Массандровский пляж</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Массандровский пляж'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/sunbathe-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmYaltaNaberej = new ymaps.Placemark(
            [44.4956023, 34.1683602],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Ялтинская Набережная</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Ялтинская Набережная'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/walking-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmZoo = new ymaps.Placemark(
            [44.4944543, 34.1182137],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Музей флористики «Поляна сказок» и зоопарк «Сказка»</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Музей флористики «Поляна сказок» и зоопарк «Сказка»'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/lion-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmAcua = new ymaps.Placemark(
            [44.485393, 34.122393],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Театр морских зверей "Акватория"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Театр морских зверей "Акватория"'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/dolphin-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmChirch1 = new ymaps.Placemark(
            [44.49113, 34.15629],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Римско-католический костел в Ялте"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Римско-католический костел в Ялте'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/cathedral-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmChirch2 = new ymaps.Placemark(
            [44.49557, 34.16382],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Собор Александра Невского"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Собор Александра Невского"'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/cross-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmChirch3 = new ymaps.Placemark(
            [44.404513, 33.78838],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Форосская церковь"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Форосская церковь'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/orthodox_church-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmOrgan = new ymaps.Placemark(
            [44.47562, 34.14316],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Органный зал в Ливадии"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Органный зал в Ливадии"'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/pipe_organ-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          var plmSea = new ymaps.Placemark(
            [44.481600, 34.185465],
            {
              balloonContentHeader:
              '<a href="#"><img class="img-link" src="http://visittoukraine.com/uploads/images/pages/port_yalta1.jpg"></img></a>',
              balloonContentBody:
              '<a href="#" class="name-link link" >Чёрное море"</a>',
              balloonContentFooter:
              '<p class="link"> улица пушкина</p> <a href="tel:88005553535" class="name-link link"><i class="fas fa-phone"></i>  8800555235</a>',
              hintContent: 'Чёрное море'
            },
            {
              iconLayout: 'default#image',
              iconImageHref: 'images/maps/sea_waves-48.png',
              iconImageSize: [30, 30],
              iconImageOffset: [-20, -35] // лево вниз
            }
          )

          // Добовление метки
          // myMap.geoObjects.add(myPlacemark1);

          // Добовление колекции меток с пресетами
          myPalace
            .add(plmTower1)
            .add(plmTower2)
            .add(plmTower3)
            .add(plmTower4)
            .add(plmTower5)
            .add(plmTower6)

          myGora
            .add(plmMedvedGora)
            .add(plmAiPetri)
            .add(plmKoshka)

          myVine
            .add(plmYaltaMagarach)
            .add(plmWine)

          myCableCar
            .add(plmKanatkav)
            .add(plmKanatka)
            .add(plmKanatkan)

          myWaterPark
            .add(plmWaterPark1)
            .add(plmWaterPark2)

          myMap.geoObjects
            .add(myPalace)
            .add(myGora)
            .add(myVine)
            .add(myCableCar)
            .add(myWaterPark)
            .add(plmWaterfall)
            .add(plmPort)
            .add(plmPushkinGrot)
            .add(plmAdakar)
            .add(plmBesVetrov)
            .add(plmArtek)
            .add(plmNikitsBotSad)
            .add(plmMassandPlaj)
            .add(plmYaltaNaberej)
            .add(plmZoo)
            .add(plmAcua)
            .add(plmChirch1)
            .add(plmChirch2)
            .add(plmChirch3)
            .add(plmOrgan)
            .add(plmSea)
        })
      })
    })
  }
}
</script>

