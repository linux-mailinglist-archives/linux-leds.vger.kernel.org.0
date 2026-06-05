Return-Path: <linux-leds+bounces-8497-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NuzLBTHZImqNeQEAu9opvQ
	(envelope-from <linux-leds+bounces-8497-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:12:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F8648BF3
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:12:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=T84w4HK+;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8497-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8497-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49BEE3003EAC
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956CF30D41E;
	Fri,  5 Jun 2026 14:03:38 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013087.outbound.protection.outlook.com [52.103.51.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4A217C211;
	Fri,  5 Jun 2026 14:03:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668218; cv=fail; b=dBRLfP5oqTIsM8kKgFrEN6FMV3skUE58LNYFufjndNQPw0fpZDCtU1K0tFes/FqgBG4gFbe8u0nww3wMmiol3BgywEmDVwLy52XkELmYQMq5Qxh1yHfS/U32QxSexexSwNvPJJ1Gx262ZvpfVrzJ5yXfL1AfDO/qkOUQFnJtkCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668218; c=relaxed/simple;
	bh=jkn8GXE5PLoLZ+WqjKVfE1sf5jRh0K1N0VTcoWDWZ0s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jXgXknR8Q+1JHshl9L4QGUd4j0uZTC22lopuwR3XLECdwtGp+C3tf0ql+2RsAa/1fM9R3b6qXIgMjuSX05mdONKBl+B5B8UOfrlVkwvFeBYE67wD2f6StYa+eXM8raSlaGOvfBARhbW4GGKrzcwq3GfWHVpLXYXK60KxaoisYxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=T84w4HK+; arc=fail smtp.client-ip=52.103.51.87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umxJJUScGHUr/rda+nBFXFATrltoASG5tjRZAThTI+hEVRwqYukY8zs3bFjroWKfXkCDPXMLuEyzKDlJpgOUFUYCDZ7dtHAoNIPcfhObMrZCIyVg3deVjLQ6bcTRJVJONB+3P9AM/8ZG8awP0hXGii/90UafWyDmZmMur4HIBOc/YNttyl0vTfoOtyukPefNWYFriGTaS+6hCX/d7WkjKRamiXdDZZTkjVYdeG/r0iLIKk/j7909hXKqVY6As1UsIbSnK+eqEAP9OIGXww2wDy5AzKR2fgZKdC7wLDXjVrWvvGiPEiIz/vz2CVHkadtlc0sA/2aQOSsf3GWvfzAFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIiipihmmgSJTCzdJx+mLzByzv1iR+4oE32XBRfDSjU=;
 b=a4nkN1Z1yKsQTUyWTaum9UtfDNVr34mFAlM++nnKF6+nljO+W1cBqjczANuEdAQSFUmnP4LGTq9IL8FQE6w0hrSiia0VZn6HqExDof52ZOPnLZ53WFKtneDN/3seqfUEDpEOstHGdxhrgETFtpsFXjZH9QVX2QkMJNqaZtrZXPOSqzf9pZThhpjxex3/P8EOvc0yFoS9ATApDzOBmWqC9KyUVFR1flHt5HV4rVvB9AUD/5fBIJsU5+YWMis66NH7KPEwG9D7W0tJ1laDagQ8VJDizilgc1AZHD6VI6PGb/7gEomjjAEgSDRItKokmghU/7Y9IjxuxdL6Wyyoqd+PhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIiipihmmgSJTCzdJx+mLzByzv1iR+4oE32XBRfDSjU=;
 b=T84w4HK+ypa7wOyXncwdWq1A40YPOVD4vwtFyo8rv4oyCMuqhNr9K837nBHCEtQQ9FSckjoE2xqXZ9r3/RpZXRiXm4guaYokM6UH1++05hJHQ1d1lgFZiOOCC10Dkj/brLsj7pRtKc9dk3knG37cjbI4bILoAE/u2E5kCeUn4WsNYC8dSlzPcNP4UKX7JnpQTOecBczDoObL4QdKW6sMQA9O3gmeAjNjS9AhrAM2d7TYcvfDW21Zxi6FUHozYoj7IkYw4numsuCKxaWrJOIYIh6JcUrvCd9+Iin1PvPQysrtd+7CQteF3ZLPi7le6l+pg7khYnEp19qb22WNliFSng==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU4PR08MB11573.eurprd08.prod.outlook.com (2603:10a6:10:626::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:03:34 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:03:33 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] leds: st1202: stop pattern sequence before reprogramming
Date: Fri,  5 Jun 2026 15:03:20 +0100
Message-ID:
 <GV1PR08MB84976729EED25ECB484835A4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605140320.1431585-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU4PR08MB11573:EE_
X-MS-Office365-Filtering-Correlation-Id: 80654674-d798-46b4-715d-08dec30b3ab9
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4IAaVwzmNYz3j1POCPJxJrOEA+wlz5dg6sXvr+3zOYdw/w+tcyhisgnyh3xn/3JwAIHq8/5ZwBLCPvCAwuDXj96ZzwlFcaRrexzgR1U34ZU6Mw3CN6Q0JYoKggHT3ZI6bhMqcfqB7vzib8lpGo9jW6+dCsqFGgZF87D9lO4W4+OXGJFhzRgmdafiSVNvEuPI9/DNJ+lm28IPrDH0jizGSilQg8hIsgCYObvf/zCN5bRQcLuG4AFVlJwTHslWmNdwliuDr5aHl2BlMCPNBmuQVaBXvERtAvZrx4Fb3h3U2D4svtbrUNtfaQYcwjYB7emusOeemEuYjSQHtP3f4Koqm80aKygl6kv9wRkOL1UsSM/dDK+5NsM8m8cvnbE4IrvlFzDv0u/Dl2pJ13TbL47xLd+lSb1gItFr9GXkSH8rKutB+nGHEzXsMXAq0HTU26w/BEBEgSc+sUTAKlW0KTw23roUcIsSq+KJNgGYUKxfcS3aoJ1TXxU5UBIlAul4vU7joZzbFEBbBrXj8Y/zyJLXWqGIV7b/OmzuXUS2vN7JKQBVYFndDYo1ahyiWVbobZThAKiG7Z/0Ozpc/80nLpFvyMhvV36majFQ+cC+KXNVJgdG2AdaGjqtsykWrafTfecD1g0kXApefgVekrTBODLA6b1pXkLvwppn3Q1a06QukWNsZmAD7T7Qhgimk9zLhMOMEa37JWqKM4Oc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|23021999003|37011999003|8060799015|55001999006|19110799012|41001999006|51005399006|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9sTIt4jmJQoBNb39aKDI3KpOaFYOgp2gdH/J4n1D0ZJcI7sZwrdFvg3PDl3X?=
 =?us-ascii?Q?WZkjFNVGJpLI6mQS8AXWk23QEZrgdK2znGOAvYh5+zJvfdenlIxeSP1Hwjui?=
 =?us-ascii?Q?Sb5yzTlF99qc7AP48EZk2dkDU10Cd1Jfor3nDsSXBQytdaKUxnJtjw/tC5Td?=
 =?us-ascii?Q?/D5kQiLYY9qMTN2GsoBV2/SEc+WSZyJfAXXcqXhT99MIaL1AVoFnFH03+Jas?=
 =?us-ascii?Q?wrFV0UjiGk4I8899eiGQbg5SoV1TJzeLi8O3xYMu2wUg+Gi3SznRbpTDaGfz?=
 =?us-ascii?Q?Zv3YrXhn5J//ybCMkQpG8UCmiSiOYwesmAfqFK8xmbhZMW2Akgar5t0N449R?=
 =?us-ascii?Q?alPMA3qTpSFh4UM5vUbP96KeTp0wjLyGyWVisrcMEkKhcmN1H0PhZtbMiMGC?=
 =?us-ascii?Q?oOt1NzFz6dGjC+2F09EHRwaLnY3TU4byzx6c93dY9owYLxvI7+EglojYnNl0?=
 =?us-ascii?Q?baBiYXAb9+5io9s4/Dgz4DKS7tHx5MrHOJbB9J9k5jHZIpdtSfBBocdJvhki?=
 =?us-ascii?Q?BDbXeUNtDFAAQRpbnruLNfcUpfKUzYa8YbDr/o89bmdwjgDL0AErO5ijqPFM?=
 =?us-ascii?Q?3YQcXBKYL9mBO8jQ9m+umcTylqBT1vE0/lwQIhCJ2xiPTDg8IiSwH71X444s?=
 =?us-ascii?Q?WA77FP9IY2dIvJga+x37GElLvwzw6mqg7u4Kbr5NGPYBkcTE4uY7LwbVyTSp?=
 =?us-ascii?Q?Ecb0C9RqBqT82k1nn+OoHrtZE4dzrAZ2E0wjQ2p7MdUhGZVHoaru9dif6pBv?=
 =?us-ascii?Q?6EkvB8usjQmTEr4dwFlh+VLhPKxS/zkwz+6SZND1POX2s+anYOnEmoI4Idwo?=
 =?us-ascii?Q?/6BHsmZJxXGbKI+S4Y74+Xinu4x9KylYo2RB7tGCbkxIu1SjvUYdCnCaIGcw?=
 =?us-ascii?Q?NQJ7PpNXsmlIUdlG+1UjqP3LVvmx6oVZ/XZ0HPivfx44Z/jlpXJRGtJ9HsLs?=
 =?us-ascii?Q?zRpASwRtnQZCa+rzMPA3bOaDDSyF3Jsq8joWnZKF5vVD2S1N+vaCwQ6baBvO?=
 =?us-ascii?Q?J1L1sQwA7Mj5FpV6tFHSX8coi2XUHToekltm4+Niez2sM5M=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6RIYj2xUCOQyP33VuJmx1sr001NqWfvI4ZTjx83U6Q6TuZnRqVp4I3lgqlMw?=
 =?us-ascii?Q?rkJNMuPErwq4cjj+9Lq5mweAC58xBcisddcRTshf+cBUSu66WLFY8LbQO9Xm?=
 =?us-ascii?Q?WymMg4ppHOkApRJyZ76VntbpmtJ1124DI0Kt8jG6D7F8AAyhDrV0Vl1TjPI0?=
 =?us-ascii?Q?KOA382AXCXycgSW5jpm0Ps+bo1Kxwwqz+iJ+6jLwa65+O7KA56Mc/Co/gzFn?=
 =?us-ascii?Q?biQstfujGYDfeni/CMbW1s84a9vSdrOb+SXoDJ3XHupS29JnoSHo6j/nHGF7?=
 =?us-ascii?Q?OSC/9R0QrjI5tTBOz6ozlDHt/+MuvugpV22/QaBKLOAbb19V5bJoQzf3l57Z?=
 =?us-ascii?Q?kVHSRxEphWQKew19p5b7RQPXLaTvSUC9ZKyjOa2G+9rSJ8qM8D7jWtDMI/eC?=
 =?us-ascii?Q?GKBWAC90COhxFsL/QAZuWY+b3qwDq+1v3cMcHSe+Rv6CToJMIWh2NUKXVI1r?=
 =?us-ascii?Q?P7rM/MKCufXNW673dbusCb1ooMskG8pdLxYNncsC7c1jtQXIHpFQuT/hdknu?=
 =?us-ascii?Q?dK0V5dQI74IHgGNvSCHnClsRG5YEUMPvFuG7hFIjYCsIo6/VNdHINX0BtKMi?=
 =?us-ascii?Q?ts0SWX6axDBSa4Mg4Lh1Xkmf0yj1tvEopAmzI9Yk/HxcVf6nDiro+RzEq7n6?=
 =?us-ascii?Q?oboDFqY3bMpMxUrB1oMQMLlPbEsC/Mudm6IjQ7KXWfzSHxS/luhSgml7ZdmD?=
 =?us-ascii?Q?4ExtLBpwZGJl8dE10jtGL3URq7B5GRPpFSilLinVFaArVOiiTgq80kL52jg0?=
 =?us-ascii?Q?XbEyIckHX7oP3f5UX0I/bWQAKUSkSzkOWcNsfpBxgxmH44LMaFI4zdowQa37?=
 =?us-ascii?Q?zQk3k/6uWpP6MkHP7uU0Vq51rTLe8tuHWq6yeuuTcKAvuZzmpRSUrA+kX0rO?=
 =?us-ascii?Q?aHQfCcqYBR/HHpvycUHZmupKgKqbmLi+0EdsHKTby+kl0Ac7safAKC5Abq2b?=
 =?us-ascii?Q?2itGpU/unh3nGVoOK+cEJuN9VaCThBbjb5fDusDCjnmw3tUvhREdO8sEi7gt?=
 =?us-ascii?Q?Bpv881SG6HqMho4u+zhN5EB1jER+04W2tDcPVAjaRfdCgJBItTkTWH6iOvZl?=
 =?us-ascii?Q?FrXd3wYaPc1dvjGlooKPq1QjYtwk4NbwCqhmOHhYUu9J0gTEaGG0ebeHVgVg?=
 =?us-ascii?Q?0SWhkW46p0N1CuZrvWqkCVdcrwca/Z9FMo8FTFps3nRJknFxMmHwSg/84LJV?=
 =?us-ascii?Q?t5diug4Vf44+5SmEWXuJpFh2TqCN5SewFyUy6ognN5bLYxYSnw5oAnc3rKJk?=
 =?us-ascii?Q?K2vgwROQy6Fa61B0fE3E7sDofqQf3qa5mdShACl6yzjwaEp0EG5MJy9rTmS4?=
 =?us-ascii?Q?uFjM3WB/mkkv1/Fm0uverEWrwwY0zYA0lkoq1xRd6cBEmtylZSJT5wodcrMZ?=
 =?us-ascii?Q?Yrks48KqLOTlj/tDyGCERVvzzQNvFoZ2eN2Iy3OqJdCJ8X0ZCYJ25yjVswyn?=
 =?us-ascii?Q?xkz8/zoVuCLfuOe/lf709qadt0MGzwcL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80654674-d798-46b4-715d-08dec30b3ab9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:03:33.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11573
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8497-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 746F8648BF3

The LED1202 datasheet (section 4.8) states that modifications to the
Pattern Sequence Repetition register (PAT_REP) and pattern duration
registers are only applied after the sequence has completed or been
stopped. When the device is running in infinite loop mode (PAT_REP =
0xFF) the sequence never completes on its own, so these writes are
silently ignored by the hardware.

Neither pattern_clear() nor pattern_set() stop the running sequence
before modifying pattern registers, causing any subsequent pattern
reprogramming to have no effect when the previous pattern was set to
infinite repeat.

Fix this by clearing PATS in the Configuration register before touching
any pattern registers in both functions, ensuring the hardware accepts
the new values immediately.

Note that the LED1202 has a single global pattern sequencer shared by
all channels: PATS, PATSR, the duration registers, and PAT_REP are
chip-wide. Stopping the sequencer in pattern_clear() therefore halts
any pattern running on other channels. This is an inherent hardware
constraint; pattern_set() restarts the sequencer when a new pattern is
programmed.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 7f68d956f694..316ed8eb054f 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -200,6 +200,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
@@ -226,6 +230,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < len; patt++) {
 		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
 				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-- 
2.54.0


