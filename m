Return-Path: <linux-leds+bounces-8505-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RqsmGTzbImrkeQEAu9opvQ
	(envelope-from <linux-leds+bounces-8505-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:20:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB4648CA9
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:20:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=IiKB1M1t;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8505-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8505-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A71AA300B9E1
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0991E766F;
	Fri,  5 Jun 2026 14:12:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013087.outbound.protection.outlook.com [52.103.51.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4C356745;
	Fri,  5 Jun 2026 14:12:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668776; cv=fail; b=qYhsC7PsTrPISsYO4eg4GdJz9UzZn/5wFQgVbVOpe6g4N8imWsSBow4tGw2ToXGo8Z1DFddQhouhSuML3VBH1a89Q3Hh9TbaJd/3umHGkBVJuk8ws0I52sM8uWFyKw0r26vVJPJndQ1Ad7i7yey7g221QJC82fpt7cxXgaXR6lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668776; c=relaxed/simple;
	bh=2zfe6zbAFR+zEWd85z604M6BDQtc8vNMH/lm0F5FFZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E2N5SiB7VNRnOV7F7vIF5hu31DVxr7X+mATM2ZflFeIkhx41pDi781kL7YefoJC2vp64GoeR5MOrFjQOaUJ5/bSq31DO+1HWKZkXWAAGvkq4++2alNKdEb+z9U5Yep6QHKtVEjukvjE1pVau/YjmJG6/+3s4Wzk82NOpdIYDtL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IiKB1M1t; arc=fail smtp.client-ip=52.103.51.87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w30G4h/ksYvMG37EM4XbliGpL2pb1hzR7ujmLAyupMQejUJDaWvvJqli6h0p8xujbnMc8tENlK73Qh112AK1Ezn7UhKQVOALK4eTC+4UXZHDEaPBIYArpIqU4q7lg9A06PZ27KYKiDMbkiL1nPjm617xgNvMkRWbYWAus5updecbqPia5XVTP6wvHxQZ1T1oYpQXom8wJLFQUAxBc5HQCc0cfbbQYrbzms56zrCVhDX9BKu5Z0YJFZbsHDC5FEpDO5lNNRegcKL4CRJ5rFWvfMjn0XSFJp/3CRtFo0PfB7G8BAZ8t0pqnYXYI3ncumDNmdnl0i8aHOpSlAk0YnnDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=LStwybQ1UNByKZ4PtvE7/EiU1pwxEhWtkQXQ3ZsD0hQABh4JAwIH3YeeWCNHwAU/4QWrICsoSNRQeHfp6HJrgwBhwOf1jw3MTMr60al+p9uzwC42miQ5xYLOhaKNHv0oO6buVr+1yBrTj9qwcsEVTdvGm0yELn63FNf9gElvXG4dnO/ZgQG9yB7UvpgcAjcyx1oYOXW0U68bLHhPTmfqtan9a+hSkL1mTc/OA+60Y9CZqF2ca5I5uLL44gS9Twe3TL8lymBD0hlUGkYlzJh9G+t97nxnw+doqu3lqzrkSJbv3/7wheyJqJJ7i6fNR67yjuQKxRQoBMNwvMO3KERhLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr7eWBXEQOHQvTQprLYOCuJuOuhTf0KtAc0IMC7Td/k=;
 b=IiKB1M1tGMoGJ2wi7K1661A4PTFsIG5X7ykshJ/GuASakwM/4PBbe5Egi1Z7T6uFHs43S61aByuzZ+EJXmq2n9CisBHaZxxsLhU4rgq5OCpjULxK1BrnWy6LLE6iRMhbqvjN6T96aoT8IFpdvjEhf2hsKm4ujaSejBMn/+BfZOU617R8sZMZ+gBqrAIMFw6/f94iEEawQpweyGt5fJX0qpLO2NKFvB3+3MlzlZNBeoLjPT5e12HpPIdBHTerx7jtxORv6K1ElEPY50jv3FAanSbPyJ8b9oG0TgAdybv0HVoKiBxInCYZ2+X+/dz159/cVUzgBcpgpKKtgV4EiiVrEw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAVPR08MB9377.eurprd08.prod.outlook.com (2603:10a6:102:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:12:50 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:12:50 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] leds: st1202: correct and extend hw_pattern documentation
Date: Fri,  5 Jun 2026 15:12:37 +0100
Message-ID:
 <GV1PR08MB849702AA55C6395CF36CBB56C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605141237.1484959-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAVPR08MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8ac3bf-2014-4fd7-11da-08dec30c8687
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4CV84a3qBhETxnMsAqIGv351KYywmlQlSjMWhiWubyayeEcfdcSkN2EzroXbTjFo7xHVTovLOdTXcGFeK0N0m6EbxN2CIN3B3YjtBykxacP62c0s//LESe6OwIX6JPNr5NidXD1bc++ZNlFBIOTb6W6iFFue9Xgu7V1OWy1QkRGohYlRSUp6Hy1X0LWNCX/9vc6RDMQJZz7zuCHwZtYExGlpHCwrBVJBkSqHk5yrQGHDP5UTAfwnxTjyzFv2PPflaMNRoGJK8RYdRP2zfqgy3LyQswMj/EkkQbm/2JcGRErlDNl3s7jP3X+Eq1f9onloPZPmryQDro849NePDrNFBBL8E3GditYkT317+B65MvIvGw337QLW2aTpZIgNWtTiLPiMxl6sAF1dgY9McqcQkGOo3PCo3tiVptYKtdCPyRYt3Z62qQsHmWI2nQtwIoYMvycE58YviRgZXDLlSrviDN4X+hNYC/eHQO63rAn+LnfBzNSby8OkGF3AjH9hrUfDjqoifz9Szf/3/yVMwoqDWdcwMm1glnkRpJojqnPUwhXmphFI8FoB+KKbtJh84QHkdZIVvDTRq7DadEMdPLzR5lZJwipoyXojj12ncW+WxPZqbcKBoMucfIHFffI5pH/fJUOR6enH0SA79zZBY60ovSY5UPrm6gDpNAnl4bXdgXXwd+eLCgy/qg7rkT3pl+6KUgjxhNlbfYlQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|41001999006|55001999006|37011999003|51005399006|8060799015|15080799012|19110799012|23021999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D1GdoEOSLs3mSLHhT6eBqx8TCSMw/blk2K4o8qkh7zlMPQUXTZoGLvQhUh8O?=
 =?us-ascii?Q?OGv9S0Z2X6HPKxC5dfkzF92C7rLoiv/MfVnJEohdgXEEnNYi+/Iu3rTrFqtO?=
 =?us-ascii?Q?DonXVPm9pvKB+0VJNuTUwqWxIZBr+b10vsKWlxMXC1WpdcokRXrHViw3R8IF?=
 =?us-ascii?Q?isv3CvlD4c07tEGQwd+8rXz8L+sKjJggp7A4c1M87928lXMVBA44PYUe8Ehg?=
 =?us-ascii?Q?D9GCaF3R1CfH5xZYe8jcE4wMVWBYISzefnCL4/H8eDD3WjBSCH2gQqL/b0jC?=
 =?us-ascii?Q?anE6Va/+kZoRkkVwBEXT3EUp4bYQVRES8cTY71f8DJRqhtq58VnWQRP5tSC7?=
 =?us-ascii?Q?dByk5rkkJw9g4bOWU/91GMfbodvAPUh83uGZwaSnQfZT0Lq+Mwljx4TpRONI?=
 =?us-ascii?Q?tTEcjGGmAMb9HnRVhcBb6EzoVZAqdWmRDa4T3yW3zPPKNTJ5iNIJTVbpIvbh?=
 =?us-ascii?Q?JMV4DoWy5s+VoCr25fng1ZsiF41rUVh7p+g4Dw+ryJ65fU+fzL56JckeSX8b?=
 =?us-ascii?Q?3nmBx/ZzwjcmQylrjpVa4Wx29uP2zvvzSpLaZVzGkg+CcPaN6N2r18rysaKz?=
 =?us-ascii?Q?zOeaYRQCYBw3MFp6Gkws3IazKM8btlELPjD/IKUsu6xsM5YwldH4BlgSmqpP?=
 =?us-ascii?Q?D4GXdPvvKuNFfO3A2ZQTolh6udarJrc8p/79ytJ1HBpiYZO8uXFmipFNuuK0?=
 =?us-ascii?Q?Ah+cVH5Me6XKgHeejM0ZNs2ga58VDBdXTFNgdn7uWfckWsngCAv/Vkpljztv?=
 =?us-ascii?Q?oWMgN0kHBnVmM08JuTYkeuHBPW91SaBFzcfGwRTl9OeeWNL4TU/Gttyfk6Ro?=
 =?us-ascii?Q?eHp+DLuw/KMBTqhbdSWIOChhhlyFbofYg909j7J9vAn6ovddPJU+4ZA/NQq+?=
 =?us-ascii?Q?oMeqzu06yZHzHhaC8fy49n7dYt4J5kL/KoND+gVA2eDwU2BpcDzN0WfbVPHO?=
 =?us-ascii?Q?fprND+FmSOTrmxU/hO0tSPXo5/igUFreTBhUsXjfYgUMaQJBX/hLxEg15Zlr?=
 =?us-ascii?Q?LeC60ocO/le9+gG15LOOnxBhmcT9pcmHypQrjvZfXJaqL1A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eyWJ8sOxLQGBCGfvthWAmdVGqg85hTEdDQUOIE5CCtRFCwCyq1FpIWyPd6EH?=
 =?us-ascii?Q?PLWz9YrjxjIs9GtBCTeyw8zCAY49tL+mD4DDOKTiQxXdmtmkN33fTVvtl7Qu?=
 =?us-ascii?Q?YhmcAqgdrn/w6+qG6VVol2rWglqxWo9xloQTXWY+7qZDjBUrQNRaczV7HONk?=
 =?us-ascii?Q?fRDqulJTa7Id6mt92VJTjc4MI4+0u/5zHAvyrF1+O7mtsGl8psR42zFq3qcs?=
 =?us-ascii?Q?xOpDBVukuLdjoP5EQpZdwEG7lqMEZX2TKT7CdlAqG1q3qo00Gajk/l2sxVOz?=
 =?us-ascii?Q?wHHhm5RsfLC+i3VS+PAXt52isQUQt6aEUQVQ3Jc8gK/BUxwu5GUssj9I0Jsz?=
 =?us-ascii?Q?l+WBLX1YH55rFKoVJslwcLT9qVusQ6I2kEoEzjuxS9SA89HqYOyXoR/cTRnd?=
 =?us-ascii?Q?XhA0BddUa9UiQp4/Mdp+SCsqLkv/AzkKjFvDB5NNY5eaCFGBlaOm8gR+ruPn?=
 =?us-ascii?Q?QeTNcVT3nlZpWoI7rJFHj0WG9d6idXmb0W9dSHmWnLNlhbaCPK1q1i7zsGsk?=
 =?us-ascii?Q?rRTS3uUKqle0xrM9Hs97mb494wsiIsFsVfbXF3ZAb7wJosBDuPp1LXllvpSG?=
 =?us-ascii?Q?ZMxlxEf1kkM97E4sTx9A6jDGqp7mmvCsgqISmpKl6OuKEwU9LQfMgPRY88Uq?=
 =?us-ascii?Q?Z4RCs9d9yQAOtSWXKLm2c+AfGZ+RM/FRey9IiIpjFwy7+EAzwKVwsXrh+DzP?=
 =?us-ascii?Q?R1qeHqWPE2oKepyl3nwvww1vndBkUDeaImrZ3nGILzsrV5dT7Oh6kQzf6idX?=
 =?us-ascii?Q?xBsdelyxhCXd94I1sH8GNTAWhlVxx2N/mybkee2R3IYPzcvI0E68VkIbEkKw?=
 =?us-ascii?Q?g8OAJw4vhp1P9hltwnpnPg7AWlCVSmrtiPX/v9TkwCdWfm7CnSn3Sfi4arJq?=
 =?us-ascii?Q?C6T1HvY/pC72hvtKnmsFb0m1xO+ScP/HwmaFto5D4TulnT/3Yy7ASpBSfY6h?=
 =?us-ascii?Q?lj9DSyQDPy3gvWl3huMsqe4Axh1xwQrAUHKp5KsdO8Clgb9QIvuXvrl4st14?=
 =?us-ascii?Q?PjKHyZALZYJnsRlme+hFYLunm47+JwlFpj/VOB7nPxmy3L7yJtApbinLzJbb?=
 =?us-ascii?Q?yRLVD/XDlA3p8eEOHQzBOtPk3OH24CX3zaBpQgJMYADe9bY0T93HZJyLIXze?=
 =?us-ascii?Q?sA2SZtQG5V7bDfP1RYRgrZlssOedFT4Dq5AQs9lzaK50kERx4m0fL9KIWGZF?=
 =?us-ascii?Q?bo1EtsfTRw/UP4Lmfoudi7deV0AvBtnpIzwvhpRHKl91ffUN0VBBqQ4ZhQE8?=
 =?us-ascii?Q?E2LqTOgQlOS+QBCC24L+Nlm8aC2vr5Xq4wN9a3QHZzmo2vAf6AhnfInK9d2c?=
 =?us-ascii?Q?dmk1zqIYzMcT4O1k52g4/o6ekhtyTDtuazCI92c61ofxlp6Z+f9xVZ6g/zjH?=
 =?us-ascii?Q?DUop/NyN2zCJfp370hPhm9EFnBmcekZbc04+BbA/TT8oIEsfv95IytCpOzJD?=
 =?us-ascii?Q?C1SvVOpVF1wHvrGcp+0zVQrsv5MiwQCe?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8ac3bf-2014-4fd7-11da-08dec30c8687
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:12:50.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9377
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8505-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:from_mime,outlook.com:email,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1DB4648CA9

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
2.54.0


