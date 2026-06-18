Return-Path: <linux-leds+bounces-8673-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bGtmNfEONGoCMwYAu9opvQ
	(envelope-from <linux-leds+bounces-8673-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:29:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D56A13F9
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=KDOLpLIO;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8673-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8673-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05F4C30A155F
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8ACF3FCB10;
	Thu, 18 Jun 2026 15:28:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011037.outbound.protection.outlook.com [52.103.33.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621813FC5A9;
	Thu, 18 Jun 2026 15:28:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796484; cv=fail; b=ZcaPRWvcr6u7XnUU5epn3+ANyfGCLGeIWpxpAVmqbNJDdziO84+V7P5EnbFJnrPgP5IyH63fsYegSYvKAkUho5uVhyDxf4XcsI9Be6yKcrA4as/HXkMzzhfRjNjHMeWiBOsI+YqdB8Wz9RS43ptX4MMmDa35Wf8CsVEcqtjciEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796484; c=relaxed/simple;
	bh=YP2QLJe5tVFoEbAH1B2Kw7JH5wfALTBd2Sh91skJ4MQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qn4G6wuzzip5VMozOUR7ISw4iMcSQHsFkwbbyClCaffno3i/p9n0cEFf4HtlIKJcdDKNoP0O3rTXPrtNLABkzoPY+k1u3c/WehZl3KUM4tDFBsMF0kCqJsNoAWrdW/EOGM9F6SqCUXjthW4XGamZw/tdIRImZcx8soQuQHYlVOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KDOLpLIO; arc=fail smtp.client-ip=52.103.33.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDh88zlPf+AvZdEJ9mwuWqlZR//iLGuI4Nau2qq6wYIw7S+7McS/5vn/drN1tivKr/geOlqX7zIl//TaLNivYQQ/sMxmBjIu/RiYHzwHHSlk2UdLrmzzFub4V5xhzzWMEshd6bBDwv8RMOfSUNFaZVahLjLZTluCQhMAYnqPNiYN0fEtD2WZ4AU8ik7JhvSXshC1ao2h3rofl8jr13K6hM5mAyhCDE7ufyQp4EGUiUcdK4MwTqanEdg0ikDpEjsoyKSMTBMTYrqNwhDqQTyotbf9VsAdieL5FPinIP1K+IEt6Titrcoh/DyNvW7qtD73AwuMsJI018QfNYCSjz+FJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=352OVVBY8WCBMhkO+raBkz6KWn1vBKzhXFWFwgwACZg=;
 b=EM3fz5L03Md/vo6hGRcJ7kLHycaJ5FXu0Y3kpohSam1w18ZZUg78NxWmbta4yRkpvj16p8lGjD3dQqQwYlX0GYWNABxEnv4Bmnf6EAXdBdGs+FLB7P1+JY7/URXMTWtiO41IfdtGgi6v7rnWBSbjkeE61GP0csO1ZxQbldeUsQqVFoFtMwY+9W9FXDfGV3ET5KHxTLiSIzyQ07hVff0vI6RnC0wsrACDwuovVxS0vSGTK+1Dub2ty21hQ+8dKqzzXxEWpyHbDcaqrqVXRe+iwSZZ81NaC2jqD9expDSMGw1q4tIRkfJVpAitn8qWSO61Xupaqc1TuLEtEknSpYjIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=352OVVBY8WCBMhkO+raBkz6KWn1vBKzhXFWFwgwACZg=;
 b=KDOLpLIOU0WQeuAihlmvAe3BL4maJH3oOgaewbB/zK5ViHG1rUaHquz64k+giq6L1qJEeW3VYp0QbdTnBGPU1kupQTMY1GBRhuDrnFUQiB3SF7KOvIfZT0XWYTSo+kKRYGwKLtjK64RU8SnlVqi9pRhhptL9Oyfq1h7uXBFZax8hJaWYpYY7ZgABQR+VTG9pZ7kgijfyK+9KwsQBkKtuCoZ4blAsvrNuK5LVShKFTI/uiOLvM4LHGsoldkm8dk35+XSYGp3NX9KTGoY4G2MR6QVL/vx9RI0ObjGQjJbO6psrMfSGtzguCH5haRchV+Dny9U91yYEqd4BoJ2MqMVQZA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by FRZPR08MB11190.eurprd08.prod.outlook.com (2603:10a6:d10:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 15:27:58 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 15:27:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] leds: st1202: validate LED reg property against channel count
Date: Thu, 18 Jun 2026 16:27:45 +0100
Message-ID:
 <GV1PR08MB8497E83252D8A8CCE26E65AAC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618152745.924939-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|FRZPR08MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: 541dd080-38cf-4e76-c781-08decd4e2ca7
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRABAnnZkaloX5c4/Et3+qtahwJ8F1ooGH1UM/4+o7TGsyNWpp2bb/wz94XAf09ZtICGptdDU7yc9w2PdPZAqr/td03WX47uYjDYTkXGGGny1dsqSAfdEx3/gHcNedEdzLfe/dC/polzi4p+kI8OLx69UtFjCp59ZmmFFPut0W+2qLhfXfpL0rQKSS1KCFzK7WyAMA0CmREykosGNtE8cmqYymGMv0qwapJCkR/xlY2D6S+Cv0TmEV+dJaDBK6jFh5IaI6fPohuardOlzcV/p7rgYpM5l2dMlk2PnCGC2yEuKhdkNNy9F1nBgrUc27qJLi8EIHFVs1wryNjAgP+jy1VHsJPDYonG89aQPo3y+YcxP+3b4/BA4nYso1cVIL/1fz139DMpt0X5qK80BsjcpZ0wIPVh8Y+a1ybdz57H/HI+VYwDgKw3PRxmXaIaPYAxutWQVmBlybKYUtJvEh3HaC4fhQLMHwZAGTJjm34hpQU7CLQjxz49iEod4SrsYHrGaPPxsRzDh6EmAJZSDb4homu2aN/JTjik2vWn9v8NTQpY/OTqM6cXnbPLBOQmseUeT66T2Dfk8D75Y03odZz1WgMQBtcj5lQg3I1poNcmd+IfNw80sogk62xCPIw7ezJW4H7BHyuIVmV+7nFsLRgfCcDFSn7JA9n9nblb/QPkbqhdYW0q9IKeaVMXqaFqfAXEtGZ+RNnQaPQNklEIiwQgwFS/26hvqG25V1hsh3LgJ4Fp4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|23021999003|51005399006|24021099003|8060799015|19110799012|5072599009|37011999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kxBTk+Aihbyu0VfudkKeZc+JTudB54gQDVjt46pIXDaFl9wcj//eoidXpxd1?=
 =?us-ascii?Q?Z5/kg/bPJdl/y9mn9qvJbBa7vHjcpZIEBMvZlMKH83RmfriMdkC0ps8zNHwP?=
 =?us-ascii?Q?tnRkxq1qVE5sq9+IL5oEV7ld6mAVi5U/M+knc/7j13NNgyivPtgeDzalBtmP?=
 =?us-ascii?Q?g39XQqRIgXK6RfL/C8/XveaU3YfCw+oUWoZuiRCMnHG8n0GqxREfG5hA9iYi?=
 =?us-ascii?Q?qP3ExrwU10Q72Blqlfe2rHQYw58nDrbLlMJCSDWUbM1vn3URNmQbZIM2Eglw?=
 =?us-ascii?Q?WEHhXf7CDBe2mcywERKJVgpXBoeA+mxOcGJ4G+CWc3oXbST8Feft4I2CM/xd?=
 =?us-ascii?Q?zKsQrzR2PKQ3nFYcO6Ji1wx0mHs0QewMx7kLd6QWGCWYAHERcLEDsoNm2/sR?=
 =?us-ascii?Q?LhoxI0DYzac073xW4/dO3OlU45/6NUXxN8GIJ9wzeDMA/fjs4S087+lnm1e6?=
 =?us-ascii?Q?0iks+U/H2gbOpsgpZiW5ubsY0dxX0HSrRuHT8p5OiSGEtH9zGm9sbir0oW7B?=
 =?us-ascii?Q?++qfIGI3iJLRUjTsg9MpILIP+z74SWpGvjiChBdh/he4Y+hp2b5UBvxm4kUe?=
 =?us-ascii?Q?dSIEQlpa7YmeDkkw3/22UtORxhejxK46F0hpYfT/xLP2IC5HDrnfwpnmoZPA?=
 =?us-ascii?Q?JxC9HA6eWQgRaut6Quxsgn+Yqa1yDv4asnSyfU8TFVkOUsocqRYTwXWguYEK?=
 =?us-ascii?Q?Ko9CJ72IuEpyOXBEeIObP+dECfqNjbLdMAa9V3vw1PjFwnBy7Qls+ziVzYon?=
 =?us-ascii?Q?l1B9ilf+bODNLaNtYXwW5i3062YbFz5/+IV733VlV4G6deDT+Z7GhneTBFTZ?=
 =?us-ascii?Q?kVsysnVniSYx9Lzv1JovkGjhZEZ/tBEMfwIGxvIGaHhnKewaR5Y7u8OB+vnY?=
 =?us-ascii?Q?EGS3FRg/es2Tvwp26hj5nqiCe4A0lGpFW41imrZXRvy8srIOKJv1HUx+JB3+?=
 =?us-ascii?Q?lyW0gEuKu/4aPnzvzEv4tGoPxqBMZLm2OE3Yn4QiHh2aurA+dpB5NTpS/wPB?=
 =?us-ascii?Q?Fm6i?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cEoWVCmFEwppXcDWe0KKc7ZPXjm8RgopmEVoKFe2Fz5Zrral3F7CEB57G+As?=
 =?us-ascii?Q?Q83yKj2dB8HNeeN5/L2x9s4A34c5+MbEdVvu+SZ5UuLsnvqqBJDlDKZ3LEta?=
 =?us-ascii?Q?0o5j+WiD02b6PHAqs1W9l/DZQfveyCe5Ja/jlGvF3a7+dFsA8lPWbn27G3Dk?=
 =?us-ascii?Q?DheCzTXsFRKYkgxy3MgGKF+xulNxemiGlVIhmOAun+1cweQabAdkx4odK9wi?=
 =?us-ascii?Q?BjEF2z0DNN/rPpefxGy204ARJvhhQloBrH9fiYZGDsbmpjSeJXXr5OA2Fgko?=
 =?us-ascii?Q?apEDybrzDF0Ki4IXP8Hou1DL7G7HP5fgo9j3t6DxKnBFNl1M9CQqTzRVoSKt?=
 =?us-ascii?Q?4Oh6rKxE5TnOOxLiWeJ5PLzhgjs3QRvSDxZ9yY0VO92mxRWCN8RXWL36H01y?=
 =?us-ascii?Q?rEh6y40dZamFCzrZih7IQbPnD2XoQolr05JC20E5TkJzV7cNG2M6KQSG/8Ef?=
 =?us-ascii?Q?6MIDg8j2c5Lo9uJQj2uS/MzSdpenf03mdI1hZ7ShogeVam5MeJyErbNFBGFC?=
 =?us-ascii?Q?BrKqGwcGEx7gGwtyGYJExLyXQZZpe870AFGsUsa7A7Vu6Ji0UU56RLiyA3Cf?=
 =?us-ascii?Q?m4bmwYUHu9+a7GcaJa+xvWBIrcHVoIQt7VNRuGhZ+xrWpp2Cgjx3PjgHUJAM?=
 =?us-ascii?Q?kSk4shpwZn2NZrtRZl3iioVkV50GJHpCJY+DNNRE5u3FAbE7EFjP919QP6cH?=
 =?us-ascii?Q?RAJODmnJVQMhEt6B/bdknvevMngBQWFaxxnPJl4UhK3aAjo2adk93aiIecl/?=
 =?us-ascii?Q?UvWNm9VDsFVL35WzwIU1/HuCnxAa47ZdjUW0JdFDyyHJsoegd5W9JH507iik?=
 =?us-ascii?Q?zMYuAHzDSXVrgx7Yov/NJdd1Jwf5U/W7SFfQQTVqCvbQGSUwTQqHBM6vaCzX?=
 =?us-ascii?Q?B+Sdh6It/CTM7eTHBusbqRb2Ahd/P+sMaApTvFSRmQdQ6Gpem9kq1EVnQegY?=
 =?us-ascii?Q?9Rpy8MzXEzu7d+gAsmVeLZrAjyIpiIfjfjtOwNUnGOcL7TReyZkgTboJ06Le?=
 =?us-ascii?Q?70nSJyb4PpOA2UXPHWbLYrGdJjk96LOBPEYsuLQcQZw7t4Ewkq8KR0M2GNZR?=
 =?us-ascii?Q?Yl7KZxAZiwfvaRrnu5e6SxsW4sApbSdsfrNoyX1zsvOYkkq4mZ0r2qqbtHBN?=
 =?us-ascii?Q?pLI+QAoQ5ugxOtGtjqCEXs3sHLHaXw0XmhYlHI3LRTcebSPNPxDJNS0ABZ7Z?=
 =?us-ascii?Q?8t1rr6crtOgKVWO5wohV1znJZ80OkQQKVqP9J7UabpMjUWwaV914XnN9bj+d?=
 =?us-ascii?Q?+PEwji4JD8WwAVo3tXo49f3u+P7F/7jK2jMLWBwgnlid3v71fwBEBZ3Gr2NE?=
 =?us-ascii?Q?qZ1EnIHl8xhWtuZPADbMAKBbmTZcOBxXKYjpEfuBUni3EGNK2R7r4xZhDDbQ?=
 =?us-ascii?Q?Krh1RStNazMqrFf2g7Llsmmdg9+zFPcASv8uvo/yQSEtSOiWxe/ZEeBcsM3m?=
 =?us-ascii?Q?avJHjgjBd/0yZMmVLz0ThDSTQdjzh5+x?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541dd080-38cf-4e76-c781-08decd4e2ca7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:27:58.1027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8673-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A1D56A13F9

The reg property from the device tree is used directly as an array index
into chip->leds[] without bounds checking. A value >= ST1202_MAX_LEDS
would cause an out-of-bounds write during probe.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index cc071742e703..f2375bb24b73 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -286,13 +286,19 @@ static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
 	struct st1202_led *led;
-	int err, reg;
+	int err;
+	u32 reg;
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err)
 			return dev_err_probe(dev, err, "Invalid register\n");
 
+		if (reg >= ST1202_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL,
+					"LED reg %u out of range [0, %d]\n",
+					reg, ST1202_MAX_LEDS - 1);
+
 		led = &chip->leds[reg];
 		led->is_active = true;
 		led->fwnode = of_fwnode_handle(child);
-- 
2.54.0


