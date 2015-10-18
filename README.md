DifficultHTTPServer [![NPM version][npm-image]][npm]
---

> Instant HTTP Server for Single Page Application

* static-server
* bower compressor
* single file compiler([coffee-reactify][A] / [jade][2-2] / [stylus][2-3])

# Usage

```bash
npm install difficult-http-server --global

# create empty project
mkdir my-project
cd my-project

# create empty files(requirement)
dhs touch
tree .
# my-project
# ├── index.coffee
# ├── index.jade
# └── index.styl

# fetch packages(optional)
npm install bower --global
bower init # or `echo '{"name":"'$(basename $PWD)'"}' > bower.json`
bower install angular-ui-router --save

# boot
dhs . --open
# DifficultHTTPServer at http://localhost:59798 using .
```

`index.jade`

```jade
doctype html
html
  head
    meta(charset="UTF-8")
    title DifficultHTTPServer
    script(src="pkgs.js")
    script(src="index.js")
    link(href="index.css" rel="stylesheet")
  body
    h1 hello dhs
```

## Other options
See also `$ dhs`

## Routes

### `GET /`
parse `/index.jade`

### `GET /index.js`
parse `/index.coffee` using [coffee-reactify][A] with [ng-annotate][C] + [jadeify][B] + [brfs][F]

### `GET /index.css`
parse `/index.styl` with [kouto-swiss][D]

### `GET /pkgs.js` / `GET /pkgs.min.js`
combine [dependencies of /bower.json](https://github.com/ck86/main-bower-files#options) using [express-onefile][E]

### `Otherwise`
to static serving. (__If a static file exists, the middlewares will not be executed__)

[A]: https://github.com/jsdf/coffee-reactify#readme
[B]: https://github.com/domenic/jadeify#readme
[C]: https://github.com/olov/ng-annotate#readme
[D]: https://github.com/krkn/kouto-swiss#readme
[E]: https://github.com/59naga/express-onefile#readme
[F]: https://github.com/substack/brfs#readme

# Example
* [narou.berabou.me](https://github.com/59naga/narou.berabou.me) `http://syosetu.com/` Vertical Reader
* [vpn.berabou.me](https://github.com/59naga/vpn.berabou.me) MikuMikuDance Vocaloid-Pose-Data(`.vpd`) Viewer 
* [nicolive.berabou.me](https://github.com/59naga/nicolive.berabou.me) `http://live.nicovideo.jp/` Comment Viewer

# Awesome converters
* [js2coffee 2.0 — convert JavaScript to CoffeeScript](http://js2.coffee/) by [Rico Sta. Cruz](https://github.com/rstacruz)
* [HTML2Jade - HTML to Jade Online Realtime Converter](http://html2jade.org/) by [Don Park
](https://github.com/donpark)
* [Css2Stylus - Convert your #CSS into #Stylus!](http://css2stylus.com/) by [Denis Ciccale](https://github.com/dciccale)

# See also
* [express][1]
* [express-cjs][2] ([coffee-script][2-1] / [jade][2-2] / [stylus][2-3])
* [express-onefile][3] ([bower][3-1] / [onefile][3-2])
* __difficult-http-server__

[1]: https://github.com/strongloop/express#readme

[2]: https://github.com/59naga/express-cjs#readme
[2-1]: https://github.com/jashkenas/coffee-script#readme
[2-2]: https://github.com/jadejs/jade#readme
[2-3]: https://github.com/stylus/stylus#readme

[3]: https://github.com/59naga/express-onefile#readme
[3-1]: https://github.com/bower/bower#readme
[3-2]: https://github.com/59naga/onefile#readme

License
---
[MIT][License]

[License]: http://59naga.mit-license.org/

[sauce-image]: http://soysauce.berabou.me/u/59798/difficult-http-server.svg
[sauce]: https://saucelabs.com/u/59798
[npm-image]:https://img.shields.io/npm/v/difficult-http-server.svg?style=flat-square
[npm]: https://npmjs.org/package/difficult-http-server
[travis-image]: http://img.shields.io/travis/59naga/difficult-http-server.svg?style=flat-square
[travis]: https://travis-ci.org/59naga/difficult-http-server
[coveralls-image]: http://img.shields.io/coveralls/59naga/difficult-http-server.svg?style=flat-square
[coveralls]: https://coveralls.io/r/59naga/difficult-http-server?branch=master
