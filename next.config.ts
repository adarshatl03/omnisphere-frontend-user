/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone', // Required for Dockerized Next.js
  reactStrictMode: true,
  swcMinify: true,
  async rewrites() {
      return [
          {
              source: '/api/:path*',
              destination: 'http://backend-user:8000/:path*',
          },
      ];
  },
};

export default nextConfig;
