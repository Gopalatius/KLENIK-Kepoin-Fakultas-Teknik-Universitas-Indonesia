const realMinify = require("html-minifier").minify
const minify_options = {
	collapseBooleanAttributes: true,
	collapseWhitespace: true,
	decodeEntities: true,
	html5: true,
	minifyCSS: true,
	minifyJS: true,
	removeAttributeQuotes: true,
	removeComments: true,
	removeEmptyAttributes: true,
	removeOptionalTags: true,
	removeRedundantAttributes: true,
	removeScriptTypeAttributes: true,
	removeStyleLinkTypeAttributes: true,
	removeTagWhitespace: true,
	sortAttributes: true,
	sortClassName: true,
	trimCustomFragments: true,
}

function minify(data){
    return realMinify(data,minify_options)
}

module.exports = {minify}