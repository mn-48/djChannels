import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import { Navbar, NavDropdown } from "react-bootstrap";
import { Link } from "react-router-dom";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css"; // optional

import loggedInUser from "../../../FakeData/loggedInUser";
import organization from "../../../images/3d-buildings.png";
import job from "../../../images/briefcase.png";
import education from "../../../images/education.png";
import home from "../../../images/home.png";
import news from "../../../images/news.png";
import notification from "../../../images/notification.gif";
import otherReligion from "../../../images/other-religion.png";
import photos from "../../../images/photos.png";
import religion from "../../../images/religion.png";
import services from "../../../images/service.png";
import sale from "../../../images/shopping-cart.png";
import marriage from "../../../images/wedding-couple.png";
import MessageDropdown from "../MessageDropdown/MessageDropdown";
import NotificationDropdown from "../NotificationDropdown/NotificationDropdown";
import UserIconDropDown from "../../UserIconDropDown/UserIconDropDown";
import "./Navigation.css";

const Navigation = () => {
  const user = loggedInUser;

  // access user data 
  const loginUser = useSelector((state)=> state.auth.user);

  const customUserinfo = { 

    name: `${loginUser && loginUser.consumer.first_name} ${loginUser && loginUser.consumer.last_name}`,

    imageUrl: `http://127.0.0.1:8000${loginUser && loginUser.consumer.photo}`,
  }

  const handleSearch = () => {
    console.log("clicked");
    const element = document.getElementById("header-search-box");
    const search_input = document.getElementById("search_input");
    search_input.value = "";
    element.classList.toggle("header-search-box-hide");
  };

  useEffect(() => {
    const element1 = document.getElementById("header-search-box");
    element1.classList.add("header-search-box-hide");
  });

  return (
    <>
      <Navbar className="desktopNavbar fixed-top" bg="light" expand="lg">
        <div className="col-lg-3 custom-nav-left">
          <Link to="/" className="brand">
            <FontAwesomeIcon icon={["fas", "users"]} /> World Ehsan{" "}
            <small>Social Site</small>
          </Link>
        </div>

        <div className="col-lg-6 custom-nav-center">
          <Tippy
            content={<span>My home</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/">
              <img src={home} alt="Home" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Photo Timeline</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/photos">
              <img src={photos} alt="categoryPhotos" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Post or Search your desire JOB</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/job">
              <img src={job} alt="Job" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Marriage</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/marriage">
              <img src={marriage} alt="Marriage" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Find your Desire Service</span>}
            interactive={true}
            custom-dropdown
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/services">
              <img src={services} alt="services" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Buy and Sale</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/buy-sale">
              <img src={sale} alt="sale" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Search Organizations</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/organizations">
              <img src={organization} alt="organizations" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Educational Posts</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/education">
              <img src={education} alt="education" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Religious Posts</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/religion">
              {user.religion === "Islam" ? (
                <img src={religion} alt="religion" />
              ) : (
                <img src={otherReligion} alt="religion" />
              )}
            </Link>
          </Tippy>

          <Tippy
            content={<span>All News</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <Link className="custom-nav-item" to="/news">
              <img src={news} alt="news" />
            </Link>
          </Tippy>

          <Tippy
            content={<span>Search Post, Page, Group, Member</span>}
            interactive={true}
            animation={"shift-toward"}
          >
            <span
              className="custom-nav-item search-icon"
              onClick={handleSearch}
            >
              <FontAwesomeIcon icon={["fas", "search"]} />
            </span>
          </Tippy>

          <div id="header-search-box" className="header-search-box">
            <input
              type="text"
              className="search_input"
              id="search_input"
              placeholder="Search Post, Page, Group, Member"
            />
            <FontAwesomeIcon icon={["fas", "times"]} onClick={handleSearch} />
          </div>
        </div>

        <div className="col-lg-3 custom-nav-right">
          {/* Message Dropdown Start */}
          <NavDropdown
            className="custom-dropdown-message "
            title={
              <span className="custom-nav-item" to="/news">
                <FontAwesomeIcon icon={["far", "comments"]} />
                <span>620</span>
              </span>
            }
            id="basic-nav-dropdown2"
          >
            <MessageDropdown></MessageDropdown>
          </NavDropdown>
          {/* Message Dropdown Ends */}

          {/* Notification Dropdown Start */}
          <NavDropdown
            className="custom-dropdown-notification  "
            title={
              <span>
                <img src={notification} alt="notifications" />
                <span>126</span>
              </span>
            }
            id="basic-nav-dropdown3"
          >
            <NotificationDropdown />
          </NavDropdown>

          {/* User Icon Dropdown Start */}
          <NavDropdown
            className="custom-dropdown"
            title={
              <div
                className="custom-avatar"
                style={{ border: "2px solid var(--ehsan-ash-color)" }}
              >
                <img
                  src={customUserinfo.imageUrl}
                  alt={customUserinfo.name}
                />
              </div>
            }
            id="basic-nav-dropdown"
          >
            <UserIconDropDown />
          </NavDropdown>
          {/* User Icon  Dropdown Ends */}
        </div>
      </Navbar>
    </>
  );
};

export default Navigation;
