import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

const initialState = {
  isLoading: false,
  isError: false,
  error: "",
  isAuthenticated: false,
  authenticatedData: {},
};

export const loginAsyncAction = createAsyncThunk(
  "login/loginSlice",
  async (body) => {
    const config = {
      headers: {
        "Content-type": "application/json",
      },
    };

    const res = await axios.post(
      "http://127.0.0.1:8000/api/token/",
      body,
      config
    );

    return res.data;
  }
);

const loginSlice = createSlice({
  name: "login",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(loginAsyncAction.pending, (state, action) => {
      state.isLoading = true;
    });

    builder.addCase(loginAsyncAction.fulfilled, (state, action) => {
      state.isLoading = false;
      state.isAuthenticated = true;
      state.authenticatedData = action.payload;
      localStorage.setItem("wess_access_token", action.payload.access);
      localStorage.setItem("wess_refresh_token", action.payload.refresh);
    });

    builder.addCase(loginAsyncAction.rejected, (state, action) => {
      state.isError = true;
      state.error = "Please Provide Valid Credentials";
    });
  },
});

export default loginSlice.reducer;
