import React, { useState } from "react";
import { useForm } from "react-hook-form";
import { useNavigate } from "react-router-dom";
import axios from "axios";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
// svg
import OrganizationImage from "../../images/3d-buildings.png";

import "./Organizations.css";

const OrganizationDetails = ({ orgData, modalType }) => {
  // navigate
  let navigate = useNavigate();

  // show update form's state
  const [updateForm, setUpdateForm] = useState(
    modalType === "edit" ? false : true
  );

  // image preview
  const [previewImage, setPreviewImage] = useState(
    `http://127.0.0.1:8000${orgData && orgData.logo}`
  );

  // show update form
  const showUpdateFormHandler = () => {
    setUpdateForm(false);
  };

  // react hook form
  const {
    register,
    handleSubmit,
    watch,
    // formState: { errors, isValid },
  } = useForm({ mode: "all" });

  console.log(watch("example")); // watch input value by passing the name of it

  // submit updated data
  const updateHandler = async (data) => {
    console.log("updated data", data);

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

    try {
      const res = await axios.patch(
        `http://127.0.0.1:8000/api/employer/${orgData && orgData.id}/`,
        formData,
        config
      );

      console.log("organization updated successfully!", res);

      modalType === "edit"
        ? navigate("/organizations-dashboard", { replace: true })
        : setUpdateForm(true);
    } catch (err) {
      console.log("This is update error : ", err);
      modalType === "edit" ? setUpdateForm(false) : setUpdateForm(false);
    }
  };

  // back to organization
  const backOrganizatonHandler = () => {
    setUpdateForm(true);
  };

  return (
    <>
      {/* Header content */}
      <div className="d-flex mx-3 align-items-center py-2 my-3 px-3">
        <div className="organization-icon">
          <img src={OrganizationImage} alt="organization" />
        </div>
        <div className="flex-grow-1">
          <h2>Organizations Information</h2>
        </div>

        {updateForm ? (
          <>
            <button className="edit-btn" onClick={showUpdateFormHandler}>
              <FontAwesomeIcon className="me-2" icon={["fas", "edit"]} />
              Edit
            </button>
          </>
        ) : (
          ""
        )}
      </div>

      <div>
        {updateForm ? (
          <>
            <div className="row rounded mx-3">
              {/* General information  */}
              <div className="row my-3 bg-white rounded">
                <div className="col-12 mt-0 mb-2">
                  <h3 className="group-title m-0">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    General information
                  </h3>
                </div>

                {/* company_name */}
                <div className="col-md-6">
                  <h5 className="info-heading">company name</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_name}
                  </p>
                </div>

                {/* user name */}
                <div className="col-md-6">
                  <h5 className="info-heading">User Name</h5>
                  <p className="info-detail">{orgData && orgData.username}</p>
                </div>

                {/* year_of_establishment  */}
                <div className="col-md-6">
                  <h5 className="info-heading">year of establishment</h5>
                  <p className="info-detail">
                    {orgData && orgData.year_of_establishment}
                  </p>
                </div>

                {/* company_size  */}

                <div className="col-md-6">
                  <h5 className="info-heading">company size</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_size}
                  </p>
                </div>

                {/* company_country  */}
                <div className="col-md-6">
                  <h5 className="info-heading">company country</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_country}
                  </p>
                </div>

                {/* company_district  */}
                <div className="col-md-6">
                  <h5 className="info-heading">company district</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_district}
                  </p>
                </div>

                {/* company_subdistrict  */}

                <div className="col-md-6">
                  <h5 className="info-heading">company subdistrict</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_subdistrict}
                  </p>
                </div>

                {/* industry_category  */}
                <div className="col-md-6">
                  <h5 className="info-heading">industry category</h5>
                  <p className="info-detail">
                    {orgData &&
                      orgData.industry_cat &&
                      orgData.industry_cat.name}
                  </p>
                </div>

                {/* industry_type  */}
                <div className="col-md-6">
                  <h5 className="info-heading">industry type</h5>
                  <p className="info-detail">
                    {orgData &&
                      orgData.industry_type &&
                      orgData.industry_type.name}
                  </p>
                </div>

                {/* company_address  */}
                <div className="col-md-6">
                  <h5 className="info-heading">company address</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_address}
                  </p>
                </div>
              </div>

              {/* Contact Information  */}
              <div className="row my-3 bg-white rounded">
                <div className="col-12 mt-0 mb-2">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "address-book"]}
                    />
                    Contact Information
                  </h3>
                </div>

                {/* company_email   */}
                <div className="col-md-6">
                  <h5 className="info-heading">company email</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_email}
                  </p>
                </div>

                {/* contact_person_name  */}
                <div className="col-md-6">
                  <h5 className="info-heading"> contact person name</h5>
                  <p className="info-detail">
                    {orgData && orgData.contact_person_name}
                  </p>
                </div>

                {/* contact_person_phone */}
                <div className="col-md-6">
                  <h5 className="info-heading"> contact person phone</h5>
                  <p className="info-detail">
                    {orgData && orgData.contact_person_phone}
                  </p>
                </div>

                {/* contact_person_email  */}

                <div className="col-md-6">
                  <h5 className="info-heading"> contact person email</h5>
                  <p className="info-detail">
                    {orgData && orgData.contact_person_email}
                  </p>
                </div>

                {/* contact_person_designation */}
                <div className="col-md-6">
                  <h5 className="info-heading"> contact person designation</h5>
                  <p className="info-detail">
                    {orgData && orgData.contact_person_designation}
                  </p>
                </div>

                {/* company_website  */}
                <div className="col-md-6">
                  <h5 className="info-heading">company website</h5>
                  <p className="info-detail">
                    {orgData && orgData.company_website}
                  </p>
                </div>
              </div>

              {/* Others Information  */}
              <div className="row my-3 bg-white rounded">
                <div className="col-12 mt-0 mb-2">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "sitemap"]}
                    />
                    Others Information
                  </h3>
                </div>

                {/* business_description  */}
                <div className="col-md-6">
                  <h5 className="info-heading">business description</h5>
                  <p className="info-detail">
                    {orgData && orgData.business_description}
                  </p>
                </div>

                {/* trade_licence_no  */}

                <div className="col-md-6">
                  <h5 className="info-heading">trade licence no</h5>
                  <p className="info-detail">
                    {orgData && orgData.trade_licence_no}
                  </p>
                </div>

                {/* rl_no  */}
                <div className="col-md-6">
                  <h5 className="info-heading">rl no</h5>
                  <p className="info-detail">{orgData && orgData.rl_no}</p>
                </div>

                {/* facility_for_person_with_disability  */}
                <div className="col-md-6">
                  <h5 className="info-heading">
                    facility for person with disability
                  </h5>
                  <p className="info-detail">
                    {orgData && orgData.facility_for_person_with_disability
                      ? "Yes"
                      : "No"}
                  </p>
                </div>
              </div>
            </div>
          </>
        ) : (
          <>
            <div className="row rounded mx-3">
              <form onSubmit={handleSubmit(updateHandler)}>
                {/* section one  */}
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
                      company name
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="company_name"
                      {...register("company_name")}
                      defaultValue={orgData && orgData.company_name}
                    />
                  </div>

                  {/* user name */}
                  <div className="col-md-6">
                    <label
                      htmlFor="username"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      User Name
                    </label>

                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="username"
                      {...register("username")}
                      defaultValue={orgData && orgData.username}
                    />
                  </div>

                  {/* year_of_establishment  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="year_of_establishment"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      year of establishment
                    </label>
                    <input
                      type="date"
                      className="form-control form-input-placeholder-text-size"
                      id="year_of_establishment"
                      {...register("year_of_establishment")}
                      defaultValue={orgData && orgData.year_of_establishment}
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
                      defaultValue={orgData && orgData.company_size}
                    />
                  </div>

                  {/* company_country  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="company_country"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      company country
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="company_country"
                      {...register("company_country")}
                      defaultValue={orgData && orgData.company_country}
                    />
                  </div>

                  {/* company_district  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="company_district"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      company district
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="company_district"
                      {...register("company_district")}
                      defaultValue={orgData && orgData.company_district}
                    />
                  </div>

                  {/* company_subdistrict  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="company_subdistrict"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      company subdistrict
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="company_subdistrict"
                      {...register("company_subdistrict")}
                      defaultValue={orgData && orgData.company_subdistrict}
                    />
                  </div>

                  {/* industry_category  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="industry_category"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      industry category
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="industry_category"
                      {...register("industry_cat")}
                      defaultValue={
                        orgData &&
                        orgData.industry_cat &&
                        orgData.industry_cat.id
                      }
                    />
                  </div>

                  {/* industry_type  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="industry_type"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      industry type
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="industry_type"
                      {...register("industry_type")}
                      defaultValue={
                        orgData &&
                        orgData.industry_type &&
                        orgData.industry_type.name
                      }
                    />
                  </div>

                  {/* industry_type  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="industry_type"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      functional category
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="industry_type"
                      {...register("functional_cat")}
                      defaultValue={
                        orgData &&
                        orgData.functional_cat &&
                        orgData.functional_cat.name
                      }
                    />
                  </div>
                </div>

                {/* section two  */}
                <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                  {/* Contact information  */}
                  <div className="col-12 mt-0">
                    <h3 className="form-field-group-title">
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "address-book"]}
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
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="company_address"
                      {...register("company_address")}
                      defaultValue={orgData && orgData.company_address}
                    />
                  </div>

                  {/* company_email   */}
                  <div className="col-md-6">
                    <label
                      htmlFor="company_email"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      company email
                    </label>
                    <input
                      type="email"
                      className="form-control form-input-placeholder-text-size"
                      id="company_email"
                      {...register("company_email")}
                      defaultValue={orgData && orgData.company_email}
                    />
                  </div>

                  {/* company_website  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="company_website"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      company website
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="company_website"
                      {...register("company_website")}
                      defaultValue={orgData && orgData.company_website}
                    />
                  </div>

                  {/* contact_person_name  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="contact_person_name"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      contact person name
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="contact_person_name"
                      {...register("contact_person_name")}
                      defaultValue={orgData && orgData.contact_person_name}
                    />
                  </div>

                  {/* contact_person_phone */}
                  <div className="col-md-6">
                    <label
                      htmlFor="contact_person_phone"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      contact person phone
                    </label>
                    <input
                      type="number"
                      className="form-control form-input-placeholder-text-size"
                      id="contact_person_phone"
                      {...register("contact_person_phone")}
                      defaultValue={orgData && orgData.contact_person_phone}
                    />
                  </div>

                  {/* contact_person_email  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="contact_person_email"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      contact person email
                    </label>
                    <input
                      type="email"
                      className="form-control form-input-placeholder-text-size"
                      id="contact_person_email"
                      {...register("contact_person_email")}
                      defaultValue={orgData && orgData.contact_person_email}
                    />
                  </div>

                  {/* contact_person_designation */}
                  <div className="col-md-6">
                    <label
                      htmlFor="contact_person_designation"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      contact person designation
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="contact_person_designation"
                      {...register("contact_person_designation")}
                      defaultValue={
                        orgData && orgData.contact_person_designation
                      }
                    />
                  </div>
                </div>

                {/* Others information  */}
                <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                  <div className="col-12 mt-0">
                    <h3 className="form-field-group-title">
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "sitemap"]}
                      />
                      Others information
                    </h3>
                  </div>

                  {/* business_description  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="business_description"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      business description
                    </label>
                    <input
                      type="text"
                      className="form-control form-input-placeholder-text-size"
                      id="business_description"
                      {...register("business_description")}
                      defaultValue={orgData && orgData.business_description}
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
                      {...register("trade_licence_no")}
                      defaultValue={orgData && orgData.trade_licence_no}
                    />
                  </div>

                  {/* rl_no  */}
                  <div className="col-md-6">
                    <label
                      htmlFor="rl_no"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      rl no
                    </label>
                    <input
                      type="number"
                      className="form-control form-input-placeholder-text-size"
                      id="rl_no"
                      {...register("rl_no")}
                      defaultValue={orgData && orgData.rl_no}
                    />
                  </div>

                  {/* logo */}
                  <div className="col-md-3">
                    <label
                      htmlFor="logo"
                      className="form-label mb-1 multi-step-form-label-name"
                    >
                      Logo
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

                  {/* your uploaded logo  */}
                  {previewImage ? (
                    <div className="col-md-3">
                      <label
                        htmlFor="logo"
                        className="form-label mb-1 multi-step-form-label-name"
                      >
                        your uploaded logo
                      </label>
                      <div className="user-selected-logo">
                        <img src={`${previewImage}`} alt="user-logo" />
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

                {/* buttons  */}
                <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                  {/* back button */}
                  <div
                    className={
                      modalType === "edit"
                        ? "col-6 mb-1 text-start d-none"
                        : "col-6 mb-1 text-start"
                    }
                  >
                    <button
                      className="back-btn"
                      onClick={backOrganizatonHandler}
                    >
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "arrow-alt-circle-left"]}
                      />
                      Back
                    </button>
                  </div>

                  {/* update button  */}
                  <div
                    className={
                      modalType === "edit"
                        ? "col-12 mb-1 text-end"
                        : "col-6 mb-1 text-end"
                    }
                  >
                    <button type="submit" className="update-btn">
                      Update
                      <FontAwesomeIcon
                        className="ms-2 "
                        icon={["fas", "paper-plane"]}
                      />
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </>
        )}
      </div>
    </>
  );
};

export default OrganizationDetails;
