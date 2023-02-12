module.exports = {
  "root": true,
  "env": {
    "browser": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:vue/vue3-essential",
    "plugin:@typescript-eslint/recommended",
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
  ],
  "rules": {
    "brace-style": ["error", "1tbs"],
    "curly": ["error", "multi-line"],
    "keyword-spacing": ["error", { "before": true }],
    "space-before-blocks": ["error", "always"],
    "indent": ["error", 2],
    "semi": ["error", "always"],
    "space-before-function-paren": ["error", "always"],
  }
};
