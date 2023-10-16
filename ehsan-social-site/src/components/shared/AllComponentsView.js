import React from "react";
import Navigation from "./Navigation/Navigation";
import { Row } from "react-bootstrap";
import Layout3 from "./Layout/Component39/Layout3";
import Layout9 from "./Layout/Component39/Layout9";
import Layout3Navbar from "./Layout/Component39/Layout3Navbar";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function AllComponentsView() {
  return (
    <>
      <Navigation />
      <div className="container-fluid service-area  min-height-100 ">
        <div className="false-space"></div>
        <div className="false-space"></div>
        <div className="container">
          <Row>
            {/* You can pass props == props are not mandatory*/}
            <Layout3
              innerStyle={{ borderRadius: "5px", padding: "10px" }}
              mainStyle={{}}
            >
              <h2>About</h2>
              <p>
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. E
                veniet ducimus, voluptatem sapiente doloribus culpa quia fugiat
                iure? Quisquam rem officia alias sint numquam olorem, quos
                fugiat, aliquid aperiam soluta officiis?
              </p>
              <hr />

              <h2>Intro</h2>
              <ul>
                <li>
                  <FontAwesomeIcon icon={["fas", "home"]} /> Lives in{" "}
                  <Link to="/things-to-do/dhaka">Dhaka</Link>
                </li>
                <li>
                  <FontAwesomeIcon icon={["fas", "heart"]} /> Married to{" "}
                  <Link to="/profile/1115832">Mehjabin Hasan</Link>
                </li>
                <li>
                  <FontAwesomeIcon icon={["fas", "users"]} /> Followed By{" "}
                  <Link to="/followers/1115832">319 Followers</Link>
                </li>
              </ul>
            </Layout3>
            {/* You can pass props == props are not mandatory*/}
            <Layout9 innerStyle={{ backgroundColor: "tomato" }} mainStyle={{}}>
              <h1>H1 Right</h1>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam
                quam perspiciatis, ullam assumenda dolorum dolor
              </p>

              <hr />
              <h2>H2 Right</h2>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
            </Layout9>
          </Row>
          <div className="clearfix">
            <hr />
          </div>
          <Row>
            {/* You can pass props == props are not mandatory*/}
            <Layout3Navbar
              innerStyle={{
                borderRadius: "5px",
                padding: "10px 0",
                border: "1px solid rgba(0,0,0,0.5)",
                textAlign: "center",
              }}
              mainStyle={{}}
            >
              <h2>H2 Headline</h2>
              <ul>
                <li>
                  <Link className="left-layout-card" to="/gallery">
                    <div className="custom-icon">
                      <img
                        src="https://i.ibb.co/XX0BGgP/gallery.png"
                        alt="Gallery"
                      />
                    </div>
                    <div className="content">
                      <h3>Using Img Icon</h3>
                    </div>
                  </Link>
                </li>

                <li>
                  <Link className="left-layout-card" to="/gallery">
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "times"]} />
                    </div>
                    <div className="content">
                      <h3>Using Font Icon</h3>
                    </div>
                  </Link>
                </li>

                <li>
                  <Link className="left-layout-card" to="/gallery">
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "user"]} />
                    </div>
                    <div className="content">
                      <h3>Using Font Icon</h3>
                    </div>
                  </Link>
                </li>

                <li>
                  <Link className="left-layout-card" to="/gallery">
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "user"]} />
                    </div>
                    <div className="content">
                      <h3>Using Font Icon</h3>
                    </div>
                  </Link>
                </li>

                <li>
                  <Link className="left-layout-card" to="/gallery">
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "paper-plane"]} />
                    </div>
                    <div className="content">
                      <h3>Using Font Icon</h3>
                    </div>
                  </Link>
                </li>
                <li>
                  <Link
                    className="left-layout-card justify-content-between"
                    to="/gallery"
                  >
                    <div className="content">
                      <h3>Right icon Bootstrap Flex</h3>
                    </div>
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "paper-plane"]} />
                    </div>
                  </Link>
                </li>

                <li>
                  <Link
                    className="left-layout-card justify-content-start"
                    to="/gallery"
                  >
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "paper-plane"]} />
                    </div>
                    <div className="content">
                      <h3>Left icon Bootstrap Flex</h3>
                    </div>
                  </Link>
                </li>
              </ul>
            </Layout3Navbar>
            <Layout9>
              <h1>You can use Layout9 or 3 anyside</h1>
            </Layout9>
          </Row>
          <div className="clearfix">
            <hr />
          </div>
          <Row>
            <Layout9>
              <h1>You can use Layout9 or 3 anyside</h1>
            </Layout9>
            <Layout3Navbar>
              <h1>H1 Headline</h1>
              <ul>
                <li>
                  <Link className="left-layout-card" to="/gallery">
                    <div className="custom-icon">
                      <FontAwesomeIcon icon={["fas", "paper-plane"]} />
                    </div>
                    <div className="content">
                      <h3>Using Font Icon</h3>
                    </div>
                  </Link>
                </li>
                <li>
                  <a className="left-layout-card" href="/follower">
                    <div className="custom-icon">
                      <img
                        src="https://i.ibb.co/FgkhXzs/followers.png"
                        alt="Follower"
                      />
                    </div>
                    <div className="content">
                      <h3>
                        Follower <span>(12)</span>
                      </h3>
                      <p>
                        <FontAwesomeIcon icon={["fas", "dot"]} /> 2 new
                      </p>
                    </div>
                  </a>
                </li>

                <li>
                  <a className="left-layout-card" href="/follower">
                    <div className="custom-icon">
                      <img
                        src="https://i.ibb.co/FgkhXzs/followers.png"
                        alt="Follower"
                      />
                    </div>
                    <div className="content">
                      <h3>
                        Following <span>(6)</span>
                      </h3>
                      <p>
                        <FontAwesomeIcon icon={["fas", "dot"]} /> 23 new
                      </p>
                    </div>
                  </a>
                </li>
              </ul>
            </Layout3Navbar>
          </Row>
          <div className="clearfix">
            <hr />
          </div>
        </div>
      </div>
    </>
  );
}

export default AllComponentsView;
