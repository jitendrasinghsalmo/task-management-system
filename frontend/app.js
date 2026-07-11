const BACKEND_BASE_URL = window.__BACKEND_URL__ || 'https://your-render-or-railway-backend-url.com';

function buildApiUrl(path) {
  const normalizedPath = path.startsWith('/') ? path : `/${path}`;
  return `${BACKEND_BASE_URL}${normalizedPath}`;
}

async function pingBackend() {
  try {
    const response = await fetch(buildApiUrl('/api/health'), {
      headers: { Accept: 'application/json' }
    });

    if (!response.ok) {
      throw new Error(`Request failed with status ${response.status}`);
    }

    const payload = await response.json().catch(() => ({}));
    return payload;
  } catch (error) {
    console.error('Backend connection failed', error);
    return null;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById('statusButton');
  if (button) {
    button.addEventListener('click', async () => {
      button.textContent = 'Checking backend...';
      const result = await pingBackend();
      button.textContent = result ? 'Backend reachable' : 'Backend not reachable';
    });
  }
});
