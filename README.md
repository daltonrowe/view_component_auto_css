# View Component Auto CSS

This implementation pattern aims to solve the problem of CSS pack management in a Vite based Rails setup.
It compiles each View Component's CSS file a separate entrypoint

## ⚡️ Features

- Only load CSS for components rendered on the page.
- No need to manually chunk your CSS into per route bundles.
- Use the same CSS inlined on the page, or linked externally.

## ⚖️ Tradeoffs

- Will likely result in more plentiful, smaller CSS files.
- Ordering of stylesheets is alphabetical to prevent unpredicatable specificity.
