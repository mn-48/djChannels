import React from 'react';
import '../Layout.css';
import './Component39.css';

function Layout3Navbar(props) {
    return (
        <div className="col-lg-3 col-md-3 col-sm-3 layout navbar39 " style={props.mainStyle&&props.mainStyle}>
            <nav className="navbar39-nav hidden-sm hidden-xs" id="left-sidebar" style={props.innerStyle&&props.innerStyle}>
                {props.children}
            </nav>
        </div>
    )
}

export default Layout3Navbar

