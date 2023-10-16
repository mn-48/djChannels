import React from "react";
import Tippy from "@tippyjs/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function PostCategoryDropdown(props) {
  const { allCategory, currentCategory, handleCategorySelection } = props;
  return (
    <>
      <Tippy
        trigger={"click"}
        hideOnClick={true}
        animation={"perspective"}
        theme={"light"}
        placement={"right"}
        content={
          <div className="post-category-area">
            <h5>Change Post Category</h5>
            <ul>
              {allCategory &&
                allCategory.results.map((dt) => (
                  <li
                    key={dt.id}
                    className="left-layout-card "
                    onClick={() =>
                      handleCategorySelection(dt.name, dt.type, dt.urls)
                    }
                  >
                    {" "}
                    {dt.name === currentCategory && (
                      <FontAwesomeIcon icon={["fas", "check"]} />
                    )}{" "}
                    {dt.name}
                  </li>
                ))}
            </ul>
          </div>
        }
        interactive={true}
        // animation={"shift-toward"}
      >
        <p>
          This post type is <strong>{currentCategory}</strong>, you can change
          it from here <FontAwesomeIcon icon={["far", "caret-square-down"]} />
        </p>
      </Tippy>
    </>
  );
}

export default PostCategoryDropdown;
