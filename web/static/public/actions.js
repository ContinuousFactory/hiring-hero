import axios from 'axios';

export const fetchCompany = (companySubdomain) => {
  const companyUrl = `http://localhost:4000/api/companies/${companySubdomain}`;
  const request = axios.get(companyUrl)

  return {
    type: 'FETCH_COMPANY',
    payload: request
  }
}

export const submitResume = (data, jobId, companyId) => {
  const url = `http://localhost:4000/api/companies/${companyId}/jobs/${jobId}/candidates`;
  const request = axios.post(url, {"resume": data})

  return {
    type: 'SUBMIT_RESUME',
    payload: request
  }
}
