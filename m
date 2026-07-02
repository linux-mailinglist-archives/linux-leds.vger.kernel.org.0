Return-Path: <linux-leds+bounces-8884-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ApElNdPnRmpufQsAu9opvQ
	(envelope-from <linux-leds+bounces-8884-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:36:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FD6FD3C6
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:36:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=XG7eCrMa;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8884-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8884-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFE833075B4F
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987C43C1969;
	Thu,  2 Jul 2026 22:32:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013015.outbound.protection.outlook.com [52.103.33.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF64639A058;
	Thu,  2 Jul 2026 22:32:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031535; cv=fail; b=ZHgr5/FcrfX1U1PdvqPmoq/J0UoFW12UBSlKzv++JAiu3GHcGBQYMtFR+BOPchDg6gpa3d+0T5WCL0bjjEH6ZhQc0c9kFHQRJA5sEV4oPhTfBZFdfBJo70zdqJ+vQpsodKi2GgL/vHnZ59HmzeJMCidDXrJr2aWPRaMhTQE7Y50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031535; c=relaxed/simple;
	bh=Azb9etV4g190fid+xJO+KLpByBBdmcWGFqpSwfU+FtI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S2N48fSgHuJv2dtd8Y4QL4hGmtXq2E0f5c59+snxuoFMsaDHCH+hAds/ahCoPr5mKd7NSZwPIAEpB3FskC8BtXBOfStorjciHg8jcU8GLu0zleIv9VX9QqkqshIyODtWgxPkSJ8LUEKl1E/2/eJXEy/u8vOad0XS+Q8s9imJktk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=XG7eCrMa; arc=fail smtp.client-ip=52.103.33.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foaiTKdIl7esYU9psh8Njp50zoHah164mliCP5BWD4rB6zg6EigVcGTiCES/ic5atoMGkXbs/81yXwE31YzVzeb+9djbfXREjerC2Fnhz/U9hUIMdmFr3dRg/WthEri77W7g9klZCuPXOf0UnEHor5EFWIg3TjA4XQTWy24XuwFRHbiXN2Sl72Zv6JAPb4+lCwi82/aVuLnMEJvS3kjvqshuiupr3AWs5wx7t/M656nqTLjB52IokqPMK+T9MmV4vE7YvXoEuAxKHfcP/uRwDkREm9KSu+UL4sQCAxvSVoHZlc+ZM0YzZOD4VukAqVzgpK+0JsM7bFoevjBo/mXdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsqoXhdrrZa6Edc3n+lkiooHsalSV+I7cegZGqUELJs=;
 b=fqZZPrferW7OHVjwSY/rDpiXy1csczM70fCBYPjtjx6ynMWemvhF6zbirqXAOgyaDy3BJFVOrOZcoY+RvLdHA2nF/C9JSdNJZPvwRnbrIEvtewCk/as7/aJPrWQf6BvfO6Kyg2XJPhHr5rZ7ngfMMwRrb2n0d9vRRaBH2wAG4pEniCixVBFiFqPf/6niNdn5zXywFzhOxaXI5rO9qenH6p8C7l3XiNIxfEZWAR34oC1I1+Kh0D9Oei0rd1YNEcwVrQj+JXFS/3TIb0OIBRLMe9YGqFnQXBAf0F8O492sZ7bSJJxoYeByUlLQd+/x7CRJlXpVzw1MuxBrASk9V8GsKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsqoXhdrrZa6Edc3n+lkiooHsalSV+I7cegZGqUELJs=;
 b=XG7eCrMaY9UDSx13kopUQcx+5ayren8YJ/yV4cEhox8T1LmSGdVgbJyCeVoU5nOPTEfNCc473c5HdN7fUhjJSxf8eyRNc5+Q0omVJOWMHfXb0YRw+7qeOUsbs2/N6j7qGEkQe7ZLNsH+1PchvlLhMr9JBTk9oTGXm8Qwdja0ABauK+UNsoRgMTANgj3fJDTt70F7ykTu2VFbVriaX9jlpzbxyqSZqwXPSAP+wtIqVJj2X6OmfhJMziB4I/dg715dpaJM8YVW2ybf3uVzFlfXKaeX+V630hZGb+QGLvwJ8XewEPnTUPJVlnTmUXUzRgyBF3JxSws2JNA+e3FuisPpOQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:32:08 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:32:07 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/9] leds: st1202: fix spurious pattern sequence start in setup
Date: Thu,  2 Jul 2026 23:31:55 +0100
Message-ID:
 <GV1PR08MB849724B0FF00255F4760FAE0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702223155.111353-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA4PR08MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e88911-207e-493a-aa6f-08ded889bfe3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|51005399006|8060799015|41001999006|19110799012|25010399006|23021999003|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N3GHF7NeXW/RSq4221eP83reeBprr6TzK5/a6o1Vn9JdIejj0Oiv5tYNbI4L?=
 =?us-ascii?Q?r/flnn7ze3DicTpeIoflcP8AOL8tDw88+SRRCYdibFkBzQGTSRBmY1orD4x7?=
 =?us-ascii?Q?r/BHjqu3iq2tkI+G/T/+imef6ht2rCTTpSup5Yyh8eMR476LJCfHhB0Z63mb?=
 =?us-ascii?Q?EV7BSrjGWG977BqWeHjO64jrUg8/eyqFhCoSBzZ1t6Mh5xFgvKp71RU9UxgP?=
 =?us-ascii?Q?c0j31J5ALYp1GdwchFn9MgJbj6LpLgjhJ06Vl8vd2hujdZqnNPKmvvWTRiHm?=
 =?us-ascii?Q?q/O90omPt6ajrxzXt8I/ARtgywG2MJA17q9RMgC2LociLQ26JyxeopERJ0NC?=
 =?us-ascii?Q?DIYKwA3pPvbmAJ3Cyv+dvMPuu8VLP/4PUhE2VcGxeS4Cif/JkNyyQyydDqOf?=
 =?us-ascii?Q?un8/UmPxaUdfI/7rNjSpuhTo05DvdlmFDtDxav1Hpw6UTK3d22jjLEzvHLu5?=
 =?us-ascii?Q?mnDFbF1D8jGCyAQYNCJqX2cRoJIYpaIQhzo+hMXsZsr1BNbIffTNdEYkgLl6?=
 =?us-ascii?Q?JcguS7xyhYiked85Fx5vFgdeB7qKowGOVt8naACm0KM+gTvUZkUkY+Xp4CdY?=
 =?us-ascii?Q?PtafHFIWAY1mX1CfgThHmkOSRtmPyqXPekiaHMGGRGrT+SXqt+86uLqlyBsC?=
 =?us-ascii?Q?T/kf3PpEl+AaVbsXjcYEbjnwnJh0AjsoKkd+5C+JOWYteyUyAYYykFi89YcG?=
 =?us-ascii?Q?w+8VPOzcc0zUgmfd+2/bgavrBTuGeZVchjuxcizTCA+EBJBfv3RlhPz3pozu?=
 =?us-ascii?Q?nim8wK7Co8jkOgI/uL+p+70OvDt7B/rdu9dpJ27HI/i2ZR/3+C2wdeGbnpHR?=
 =?us-ascii?Q?efEfzlmw507uc++m4Iq3IALS07dSb9PkzYHkM3CjTepoHAlW4RwFdvWs25r4?=
 =?us-ascii?Q?ybTZJYvjsjDlJOlCrrAuhK7IWFm931R61yFhM2gDOm+CqxXXISiMK67ARrKW?=
 =?us-ascii?Q?1dvmhDelewFvlViNUzDFVdM4En0mQXZRVifRIBIJKjsP9f4GjdnQVKaHBfU7?=
 =?us-ascii?Q?U2Z1?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V1pPWSMJoyw6IR/Qtohs9wOghljKf0vw6oww/AuSiIJB3eL+oi/qE0xalOBv?=
 =?us-ascii?Q?eaZeFPAYD0uvqlyBXeMy8+34Rsj7daiRYokKU6Wfw0YT69cR/3MzsHJDdC/m?=
 =?us-ascii?Q?KL8aNDSovhfK79CYnjWqtLcGI0MbElSPCX/Y9BNQkKmm2lG6eSoDHz9l8z/q?=
 =?us-ascii?Q?CJNa4hh5PCu9r37I7VBnbkeI836gxm2MgmLpcjY9ng7AUG+GhbGjeyk7EY0h?=
 =?us-ascii?Q?8v5wj0zLb/sRKP/ZX8vvKkBceKnkKGso3IhMNZ+8fnw1wLy7hvNvmKIQ6QiO?=
 =?us-ascii?Q?zi2IT8X706vFafL8V28O/dquO4KHUnu8PbXNg7IQfzpeGPtqccpInS13hJ9o?=
 =?us-ascii?Q?DxEfHdnW/bAs1rBdlKS+uprk0jSpdeDpHaTiZaIb7DnuCJteGbPta04WWhY3?=
 =?us-ascii?Q?ElSUjIh+iUnB390nX+k40E6CoJ7/Q89AAxghlW4IOw5SMcktoaXHs58sqQyl?=
 =?us-ascii?Q?ScLe4OjOT0xKbVxkNdN2S4HNN6r3NoQ1m+YCdpNLsNNcXEjlJFs8eW7FcLJC?=
 =?us-ascii?Q?zz/7JxIuXcRdLgTh/9eGMNBHQIUsXX2Q6WlIzsmWfTc1JFKAAGNTRy5OACGo?=
 =?us-ascii?Q?Kxk93h+UO5l8lRd1ID97871MYOOrHxocQQs39dp2AIap2FZLeR95DFFFBkGL?=
 =?us-ascii?Q?nyw2OUwyuXhY86I42RFIQZuScZLKumjkWe9WLrNVhyR40+k+cYsXYo/HPX4o?=
 =?us-ascii?Q?fy/FZidyylqCCxuOG1zjQ/kPWrr+rY6ddF2LmeDoXqSSsDieoLXVLK4DWV4h?=
 =?us-ascii?Q?awexIQLfXWy5ZvVuSN1VIE8CPd3d+zHTCH/NG/Ss/eRmKAAu5cgRFwJk2KrX?=
 =?us-ascii?Q?60r1igVU9LPdPIBi66VQn8Ef3YLLdxrHTfB4aa0pFDFTHKWD0sfJvgQUH5Y1?=
 =?us-ascii?Q?9TkYBqBgJwzYojiWW00Mlg3ZDrVgVqb9vDwTlQwsSMGRFHZlKyUFZDjIAseK?=
 =?us-ascii?Q?21/IRtMANTd3TkPJXNZkFz9+12DzMjRgEB7gd8Mbyrvt6AVDnZ8jPI0SwLKR?=
 =?us-ascii?Q?47opaJWAQJ8UFNxMqzxKQlQppNZqTLJV/OuXQ4J6J25E/yl7vmzGClOgXLWb?=
 =?us-ascii?Q?BUzAa9SU2mTO9z+6gjSdgwFVmCxfXDOOC3cHkgGqzR3rbMWHLBlDhrVx4Y3Y?=
 =?us-ascii?Q?cuViAYibHAin78gx3XLcHf4xzw/RwT6NgxSuEGCdl6rAo7WiOurKMxXG5bdA?=
 =?us-ascii?Q?C75zKVQjpcePhtXY4toJWK5XiDffneMKAAuMYjtJ2HD9sBIeZl67sRzJVIUk?=
 =?us-ascii?Q?Q6bxv6EQTnKU96tHwa0TPDD91w4fJr5egnGz5Ad6ABvAwDQzGGCQrGoTLbXM?=
 =?us-ascii?Q?50+/PnW12Ey+3ZVn0JtfZDdMF5SmS6Op9ezfUV4rgxULiQCmLxmBsr9tEaD+?=
 =?us-ascii?Q?TLTmko78Ar6AjH/iSWPV70EXutpzMyrJhcg2IKxe3eZAAkMPLYMl5IrLOOsj?=
 =?us-ascii?Q?sMF48iSw2tOpKB6eH8IkviWpgBShQuS1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e88911-207e-493a-aa6f-08ded889bfe3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:32:07.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6160
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
	TAGGED_FROM(0.00)[bounces-8884-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 364FD6FD3C6

st1202_setup() writes PATS and PATSR to the Configuration register as
its final step, which starts the hardware pattern sequencer during
device probe before any patterns have been programmed. This causes the
device to run a sequence with whatever values happen to be in the
pattern registers at the time.

Remove the write. The device reset at the start of setup restores all
registers to their power-on defaults, leaving PATS and PATSR cleared.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 3203b3768ec5..b8a571282900 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -333,11 +333,6 @@ static int st1202_setup(struct st1202_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
-				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.55.0


