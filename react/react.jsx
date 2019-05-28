const ReactDOMServer = require('react-dom/server');
const React = require('react');

/* TODO: Maybe use PDF.js to render the pdf? (https://github.com/mozilla/pdf.js) */

function ReactIndexPage(name) {
	return ReactDOMServer.renderToString(<h1>Hello { name }</h1>;
}

module.exports = {
	ReactIndexPage,
};
