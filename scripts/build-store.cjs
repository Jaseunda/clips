const fs = require('fs');
const path = require('path');

const APPS_DIR = path.join(__dirname, '../apps');
const FEATURED_FILE = path.join(__dirname, '../featured.json');
const OUTPUT_FILE = path.join(__dirname, '../store.json');

function main() {
  const apps = [];
  
  if (fs.existsSync(APPS_DIR)) {
    const appDirs = fs.readdirSync(APPS_DIR);
    for (const dir of appDirs) {
      if (dir.startsWith('.')) continue;
      
      const manifestPath = path.join(APPS_DIR, dir, 'manifest.json');
      if (fs.existsSync(manifestPath)) {
        try {
          const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
          apps.push(manifest);
        } catch (e) {
          console.error(`Error parsing ${manifestPath}:`, e);
          process.exit(1);
        }
      }
    }
  }

  let featured = {};
  if (fs.existsSync(FEATURED_FILE)) {
    try {
      featured = JSON.parse(fs.readFileSync(FEATURED_FILE, 'utf8'));
    } catch (e) {
      console.error(`Error parsing ${FEATURED_FILE}:`, e);
      process.exit(1);
    }
  }

  const store = {
    version: 1,
    updatedAt: new Date().toISOString(),
    featured,
    apps
  };

  fs.writeFileSync(OUTPUT_FILE, JSON.stringify(store, null, 4));
  console.log(`Successfully built store.json with ${apps.length} apps.`);
}

main();
