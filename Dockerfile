FROM node:16-slim

WORKDIR /app 

COPY package*.json ./ 
RUN npm install 

# Sửa lại dòng này: đảm bảo có khoảng trắng giữa dấu chấm thứ nhất và dấu chấm thứ hai
COPY . . 

EXPOSE 3000 

CMD ["npm", "start"]