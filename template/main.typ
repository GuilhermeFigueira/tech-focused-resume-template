#import "@local/tech-focused-resume:0.1.0": *

#let name = "Jane Doe"
#let headline = "Full Stack Developer"

#let location = "San Francisco, CA"
#let phone = "+1 (555) 123-4567"

#let email = "jane.doe@example.com"
#let github = "janedoe"
#let linkedin = "jane-doe"
#let personal-site = "janedoe.dev"

#show: resume.with(
  author: (
    name: name,
    headline: headline,
    position: center,
    font-size: 14pt,
  ),
  header-info: (
    style: "row",
    contact: (
      show-icons: true,
      show-sensitive-info: true,
      position: horizon,
      gap: 0.2em,
      info: (
        location: location,
        email: email,
        github: github,
        linkedin: linkedin,
        phone: phone,
        personal-site: "",
      ),
    ),
  ),
  style: (
    accent-color: "#26428b",
    font: "Calibri",
    paper: "us-letter",
    font-size: 10pt,
  ),
  config: (
    lang: "en",
    region: "us",
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
    location: "Remote",
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
    consistent: true,
  )[
    Software Engineering, Artificial Intelligence, Object-Oriented Programming, Distributed Systems, Algorithms, Data Structures, Databases, Computer Networks, Web Development, Discrete Mathematics
  ]

  #edu(
    institution: "Example Technical High School",
    location: "Boston, MA",
    dates: dates-helper(start-date: "Jan 2016", end-date: "Dec 2018"),
    degree: "Technical Diploma in Systems Development",
    consistent: true,
  )[
    Programming Logic, Databases, Algorithms, Web Development, Mobile Development, Networks, Design
  ]
]

#section("Projects")[
  #project(
    name: "TaskFlow",
    tagline: "Team task management platform",
    dates: dates-helper(start-date: "Mar 2023", end-date: "Aug 2023"),
    relation: "University of Example",
    show-url: true,
    url: (
      prefix: "github.com/",
      value: "janedoe/taskflow",
      icon: "github",
    ),
    relation-type: "Capstone Project",
  )[
    A team collaboration platform built to help small teams plan and track work. Responsible for the frontend architecture and the real-time notification system.
    - *Frontend:* React, TypeScript, and Vite, with authentication, boards, and real-time updates via WebSocket.
    - *Backend:* REST API built with Node.js, Express, and PostgreSQL.
    - *Infrastructure:* Deployed with Docker on a cloud provider, with CI/CD via GitHub Actions.
  ]

  #project(
    name: "WeatherNow",
    tagline: "Minimalist weather forecast app",
    dates: dates-helper(start-date: "Oct 2021", end-date: "Jan 2022"),
    relation: "Example Technical High School",
    relation-type: "Personal Project",
    show-url: false,
  )[
    A lightweight weather app built with vanilla JavaScript and a public weather API, focused on fast load times and a clean, minimal interface. Presented at the school's annual tech fair.
  ]
]

#grid(
  columns: (3fr, 1fr),
  gutter: 2.5em,
  section("Skills")[
    - #skills-line("Languages", ("TypeScript", "JavaScript", "Python", "Java", "HTML/CSS"))
    - #skills-line("Frontend", ("React", "Next.js", "Vue.js", "Tailwind CSS", "Figma"))
    - #skills-line("Backend", ("Node.js", "Express", "REST APIs"))
    - #skills-line("DevOps & Tools", ("Git", "GitHub", "GitHub Actions", "Docker", "Vercel"))
    - #skills-line("Databases", ("PostgreSQL", "MySQL"))
  ],
  section("Languages")[
    - English (Native)
    - Spanish (Intermediate)
  ],
)
