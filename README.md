# NewsApp

A simple SwiftUI app that fetches and displays a list of news articles from a remote API. The app follows the MVVM architecture and demonstrates the use of Combine for data binding and error handling.

## Features

- Display a list of news articles including:
  - **Title**: The headline of the news article.
  - **Image**: A thumbnail image representing the news article.
  - **Short Description**: A brief excerpt from the article's content.
  - **Published Date**: The date the article was published.
- Show detailed information for each news article.
- Error handling with a retry mechanism in case of network failure.
- A loading indicator is displayed while data is being fetched from the network.

## Requirements

- iOS 14.0 or later
- Xcode 12.0 or later
- Swift 5.0 or later

## Architecture

This app follows the **MVVM (Model-View-ViewModel)** design pattern.

- **Model**: Represents the data structure (`NewsArticle`). This includes fields like the article's title, content, image URL, and published date.
- **View**: Represents the user interface. Views such as `NewsListView` (the main list) and `NewsRowView` (a row representing each article) are responsible for displaying the data to the user.
- **ViewModel**: The ViewModel is responsible for fetching data from the network, managing the state, and providing data to the view. It is also responsible for handling error states and loading indicators.

## Libraries and Frameworks Used

- **SwiftUI**: For building the user interface.
- **Combine**: For handling asynchronous operations and data binding between the ViewModel and View.
- **URLSession**: For making network requests to fetch news articles from a remote API.
- **AsyncImage**: For displaying images asynchronously, especially useful for fetching and showing images from URLs.
- **Combine**: For handling asynchronous operations and data flow, ensuring updates are published on the main thread.
