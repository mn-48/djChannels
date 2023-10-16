import React, { useState } from "react";
import { useNavigate, useOutletContext } from "react-router-dom";
import { useForm } from "react-hook-form";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";

import "./Organizations.css";

const CreateNewOrganization = () => {
  // outlet context
  const {threeCategory} = useOutletContext();

  // form step handler state
  const [formStep, setFormStep] = useState(0);

  // navigate
  let navigate = useNavigate();

  const [previewImage, setPreviewImage] = useState("");

  // react hook form
  const {
    register,
    handleSubmit,
    watch,
    formState: { isValid },
  } = useForm({ mode: "all" });

  // form next step handler
  const formNextStepHandler = () => {
    setFormStep(formStep + 1);
  };

  // form previous step handler
  const formPrevStepHandler = () => {
    setFormStep(formStep - 1);
  };

  // render previous step button dynamically
  const renderPrevButton = () => {
    if (formStep > 0 && formStep < 2) {
      return (
        <button
          type="button"
          className="btn form-prev-step-button text-dark"
          onClick={formPrevStepHandler}
        >
          <FontAwesomeIcon
            className="me-2"
            icon={["fas", "arrow-alt-circle-left"]}
          />
          Go Prev Page
        </button>
      );
    }
  };

  // render next step button dynamically
  const renderNextButton = () => {
    if (formStep > 1) {
      return undefined;
    } else if (formStep === 1) {
      return (
        <button
          disabled={!isValid}
          type="submit"
          className="btn form-next-step-button text-dark"
        >
          Create
          <FontAwesomeIcon className="ms-2" icon={["fas", "paper-plane"]} />
        </button>
      );
    } else {
      return (
        <button
          disabled={!isValid}
          type="button"
          className="btn form-next-step-button text-dark"
          onClick={formNextStepHandler}
        >
          Go Next Page
          <FontAwesomeIcon
            className="ms-2"
            icon={["fas", "arrow-alt-circle-right"]}
          />
        </button>
      );
    }
  };

  // form submit handler
  const organizationRegistration = (data) => {
    console.log(data);

    if (data.facility_for_person_with_disability === true) {
      data.facility_for_person_with_disability = 1;
    }

    if (data.facility_for_person_with_disability === false) {
      data.facility_for_person_with_disability = 0;
    }

    let formData = new FormData();

    for (let i in data) {
      if (i === "logo") {
        formData.append(i, data.logo[0], data.logo[0].name);
      } else {
        formData.append(i, data[i]);
      }
    }

    // configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
        "Content-Type": "multipart/form-data",
      },
    };

    // sending http request
    axios
      .post("http://127.0.0.1:8000/api/employer/", formData, config)
      .then((res) => {
        console.log("organization created successfully!");
        navigate("/organizations-dashboard", { replace: true });
      })
      .catch((err) => {
        console.log("Organization Registration Error : ", err);
      });
  };

  console.log(watch("example")); // watch input value by passing the name of it

  return (
    <>
      <div className="row text-center bg-white mx-3 py-3 rounded text-uppercase">
        <h2>Register New Organization</h2>
      </div>

      <div className="row rounded mx-3">
        <form onSubmit={handleSubmit(organizationRegistration)}>
          {/* form step one  */}
          {formStep === 0 && (
            <>
              {/* General information  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    General information
                  </h3>
                </div>

                {/* company_name */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_name"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company name<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="company_name"
                    {...register("company_name", { required: true })}
                    placeholder="Ex: Ehsan Software"
                  />
                </div>

                {/* user name */}
                <div className="col-md-6">
                  <label
                    htmlFor="username"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    User Name<span className="required-icon-color ">*</span>
                  </label>

                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="username"
                    {...register("username", { required: true })}
                    placeholder="Ex: Jhon Doe"
                  />
                </div>

                {/* year_of_establishment  */}
                <div className="col-md-6">
                  <label
                    htmlFor="year_of_establishment"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    year of establishment
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="date"
                    className="form-control form-input-placeholder-text-size"
                    id="year_of_establishment"
                    {...register("year_of_establishment", { required: true })}
                  />
                </div>

                {/* company_size  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_size"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company size
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="company_size"
                    {...register("company_size")}
                    placeholder="Ex: 24"
                  />
                </div>

                {/* company_country  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_country"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company country
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="company_country"
                    {...register("company_country", {
                      required: true,
                    })}
                    placeholder="Ex: Bangladesh, India"
                  />
                </div>

                {/* company_district  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_district"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company district
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="company_district"
                    {...register("company_district", { required: true })}
                    placeholder="Ex: Bogura, Mymensingh"
                  />
                </div>

                {/* company_subdistrict  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_subdistrict"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company subdistrict
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="company_subdistrict"
                    {...register("company_subdistrict", { required: true })}
                    placeholder="Ex: Bogura Sadar, Sherpur"
                  />
                </div>

                {/* industry_category  */}
                <div className="col-md-6">
                  <label
                    htmlFor="industry_category"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    industry category
                    <span className="required-icon-color ">*</span>
                  </label>
                  <select
                    className="form-control form-input-placeholder-text-size"
                    id="industry_category"
                    {...register("industry_cat", { required: true })}
                  >
                    <option value=""> ---Select--- </option>
                    {threeCategory.industry_cat &&
                      threeCategory.industry_cat.map((category, index) => {
                        return (
                          <option key={index} value={category.id}>
                            {category.name}
                          </option>
                        );
                      })}
                  </select>
                </div>

                {/* industry_type  */}
                <div className="col-md-6">
                  <label
                    htmlFor="industry_type"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    industry type<span className="required-icon-color ">*</span>
                  </label>
                  <select
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="industry_type"
                    {...register("industry_type", { required: true })}
                  >
                    <option value=""> ---Select--- </option>
                    {threeCategory.industry_type &&
                      threeCategory.industry_type.map((type, index) => {
                        return (
                          <option key={index} value={type.id}>
                            {type.name}
                          </option>
                        );
                      })}
                  </select>
                </div>

                {/* functional category  */}
                <div className="col-md-6">
                  <label
                    htmlFor="functional_cat"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    functional category
                    <span className="required-icon-color ">*</span>
                  </label>
                  <select
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="functional_cat"
                    {...register("functional_cat", { required: true })}
                  >
                    <option value=""> ---Select--- </option>
                    {threeCategory.functional_cat &&
                      threeCategory.functional_cat.map((functional, index) => {
                        return (
                          <option key={index} value={functional.id}>
                            {functional.name}
                          </option>
                        );
                      })}
                  </select>
                </div>
              </div>
            </>
          )}

          {/* form step two  */}
          {formStep === 1 && (
            <>
              {/* Contact information  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    Contact information
                  </h3>
                </div>

                {/* company_address  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_address"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company address
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="company_address"
                    {...register("company_address", { required: true })}
                    placeholder="Ex: Bogura, Bangladesh"
                  />
                </div>

                {/* company_email   */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_email"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company email<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="email"
                    className="form-control form-input-placeholder-text-size"
                    id="company_email"
                    {...register("company_email", { required: true })}
                    placeholder="Ex: example@gmail.com"
                  />
                </div>

                {/* company_website  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company_website"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company website
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="url"
                    className="form-control form-input-placeholder-text-size"
                    id="company_website"
                    {...register("company_website", { required: true })}
                    placeholder="Ex: www.ehsansocial.com"
                  />
                </div>

                {/* contact_person_name  */}
                <div className="col-md-6">
                  <label
                    htmlFor="contact_person_name"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    contact person name
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="contact_person_name"
                    {...register("contact_person_name", { required: true })}
                    placeholder="Ex: Jhon Doe"
                  />
                </div>

                {/* contact_person_email  */}
                <div className="col-md-6">
                  <label
                    htmlFor="contact_person_email"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    contact person email
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="email"
                    className="form-control form-input-placeholder-text-size"
                    id="contact_person_email"
                    {...register("contact_person_email", {
                      required: true,
                    })}
                    placeholder="Ex: example@gmail.com"
                  />
                </div>

                {/* contact_person_phone */}
                <div className="col-md-6">
                  <label
                    htmlFor="contact_person_phone"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    contact person phone
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="contact_person_phone"
                    {...register("contact_person_phone")}
                    placeholder="Ex: +01xxxxxxxxx"
                  />
                </div>

                {/* contact_person_designation */}
                <div className="col-md-6">
                  <label
                    htmlFor="contact_person_designation"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    contact person designation
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="contact_person_designation"
                    {...register("contact_person_designation", {
                      required: true,
                    })}
                    placeholder="Ex: Doctor, Engineer"
                  />
                </div>
              </div>

              {/* others information  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    others information
                  </h3>
                </div>

                {/* business_description  */}
                <div className="col-md-6">
                  <label
                    htmlFor="business_description"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    business description
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="business_description"
                    {...register("business_description", { required: true })}
                    placeholder="Ex: description of your business ..."
                  />
                </div>

                {/* trade_licence_no  */}
                <div className="col-md-6">
                  <label
                    htmlFor="trade_licence_no"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    trade licence no
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="trade_licence_no"
                    {...register("trade_licence_no", {
                      required: true,
                    })}
                    placeholder="Ex: EX1000000"
                  />
                </div>

                {/* rl_no  */}
                <div className="col-md-6">
                  <label
                    htmlFor="rl_no"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    rl no<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="rl_no"
                    {...register("rl_no", { required: true })}
                    placeholder="Ex:  EX1000000"
                  />
                </div>

                {/* logo */}
                <div className={previewImage ? "col-md-3" : "col-md-6"}>
                  <label
                    htmlFor="logo"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    Logo<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="file"
                    className="form-control form-input-placeholder-text-size"
                    id="logo"
                    {...register("logo", { required: true })}
                    onChange={(e) =>
                      setPreviewImage(URL.createObjectURL(e.target.files[0]))
                    }
                  />
                </div>

                {/* user selected logo  */}
                {previewImage ? (
                  <div className="col-md-3">
                    <label
                      htmlFor="logo"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      Your Selected Logo
                    </label>
                    <div className="user-selected-logo">
                      <img src={`${previewImage}`} alt="your_image" />
                    </div>
                  </div>
                ) : undefined}

                {/* facility_for_person_with_disability  */}
                <div className="col-md-6">
                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="facility_for_person_with_disability"
                    >
                      facility for person with disability
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="facility_for_person_with_disability"
                      {...register("facility_for_person_with_disability")}
                    />
                  </div>
                </div>
              </div>
            </>
          )}

          <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
            <div className="col-6 mb-1 text-start">{renderPrevButton()}</div>
            <div className="col-6 mb-1 text-end">{renderNextButton()}</div>
          </div>
        </form>
      </div>
    </>
  );
};

export default CreateNewOrganization;
