const { environment } = require('@rails/webpacker')


// 新たに記述
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Swiper: 'swiper/swiper-bundle',
    Popper: 'popper.js'
  })
)


module.exports = environment
