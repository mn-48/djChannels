import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import React from "react";
import "tippy.js/animations/perspective.css";
import "tippy.js/themes/light.css";
import "./MessageSingleCard.css";

const MessageSingleCard = (props) => {
  const { imageUrl, from, text, ago, online } = props.msgInfo;
  const fewText = text.substr(0, 38) + "..";

  return (
    <div className="singleMessageCard">
      <div
        className="col-lg-2 col-md-2 col-sm-2"
        style={{ height: "50px", position: "relative" }}
      >
        <div
          className="custom-avatar-sm "
          style={{ border: "1px solid var(--ehsan-ash-color)" }}
        >
          <img src={imageUrl} alt={from} />
        </div>
      </div>

      <div className="content col-lg-10 col-md-10 col-sm-10">
        <h3>
          {from}
          <span className="badge">{ago}</span>
        </h3>
        <p className="text-justify">{fewText}</p>
        <Tippy
          trigger={"click"}
          hideOnClick={true}
          animation={"perspective"}
          theme={"light"}
          content={
            <div className="message-options">
              <p onClick={() => alert(from)}>
                <FontAwesomeIcon icon={["fas", "check"]} />
                Mark as read
              </p>
              <p>
                <FontAwesomeIcon icon={["far", "comment"]} />
                Open in Messenger
              </p>
              <p>
                <FontAwesomeIcon icon={["fas", "comment-slash"]} />
                Mute Conversation
              </p>
              <p>
                <FontAwesomeIcon icon={["fas", "user"]} />
                View Profile
              </p>
              <p>
                <FontAwesomeIcon icon={["fas", "microphone"]} />
                Audio Call
              </p>
              <p>
                <FontAwesomeIcon icon={["fas", "video"]} />
                Video Call
              </p>
            </div>
          }
          interactive={true}
          // animation={"shift-toward"}
        >
          <span className="action-btn">
            <FontAwesomeIcon icon={["fas", "ellipsis-v"]} />
          </span>
        </Tippy>
        <span className="active-inactive">
          <FontAwesomeIcon
            className={online ? "active" : "inactive"}
            icon={["fas", "circle"]}
          />
        </span>
      </div>
    </div>
  );
};

export default MessageSingleCard;
