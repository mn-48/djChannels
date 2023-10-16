import React, { useState, useEffect } from "react";
import axios from "axios";
import Tippy from "@tippyjs/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Form } from "react-bootstrap";
import cog from "../../../../images/cog.svg";

function PostPrivacy() {
  const [radioValue, setRadioValue] = useState("followers");
  const [privacyRadios, setPrivacyRadios] = useState();
  //Privacy List
  useEffect(() => {
    const privacyApiResult = async () => {
      const request = await axios.get(
        "http://127.0.0.1:8000/api/social/privacys/"
      );
      console.log("setPrivacyRadios :: ", request.data);
      setPrivacyRadios(request.data);
      return request.data;
    };
    privacyApiResult();
  }, []);
  console.log("radio selected", radioValue);

  return (
    <div className="create-new-post-modal-header-right">
      <Tippy
        trigger={"click"}
        // hideOnClick={true}
        hideonclick={true}
        animation={"perspective"}
        theme={"light"}
        placement={"left"}
        content={
          <div className="">
            <h5>Privacy Settings</h5>
            <ul>
              {privacyRadios &&
                privacyRadios.results.map((radio, idx) => (
                  <li
                    key={radio.id}
                    className="left-layout-card post-privacy-item"
                    hideOnClick={true}
                  >
                    <label htmlFor={`radio-${idx}`}>
                      <div className="post-privacy-custom-icon">
                        <FontAwesomeIcon icon={["fas", radio.icon]} />
                      </div>
                      <div className="content">
                        <h3>{radio.name}</h3>
                        <span>{radio.nameSubtitle}</span>
                      </div>
                    </label>

                    <Form.Check
                      key={idx}
                      id={`radio-${idx}`}
                      type="radio"
                      variant="secondary"
                      name="radio"
                      value={radio.name}
                      checked={radioValue === radio.name}
                      onChange={(e) => setRadioValue(e.currentTarget.value)}
                    />
                  </li>
                ))}
            </ul>
          </div>
        }
        interactive={true}
        // animation={"shift-toward"}
      >
        <div className="settings">
          <img src={cog} alt="setting" />
        </div>
      </Tippy>
    </div>
  );
}

export default PostPrivacy;
