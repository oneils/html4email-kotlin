<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${digest.title}</title>
    <style>
    body, html {
        font-family: Calibri, Arial;
        font-size: 0;
    }
    table {
        margin: 0;
        padding: 0;
        border-spacing: 0;
    }
    table tr th {
        margin: 0;
        padding: 0;
    }
    table.main {
        margin: 0 auto;
        padding: 0;
        width: 610px;
        border-spacing: 0;
    }
    table.main tr td {
        padding: 20px;
    }
    table tr td .topic {
        font-family: Calibri, Arial;
        margin: 0;
        font-size: 24px;
        font-weight: bold;
        text-transform: uppercase;
        color: #262626;
    }
    table tr td .news-item {
        text-align: justify;
    }
    table tr td .news-item .title {
        font-family: Calibri, Arial;
        margin: 0;
        padding: 0;
        font-size: 18px;
        color: #595959;
        font-weight: bold;
        text-decoration: none;
    }
    table tr td .news-item .description {
        font-family: Calibri, Arial;
        margin: 0;
        padding: 0;
        font-size: 14px;
        color: #595959;
    }
    .main .main-tr:nth-child(2n+1) {
        background-color: #ffffff;
    }
    .main .main-tr:nth-child(2n) {
        background-color: #f2f2f2;
    }
    .main .main-tr:first-child {
        background-color: #595959;
    }
    .main .main-tr:last-child {
        background-color: #707070
    }
    .main .main-tr:last-child td {
        text-align: center;
    }
    .main .main-tr:last-child td a {
        font-size: 15px;
        color: #cdcdcd;
    }
    </style>
</head>
<body>
    <div class="wrapper">
        <table class="main">
            <tr class="main-tr">
                <th>
                    <img src="/images/logos/${digestNumber}.png">
                </th>
            </tr>

            <#list digest.topics as t>
            <tr class="main-tr">
                <td>
                    <table><tr><td style="padding: 0 0 15px 0"><p class="topic">${t.topic}</p></td></tr></table>
                    <hr>
                    <#list t.articles as article>
                    <table><tr><td style="padding: 10px 0 0 0">

                        <div class="news-item">
                            <table><tr><td style="padding: 0 0 10px 0"><a class="title" href="${article.url}">${article.title}</a></td></tr></table>
                            <p class="description">
                                ${article.description}
                            </p>
                        </div>

                    </td></tr></table>
                    </#list>

                </td>
            </tr>
            </#list>

            <tr class="main-tr">
                <td>
                    <a href="mailto:${digest.contributeTo}">2015 ${digest.companyName}</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
