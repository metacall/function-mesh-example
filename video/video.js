const ReactDOMServer = require('react-dom/server');

const React = require('react');

const Video = props => React.createElement("video", {
  src: props.name
});

const myFunc = name => console.log(ReactDOMServer.renderToString(React.createElement(Video, {
  name: name
})));
