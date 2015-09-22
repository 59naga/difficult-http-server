DifficultHTTPServer [![NPM version][npm-image]][npm]
---

> Instant HTTP Server for Single Page Application

* static-server
* single file compiler([coffeify][A] / [jade][2-2] / [stylus][2-3])
* bower compressor

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
bower init # or `yes '' | bower init`
bower install angular-ui-router --save

# boot
dhs .
# DifficultHTTPServer at http://localhost:59798 using .
```

## Routes

### `GET /`
parse `/index.jade`

### `GET /index.js`
parse `/index.coffee` using [coffeeify][A] with [browserify-plain-jade][B] + [ng-annotate][C]

### `GET /index.css`
parse `/index.styl` with [kouto-swiss][D]

### `GET /pkgs.js` / `GET /pkgs.min.js`
compress bower files using [express-onefile][E]

### `Otherwise`
to static serving.

[A]: https://github.com/substack/coffeeify#readme
[B]: https://github.com/redhotvengeance/browserify-plain-jade#readme
[C]: https://github.com/olov/ng-annotate#readme
[D]: https://github.com/krkn/kouto-swiss#readme
[E]: https://github.com/59naga/express-onefile#readme

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
