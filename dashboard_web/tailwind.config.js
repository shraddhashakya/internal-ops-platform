/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./src/**/*.{html,ts}",
  ],
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        primary: "var(--color-primary)",
        secondary: "var(--color-secondary)",

        backgroundLight: "var(--color-background-light)",
        backgroundDark: "var(--color-background-dark)",

        textDark: "var(--color-text-dark)",
        textLight: "var(--color-text-light)",

        ticketOpen: "var(--color-open)",
        ticketProgress: "var(--color-inprogress)",
        ticketClosed: "var(--color-closed)",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
};
