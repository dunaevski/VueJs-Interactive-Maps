<template>
<div id="vk_comments"></div>
</template>

<script>
export default {
  head: {
    script: [
      {
        src: 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'
      },
      {
        src: '//vk.com/js/api/openapi.js?154',
        type: 'text/javascript'
      }
    ]
  },
  mounted () {
    $.getScript('//vk.com/js/api/openapi.js?154').then(() => {
      const VK = global.VK
      VK.init({apiId: 6471191, onlyWidgets: true})
      VK.Widgets.Comments('vk_comments', {limit: 10, attach: '*'})
    })
  }
}
</script>

