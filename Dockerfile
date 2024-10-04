# Используем образ Golang для сборки
FROM golang:1.16 AS builder

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы go.mod и go.sum
COPY go.mod go.sum ./

# Устанавливаем зависимости
RUN go mod tidy

# Копируем исходные файлы
COPY . .

# Сборка приложения
RUN CGO_ENABLED=0 GOOS=linux go build -o hello .

# Используем минимальный образ для выполнения приложения
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/hello .
CMD ["./hello"]
