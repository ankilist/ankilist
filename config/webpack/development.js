process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin")
const path = require("path")

environment.plugins.append(
  "ForkTsCheckerWebpackPlugin",
  new ForkTsCheckerWebpackPlugin({
    typescript: {
      tsconfig: path.resolve(__dirname, "../../tsconfig.json")
    },
    async: false
  })
)

module.exports = environment.toWebpackConfig()
