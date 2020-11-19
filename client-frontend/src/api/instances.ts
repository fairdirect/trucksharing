import axios from 'axios'

const { REACT_APP_API_RECIPIENT_URL: apiUrl } = process.env

export const apiInstance = axios.create({
  baseURL: apiUrl,
  timeout: 3000,
  headers: {
    'Access-Control-Allow-Origin': '*',
  },
})
