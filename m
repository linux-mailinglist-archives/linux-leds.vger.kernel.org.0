Return-Path: <linux-leds+bounces-8154-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP3ACs6BCGo2tAMAu9opvQ
	(envelope-from <linux-leds+bounces-8154-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:40:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A107455C1FD
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A4A430158B7
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6B03E1234;
	Sat, 16 May 2026 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Dc5wq+42"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011032.outbound.protection.outlook.com [52.103.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C283E2742;
	Sat, 16 May 2026 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942392; cv=fail; b=s0iIaIVU0eoKVWoPIJtGTnAl8aeGvoKgySYL/la6kTMQSYt93VYaOdsWhbPyqRgZpFtvB7NU7YUFwymlIXmAXfXYAm1K/ThLWZBDUB+mCBKa4zOlu4BhQGjbT+2ZCTgRVBRxLB9SAVlQrSCVvIRiPp+0bLevvwv5R0EMmG4/lGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942392; c=relaxed/simple;
	bh=IjU/5NoDsHu0wqkIBcOHVEJ7ua0ZbfajlDgpoCw7FYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C36+bsGNaDzY4aYtwg8k30PZePkDNdDP1/yZBfoqvRcr0q6N36PltcorWmBfupxAhuaYklYrbc8/xjq9wTnVof3gF1pjFDyr8DIDs9Y+7CWdWNYEAISziuQbUdCsj+LO87j+4OWuyVXih+n2OJizk8vgFZONFx1VsmHTS4fTaMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Dc5wq+42; arc=fail smtp.client-ip=52.103.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWBpReiX2iQ7wtOuVc+r69Zyttu4fCKbjTliXcjFfQxrRE4WQ1KWsCuthAifF6swq/qFd0ZkAZJEg9Hqkoiklw7GWewLrN3adQWxriBnW2t0bgfCedpfvd4Ln8z0YvL/xJf4Se2GcAhyrNh3EXQvgfiVo8Dm4Mtt6GvMGwUvWzYfqK2c+fhQPP5gqYG2b/0YmLjREbvZDTX1jKW36uELOjKH8kVqJRRJtjMpwDIDH04TNGxsXcoe2j7yHB90z9V+r0CklmlM/A1W5r+DIwnZuSjnBgiY0Kj4DuLA7Yh4B5zufV5mFbQsF3eHHcyVGVchOH9jWQ8FH3T1NiSDgkKraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY0VMFfykmTzTfPtWcJtPdPeUmxqvQzrE1ueMYuVQU4=;
 b=zDUY9uYkGcET8Mn5s86WgX9GzUFUTsFwdoBMqH74sNZMAKLvpB3dATFQt0ibeJW1v1LXcEVjrM8lm484FrG7764GMk7p5k7nT2Ua+gTKn66Wzh1A8Z/vcAac9thtqvwaa0KB7Rx2Piics8BUHxLyTEyBBWb1wQN9vTmk3KVpbXA0Usy73CsaljQH9yLklyB+sq8Wh7NVYakL05EzEEDQcONaJhKP4winMaWILQQKnQvUxm74ipRNgk+GiWX1jnoGnq/529inlnR16xwFhgExiBtIYkIhHrQvi/9Bje09xIeu7GfK6OBop9RQ5nVxevvUV0NRnLCYf9COJF09v5dWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY0VMFfykmTzTfPtWcJtPdPeUmxqvQzrE1ueMYuVQU4=;
 b=Dc5wq+422p671//hWeHOUGufL525qzMmZ0RXX+RGtU/NnOxPtoRMPjwO5Rdki5lWiNd+Vw626kl5YHaBA9Hu/tx5s/ebMnX7KMQMDpXYi0ou0+p4FbUryVgswIJPtwFKkhR6CX0thye2HIsJMXI6YY4vTO82QnbjklxNWIwUr3RtZo8SL8M7wTnaOsokBUpasVOEws02YIlJi0JmpSNyQlmQCH0SZSTYtAcCchCm4zql50AyvrePn7O8ATqGySTKqFDYWjw6ExW96+h37N0rQvnwkDaN67dGd/+C001s+BvcvOen4FhjHHdOWvIK+dZV++yD7ssQ4R1QfZ/wDYplag==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0061.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Sat, 16 May 2026 14:39:47 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:39:47 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Sat, 16 May 2026 15:39:34 +0100
Message-ID:
 <WA0P291MB0385D7B7539C1643D1536234C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::17) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143934.1646423-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0061:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad845c7-1431-47be-32bf-08deb358fa45
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|19110799012|8060799015|15080799012|23021999003|55001999006|37011999003|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d5+KCt9H9THBS9bkGCS+6GaaUDu1htddJ7qMM+iLIHnnQZimC5lE6u0Frx83?=
 =?us-ascii?Q?Jpldi0BQUaR1OkMB0eZnZZl2iwIyusSYJ4nSBe30bTMuwYT+VymdyuSvS8ut?=
 =?us-ascii?Q?3+6C9KuluXNBcWP+eiY7Cirb5Uy7YTGMdoblYNMfCwHJBFS9FXHEkYVHMNDD?=
 =?us-ascii?Q?1//tHgsPsfqmm55MNQZ48eHV6sg73aGisuyfdHDQ3RFsViJ/iHyPdNrQFq6h?=
 =?us-ascii?Q?QDMbgurwDPZJ3py9/DIzyZw7P39FGQT13axqp8VJ6o5mXbQ/oRNrjXezlJ6V?=
 =?us-ascii?Q?F2F/kIHfpN6NLqoNz19VmfmzCmohU0gvqJPbdyvVdV7quYfURArq9c1ltpZ3?=
 =?us-ascii?Q?Cw9WrD0UZs7DxLfJNK1arXZbQ24h474ahVBEjAGqdSV8axZy3d3/mAgEM3OI?=
 =?us-ascii?Q?9mzuMkItEA4kWczvhFcpA3fer0JRlJ75gcUWeTeoB+sHaQKu5xXSYerMDwNE?=
 =?us-ascii?Q?u2qTzkJWJb+s3GYN8VpCf8TnzABOJOnKaSbK5OR+4mobng7bo+ebdm3/lyf7?=
 =?us-ascii?Q?ffKjgsRKva627rnaEhzxqI5LBRGFFiKG3kOLKPX/6e+Z/y1cbeLbupAL/xj7?=
 =?us-ascii?Q?joq+YRmLe0hQN1Fb/d1HYCVkBMMonDGL0l0FPkhBsB2ot1IaCdhjaj2dMYf2?=
 =?us-ascii?Q?hOVNCGkC6OfKPwxtGrD885bAzQNasHyJwWatT9W/OHi5rWrwEdaHDQ2Bt8C6?=
 =?us-ascii?Q?nmgZqc/yFjJjtwMf8oEEZVybaF8bopJtrQ+isziYgDqOqZgS9jujGDTStL+c?=
 =?us-ascii?Q?PIprJdyw7cx6SU4PdoiwMbjNEwiCKRu3ItPUj28KuQ2wUBIbmeCO/tPJbCg2?=
 =?us-ascii?Q?BrhcBugDQZmKn5QQSxaTKHtjgkxbke3WBxdUM10snxqV3/7sVDp1C3MlD1zR?=
 =?us-ascii?Q?A0XUd6QOxhHxUTWN6nAJv5LZ9tqgrld0OewCSqw8S9CnToHdeLYMB7mQxbHE?=
 =?us-ascii?Q?3L5Pml4D6t1WH9IFGlWUjRZs2j8ytkD9nU3niHpBYNyQdoAMHhtN9ZNJwMLo?=
 =?us-ascii?Q?AQ1r?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZK9vDD0rcC3cjru5YF+leYA0T/HtfEaFtKl3rg4N5oakAhizd1lpKwrduOAl?=
 =?us-ascii?Q?yydc9OggwEMQb8jOY+L2NHnRVSZrJcPmbWeqnCPwem9AP62720Axuf0rxdnG?=
 =?us-ascii?Q?VPYbG578GIDV26PqAYNPm9Rm9tdqP069y7ZUTzwrCM329YOoJFYYRlJzwjeX?=
 =?us-ascii?Q?kBxV5Y1BfVE0FQ88mH4l0R5miPB+o5mKDJq6Ma9wk90tsxIrWH0k/nBcDYUx?=
 =?us-ascii?Q?UXAgzXMXe1vtDU4gx08eAdyhzfop/6AsDwUtYz4GCwQaFlH/pdePlW94zv8i?=
 =?us-ascii?Q?kFTbEVQZJNZkRUGTDvlNzlnbvUNkJgKT3+gtvbS+H1PUlMW1soG1QUr5z4EH?=
 =?us-ascii?Q?TG+FSc83Rw59bbP3PwpmLqHtbByQ9jg8GXBDKMHYxbe85WqGgpJlYoVCu7/1?=
 =?us-ascii?Q?DuWlQip8hkTHdmfaJpYg7yTkQvlWizOZ236axNv7wsELjPa7MLtlmg0MfXTf?=
 =?us-ascii?Q?Gyp/VOCxPRnLc/xXP1fvPMHBjNmrCGqbVcFFEkjVAR3qHpeQ0sFtcMwbHBUA?=
 =?us-ascii?Q?4QzwOYkG0OVFIkre6CfoPouRJAjdA4v1dq6xubDIV6jD6dW7Zq18XlpZCmem?=
 =?us-ascii?Q?dz5yfKADyOx9LRqqF7l7sSlSbLrftFVOwQmENVkb75S/fQd8zr3cjE4y1Rmn?=
 =?us-ascii?Q?gtvnt9AJLNEEsJ/0qgRYftsOVxz3rjceWo8kRoMhbj6QgyQSFhKi1jWIuVTG?=
 =?us-ascii?Q?qRHpPLsf7MozHfabYkwcdLH+E73MyRI/uM/oyhXelfsDlTyZh9K7dJjEg9Gl?=
 =?us-ascii?Q?6wMu6obMiYuT/+CbqLPFL3Ha5Un/R6xn8uNO6g0CrxNpbmWc+dEUuZQa0SVH?=
 =?us-ascii?Q?F3P2v8AADLcQxC4lrIwjthp+pBMohnWiupln84gZRWmZ2DWd4tGclp5ZjW5t?=
 =?us-ascii?Q?29khPMLPB9Y8thW/Udzpll6Upd/6JXXg5Jh6m82gGo45luDZatvDf5rHr4Ao?=
 =?us-ascii?Q?XaEWgJ24rZ/vd5nKEW/LVr79emheWBvAmPwXufXV3FeBD1UAV2pmJSkugoUx?=
 =?us-ascii?Q?pyzjw64/kFtvzZi11+ZVAHbj1YZHv+9Z3TKKkW2OJ5WKY9QjayW8Hbjj/j/N?=
 =?us-ascii?Q?93IhTdhN16BKu5ZffRtD0b9ixiRl6ktp09Z/zJXu3CMDqJPOgsuWLDfM9RV6?=
 =?us-ascii?Q?uG5vd/KRIJv+aadXvhzzWTKurCSkEJpetBnfy4OXlkda6om6wBcixF+ABYGm?=
 =?us-ascii?Q?Vl2fBJ+Mn+K5m6W2FXOYyV8mZpKPxtOumv3T2IwQUMwuhWyQyVwJPpsPLb52?=
 =?us-ascii?Q?/tdgNsea+R3kCyWk9ZgTzBn+KUUtrqUSAKBU5FrvYEMTMlz6KTYOFrEm7CWZ?=
 =?us-ascii?Q?8t34qJXbl9T+vEFn2XCG+v3Kh0TOOLFY/iBTZ+N3ohxDsYenYRR4PUPdQTEL?=
 =?us-ascii?Q?/ZinooHFnUX81sBesFR6Fw3lQsY4bjOr3VPWbOqX2EbZ9sV6jhv34WGa+B56?=
 =?us-ascii?Q?8rds6diPvt12gZ6BFgKSbdPSjWqJF3zj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad845c7-1431-47be-32bf-08deb358fa45
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:39:47.2913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0061
X-Rspamd-Queue-Id: A107455C1FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8154-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

Once a hardware pattern is running (PATS=1), writing to the brightness
sysfs attribute only updates the ILED register. The visible output is
ILED x Pattern_PWM/4095, so the change has little effect and the LED
never returns to steady static operation as the user expects.

Set CONFIG_REG to SHFT (static mode) before writing ILED so that a
direct brightness write always produces a steady output at the
requested level.

This also enables basic LED operation without the pattern trigger: with
the trigger set to none, the brightness sysfs attribute fully controls
the LED as a simple on/off device. Previously there was no working path
for this, as brightness writes had no visible effect unless a hardware
pattern had first been programmed.

This is safe because software patterns already run with PATS=0 (making
the write a no-op in that path), and the hardware pattern engine does
not call brightness_set during autonomous pattern execution.

Note that CONFIG_REG is chip-wide, so this clears the pattern mode for
all channels on the device.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 9150b92ccbac..bca2d9a80b63 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -136,6 +136,7 @@ static void st1202_brightness_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
 }
 
-- 
2.54.0


