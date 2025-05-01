import streamlit as st
import requests

st.title("Code Refactoring Tool")
code_input = st.text_area("Enter your code here:", height=300)
if st.button("Refactor"):
    if code_input.strip():
        response = requests.post("http://0.0.0.0:8000/refactor", json={"code": code_input})
        if response.status_code == 200:
            refactored_code = response.json()
            st.subheader("Refactored Code")
            st.code(refactored_code, language="python")
        else:
            st.error("Error in refactoring the code")
    else:
        st.warning("Please enter code to refactor")   