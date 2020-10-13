process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");
if (!module.hot) {
    environment.loaders.get('sass').use.find(item => item.loader === 'sass-loader').options.sourceMapContents = false;
}

const chokidar = require("chokidar");

environment.config.devServer.before = (app, server) => {
  chokidar
    .watch([
      "config/locales/*.yml",
      "app/views/**/*.html.erb",
      'app/assets/**/*.scss'
    ])
    .on("change", () => server.sockWrite(server.sockets, "content-changed"));
};

module.exports = environment.toWebpackConfig();