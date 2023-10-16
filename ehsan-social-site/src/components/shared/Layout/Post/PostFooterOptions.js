import React from "react";
import Tippy from "@tippyjs/react";
import postTheme from "../../../../images/theme.svg";
import photoUpload from "../../../../images/photo_upload.svg";
import feeling from "../../../../images/feeling.svg";
import gifUpload from "../../../../images/gif_upload.svg";
import questionAnswer from "../../../../images/comment.svg";
import tag from "../../../../images/tag.svg";
import checkin from "../../../../images/checkin.svg";

function PostFooterOptions(props) {
  const { currentCategory } = props;
  return (
    <div className="post-create-icons-group create-new-post-modal-footer-left">
      <Tippy
        content={<span>Change Post Theme</span>}
        interactive={true}
        animation={"shift-toward"}
        placement={"bottom"}
      >
        <div className="icon-div">
          <img src={postTheme} alt="Add theme" />
        </div>
      </Tippy>

      <Tippy
        content={<span>Add Photo in your post</span>}
        interactive={true}
        animation={"shift-toward"}
        placement={"bottom"}
      >
        <div className="icon-div">
          <img src={photoUpload} alt="Photo_Upload" />
        </div>
      </Tippy>
      {currentCategory === "General Post" && (
        <>
          <Tippy
            content={<span>Add Feelings/Activity</span>}
            interactive={true}
            animation={"shift-toward"}
            placement={"bottom"}
          >
            <div className="icon-div">
              <img src={feeling} alt="Feeling" />
            </div>
          </Tippy>

          <Tippy
            content={<span>Add GIF from Library</span>}
            interactive={true}
            animation={"shift-toward"}
            placement={"bottom"}
          >
            <div className="icon-div">
              <img src={gifUpload} alt="Add Gif" />
            </div>
          </Tippy>
        </>
      )}

      <Tippy
        content={<span>Ask a Question</span>}
        interactive={true}
        animation={"shift-toward"}
        placement={"bottom"}
      >
        <div className="icon-div">
          <img src={questionAnswer} alt="Question Answer" />
        </div>
      </Tippy>
      <Tippy
        content={<span>Tag a Friend who Follows you</span>}
        interactive={true}
        animation={"shift-toward"}
        placement={"bottom"}
      >
        <div className="icon-div">
          <img src={tag} alt="Tag Someone" />
        </div>
      </Tippy>

      <Tippy
        content={<span>Check In and Add location </span>}
        interactive={true}
        animation={"shift-toward"}
        placement={"bottom"}
      >
        <div className="icon-div">
          <img src={checkin} alt="Check In" />
        </div>
      </Tippy>
    </div>
  );
}

export default PostFooterOptions;
