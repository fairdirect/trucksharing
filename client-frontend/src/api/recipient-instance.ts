import axios from 'axios'

const { REACT_APP_DUMMY_TOKEN_RECIPIENT: token, REACT_APP_API_RECIPIENT_URL: apiUrl } = process.env

const recipientInstance = axios.create({
	baseURL: apiUrl,
	timeout: 3000,
	headers: {
		Authorisation: token,
		'Access-Control-Allow-Origin': '*',
	},
})

export default recipientInstance
