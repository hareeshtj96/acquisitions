echo "📦 Building and starting development containers..."
echo "   - Neon Local proxy will create an ephemeral database branch"
echo "   - Application will run with hot reload enabled"
echo ""

# Start containers in detached mode
docker compose -f docker-compose.dev.yml up --build -d

echo "⏳ Waiting for database to be healthy..."

# Wait until neon-local is healthy
until [ "$(docker inspect --format='{{.State.Health.Status}}' acquisitions-neon-local 2>/dev/null)" = "healthy" ]; do
  printf "."
  sleep 2
done

echo ""
echo "📜 Applying latest schema with Drizzle..."
docker exec -it acquisitions-app-dev npm run db:migrate

echo ""
echo "🎉 Development environment started!"
echo "   Application: http://localhost:3000"
echo "   Database: postgres://neon:npg@localhost:5432/neondb"
echo ""

# Attach logs
docker compose -f docker-compose.dev.yml logs -f