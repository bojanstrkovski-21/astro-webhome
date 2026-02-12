import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://bokiwebhome.link',
  base: '/',
  output: 'static',
  build: {
    format: 'directory'
  }
});