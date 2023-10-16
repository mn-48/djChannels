import React, { useEffect } from "react";
import { useDispatch } from "react-redux";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fab } from "@fortawesome/free-brands-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { Routes, Route } from "react-router-dom";
import "./App.css";
import BuySale from "./components/BuySale/BuySale";
import EditProfile from "./components/EditProfile/EditProfile";
import HelpSupport from "./components/HelpSupport/HelpSupport";
import Home from "./components/Home/Home";
import Job from "./components/Job/Job";
import JobSearch from "./components/Organizations/Jobs/JobSearch";
import JobProfile from "./components/Job/JobProfile";
import Login from "./components/Login/Login";
import Logout from "./components/Logout/Logout";
import Marriage from "./components/Marriage/Marriage";
import MarriageProfile from "./components/Marriage/MarriageProfile";

import Organizations from "./components/Organizations/Organizations";
import OrganizationDashboard from "./components/Organizations/OrganizationDashboard";
import CreateNewOrganization from "./components/Organizations/CreateNewOrganization";
import PendingOrganizations from "./components/Organizations/PendingOrganizations";
import ActiveOrganizations from "./components/Organizations/ActiveOrganizations";
import CreateNewJob from "./components/Organizations/CreateNewJob";
import PendingJobs from "./components/Organizations/PendingJobs";
import ActiveJobs from "./components/Organizations/ActiveJobs";
import BillingsSettings from "./components/Organizations/BillingsSettings";
import PendingInvoices from "./components/Organizations/PendingInvoices";
import AllInvoices from "./components/Organizations/AllInvoices";
import DashboardContent from "./components/Organizations/DashboardContent";

import JobPostDetailsDashboard from "./components/Organizations/JobPostDetailsDashboard";
import Pages from "./components/Pages/Pages";
import Profile from "./components/Profile/Profile";

import Overview from "./components/Profile/Overview";
import Address from "./components/Profile/Address";
import Others from "./components/Profile/Others";
import FamilyAndRelation from "./components/Profile/FamilyAndRealation";
import ContactInfo from "./components/Profile/ContactInfo";
import Education from "./components/Profile/Education";

import Services from "./components/Services/Services";
import Settings from "./components/Settings/Settings";
import PrivateRoute from "./components/PrivateRoute/PrivateRoute";
import AllComponentsView from "./components/shared/AllComponentsView";
import { loadUser } from "./store/actions/auth";
import UserIconDropDown from "./components/UserIconDropDown/UserIconDropDown";

library.add(fab, fas, far);


const App = () => {
  // dispatch for loading authenticated user
  const dispatch = useDispatch();

  // load authenticated user
  useEffect(() => {
    dispatch(loadUser());
  }, []);

  return (
    <Routes>
      <Route path="/login" element={<Login />}></Route>

      <Route path="/*" element={<PrivateRoute />}>
        <Route path="" element={<Home />} />
        <Route path="job" element={<Job />} />
        <Route path="logout" element={<Logout />} />
        <Route path="jobsearch" element={<JobSearch />} />
        <Route path="job/profile/edit" element={<JobProfile />} />

        {/* --------------- Marriage routes -----------------  */}
        <Route path="marriage" element={<Marriage />}>
          <Route index element={<h3>Main Marriage Component</h3>} />
          <Route
            path="profile/view"
            element={<h3>Rendering profile edit/view Components</h3>}
          />
          <Route path="profile/create" element={<MarriageProfile />} />
        </Route>
        {/* -------------- end marriage routes --------------- */}

        <Route path="services" element={<Services />} />
        <Route path="buy-sale" element={<BuySale />} />

        {/* ----------- organizations routes -----------------  */}
        <Route path="organizations" element={<Organizations />} />
        <Route
          path="organizations-dashboard"
          element={<OrganizationDashboard />}
        >
          <Route index element={<DashboardContent />} />

          {/* organization routes  */}
          <Route
            path="create-organizaton"
            element={<CreateNewOrganization />}
          />
          <Route
            path="pending-organizations"
            element={<PendingOrganizations />}
          />
          <Route
            path="active-organizations"
            element={<ActiveOrganizations />}
          />

          {/* jobs routes  */}
          <Route
            path="create-new-job"
            element={<CreateNewJob formType="createJob" />}
          />
          <Route path="pending-jobs" element={<PendingJobs />} />
          <Route path="active-jobs" element={<ActiveJobs />} />

          {/* billings routes  */}
          <Route path="billings-settings" element={<BillingsSettings />} />
          <Route path="all-invoices" element={<AllInvoices />} />
          <Route path="pending-invoices" element={<PendingInvoices />} />
        </Route>
        {/* ----------- end organizations routes -------------  */}

        <Route
          path="jobpost-details-dashboard"
          element={<JobPostDetailsDashboard />}
        />

        {/* ---------------- profile routes ------------------  */}
        <Route path="profile" element={<Profile />}>
          <Route index element={<Overview />} />
          <Route path="others" element={<Others />} />
          <Route path="contact/info" element={<ContactInfo />} />
          <Route path="family/relation" element={<FamilyAndRelation />} />
          <Route path="education" element={<Education />} />
          <Route path="address" element={<Address />} />
        </Route>
        {/* ------------- end profile routes ------------------  */}

        <Route path="edit-profile" element={<EditProfile />} />
        <Route path="settings" element={<Settings />} />
        <Route path="pages" element={<Pages />} />
        <Route path="help-support" element={<HelpSupport />} />
        <Route path="component-example" element={<AllComponentsView />} />
        <Route path="icon-drop-down" element={<UserIconDropDown />} />
      </Route>
    </Routes>
  );
};

export default App;
