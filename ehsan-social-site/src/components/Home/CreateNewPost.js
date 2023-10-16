import React, { useEffect, useState } from "react";
import PostCategoryModal from "./PostCategoryModal";
import GeneralPostModal from "../shared/PostModals/GeneralPostModal";
import EducationalPostModal from "../shared/PostModals/EducationalPostModal";
import dropDownArrow from "../../images/down-arrow.svg";
import axios from "axios";
import CreateNewPostOptions from "../shared/Layout/Post/CreateNewPostOptions";
import "./Home.css";
import { useNavigate } from "react-router-dom";

function CreateNewPost() {
  const navigate = useNavigate();
  const [modalShow, setModalShow] = useState(false);
  const [postModalShow, setPostModalShow] = useState(false);
  const [allCategory, setAllCategory] = useState();
  const [postCategory, setPostCategory] = useState("General Post");

  // Post Category GET API
  useEffect(() => {
    const apiResult = async () => {
      const request = await axios.get(
        "http://127.0.0.1:8000/api/posts/categories/"
      );

      setAllCategory(request.data);
    };
    apiResult();
  }, []);

  //Handle Category Selection (code Start)
  const handleCategorySelection = (selectedPostCategory, type, urls) => {
    setModalShow(false);
    if (type === "Individual") {
      console.log("open individual Page");
      navigate("/somewhere/else", { replace: true });
    } else {
      setPostCategory(selectedPostCategory);
      console.log("open individual modal");
      setPostModalShow(true); //Showing Post Modals
    }
  };

  // Processing which Modal need to show  (code start)
  let postModal = null;

  if (postCategory === "General Post") {
    postModal = (
      <GeneralPostModal
        show={postModalShow}
        onHide={() => setPostModalShow(false)}
        allCategory={allCategory}
        handleCategorySelection={handleCategorySelection}
        currentCategory={postCategory}
      />
    );
  }

  if (postCategory === "Educational Post") {
    postModal = (
      <EducationalPostModal
        show={postModalShow}
        onHide={() => setPostModalShow(false)}
        allCategory={allCategory}
        handleCategorySelection={handleCategorySelection}
        currentCategory={postCategory}
      />
    );
  }
  // Processing which Modal need to show  (code ends)

  return (
    <>
      <div className="create-post-area">
        <CreateNewPostOptions />
        <div className="post-create-button-group">
          <span onClick={() => setModalShow(true)}>
            {postCategory} &nbsp; <img src={dropDownArrow} alt={postCategory} />{" "}
          </span>
          <span onClick={() => setPostModalShow(true)}> Create Post </span>
        </div>
      </div>

      <PostCategoryModal
        show={modalShow}
        onHide={() => setModalShow(false)}
        handleCategorySelection={handleCategorySelection}
        currentCategory={postCategory}
        allCategory={allCategory}
      />
      {postModal}
    </>
  );
}
export default CreateNewPost;
