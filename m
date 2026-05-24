Return-Path: <linux-leds+bounces-8301-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPOaNDB7E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8301-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:26:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385C5C4902
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BECDB3006509
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ECB37BE6A;
	Sun, 24 May 2026 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NDfIi3ZD"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012059.outbound.protection.outlook.com [52.103.53.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7833CEA7;
	Sun, 24 May 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661612; cv=fail; b=Z44CJr5FMcOnmBwKogPmfp/bYWfQOVLMhaYweMMkpCIDpBd0RkH9uu2WbGY8OYg99b4cdScUZU8UlOddCTBuPKWodam4xJIVi0QultQWIyw9W6tW+GrZ/VcSWzXzRzHyhsobmyJI9Hs/kxSv0pWBuizpnnMynzAFOcNzD26hA0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661612; c=relaxed/simple;
	bh=7gyOgZ+D5gYtxtwgUYP1IWb5CAKjqEv4n35tdTcLluc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BD+RG53WAexNRJ/XX/LVfcFtYzttaXesm+kC7i5V+dFWXPo+hk+fG40zc3NV3GJm10xvHyVtyZPTVY3dpfv4oAn7a0MIa791wUoawbfN5Yk0RtWjSCHuEvzZxJsKVo3M2ikWgYe4+opCF3AxBmTLHBHLyAWa4wW8nVtQomuKevU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NDfIi3ZD; arc=fail smtp.client-ip=52.103.53.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gS4io62ZzfYIKqv6USSyuji78HYtw8s/NQFhjrNkUrGcVgVMVAu14t5eQRoJdUpnOGtkhapfn1WrepnLMMdwkuxOHDVapuOGfHQ2Fp1lDrslTQk6ZBdIo4hG9KFqJKTsAK0Qxl11aezZDVhCPWrkH8MVHOHo0bKhxfU510HKNZtf9sX1nHJOQkJnxUKPaCJdQjS8IoWvxfBzytvfWp/yUaBnk7PsZhj29HW+1uVhlYCmEN7dm8Zy/14UOmfgfl1b+DCIGUqEa/dfTeBR3Xq2/ktbwgEvbgL//bjcd1Vl+5zprjF0DubdPSIqGivx3S0ILXgqsKcJ/1kRvCKcykhzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gys82bOseI28kLbsF0/6fM5F00KBV+e0nNdh1qiq/+c=;
 b=k6IKRRNC4SsLm8KwxU2BKZtlQQ5dsf+QKanbzq1/vzA0kW2HzB3LdWd206vXuGI5gZjdosKJW13F/VchfuKc4QzykqEMb6+NYusw5Vsloh6cCesmkwJANz97G17MYFl4ntrtAtlBSsK95G77woHTX6lTX9PgAcz2iGpcjs+4DE0WfCybJWPzzOgLmBfflIL1tGDeGghLuXbb5uDmEYaDuhi+9o5eeKFsBTp/Gr51Yf8Od4D590kUa6C9yK3aqB9J9WRb9GOqBFfd0h5hHIb3hTRgtSb0F/SOgt3xZGKg6/k+KHBOxmWvJHIyJQBxgXy9mK+NLhoLYL3aklse6KlL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gys82bOseI28kLbsF0/6fM5F00KBV+e0nNdh1qiq/+c=;
 b=NDfIi3ZDD7HwoVFfLaI/9EXpEMs/lNM1jN7QLLn7w15+XLUZKiX3OhuYxNpQXS7JqkCWLTo3KlaypKz0OnxLwTcr+hB1gxczyqWpUbxb1LSevD9dnIJsM7QQCR2FBzORzjyv4x/uO6YVpUDGmM5YzC4H8Ejky3kLje4q9xr85vCSLIzQPgRUoCFNFGMdajjWWS2FRlFeiu40AKrx7EVRMcIJuDwgqCkxMzjjTAtskc7bq+RgL4a86TPBjHvbWyNlASm4Uu8Esz1nFSgSNEhUcOcb15jgttBXbrJYvcUeGdPWPLEdtaWTd1mfWNmgQz4x6RPjdY1pBHUMFO0CDNoDFA==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:26:44 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:26:44 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] leds: st1202: reset PAT_REP to POR default in pattern_clear
Date: Sun, 24 May 2026 23:26:32 +0100
Message-ID:
 <WA0P291MB0385E612E1AB17EDE3E33F1DC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::19) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222632.373216-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: 153cbb63-9231-4283-dae5-08deb9e38938
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|21061999006|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Q95MroPfVVBwOFaoquEe95Q+4PQRz49FB7W/HYqV2InmporsZ5wKW5XOqQP?=
 =?us-ascii?Q?9foGJRcsWZfix+uudgW9sXUqUfCRKvLnf51rM/RzsH9mXSxrW3pchd/xC0U5?=
 =?us-ascii?Q?6h8kG/dab3cD5/DBUASrJQNEwSXXaw8f2m1jQPI1y2lRZeh4ujtyZRokKmkO?=
 =?us-ascii?Q?ECjdg/MZ3GVDsKg0/jaSEH8cI5K6w46WnQq9SfshefeIfpi3EVPTSmlteonN?=
 =?us-ascii?Q?noAQaJoH7qGAqwQqdN7przfCJPmL82LI6yxFRe0va91PnlGWwKs8pGVti2sN?=
 =?us-ascii?Q?WQZoSgisZlqjN4mCFfYb7yv9LDtp6XGD/VTVJLfyhLs8ZQIuTORz0nY6/feO?=
 =?us-ascii?Q?C8GD8tySt9j59etCHIVsugSrB7VHFaVXggK4ivkzPMfRHgxPN1nIcoWTDsIg?=
 =?us-ascii?Q?Q9l8TgJNFFLOaym7gMMSznmg1R9mXpzjoayIMqlpSsSGIJv2VdBUJ9f/d3m2?=
 =?us-ascii?Q?SerVCvtUAcwhCTXWLQl/FnAqr+m92c5C5/yUc3EaY9vDZrK1Y8IuI7dDOugb?=
 =?us-ascii?Q?XefCgNueC7t9L7X1v8mdKnPK1hEB2rkHSWQcNNS3tJOMoQPHBy8z//TNltYx?=
 =?us-ascii?Q?V7+2CEl2NNMU+6f7TdGlrEfa4TRlvmgAkdSmco3psVtW5PV9ilFlqLHh9XQd?=
 =?us-ascii?Q?pIIgQ6150Eb0xICYc6Z0O0HG58rTib7FInWV+jbrWEa4R8N3gxqtcVkIC1HE?=
 =?us-ascii?Q?PL8GhQAR3PJCFPrzI/nrPIwcRow4JyUQI4cUCh1BWDc3BvMOcsg/nTepgGeC?=
 =?us-ascii?Q?+Nq8135MTV87N+aKtxyUuDVfNkHH2/dr05habv3Z/cQ12xJXv4Qs798ucwuw?=
 =?us-ascii?Q?Gl7MlFGE0smilxoBLWEFlAFZDEwTenqzMk+DgsM4gKhTw27GDyRAc5/N+Pu4?=
 =?us-ascii?Q?zUX688HYCdm2nPHXx0y6NJiTQ21WCtm78fAduatEiEZ37nBisdO7QsLRaQkt?=
 =?us-ascii?Q?+oOne/iQMkfj0dPKBP0pr4uUy05uxz1/b2AJuufXoZUOn8F/6JnutwXR5DIh?=
 =?us-ascii?Q?g5c3+aNwqg6+hJkv2YTXusujvP3e9xTkAJeMqbAqhPVb+DrDJxGyK1sXN4qe?=
 =?us-ascii?Q?pZe+b61O?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nVkEbIFNVr30hI3uz2yLn1Br5XLh9zAkG67RIzWet0FhMQUlfh9KfFkX2cLC?=
 =?us-ascii?Q?0v93FADIiIPL4q2QEr1vy143hDjJiLuePn7hUlNN8l94h/NuMdVm9Y2vTs59?=
 =?us-ascii?Q?JsCSK+2ad8Z/Iqah9tgT6ZIRCY8e6mOROZ+VAcIV4sK2kkA7SzNWZ8PghlfP?=
 =?us-ascii?Q?g1leJIhaVjrKfoGY0fsWwuxsmyKcfDRNuc0fXX3pc9LGo9u1D/oO+hiuetBb?=
 =?us-ascii?Q?UZ33yNxLnX61eLjErmGaHSR9RyCaRSuQf/kk6VhnzzjrX4s090F++fVuE8Jl?=
 =?us-ascii?Q?ZjivNPlRotSS9gdx4NbMtfda1U+lLAS8Ac0WIQUOg+VOK1Kf6rtH8Fo+sBXl?=
 =?us-ascii?Q?Uda3S3PtgBxb4iKPjAoboDim7effBps+iBl8Nm72IeweesjsGF22awWUIbQk?=
 =?us-ascii?Q?OwRHwlc9cWyz5g1t24USw+yCAfFk9eeYVcsLH7/OTaOmaethV4a6GZ8PcvVI?=
 =?us-ascii?Q?0tLv02ahtJvqlSg2GBVU3fCUifvV5DHWjzyug201/vKFop5cJouMNjaSfnaB?=
 =?us-ascii?Q?/70icLdd43yRFuU80NP85PVUrKcGP3xUnvYitG6OEgxksoPHhuRyIiO3aI/4?=
 =?us-ascii?Q?25Bf6o6fGqhUCquY/4aeLoMPgpiQxqEPPo9XG7hpHX6+zsDlAiIeHSp4cpwZ?=
 =?us-ascii?Q?eZPFSeTMYh/01DGx0g0rpuqY4AJZ18qLzVsKqJadIpLAwnRTtRNHxBE4x58x?=
 =?us-ascii?Q?wWtjRXz6+r643EJFg70bZ+v/W5hCBGuxv+hGj3mbXgniX9qQGGgLfZ/cwHPB?=
 =?us-ascii?Q?+jlEIFcWiIqmMbDEXaBlpVDSgkaRWE3SjL0W0cEGPiOIReF3/wtGsQ2WsYrc?=
 =?us-ascii?Q?iyynVuj/GZyzX3gegHJOZGN3daA/7q+dlvl12jn5p6mIe5rdTDJzt0E3giSj?=
 =?us-ascii?Q?gxp3xcWvWSjMMxVg2NshdZAzjAXabaCLMcWAJen2k3oL2Z1AQo81ISHOSLYb?=
 =?us-ascii?Q?pDF4i6D+EcjGbQ0+kMAqxjoCGzyuT+WNwA9ZhUIj/gIh5+guaqMIEf2NNyxo?=
 =?us-ascii?Q?Q43E6t+VEn25w0QPRIgoJb6PlH3o2zh4eQl5wUy1yE47MM8l/VmAg61pKXiy?=
 =?us-ascii?Q?Ezkh5JvC3yB6jEt1e/rob7tEccNHN2yigNDdsEX0S0egL1atllLi6w8+DrGq?=
 =?us-ascii?Q?HztI1LBtDibmUwTMdDmyubMTEs7Y6jU4PYihulvZ9+MQwYU9JvwQ8sAGCNPr?=
 =?us-ascii?Q?BX5YxjgbaQyJaVztUtvy1k7I9rIFkH5gzM8nw4A46afw54nN8XfOUiK3aF1s?=
 =?us-ascii?Q?8sMzJEK+DugcT+MjccidbdHDDoW5l/pVLowCb73FmLwnXEjRzHuMKOTTbeDI?=
 =?us-ascii?Q?zhUde34el84zfieHiJjhU1OViDVyorJLvEgDMz8lS6UbXxUvnnEAcgz02++I?=
 =?us-ascii?Q?y2F0Pof2YB3uWbmoJYMOV6BcFWErUmqZBn/l4pT0X1VnsHy4NZ3gi3/gaTRP?=
 =?us-ascii?Q?hfemRzNomueryBAbmx9DT0sPBTDFNVYj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153cbb63-9231-4283-dae5-08deb9e38938
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:26:44.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0169
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8301-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5385C5C4902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Pattern Sequence Repetition register (PAT_REP) is not reset when
clearing a pattern. This leaves a stale repeat count in the register,
most critically 0xFF if the previous pattern was set to infinite loop,
which will be picked up by a subsequent pattern_set() call in the
window between pattern_clear() returning and pattern_set() writing its
own value.

Reset PAT_REP to its power-on reset default of 1 in pattern_clear() to
ensure a clean state.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 1ca77fbe4ec9..9c1ae35dcb4c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -204,6 +204,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 	if (ret != 0)
 		return ret;
 
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, 1);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
-- 
2.54.0


