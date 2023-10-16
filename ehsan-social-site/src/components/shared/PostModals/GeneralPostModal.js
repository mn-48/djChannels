import React from "react";
import { Modal, Button } from "react-bootstrap";
import PostFooterOptions from "../Layout/Post/PostFooterOptions";
import PostModalHeader from "../Layout/Post/PostModalHeader";
import "./PostModals.css";

function GeneralPostModal(props) {
  const {
    show,
    onHide,
    allCategory,
    handleCategorySelection,
    currentCategory,
  } = props;

  return (
    <Modal
      show={show}
      onHide={onHide}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
      className="post-modal-area"
    >
      <PostModalHeader
        allCategory={allCategory}
        currentCategory={currentCategory}
        handleCategorySelection={handleCategorySelection}
      />

      <Modal.Body>
        <h4>Centered Modal</h4>
        <p>
          Cras mattis consectetur purus sit amet fermentum. Cras justo odio,
          dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac
          consectetur ac, vestibulum at eros.
        </p>
      </Modal.Body>

      <Modal.Footer>
        <PostFooterOptions currentCategory={currentCategory} />
        <div className="create-new-post-modal-footer-right">
          <Button onClick={onHide}>Post</Button>
          <Button variant="outline-secondary" onClick={onHide}>
            Cancel
          </Button>
        </div>
      </Modal.Footer>
    </Modal>
  );
}

export default GeneralPostModal;
