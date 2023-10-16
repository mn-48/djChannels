import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import React, { useState } from "react";
import { Link } from "react-router-dom";
import "tippy.js/animations/perspective.css";
import "tippy.js/themes/light.css";
import messages from "../../../FakeData/messages";
import messageSingleOption from "../../../FakeData/messageSingleOption";
import "./MessageDropdown.css";
import MessageSingleOption from "./MessageSignleOption/MessageSignleOption";
import MessageSingleCard from "./MessageSingleCard/MessageSingleCard";

const MessageDropdown = () => {
  const message = messages;
  // const [messageOption, setMessageOption] = useState(messageSingleOption);
  const [messageOption] = useState(messageSingleOption);
  console.log(message);

  return (
    <div>
      <div className="inner-dropdown message-inner-dropdown">
        <div className="top-area">
          <div className="message-header">
            <h1>Messenger</h1>
            <div className="action-buttons">
              <Tippy
                trigger={"click"}
                hideOnClick={true}
                animation={"perspective"}
                theme={"light"}
                placement={"left"}
                content={
                  <div className="message-main-options">
                    <h3>
                      <FontAwesomeIcon
                        icon={["fas", "cog"]}
                        className="spinner"
                      />
                      Chat Settings
                    </h3>
                    <p>Customize your messages experience</p>
                    {messageOption.map((mso) => (
                      <MessageSingleOption key={mso.id} mso={mso} />
                    ))}
                  </div>
                }
                interactive={true}
                // animation={"shift-toward"}
              >
                <span>
                  <FontAwesomeIcon icon={["fas", "cogs"]} />
                </span>
              </Tippy>

              <span>
                <FontAwesomeIcon icon={["fas", "expand"]} />
              </span>
              <span>
                <FontAwesomeIcon icon={["fas", "video"]} />
              </span>
              <span>
                <FontAwesomeIcon icon={["far", "envelope"]} />
              </span>
            </div>
          </div>
          <div className="message-search">
            <input
              type="text"
              name="messageSearch"
              id="messageSearch"
              placeholder="Search Message"
            />
          </div>
          <div className="message-body">
            {message.map((msg) => (
              <MessageSingleCard key={msg.id} msgInfo={msg} />
            ))}
          </div>
        </div>
      </div>
      <footer className="bottom-area">
        <Link to="/messages">
          <FontAwesomeIcon icon={["fas", "link"]} /> Go to all Messages
        </Link>
      </footer>
    </div>
  );
};

export default MessageDropdown;
