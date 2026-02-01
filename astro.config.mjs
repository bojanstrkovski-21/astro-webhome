import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://bojanstrkovski-21.github.io',
  base: '/astro-webhome',
  output: 'static',
  build: {
    format: 'directory'
  }
});