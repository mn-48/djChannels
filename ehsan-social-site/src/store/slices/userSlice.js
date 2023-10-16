import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  isLoading: false,
  isError: false,
  error: "",
  isAuthenticated: false,
  user: null,
};

const userSlice = createSlice({
  name: "user",
  initialState,
  reducers: {
    getUserAction: (state, action) => {
      if (action.payload.isError) {
        state.isError = true;
        state.error = action.payload.error;
        state.isAuthenticated = false;
        state.user = null;
      } else {
        state.isAuthenticated = true;
        state.isError = false;
        state.error = "";
        state.user = action.payload.data;
      }
    },
  },
});

export const { getUserAction } = userSlice.actions;
export default userSlice.reducer;
