import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useState } from "react";
import { Link } from "react-router-dom";
import './MessageSignleOption.css';


const MessageSignleOption = (props) => {
   
    const { id, optionName, icon, iconType, showOption, status, link } = props.mso;
    const [checkState, setCheckState] = useState(status);
    const handleCheckbox = () => {
        if (checkState === 'checked') {
            setCheckState(null);
        }
        else {
            setCheckState('checked');
        }
        //Changed value based on action
        console.log(id, checkState);
    }

    

    return showOption ? (
      <div className="single-message-option">
        <div>
          <span>
            <FontAwesomeIcon icon={[iconType, icon]} />
          </span>
          {optionName}
        </div>
        <label className="switch">
          <input
            type="checkbox"
            checked={checkState}
            onChange={() =>
              handleCheckbox()
            }
          />
          <span className="slider round"></span>
        </label>
      </div>
    ) : (
      <Link to={link} className="single-message-option">
        <div>
          <span>
            <FontAwesomeIcon icon={[iconType, icon]} />
          </span>
          {optionName}
        </div>
      </Link>
    );
};

export default MessageSignleOption;