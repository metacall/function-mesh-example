const ReactDOMServer = require('react-dom/server');
const React = require('react');

const path = require('path');
const fs = require('fs');

const Video = props => <video src={props.name}></video>;

function RenderVideoReact(name) {
    return ReactDOMServer.renderToString(<Video name={name} />;
}

function RenderVideoFile(name, start, end) {
    const path = path.resolve(__dirname, `${name}.mov`);
    const file = fs.createReadStream(path, {start, end});

    file.close();

    return name;
}

module.exports = {
    RenderVideoReact,
    RenderVideoFile,
};
