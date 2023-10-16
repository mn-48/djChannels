import React, { useState } from "react";
import Tippy from "@tippyjs/react";
import { useSelector } from "react-redux";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Row } from "react-bootstrap";
import { Link } from "react-router-dom";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css"; // optional

import Left from "../shared/Layout/Left";
import Middle from "../shared/Layout/Middle";
import Right from "../shared/Layout/Right";
import Navigation from "../shared/Navigation/Navigation";

//Leftside Components
import homeLeftLayoutCardData from "../../FakeData/homeLeftLayoutCardData";
import homeLeft from "../../FakeData/homeLeftFavorite";
import HomeLeftLayoutCard from "../shared/Layout/HomeLeftLayoutCard/HomeLeftLayoutCard";

// Rightside Components
import wishNotificationsAPI from "../../FakeData/wishNotificationsAPI";
import HomeRightWishNotificationCard from "../shared/Layout/HomeRightWishNotificationCard/HomeRightWishNotificationCard";
import HomeRightFrequentlyMessagesCard from "../shared/Layout/HomeRightFrequentlyMessagesCard/HomeRightFrequentlyMessagesCard";
import frequentlyMessages from "../../FakeData/frequentlyMessages";

// Middle Components
import CreateNewPost from "./CreateNewPost";
import "./Home.css";

const Home = () => {
  const user = useSelector((state) => state.auth.user);
  const customUser = {
    id: user && user.consumer.id,
    iconType: "image",
    userName: user && user.consumer.username,
    imageUrl: `http://127.0.0.1:8000${user && user.consumer.photo}`,
    title: `${user && user.consumer.first_name} ${
      user && user.consumer.last_name
    }`,
    firstName: user && user.consumer.first_name,
    lastName: user && user.consumer.last_name,
    url: `profile/${user && user.consumer.username}`,
  };

  const homeLeftLayout = homeLeftLayoutCardData;

  const homeLeftFavorite = homeLeft;

  // Right Component js start
  // Wish state management and removal
  const [wishNotifications, setWishNotifications] =
    useState(wishNotificationsAPI);

  const handleWishNotificationsRemove = (id) => {
    const afterRemove = wishNotifications.filter(
      (oldItem) => oldItem.id !== id
    );
    setWishNotifications(afterRemove);
  };

  //Trending State Management
  // const [trendingNotifications, setTrendingNotifications] = useState(hashNotificationsAPI);
  // const handleTrendingNotificationsRemove = (id) => {
  //   const afterRemove = trendingNotifications.filter((oldItem)=> oldItem.id !== id);
  //   setTrendingNotifications(afterRemove);
  //   console.log('Clicked on Trending');
  // }

  //Frequently Messages
  // const [messageSender, setMessageSender] = useState(frequentlyMessages);
  const [messageSender] = useState(frequentlyMessages);

  const newMessage = () => {
    alert("New Message");
  };

  return (
    <>
      <Navigation />
      <div className="container-fluid">
        <Row>
          {/* Left  */}
          <Left name="home">
            <HomeLeftLayoutCard key={user && user.id} cardData={customUser} />
            {homeLeftLayout.map((hllcd) => (
              <HomeLeftLayoutCard key={hllcd.id} cardData={hllcd} />
            ))}

            {/* My Favourite Start */}
            <h2>
              <span className="badge bg-info">
                <FontAwesomeIcon icon={["fas", "star"]} />
              </span>
              My Favorite
            </h2>
            {homeLeftFavorite.map((hlf) => (
              <HomeLeftLayoutCard key={hlf.id} cardData={hlf} />
            ))}
            {/* My Favourite Ends */}
          </Left>

          <Middle name="home">
            <CreateNewPost></CreateNewPost>
          </Middle>

          <Right name="home">
            {
              // Wish Notification Area
              wishNotifications.length > 0 && (
                <div className="right-notification-box">
                  <div className="right-notification-headline-area">
                    <h3 className="right-notification-headline">
                      <FontAwesomeIcon icon={["fas", "gifts"]} /> Wish your
                      followings
                    </h3>
                    {wishNotifications.length > 2 ? (
                      <Link
                        to="/all-wish-notifications"
                        className="view-all-notification-btn"
                      >
                        View All
                      </Link>
                    ) : (
                      ""
                    )}
                  </div>
                  {wishNotifications.slice(0, 2).map((notificationAPI) => (
                    <HomeRightWishNotificationCard
                      key={notificationAPI.id}
                      dataInfo={notificationAPI}
                      handleWishNotificationsRemove={
                        handleWishNotificationsRemove
                      }
                    />
                  ))}
                </div>
              )
            }

            {messageSender.length > 0 && (
              <div className="right-notification-box">
                <div className="right-notification-headline-area">
                  <h3 className="right-notification-headline">
                    <FontAwesomeIcon icon={["fas", "envelope"]} /> Frequently
                    Chat
                  </h3>
                  <Tippy
                    content={<span>Write new message</span>}
                    interactive={true}
                    animation={"shift-toward"}
                  >
                    <span
                      onClick={newMessage}
                      className="view-all-notification-btn"
                    >
                      <FontAwesomeIcon icon={["fas", "envelope"]} /> New
                    </span>
                  </Tippy>
                </div>
                {messageSender.slice(0, 10).map((messageAPI) => (
                  <HomeRightFrequentlyMessagesCard
                    key={messageAPI.id}
                    cardData={messageAPI}
                  />
                ))}
              </div>
            )}
          </Right>
        </Row>
      </div>
    </>
  );
};

export default Home;
