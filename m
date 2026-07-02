Return-Path: <linux-leds+bounces-8866-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDGKOIajRmohawsAu9opvQ
	(envelope-from <linux-leds+bounces-8866-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:44:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C18A6FB970
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 19:44:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="um/HiyCM";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8866-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8866-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59DAC3025706
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AE93624C5;
	Thu,  2 Jul 2026 17:44:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011030.outbound.protection.outlook.com [52.103.32.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3104359A89;
	Thu,  2 Jul 2026 17:44:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014274; cv=fail; b=X0FlYCt+r/nKFhcK3LWuWqAd3FwJsfA0KoK9jBuD/lnMb0PPWjGQF0N1xv8LAoiyDqNzCVsVIPViXCGAToTit//tW9CJ9xuUkG3EBr2KNrVryOGs6k0WoSjnsotjjWOwfdlHUIoTj6MIJfll8VAIlFYzxwfrxnnVEo2xl5uxYLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014274; c=relaxed/simple;
	bh=jl4gB9fKiF2KS08nedLY/ToLCw8G8kEzFfLNglTzMAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opwmtpqjW2V+xBmrnOwphHMy2NdnkzoJa4KK0bdQ02wbbJ/Q7QK0dwVX9hGOjVDw1T4hQmpBntyEowhCJVXjIx3VD3GQObKQ2uyBRK9n2ET4Istw2Yz0hSfpLKGtTkI8giYQ7tme3sAhqR325zqm2mylkLvv9uzLakth7zGHjtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=um/HiyCM; arc=fail smtp.client-ip=52.103.32.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZtj9uWThOzJ3g+FSGkldfR/v2T5oQSIyyzGbHUp216w0RKnMDXNr9nN3kttwppdEOlQRsG+DhQYSsYyyFVF2NxIx+K5K0HIoBdWyAVKnTCZmHjr6jxp37psEV+WxtNoBa7J8lQ5CjdOur2TvRd6G/6Z/Qp4Prl2T/bP1j8ZEY29xPMGfo3Hu/x6O/JqrE2mBYPhFDOjlh2c5EcisSM/RE6ynwSvafimqAKK3u07qxXH/VUmWNX4X7Al0v6l1ZI8xykBAcwoE98A5Gaviq27RBWfhlw8/gl0HvPwaH3VBQZaJs5PHcSmMZXVFSW8sn1k81cmzci8auNFHSH1UwXt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBlFcD7L3zNbbRTzD8yZhEydL7xE3mX1aiPvxr588Zs=;
 b=eKg7QB9RJbkIXuATMYjv1rg2wphaGmRXIlDhAqdtJqezpyjoIaf+dGflutW8+UBQMwmy0/ybXEFCJ6q8U4cT0eJWBr4fR/liVRFjv3YFw8u0fdyGwcKxYEpw8QyqVrvbhBolxTKT8iV+ZK2GVU3QJHXJQHta40aGMzEU4qQ1Vzdf+BatY0N/IZyZGI8/oLeWUbLD/oZXf9eEh1eM9kURLI1QtwFdjYSg1t/3qnZbSy6zZd2fG9x1iwkebo4XxGY6SAsApG8+aKGOO+S3SHE8ZdT4/HjxZrmpilNNn5FZJ6zYPkp1GrsdjQTx0hjKyj3nF9TDJZJyDTLuTN5azIAQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBlFcD7L3zNbbRTzD8yZhEydL7xE3mX1aiPvxr588Zs=;
 b=um/HiyCMqHVc6HskvXYZzZvYiQ8YoQvaQF12iGzzlBliDA9iJK4yMC5yCFqapUnlTFw8riFhF/yXQg1Ykj6ehOnr8zhNlHsHz8vD4FfLHemQ4QWyFGhCf39UGSCjfZz/Eo/sU/fbdptewb7pE+K+DihKghtVIDUPN4u7Y36KYW7ty+PIuFBVY/psmARePozEUp3E4TJbZWsXGpFa4QVuB0JE2fC/lzJ/NL15sIPUyaW2xIDRCxeVqS4jXeXEvwf5ep3uLr8GE8LHjnKw2JRlVRMRFLDBsHYW7mqziPmmQNYTXEcy1p1wscAOnhepDncd+WPqzfVhUfpvhoK2iSid0g==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AM9PR08MB6145.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 2 Jul
 2026 17:44:31 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:44:31 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 9/9] leds: st1202: correct and extend hw_pattern documentation
Date: Thu,  2 Jul 2026 18:44:18 +0100
Message-ID:
 <GV1PR08MB8497245CDA30E7304917EE72C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0662.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702174418.2658963-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AM9PR08MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9ce113-4bdf-4f1d-a820-08ded86191d0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|37011999003|15080799012|51005399006|19110799012|23021999003|8060799015|25010399006|5072599009|41001999006|24021099003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v3DxHfb9wC6PqLTW5WTOgDc9/APNFV2vf38fA7x1GORR0VS/a6PqHy1CcbPt?=
 =?us-ascii?Q?DmCgqQUR2z96xhL/jDAjFLxvk0DvfGX7IToVrqPqsFC9If1YuZDYpWkVM+om?=
 =?us-ascii?Q?D/ITmaOfxnnAfTodjecTrpcibY4yX2PTn7pqgRvkhCWR+nlD+1QYdoLk7mj+?=
 =?us-ascii?Q?LQHY44jwv12cfaAkgp9B4doL0wmrhILraojLBs/XRSbubZS0ubtcW5qzU8uN?=
 =?us-ascii?Q?ey377bIll0nUo7GgytEQsbe9zfeLG7PoFq42zYQ3nsjP+Ra4fZOQ4OW5ztyi?=
 =?us-ascii?Q?/Fq5ReBdNwv6b4C6mtk9pTd4ejtAxjS0R1HbtqUrSQ+jadtTwsr0bO53BQvP?=
 =?us-ascii?Q?la6pD5FjraSqasZiiZ5EdfZhgyisYa8a7BYadC3jMsDoX/iT2sO3fRWn66Bi?=
 =?us-ascii?Q?OtfK2QQMApBsKx8zp23zjEb++B8rSK/8N+Ngk34OxVVdcmd8zbmXcJy1gF4E?=
 =?us-ascii?Q?MPRSgzUcmXBc4WKp3RbSWdVsc+hamOKw4N2GqQvzUmQOhrObQ0q4rqgrU2TF?=
 =?us-ascii?Q?WuwIxBFQWZLE29kXqXaGA2N3tN3Q+jePty1/zbjMFzpfrx1Y8mj/ooVq2+gY?=
 =?us-ascii?Q?dkOGvKIoLMy4F5Y76+gnQqz7tjLIs7fSCLQzcWSen289nUtnpS/S0DX8aN0b?=
 =?us-ascii?Q?sSkewJg8hLXb2LLWZwznB2nPIK3NUbyKkxyxG8Qu2dM/qhpnL5WgvFnWyXuu?=
 =?us-ascii?Q?mHRlFeox8vLPx4waxKl9anXfTVz8OKyf2OACrU1Cma7c6xJlMTTz8dJvHrNH?=
 =?us-ascii?Q?Yo2uOk9lHmuC0iWxttuVhR+S4wtM0tnd/MahcI4kAKz7YQX4aBeS1GmzFSM9?=
 =?us-ascii?Q?9OY6nZVUkO8Vh4oH7LnAmh4Pg1riR1kIUsm7wDWnWJxfLau4Fom7W4IXy7M0?=
 =?us-ascii?Q?MjT6LIHh/qHCZ9EwVHhJhZnBxAWi5PQJnpeypw14hxFIq+/pziwybBb8EaIq?=
 =?us-ascii?Q?OOjmCd/esqebtHEOhsLnGh/MnxF7yhJOcNwAXh5UqX4kZz0uiASxuiSMUnvE?=
 =?us-ascii?Q?+yti?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j6FW4Ef8m6AfNn/xE1DTYoPGBqlKpsd1BoUhhWGBZ4hRhssNzJM5tgQcj6Qv?=
 =?us-ascii?Q?7tya3ObcOEJw4vypNiZnsH/fByz17COuMDJWpxao1LoW6eViVFzLGJZQhEIK?=
 =?us-ascii?Q?QwLnxZSyPgZRjJLVrg1C18ZSQ8dBWlU89fVzqAgYYZEqV1CvWkEn1fzHWHQc?=
 =?us-ascii?Q?TLeZamngdNFgn/ye2q+9Vo0RjlwX2y/lQv5UlBl/hO2NbO1loh+o08170H9L?=
 =?us-ascii?Q?XM92ZxX1CbK837Eraxi6nuiWWQ3BCH0txfxq24DXEVHJefpHU+yVevnAoFh2?=
 =?us-ascii?Q?OT2A0PXtCLS8W6+pQvfsaysvx6hyi6KMxfpAHYnDfn8iaw1oXCimRf3zzVNy?=
 =?us-ascii?Q?XMoAOw2JY5pQVA0Fx9AAa8pkhy6jj2djG4M7XQUjeqnwk3pg264uNm6eUmW8?=
 =?us-ascii?Q?HRZsatYa8oK7cXlpfkW76F5vzzSliilb8dDDDaep4JULbZaUCRU3eR5Th26x?=
 =?us-ascii?Q?FTx3gwcFpJ9ufKKa47yyN/sCasM4WQTirpl03E08XCVvcv3KUS8zEsJkaVNC?=
 =?us-ascii?Q?gq9NKlYZ/EpILN9EIK6upWsGsv5jWJ7/w0IDnj2ozEw6FEv0Y/LyYGoaRi9o?=
 =?us-ascii?Q?bHhQFzSbNzp4EwAdpF+pNbwToTJkyhs7ivER6C3v8M+E18MzIaDJOIg6d/lc?=
 =?us-ascii?Q?UG8yez2r9u5LYKhUfCcIxYUVxy60BMf9bSturHYkBp0WbHu03iK+jFPZpewR?=
 =?us-ascii?Q?kpDHHGWQT5/bHs5yyXhDkw1bfA9eXUuPstcPiopeB+bcLnw1Cqj8a+kBymXs?=
 =?us-ascii?Q?UylSARgH+VxCxPA07zOaG+o0Ol2WlvA2ZOolW6kOqigpLpwf8SBcTdNJlmfe?=
 =?us-ascii?Q?mNTioXoasik3LTKDRDyuhVwnowviZWR+rysf7c5fxOyR6zaERJE6+vNcKJr7?=
 =?us-ascii?Q?qWOvZJbuh3F+NaRSVNTB0egjQoEn+CaKBcNYngQwcSif+aI/PQqwmuWxQ+R5?=
 =?us-ascii?Q?+ar/V25Mk6wYxvjBAf3mQb+bCxsSFHY1FiGvIxbvYfEwCB2xjNmTNRF4qCa+?=
 =?us-ascii?Q?VEz+UgCyDW3nC+XkbT7M42CcExYIXoreI8B9VKpZdsswItGLKcUP0VOhoqq7?=
 =?us-ascii?Q?niaE/cNZtI64xyJusLjT1790xJebtlVa1ODSHaIxDea6NiZXTwtMjpJ0/+an?=
 =?us-ascii?Q?BZlJ4HpCEE5ZkdjetSmq4COSFsLsrwXJuKJkbPFf1LOSVlZUDQQnTvO+CyiF?=
 =?us-ascii?Q?3nULhSjgT0sgn6/sdYFUIGDM9x2vU60Q/rMHRSm+cqwMnyKIfC7uugtN1mek?=
 =?us-ascii?Q?rgWBuV6a0mfK1iUu0DVznKoPXQDv7Tkr9Fb179ZY46bTHr8mpNTIDlsglwiA?=
 =?us-ascii?Q?P6Vx6sc8Pkp4fFHZHc6KbOk3oqiyngWb1oRuOUaz9C+CAjXdxJaXd9bJ1nM6?=
 =?us-ascii?Q?4zTTD6Ba27fhSXM5NuuVqX9uXKTII5yixR5sUcv/fDePZLktAx3upmBEay+y?=
 =?us-ascii?Q?lQ/IAyyVLXijuLlCqXvUTkBVLBgS2+WX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9ce113-4bdf-4f1d-a820-08ded86191d0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:44:30.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8866-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,outlook.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C18A6FB970

Fix the repeat section: -1 is a valid value meaning infinite repeat,
as accepted by the ledtrig-pattern sysfs interface; only 0 and values
below -1 are rejected. The previous text incorrectly stated all negative
numbers were invalid. Also remove the redundant trailing sentence since
the behaviour is now covered inline.

Add the brightness range (0-255) to the hw_pattern section, which was
previously undocumented.

Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 Documentation/leds/leds-st1202.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index a2353549469e..ed32eb3a27d4 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -16,6 +16,7 @@ in terms of PWM duty-cycle and duration (ms).
 To be compatible with the hardware pattern format, maximum 8 tuples of
 brightness (PWM) and duration must be written to hw_pattern.
 
+- Brightness range: 0-255
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
@@ -26,9 +27,7 @@ The format of the hardware pattern values should be:
 ----------------------------
 
 Specify a pattern repeat number, which is common for all channels.
-Default is 1; negative numbers and 0 are invalid.
+Default is 1. Writing 0 is invalid. Writing -1 or 255 repeats the
+pattern indefinitely.
 
 This file will always return the originally written repeat number.
-
-When the 255 value is written to it, all patterns will repeat
-indefinitely.
-- 
2.55.0


