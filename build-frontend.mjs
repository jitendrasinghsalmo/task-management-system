import { mkdirSync, cpSync, existsSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const sourceDir = resolve(__dirname, 'frontend');
const targetDir = resolve(__dirname, 'src/main/resources/static');

mkdirSync(targetDir, { recursive: true });
for (const entry of ['index.html', 'styles.css', 'app.js']) {
  const sourcePath = resolve(sourceDir, entry);
  if (existsSync(sourcePath)) {
    cpSync(sourcePath, resolve(targetDir, entry), { force: true });
  }
}
