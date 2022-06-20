import { resolve } from "path";
import { path } from "app-root-path";

export default {
    mode: "development",
    target: "web",
    entry: resolve(path, "app"),
    output: {
        filename: "client.js",
        path: resolve(path, "public")
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /(node_modules)/,
                use: "babel-loader"
            }
        ]
    }
}