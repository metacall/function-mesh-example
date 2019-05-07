const ReactDOMServer = require('react-dom/server');
const React = require('react');

const Video = props => <video src={props.name}></video>;

const myFunc = name => console.log(ReactDOMServer.renderToString(<Video name={name} />));