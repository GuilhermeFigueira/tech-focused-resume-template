#import "/src/lib.typ": *


// Author

#let name = "Jane Doe"
#let headline = "Full Stack Developer"
#let author-name-and-headline-uppercase = false
// Contact Info

#let email = "jane.doe@example.com"
#let github = "janedoe"
#let linkedin = "jane-doe"
#let personal-site = "janedoe.dev"
#let show-contact-info-icons = true

// Sensitive Info
#let location = "San Francisco, CA"
#let phone = "+1 (555) 123-4567"
#let show-sensitive-contact-info = true

// Document Data

#let document-title = "Résumé" + name
// TODO: Search default keywords
#let document-description = ""
#let document-keywords = "cv, "


#show: resume.with(
  header-info: (
    style: "row",
    author: (
      name: name,
      headline: headline,
      position: center,
      uppercase: author-name-and-headline-uppercase,
    ),
    contact: (
      show-icons: show-contact-info-icons,
      show-sensitive-info: show-sensitive-contact-info,
      position: horizon,
      gap: 0.5em,
      info: (
        location: location,
        email: email,
        github: github,
        linkedin: linkedin,
        phone: phone,
        personal-site: personal-site,
      ),
    ),
  ),
  style: (
    accent-color: "#26428b",
    font: "New Computer Modern",
    paper: "us-letter",
    font-size: 10pt,
    margin: (
      top: 0.2in,
      bottom: 0.2in,
      left: 0.3in,
      right: 0.5in,
    ),
  ),
  config: (
    lang: "en",
    region: "us",
  ),
  document-metadata: (
    keywords: document-keywords,
    title: document-title,
    description: document-description,
  ),
)


#section("Summary")[
  Full stack software developer with a background in web and mobile development. Experienced in building and shipping production applications with TypeScript, React, Next.js, and Node.js, along with backend automation using Python. Comfortable working across the stack, from UI design to API integration and cloud deployment.
]

#section("Work Experience")[
  #work(
    title: "Software Engineer",
    tech-stack: "TypeScript, React, Node.js, PostgreSQL",
    location: "San Francisco, CA",
    modality: "Hybrid",
    company: "Acme Corp",
    dates: dates-helper(start-date: "Jan 2024", end-date: "Present"),
  )[
    - Migrated a legacy dashboard from jQuery to React and TypeScript, cutting page load time by roughly 40% and reducing reported bugs by half.
    - Built a Python service to generate weekly operations reports from multiple data sources, replacing a manual process and saving the team several hours per week.
    - Designed and implemented a REST API used by both the web and mobile clients, improving consistency and reducing duplicated backend logic.
  ]

  #work(
    title: "Junior Developer",
    tech-stack: "JavaScript, Vue.js, MySQL",
    location: "San Fransico, CA",
    modality: "Remote",
    company: "Bright Labs",
    dates: dates-helper(start-date: "Jun 2022", end-date: "Dec 2023"),
  )[
    - Implemented new features for a customer-facing web application, working closely with designers and senior engineers.
    - Resolved over 100 reported issues, improving overall application stability.
  ]
]

#section("Education")[
  #edu(
    institution: "University of Example",
    location: "Boston, MA",
    dates: dates-helper(start-date: "Aug 2019", end-date: "May 2023"),
    degree: "B.Sc. in Computer Science",
  )[
    Software Engineering, Artificial Intelligence, Object-Oriented Programming, Distributed Systems, Algorithms, Data Structures, Databases, Computer Networks, Web Development, Discrete Mathematics
  ]

  #edu(
    institution: "Example Technical High School",
    location: "Boston, MA",
    dates: dates-helper(start-date: "Jan 2016", end-date: "Dec 2018"),
    degree: "Technical Diploma in Systems Development",
  )[
    Programming Logic, Databases, Algorithms, Web Development, Mobile Development, Networks, Design
  ]
]

#section("Academic and Personal Projects")[
  #project(
    name: "TaskFlow",
    tagline: "Team task management platform",
    dates: dates-helper(start-date: "Mar 2023", end-date: "Aug 2023"),
    relation: "University of Example",
    url: "https://github.com/janedoe/taskflow",
    relation-type: "Capstone Project",
  )[
    - Led the frontend architecture using React, TypeScript, and Vite, implementing authentication, boards, and real-time updates via WebSocket.
    - Designed and built the platform's real-time notification system, ensuring instant event synchronization across users.
    - Developed a REST API with Node.js, Express, and PostgreSQL to support work planning and tracking features.
    - Containerized the application with Docker and set up CI/CD pipelines via GitHub Actions for automated cloud deployment.
  ]

  #project(
    name: "WeatherNow",
    tagline: "Minimalist weather forecast app",
    dates: dates-helper(start-date: "Oct 2021", end-date: "Jan 2022"),
  )[
    - Built a lightweight weather app using vanilla JavaScript and a public weather API.
    - Focused on fast load times and a clean, minimal interface with no framework overhead.
    - Presented the project at the school's annual tech fair.
  ]
]


#grid-section(
  columns: (3fr, 1fr),
  sections: (
    section("Skills")[
      #skills[
        - *Languages:* TypeScript, JavaScript, Python, Java, HTML/CSS
        - *Frontend:* React, Next.js, Vue.js, Tailwind CSS, Figma
        - *Backend:* Node.js, Express, REST APIs
        - *DevOps & Tools:* Git, GitHub, GitHub Actions, Docker, Vercel
        - *Databases:* PostgreSQL, MySQL
      ]
    ],
    section("Languages")[
      #languages[
        - *English:* Native
        - *Spanish:* Intermediate
      ]
    ],
  ),
)
