module.exports = {
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": [
        "eslint:recommended",
        "plugin:vue/vue3-essential",
        "plugin:@typescript-eslint/recommended",
        // "plugin:css/recommended"
    ],
    "overrides": [
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "plugins": [
        "vue",
        "@typescript-eslint",
        // "css",
        // "scss"
    ],
    "rules": {
        "brace-style": ["error", "1tbs"],
        "curly": ["error", "multi-line"],
        "keyword-spacing": ["error", { "before": true }],
        "space-before-blocks": ["error", "always"],
        "indent": ["error", 4],// 4 or 2?
        // "semi": ["error", "always"],?
        "space-before-function-paren": ["error", "always"],

        // scss
        // "scss/at-extend-no-missing-placeholder": 2,
        // "scss/at-function-pattern": [2, { "name": "^[a-z]+([a-z0-9-]+[a-z0-9]+)?$" }],
        // "scss/at-import-no-partial-leading-underscore": 2,
    }
}
