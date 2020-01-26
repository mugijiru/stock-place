import axios from 'axios'

if (process.env.RAILS_ENV !== 'test') {
  axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('[name="csrf-token"]').getAttribute('content')
}

export default axios
