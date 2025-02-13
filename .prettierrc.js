/** @type {import('prettier').Config} */
const config = {
  semi: false,
  printWidth: 120,
  singleQuote: true,

  plugins: ['prettier-plugin-packagejson'],

  overrides: [
    {
      files: ['.vscode/**.json'],
      options: {
        parser: 'jsonc',
      },
    },
  ],
}

export default config
