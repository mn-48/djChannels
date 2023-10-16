import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Modal, Button } from "react-bootstrap";

function PostCategoryModal(props) {
  const {
    show,
    onHide,
    handleCategorySelection,
    currentCategory,
    allCategory,
  } = props;

  return (
    <Modal
      show={show}
      onHide={onHide}
      aria-labelledby="contained-modal-title-vcenter"
      centered
      size="sm"
    >
      <Modal.Body>
        <h4>Choose Post Category</h4>
        <hr />
        <div className="custom-category-select-btn-group gy-2">
          hellllo
          {allCategory?.results.length > 0 &&
            allCategory?.results.map((dt, index) => (
              <Button
                key={index}
                variant="outline-primary"
                onClick={() =>
                  handleCategorySelection(dt.name, dt.type, dt.urls)
                }
              >
                {" "}
                {dt.name === currentCategory && (
                  <FontAwesomeIcon icon={["fas", "check"]} />
                )}{" "}
                {dt.name}
              </Button>
            ))}
        </div>
      </Modal.Body>
      <Modal.Footer>
        <Button onClick={props.onHide}>Close</Button>
      </Modal.Footer>
    </Modal>
  );
}

export default PostCategoryModal;
