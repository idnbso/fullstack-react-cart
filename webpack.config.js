module.exports = {
    entry: ['babel-polyfill', './client/index.js'],
    output: {
        path: __dirname + '/client',
        filename: 'bundle.js',
    },
    module: {
        loaders: [
            {
                test: /\.js$/, exclude: /node_modules/, loader: 'babel-loader',
                query: { presets: [ 'react', 'es2015' ] },
            },
        ],
    },
};