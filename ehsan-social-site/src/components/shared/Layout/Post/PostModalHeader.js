import React from "react";
import PostPrivacy from "./PostPrivacy";
import { Modal } from "react-bootstrap";
import PostCategoryDropdown from "./PostCategoryDropdown";
import { useSelector } from "react-redux";

function PostModalHeader(props) {
  const { allCategory, currentCategory, handleCategorySelection } = props;
  const user = useSelector((state) => state.auth.user);

  return (
    <Modal.Header>
      <div className="create-new-post-modal-header-left">
        <div className="custom-avater">
          <img
            src={`http://127.0.0.1:8000${user && user.consumer.photo}`}
            alt={user && user.consumer.first_name}
          />
        </div>
        <div className="inner-text">
          <h5>{user && user.consumer.first_name}</h5>
          <PostCategoryDropdown
            allCategory={allCategory}
            currentCategory={currentCategory}
            handleCategorySelection={handleCategorySelection}
          />
        </div>
      </div>
      <PostPrivacy />
    </Modal.Header>
  );
}

export default PostModalHeader;
