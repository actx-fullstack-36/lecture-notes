INSERT INTO author(authorId, authorActivationToken, authorAvatarUrl, authorEmail, authorHash, authorUsername) VALUES (UUID_TO_BIN('d7a8cdd0-2201-4b6a-a469-cc032650ce90'),'d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7', 'http://myawesome.site/photo.jpg', 'bob@bob.com', 'd7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d7d', 'awesomeUsername1');

INSERT INTO article(articleId, articleAuthorId, articleContent, articleDate, articleImage) VALUES (UUID_TO_BIN('d564dabc-21ed-412b-9748-cd54eab6d680'), UUID_TO_BIN('d7a8cdd0-2201-4b6a-a469-cc032650ce90'), 'plagiarism is really really bad mkay', '2021-11-23 12:23:56.333','http://myawesome.site/photo1.jpg');

UPDATE article SET articleContent = 'plagiarism is really bad mkay', articleDate = NOW(), articleImage = 'http://giphy.site/photo2.gif' WHERE articleId = UUID_TO_BIN('d564dabc-21ed-412b-9748-cd54eab6d689');

DELETE FROM article WHERE articleId = UUID_TO_BIN('d564dabc-21ed-412b-9748-cd54eab6d689');

SELECT articleId, articleAuthorId, articleContent, articleDate, articleImage FROM article WHERE articleId = UUID_TO_BIN('d564dabc-21ed-412b-9748-cd54eab6d689');


SELECT articleId, articleAuthorId, articleContent, articleDate, articleImage FROM article WHERE articleContent LIKE '%bad%';


## Setting up a join statement is
INSERT INTO tag(tagId, tagName) values (UUID_TO_BIN('41547c08-422d-4ec4-bcf5-0f666bcfe7c0'), 'javascript');

INSERT INTO tag(tagId, tagName) values (UUID_TO_BIN('41547c08-422d-4ec4-bcf5-0f666bcfe7c1'), 'typescript');

INSERT INTO tag(tagId, tagName) values (UUID_TO_BIN('41547c08-422d-4ec4-bcf5-0f666bcfe7c2'), 'CSS');


insert into articleTag(articleTagArticleId, articleTagTagId) VALUES (UUID_TO_BIN('d564dabc-21ed-412b-9748-cd54eab6d689'),UUID_TO_BIN('41547c08-422d-4ec4-bcf5-0f666bcfe7c0'));

insert into articleTag(articleTagArticleId, articleTagTagId) VALUES (UUID_TO_BIN('d564dabc-21ed-412b-9748-cd54eab6d688') ,UUID_TO_BIN('41547c08-422d-4ec4-bcf5-0f666bcfe7c0'));


SELECT  BIN_TO_UUID(articleId) as articleId, BIN_TO_UUID(articleAuthorId),  articleContent, articleDate, articleImage FROM article INNER JOIN articleTag on article.articleId = articleTag.articleTagArticleId WHERE articleTagTagId = UUID_TO_BIN('41547c08-422d-4ec4-bcf5-0f666bcfe7c0');