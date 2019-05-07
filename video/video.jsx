const ReactDOMServer = require('react-dom/server');
const React = require('react');

const Video = props => <video src={props.name}></video>;

const myFunc = name => ReactDOMServer.renderToString(<Video name={name} />)

module.exports = { myFunc };