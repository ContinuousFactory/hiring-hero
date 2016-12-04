import axios from 'axios';

const fetchCompany = (company_subdomain) => {
  const company_url = `http://localhost:4000/api/companies/${company_subdomain}`;
  const request = axios.get(company_url)

  return {
    type: 'FETCH_COMPANY',
    payload: request
  }
}

export default fetchCompany;
