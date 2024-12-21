import React from 'react';
import './SideBar.css';

function SideNav({ setActiveContent }) {
  return (
    <div className="content">
      <nav className="nav-bar">
        <ul>
          <li><button className="link" onClick={() => setActiveContent('hostels')}>Inns</button></li>
          <li><button className="link" onClick={() => setActiveContent('hotels')}>Hotels</button></li>
          <li><button className="link" onClick={() => setActiveContent('touristic-sites')}>Touristic Sites</button></li>
          <li><button className="link" onClick={() => setActiveContent('transports')}>Transports</button></li>
        </ul>
      </nav>
    </div>
  );
}

export default SideNav;
