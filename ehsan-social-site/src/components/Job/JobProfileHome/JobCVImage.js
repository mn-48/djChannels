import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useEffect, useState } from "react";
import pdfIcon from "../../../images/pdf.png";

const JobCVImage = () => {
  function refreshPage(props) {
    if (props === "closeBtnClicked") {
      setOnEdit(false);
    }
    // window.location.reload(false);
  }

  /******* Dynamic Class code starts here *******/
  const [onEdit, setOnEdit] = useState(false);
  /******** Dynamic class code ends here*/

  const [CVFiles, setCVFiles] = useState({});

  const filesOfCV = async () => {
    const res = await axios.get("http://127.0.0.1:8000/api/jobs/jobprocreate/");
    const data = res.data;
    setCVFiles(data);
  };
  useEffect(() => {
    filesOfCV();
  }, []);

  const [isCollapsedCVDiv, setIsCollapsedCVDiv] = useState(false);

  const [image, setImage] = useState(null);
  const [pdf, setPdf] = useState(null);
  const [updated, setUpdated] = useState(false);

  const onImageChange = (e) => setImage(e.target.files[0]);
  const onPDFChange = (e) => setPdf(e.target.files[0]);

  const onSubmit = async (e) => {
    e.preventDefault();

    const config = {
      headers: {
        Accept: "application/json",
        "Content-Type": "multipart/form-data",
      },
    };

    const formData = new FormData();

    if (image) {
      formData.append("cv_photo", image);
    }
    if (pdf) {
      formData.append("cv_upload", pdf);
    }

    const body = formData;

    console.log(formData.cv_photo);

    try {
      const res = await axios.post(
        "http://127.0.0.1:8000/api/jobs/jobprocreate/",
        body,
        config
      );

      if (res.status === 201) {
        setUpdated(!updated);
        console.log(res);
      }
      if (res.status === 200) {
        console.log("successed", res);
      }
    } catch (err) {
      console.log(err);
    }
    // refreshPage() //calling the page reloader function
  };
  return (
    <>
      <div className="rounded mx-3">
        <button
          type="button"
          className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
          onClick={() => setIsCollapsedCVDiv(!isCollapsedCVDiv)}
        >
          {isCollapsedCVDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Curriculum Vitae & Photo
        </button>
        {isCollapsedCVDiv && (
          <form className="form-group mb-3" onSubmit={onSubmit}>
            <div className="mx-3">
              <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                <div className={`${onEdit ? "d-none" : "col-2 ms-auto"}`}>
                  <button
                    type="button"
                    onClick={() => setOnEdit(true)}
                    className="btn btn-primary px-2"
                  >
                    <FontAwesomeIcon className="me-1" icon={["fas", "edit"]} />{" "}
                    Edit
                  </button>
                </div>
                <div className={`${!onEdit ? "row" : "d-none"}`}>
                  <div className="col-6 text-center my-auto">
                    <img
                      src={`http://127.0.0.1:8000${CVFiles.cv_photo}`}
                      alt="Your CV"
                      width="150"
                      height="200"
                    />
                    <br />
                    <small>Your photo on CV</small>
                  </div>
                  <div className="col-6 text-center my-auto">
                    {`http://127.0.0.1:8000${CVFiles && CVFiles.cv_upload}` ? (
                      <a
                        href={`http://127.0.0.1:8000${
                          CVFiles && CVFiles.cv_upload
                        }`}
                        target="_blank"
                        rel="noreferrer"
                      >
                        <img
                          className="pdfDeco"
                          src={pdfIcon}
                          id="pdfCV"
                          alt="a pdf file"
                        />{" "}
                        <br />
                        <label id="lblHover" htmlFor="pdfCV">
                          View CV
                        </label>
                      </a>
                    ) : (
                      <button
                        onClick={() => setOnEdit(true)}
                        className="btn btn-primary"
                      >
                        Upload File
                      </button>
                    )}
                    <br />
                  </div>
                </div>
                <div className={`${onEdit ? "col-12" : "d-none"}`}>
                  <div className="form-group">
                    <label
                      className="form-label form-field-group-title"
                      htmlFor="image"
                    >
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "file-image"]}
                      />{" "}
                      Upload Image
                    </label>
                    <input
                      className="form-control"
                      type="file"
                      name="cv_photo"
                      accept="image/*"
                      // placeholder={`http://127.0.0.1:8000${CVFiles.cv_photo}`}
                      onChange={onImageChange}
                      required={!CVFiles.cv_photo}
                    />
                  </div>
                </div>
                <div className={`${onEdit ? "col-12" : "d-none"}`}>
                  <div className="form-group">
                    <label
                      className="form-label form-field-group-title"
                      htmlFor="image"
                    >
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "file-pdf"]}
                      />{" "}
                      Upload CV
                      <small className="text-dark ms-2"> (pdf file only)</small>
                    </label>
                    <input
                      className="form-control"
                      type="file"
                      name="cv_upload"
                      accept="application/pdf"
                      onChange={onPDFChange}
                      required={!CVFiles.cv_upload}
                    />
                  </div>
                </div>
              </div>
              <button
                type="reset"
                onClick={() => refreshPage("closeBtnClicked")}
                className={`btn btn-primary px-2 me-2 ${!onEdit && "d-none"}`}
              >
                <FontAwesomeIcon className="me-1" icon={["fas", "times"]} />{" "}
                Close
              </button>
              <button
                className={`btn btn-primary px-2 me-2 ${!onEdit && "d-none"}`}
                onClick={() => setOnEdit(!onEdit)}
                type="submit"
              >
                Submit
              </button>
            </div>
          </form>
        )}
      </div>
    </>
  );
};

export default JobCVImage;
