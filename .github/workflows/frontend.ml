name: Frontend CI

on:
  workflow_dispatch:   # 👈 manual run

jobs:
  frontend:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'

      - name: Install Dependencies
        run: |
          cd frontend
          npm install

      - name: Run Tests
        run: |
          cd frontend
          npm test --if-present

      - name: Build Frontend
        run: |
          cd frontend
          npm run build --if-present

      - name: Start Frontend
        run: |
          cd frontend
          npm start &
          sleep 5
