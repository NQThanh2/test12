FROM node:16-slim [cite: 1]
WORKDIR /app 
COPY package*.json ./ 
RUN npm install 
# Viết lại dòng này cho đúng
COPY . . 
EXPOSE 3000 
CMD ["npm", "start"]