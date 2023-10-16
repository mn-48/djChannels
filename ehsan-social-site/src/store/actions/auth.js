import axios from "axios";
import { getUserAction } from "../slices/userSlice";

// loadUser
export const loadUser = () => async (dispatch) => {
  try {
    const res = await axios.get("http://127.0.0.1:8000/api/user/userdetails/", {
      headers: {
        Authorization: `Bearer ${localStorage.wess_access_token}`,
      },
    });
    dispatch(getUserAction({ isError: false, data: res.data }));
  } catch (err) {
    dispatch(getUserAction({ isError: true, error: err.message }));
  }
}; 
