import React from "react";
import { Link, Outlet } from "react-router-dom";
import { useSelector } from "react-redux";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

// components
import Layout3 from "../shared/Layout/Component39/Layout3";
import Layout9 from "../shared/Layout/Component39/Layout9";

import "./Profile.css";

const About = () => {
  // match nested route
  const user = useSelector((state) => state.auth.user);

  if (user) {
    console.log("consumer photo:", user.consumer.photo);
  }

  return (
    <div className="about">
      {user ? (
        <>
          {/* header  */}
          <div className="container px-0">
            {/* hero image  */}
            <div className="about-hero-area">
              <img
                src={`http://127.0.0.1:8000${user.consumer.photo}`}
                alt={`${user.consumer.first_name}`}
              />
            </div>

            {/* header menu bar  */}
            <div className="d-flex align-items-center justify-content-between py-3 mb-3 bg-white">
              {/* left menu  */}
              <div className="d-flex align-items-center">
                <div className="ms-3 text-uppercase">
                  <Link to="/">Home</Link>
                </div>
                <div className="ms-3 text-uppercase">
                  <Link to="/about">About</Link>
                </div>
                <div className="ms-3 text-uppercase">
                  <Link to="/friends">Friends</Link>
                </div>
                <div className="ms-3 text-uppercase">
                  <Link to="/photos">Photos</Link>
                </div>
              </div>

              {/* right menu  */}
              <div className="d-flex align-items-center">
                <div className="me-3">
                  <button className="user-profile-add-to-story-button">
                    <FontAwesomeIcon icon={["fas", "plus-circle"]} />
                    <span className="ms-2">Add To Story</span>
                  </button>
                </div>
                <div className="me-3">
                  <button className="btn user-profile-content-title-button">
                    <FontAwesomeIcon icon={["fas", "pen"]} />
                    <span className="ms-2">Edit Profile</span>
                  </button>
                </div>
              </div>
            </div>
          </div>

          {/* main content section  */}
          <div className="container mt-4 px-0">
            <div className="row">
              {/* main content left sidebar  */}
              <Layout3>
                <div>
                  <h3>About</h3>
                </div>
                <div>
                  <ul>
                    <li className="py-2 item my-2 text-capitalize">
                      <FontAwesomeIcon
                        icon={["fas", "address-card"]}
                        className="me-2"
                      />
                      <Link to="/profile">Overview</Link>
                    </li>

                    <li className="py-2 item my-2 text-capitalize">
                      <FontAwesomeIcon
                        icon={["fas", "user-graduate"]}
                        className="me-2"
                      />
                      <Link to="/profile/education">
                        Educational Qualification
                      </Link>
                    </li>

                    <li className="py-2 item my-2 text-capitalize">
                      <FontAwesomeIcon
                        icon={["fas", "address-book"]}
                        className="me-2"
                      />
                      <Link to="/profile/address">Address</Link>
                    </li>

                    <li className="py-2 item my-2 text-capitalize">
                      <FontAwesomeIcon
                        icon={["fas", "users-cog"]}
                        className="me-2"
                      />
                      <Link to="/profile/family/relation">
                        Family and Relation
                      </Link>
                    </li>

                    <li className="py-2 item my-2 text-capitalize">
                      <FontAwesomeIcon
                        icon={["fas", "phone-alt"]}
                        className="me-2"
                      />
                      <Link to="/profile/contact/info">Contact Info</Link>
                    </li>

                    <li className="py-2 item my-2 text-capitalize">
                      <FontAwesomeIcon
                        icon={["fas", "sitemap"]}
                        className="me-2"
                      />
                      <Link to="/profile/others">Others</Link>
                    </li>
                  </ul>
                </div>
              </Layout3>

              {/* main content section  */}
              <Layout9>
                <Outlet context={{ consumer: user.consumer }} />
              </Layout9>
            </div>
          </div>
        </>
      ) : (
        <>
          <div style={{ marginTop: "60px", textAlign: "center" }}>
            <h2>Login Required to Show Content of About Component</h2>
          </div>
        </>
      )}
    </div>
  );
};

export default About;
