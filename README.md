# Astro Bookmark Dashboard

A comprehensive bookmark dashboard built with Astro featuring four main sections:

## Screenshot

![Home Page](public/screenshot.png)

## Features

### 🏠 Home Page
- **Search Bar**: Multi-search engine selector (Google, Bing, DuckDuckGo, Yahoo, Yandex, Baidu)
- **Three Link Groups**:
  - **Elektronska Pošta**: Gmail, Hotmail/Live/Outlook, Yahoo Mail, Proton Mail
  - **Info**: YouTube, Odysee, Wikipedia (EN/MK), Time and Date, Yr Weather, 24 Vesti, Time MK
  - **Klaud Prostor**: Dropbox, Google Drive, OneDrive, WeTransfer, Swiss Transfer, Cloudflare, MKHost, Netlify

### 🏛️ E-servisi Page
- Government e-services in a 5-column grid layout
- Services include: TAK Daskalo HRM, HRMIS, E-Obvrzki, E-PDD, E-Danoci, and more

### 🏢 Institucii Page
Three organized sections:
- **Ministerstva**: All government ministries (20 links)
- **Institucii**: Government institutions and agencies (20 links) 
- **Banki**: Banks and financial institutions (21 links)

### 🐧 Linux Page
Four comprehensive sections:
- **Linux Distros**: Popular distributions (20 links)
- **Linux News**: News sites and communities (20 links)
- **Linux Forums & Repos**: Forums, repositories, and resources (21 links)
- **GitHub/GitLab**: Developer repositories and resources (22 links)

## Technology Stack

- **Astro 4.x**: Static site generator
- **Pure CSS**: No external CSS frameworks
- **TypeScript**: Type-safe JavaScript
- **Responsive Design**: Mobile-first approach

## Themes

### Everforest Color Palette
Based on the Everforest Medium Dark theme with warm, natural colors:
- **Background Colors**: `#232a2e` to `#56635f` (7 shades)
- **Text Colors**: `#d3c6aa` (primary foreground)
- **Accent Colors**: Red, Orange, Yellow, Green, Aqua, Blue, Purple
- **Primary Green**: `#a7c080`
- **Dark Blue**: `#3a515d`

### Two Theme Options
1. **Solid Theme**: Clean gradient background using dark blue and dark gray
2. **Transparent Theme**: Semi-transparent elements with wallpaper background

**Theme Switcher**: Toggle button in navigation bar to switch between themes. Theme preference is saved in localStorage.

## Getting Started

1. **Install Dependencies**:
   ```bash
   npm install
   ```

2. **Start Development Server**:
   ```bash
   npm run dev
   ```

3. **Build for Production**:
   ```bash
   npm run build
   ```

4. **Preview Production Build**:
   ```bash
   npm run preview
   ```

## Project Structure

```
src/
├── layouts/
│   └── Layout.astro          # Main layout with navigation and styling
├── pages/
│   ├── index.astro          # Home page with search and link groups
│   ├── e-servisi.astro      # E-services page
│   ├── institucii.astro     # Institutions page
│   └── linux.astro          # Linux resources page
public/
└── favicon.svg              # Custom favicon
```

## Key Features

- **Theme Switcher**: Toggle between Solid and Transparent themes with localStorage persistence
- **Fully Responsive**: Works on desktop, tablet, and mobile devices
- **Search Integration**: Multi-engine search functionality (7 search engines)
- **Modern Design**: Everforest-inspired color palette with warm, natural tones
- **Fast Loading**: Optimized static site generation with Astro
- **Easy Maintenance**: Well-organized code structure
- **Accessible**: Semantic HTML and proper contrast ratios
- **Abbreviation Tooltips**: Quick reference badges on hover for all links

## Customization

The design uses CSS custom properties (variables) defined in the main layout, making it easy to customize colors and styling. Simply edit the `:root` section in [Layout.astro](src/layouts/Layout.astro) to change the color scheme.

## Browser Compatibility

- Modern browsers (Chrome 88+, Firefox 78+, Safari 14+, Edge 88+)
- Mobile browsers on iOS and Android
- Responsive design for screens from 320px to 1400px+

---

## Deployment

### Manual Git Push
```bash
git add . && git commit -m "update" && git push origin main
```

### Using PowerShell Script
```powershell
.\git-push.ps1
```

### Automatic Deployment
Configured with GitHub Actions - pushes to `main` branch automatically trigger deployment to GitHub Pages.

Built with ❤️ using Astro