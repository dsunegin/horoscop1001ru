if (Object.keys(clients).length !== 0) {
    for (const name of Object.keys(clients)) {
        const axiosInstance = axios.create(clients[name])
