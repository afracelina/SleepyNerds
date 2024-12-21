import React, { useState } from 'react';
import ListHotel from '../../components/ListHotel/ListHotel';
import SideNav from '../../components/SideBar/SideBar';
import ListAuberge from '../../components/ListAuberge/ListAuberge';
import TSites from '../../components/TSites/TSites';
import ListeTransport from '../../components/ListeTransport/ListeTransport';
import './Home.css';

export default function Home() {
  const [activeContent, setActiveContent] = useState('hotels'); // Default content

  return (
    <div className="home">
      <SideNav setActiveContent={setActiveContent} />
      <div className="content-area">
        {activeContent === 'hostels' && <ListAuberge />}
        {activeContent === 'hotels' && <ListHotel />}
        {activeContent === 'touristic-sites' && <TSites />}
        {activeContent === 'transports' && <ListeTransport />}
      </div>
    </div>
  );
}

