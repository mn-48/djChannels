import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useForm } from "react-hook-form";
import "./Marriage.css";

const MarriageEdit = () => {
  // form step state
  const [formStep, setFormStep] = useState(0);

  // react-hook-form
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors, isValid },
  } = useForm({ mode: "all" });

  // form next step handler
  const formNextStepHandler = () => {
    setFormStep(formStep + 1);
  };

  // form previous step handler
  const formPrevStepHandler = () => {
    setFormStep(formStep - 1);
  };

  // render previous step button dynamiclly
  const renderPrevButton = () => {
    if (formStep > 0 && formStep < 3) {
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
          Prev Page
        </button>
      );
    }
  };

  // render next step button dynamiclly
  const renderNextButton = () => {
    if (formStep > 2) {
      return undefined;
    } else if (formStep === 2) {
      return (
        <button
          disabled={!isValid}
          type="submit"
          className="btn form-next-step-button text-dark"
        >
          Submit
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
          Next Page
          <FontAwesomeIcon
            className="ms-2"
            icon={["fas", "arrow-alt-circle-right"]}
          />
        </button>
      );
    }
  };

  // form submit handler
  const onMarriageProfileEdit = (data) => {
    console.log("Marriage Profile Form Data", data);
  };

  console.log(watch("example")); // watch input value by passing the name of it

  return (
    <div>
      {/* header section  */}
      <div className="row text-center bg-white mx-3 py-5 rounded text-uppercase">
        <h2>Registration</h2>
      </div>

      {/* Marriage profile edit form  */}
      <div className="row rounded mx-3">
        <form onSubmit={handleSubmit(onMarriageProfileEdit)}>
          {/* form step one  */}
          {formStep === 0 && (
            <>
              {/* general information  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    general information
                  </h3>
                </div>

                {/* Full Name  */}
                <div className="col-md-6">
                  <label
                    htmlFor="fullName"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    Full Name<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="fullName"
                    {...register("full_name", { required: true })}
                    placeholder="Ex: Jhon Doe"
                  />
                  {errors.full_name && (
                    <span className="text-danger">This field is required</span>
                  )}
                </div>

                {/* Sur Name  */}
                <div className="col-md-6">
                  <label
                    htmlFor="surName"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    Sur Name
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="surName"
                    {...register("sur_name")}
                    placeholder="Ex: Sheikh, Bhuyan ..."
                  />
                </div>

                {/* Age  */}
                <div className="col-md-6">
                  <label
                    htmlFor="age"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    Age<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="age"
                    {...register("age", { required: true, min: 18 })}
                    placeholder="Ex: 24"
                  />
                </div>

                {/* Profile Photo  */}
                <div className="col-md-6">
                  <label
                    htmlFor="profile_photo"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    Profile Photo<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="file"
                    className="form-control form-input-placeholder-text-size"
                    id="profile_photo"
                    {...register("profile_photo", {required: true})}
                  />
                </div>

                {/* mother tongue  */}
                <div className="col-md-6">
                  <label
                    htmlFor="mother_tongue"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    mother tongue<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="mother_tongue"
                    {...register("mother_tongue", { required: true })}
                    placeholder="Ex: English,Bengali, Hindi ..."
                  />
                </div>
              </div>

              {/* Address  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "address-book"]}
                    />
                    Address
                  </h3>
                </div>

                {/* present address  */}
                <div className="col-md-6">
                  <label
                    htmlFor="present_address"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    present address<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="present_address"
                    {...register("present_address", { required: true })}
                    placeholder="Ex: Dhaka, Bangladesh"
                  />
                </div>

                {/* permanent address  */}
                <div className="col-md-6">
                  <label
                    htmlFor="permanent_address"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    permanent address<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="permanent_address"
                    {...register("permanent_address", { required: true })}
                    placeholder="Ex: Bogura, Rajshahi"
                  />
                </div>

                {/* district (permanent)  */}
                <div className="col-md-6">
                  <label
                    htmlFor="district"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    district (permanent)
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="district"
                    {...register("district")}
                    placeholder="Ex: Rajshahi"
                  />
                </div>

                {/* state (permanent)  */}
                <div className="col-md-6">
                  <label
                    htmlFor="state"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    state (permanent)
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="state"
                    {...register("state")}
                    placeholder="Ex: Rajshahi"
                  />
                </div>

                {/* birth country  */}
                <div className="col-md-6">
                  <label
                    htmlFor="birth_country"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    birth country
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="birth_country"
                    {...register("birth_country")}
                    placeholder="Ex: Bangladesh"
                  />
                </div>

                {/* grow up country  */}
                <div className="col-md-6">
                  <label
                    htmlFor="grow_up_country"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    grow up country
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="grow_up_country"
                    {...register("grow_up_country")}
                    placeholder="Ex: Bangladesh"
                  />
                </div>

                {/* residency country  */}
                <div className="col-md-6">
                  <label
                    htmlFor="residency_country"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    residency country
                     <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="residency_country"
                    {...register("residency_country", { required: true })}
                    placeholder="Ex: Turkey"
                  />
                </div>
              </div>
            </>
          )}

          {/* form step two  */}
          {formStep === 1 && (
            <>
              {/* working status  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "briefcase"]}
                    />
                    working status
                  </h3>
                </div>

                {/* company name  */}
                <div className="col-md-6">
                  <label
                    htmlFor="company"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    company name<span className="required-icon-color">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="company"
                    {...register("company", { required: true })}
                    placeholder="Ex: Ehsan Software"
                  />
                </div>

                {/* work location  */}
                <div className="col-md-6">
                  <label
                    htmlFor="work_location"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    work location<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="work_location"
                    {...register("work_location", { required: true })}
                    placeholder="Ex: Bogura, Bangladesh"
                  />
                </div>

                {/* working from  */}
                <div className="col-md-6">
                  <label
                    htmlFor="working_from"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    working from
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="working_from"
                    {...register("working_from")}
                    placeholder="Ex: Remote, Office"
                  />
                </div>

                {/* salary  */}
                <div className="col-md-6">
                  <label
                    htmlFor="salary"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    salary<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="salary"
                    {...register("salary", { required: true, min: 0 })}
                    placeholder="Ex: $500"
                  />
                </div>

                {/* employed by  */}
                <div className="col-md-6">
                  <label
                    htmlFor="employed_by"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    employed by
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="employed_by"
                    {...register("employed_by")}
                    placeholder="Ex: Egency, self ..."
                  />
                </div>
              </div>

              {/* physical and helth status  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "running"]}
                    />
                    Physical and Health Status
                  </h3>
                </div>

                {/* body type  */}
                <div className="col-md-6">
                  <label
                    htmlFor="body_type"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    body type
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="body_type"
                    {...register("body_type")}
                    placeholder="Ex: Thin, Medium, Large ..."
                  />
                </div>

                {/* eye color  */}
                <div className="col-md-6">
                  <label
                    htmlFor="eye_color"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    eye color
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="eye_color"
                    {...register("eye_color")}
                    placeholder="Ex: Green, Black ..."
                  />
                </div>

                {/* hair color  */}
                <div className="col-md-6">
                  <label
                    htmlFor="hair_color"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    hair color
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="hair_color"
                    {...register("hair_color")}
                    placeholder="Ex: Black, White ..."
                  />
                </div>

                {/* complexion  */}
                <div className="col-md-6">
                  <label
                    htmlFor="complexion"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    complexion <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="complexion"
                    {...register("complexion", { required: true })}
                    placeholder="Ex: White, Black ..."
                  />
                </div>

                {/* any disability  */}
                <div className="col-md-6">
                  <label
                    htmlFor="any_disability"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    any disability<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="any_disability"
                    {...register("any_disability", { required: true })}
                    placeholder="Ex: Damage Hand, Leg ..."
                  />
                </div>

                {/* smoke  */}
                <div className="col-md-6">
                  <label
                    htmlFor="do_u_smoke"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    do you smoke
                  </label>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="do_u_smoke_yes"
                      // name="smoke"
                      {...register("do_u_smoke", { required: true })}
                    />
                    <label
                      className="form-check-label"
                      htmlFor="do_u_smoke_yes"
                    >
                      Yes
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input "
                      type="radio"
                      id="do_u_smoke_no"
                      {...register("do_u_smoke", { required: true })}
                      checked
                    />
                    <label className="form-check-label" htmlFor="do_u_smoke_no">
                      No
                    </label>
                  </div>
                </div>

                {/* drink  */}
                <div className="col-md-6">
                  <label
                    htmlFor="do_u_drink"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    do you drink
                  </label>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="do_u_drink"
                      {...register("do_u_drink")}
                    />
                    <label className="form-check-label" htmlFor="do_u_drink-y">
                      Yes
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="do_u_drink-n"
                      // name="smoke"
                      {...register("do_u_drink")}
                      checked
                    />
                    <label className="form-check-label" htmlFor="do_u_drink-n">
                      No
                    </label>
                  </div>
                </div>

                {/* diet  */}
                <div className="col-md-6">
                  <label
                    htmlFor="diet"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    diet
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="diet"
                    {...register("diet")}
                    placeholder="Ex: Vegetarian, Non Vegetarian ..."
                  />
                </div>
              </div>
            </>
          )}

          {/* form step three  */}
          {formStep === 2 && (
            <>
              {/* family status  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "users-cog"]}
                    />
                    Family Information
                  </h3>
                </div>

                {/* family type  */}
                <div className="col-md-6">
                  <label
                    htmlFor="family_type"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    family type
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="family_type"
                    {...register("family_type")}
                    placeholder="Ex: Single, Joint ..."
                  />
                </div>

                {/* family status  */}
                <div className="col-md-6">
                  <label
                    htmlFor="family_status"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    family status<span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="family_status"
                    {...register("family_status", { required: true })}
                    placeholder="Ex: High, Middle, Low ..."
                  />
                </div>

                {/* have child  */}
                <div className="col-md-6">
                  <label
                    htmlFor="have_child"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    have child
                  </label>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="have_child_yes"
                      {...register("have_child")}
                      checked
                    />
                    <label
                      className="form-check-label"
                      htmlFor="have_child_yes"
                    >
                      Yes
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="have_child_no"
                      {...register("have_child")}
                    />
                    <label className="form-check-label" htmlFor="have_child_no">
                      No
                    </label>
                  </div>
                </div>

                {/* no of girl child of your father  */}
                <div className="col-md-6">
                  <label
                    htmlFor="no_of_girl_child_of_your_father"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    no of girl child of your father
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="no_of_girl_child_of_your_father"
                    {...register("no_of_girl_child_of_your_father", {min:0})}
                    placeholder="Ex: 1/2/3 ..."
                  />
                </div>

                {/* no of boy child of your father  */}
                <div className="col-md-6">
                  <label
                    htmlFor="no_of_boy_child_of_your_father"
                    className="form-label mb-1 mb-1 multi-step-form-label-name"
                  >
                    no of boy child of your father
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="no_of_boy_child_of_your_father"
                    {...register("no_of_boy_child_of_your_father", {min: 0})}
                    placeholder="Ex: 1/2/3 ..."
                  />
                </div>
              </div>

              {/* Extra Information  */}
              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "sitemap"]}
                    />
                    Extra Information
                  </h3>
                </div>

                {/* interest */}
                <div className="col-md-6">
                  <label
                    htmlFor="interest"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    interest
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="interest"
                    {...register("interest")}
                    placeholder="Ex: Travelling, Writing ..."
                  />
                </div>

                {/* favourite dress style  */}
                <div className="col-md-6">
                  <label
                    htmlFor="fav_dress_style"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    favourite dress style
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="fav_dress_style"
                    {...register("fav_dress_style")}
                    placeholder="Ex: Traditional, Casual ..."
                  />
                </div>

                {/* favourite color  */}
                <div className="col-md-6">
                  <label
                    htmlFor="fav_color"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    favourite color
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="fav_color"
                    {...register("fav_color")}
                    placeholder="Ex: Blue, Green ..."
                  />
                </div>

                {/* tv shows  */}
                <div className="col-md-6">
                  <label
                    htmlFor="tv_shows"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    tv shows
                  </label>
                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="tv_shows"
                    {...register("tv_shows")}
                    placeholder="Ex: Dark, Money Heist ..."
                  />
                </div>

                {/* know dancing  */}
                <div className="col-md-6">
                  <label
                    htmlFor="know_dancing"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    know dancing
                  </label>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="know_dancing_yes"
                      {...register("know_dancing")}
                    />
                    <label
                      className="form-check-label"
                      htmlFor="know_dancing_yes"
                    >
                      Yes
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="know_dancing_no"
                      // name="smoke"
                      {...register("know_dancing")}
                      checked
                    />
                    <label className="form-check-label" htmlFor="know_dancing_no">
                      No
                    </label>
                  </div>
                </div>

                {/* know singing  */}
                <div className="col-md-6">
                  <label
                    htmlFor="know_singing"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    know singing
                  </label>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="know_singing_yes"
                      // name="smoke"
                      {...register("know_singing")}
                    />
                    <label
                      className="form-check-label"
                      htmlFor="know_singing_yes"
                    >
                      Yes
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="know_singing_no"
                      // name="smoke"
                      {...register("know_singing")}
                      checked
                    />
                    <label
                      className="form-check-label"
                      htmlFor="know_singing_no"
                    >
                      No
                    </label>
                  </div>
                </div>

                {/* music  */}
                <div className="col-md-6">
                  <label
                    htmlFor="music"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    music
                  </label>
                  <input
                    type="text"
                    className="form-control"
                    id="music"
                    {...register("music")}
                    placeholder="Ex: Rock ,Romantic ..."
                  />
                </div>

                {/* sports  */}
                <div className="col-md-6">
                  <label
                    htmlFor="sports"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    sports
                  </label>
                  <input
                    type="text"
                    className="form-control"
                    id="sports"
                    {...register("sports")}
                    placeholder="Ex: Football, Cricket ..."
                  />
                </div>

                {/* read books  */}
                <div className="col-md-6">
                  <label
                    htmlFor="read_books"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    read books
                  </label>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="read_books_yes"
                      // name="smoke"
                      {...register("read_books")}
                    />
                    <label className="form-check-label" htmlFor="read_books_yes">
                      Yes
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <input
                      className="form-check-input"
                      type="radio"
                      id="read_books_no"
                      {...register("read_books")}
                      checked
                    />
                    <label className="form-check-label" htmlFor="read_books_no">
                      No
                    </label>
                  </div>
                </div>
              </div>
            </>
          )}

          <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
            <div className="col-6 mb-1 text-start">{renderPrevButton()}</div>
            <div className="col-6 mb-1 text-end">{renderNextButton()}</div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default MarriageEdit;
