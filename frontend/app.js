async function checkHealth() {
  const res = await fetch("/api/health");
  const data = await res.json();
  document.getElementById("result").innerText = JSON.stringify(data);
}

async function checkDb() {
  const res = await fetch("/api/db-check");
  const data = await res.json();
  document.getElementById("result").innerText = JSON.stringify(data);
}
