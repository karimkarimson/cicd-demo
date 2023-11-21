import './App.css';
import { useState } from 'react';

function App() {
  const [ip, setIp] = useState('');
  const [ipInfo, setIpInfo] = useState({});

  function handleSubmit(event) {
    event.preventDefault();
    console.log("requesting ipinfo");
    // fetch(`http://ipinfo.io/${ip}`)
    //   .then((response) => {
    //     response.json();
    //     console.log(response)})
    //   .then((data) => {
    //     console.log(data);
    //     setIpInfo(data);
    //   });
  }
  return (
    <main>
      <h1>My Techstarter Webiste</h1>
      <section className="App">
        <label>
            Enter an IP-Address:
              <input type="text" name="ipinput" value={ip} onChange={e => setIp(e.target.value)} />
          </label>
        <button onClick={handleSubmit}>Show me Infos about this IP</button>
        </section >
      {(ipInfo) ? (
        <section>
          <p>IP: {ipInfo.ip}</p>
          <p>Land: {ipInfo.country}</p>
          <p>Stadt: {ipInfo.city}</p>
          <p>Region: {ipInfo.region}</p>
          <p>Postleitzahl: {ipInfo.postal}</p>
          <p>Location: {ipInfo.loc}</p>
          <p>Timezone: {ipInfo.timezone}</p>
          <p>ISP: {ipInfo.org}</p>
          <p>Hostname: {ipInfo.hostname}</p>
          </section>
      ) : (<></>)}
    </main>
  );
}

export default App;
