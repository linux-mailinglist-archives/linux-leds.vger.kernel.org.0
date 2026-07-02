Return-Path: <linux-leds+bounces-8887-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d/MLLtDoRmqefQsAu9opvQ
	(envelope-from <linux-leds+bounces-8887-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:40:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168466FD422
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=gW5pbAl5;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8887-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8887-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ABC23010C0D
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1843CF04C;
	Thu,  2 Jul 2026 22:36:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010023.outbound.protection.outlook.com [52.103.33.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87C3CAE66;
	Thu,  2 Jul 2026 22:36:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783031775; cv=fail; b=GuDi6I7wt5Lb7gnHRxLCEkQVPcyUgTYaxlNGpln5Hy63X0VhpCx1BC0i6z14rsupf2EedUMbxcZmaItHCPS7Xg/wEZa2WpFCanAtHRaLPHbwhZRlYWurDwnh3al9LxUQzBSoIiy5gJh7/V2KLOKC4a7G+DXOhe+DMm7Ts9Z642c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783031775; c=relaxed/simple;
	bh=LtQEzDPRwnzGMU/z132zdlIac0SDBVqj/150rwWzz6I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aYIftY/D53TVQ3l4jo14fpBhZjITiqaMjlMBi9E41BxnEkkR5T9M/sDm8iP1boZegmMt4jDuAnxYKA5BxB22xqr2FTvQ4YQ0SvQMsVeR8w1jl3Umec1K57ACM1Yv6GPAeHZo2aCkvvI5pMC4EHwvNcHbpQIsI27bXcc47cIAZY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gW5pbAl5; arc=fail smtp.client-ip=52.103.33.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRqnvhmp6JklW1f5hUjxEMYHlBtYIcvWex+XyhUzxm/nQlx0B3b7bLvHnxAJAMh9iMnEk4PggIuQd4LoTt1L3xp+vgqeSjoiOo3XolwHqOnfZaRbQ3r3FPUTvCxqtR9mBeVMHh0NSz3rmxZOhN9ER4f+V97HTBOZU7ZIojRMLwbw7XlXS8A+1wV3zEEJ3GGYOtxPKY5bhAml7nO2VurWq7CJJJ/hpLFFS5dL9j0wAjN+3bZDQRUJ/ZfgUpneC2iS3tgHYQVuTNxzUzG+JI1tv78433tJdVREcvrjEUw2bg/dzu5LeI7fdBjaX+8g/dJANxysw+UOfd4kqV49GsGLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oMvvICb97Dl4M5g9Cl6OJfNXVQ6D0xaSch8E3gb2f4=;
 b=Ij8uNvRlzNxiImd9ByHlc0Ae6dP1aYiRNCOeT7KVO2RWKAfD5K4o41ARS5cd9n8+KKqUVI1pmJuJnIhkgo1ACcS61hOJ7uDerCnyDy30FAKaAVtS5IL8MCgXSPDY0AAYePjZ0CYDMWrog8D+DEqGNamf1rh494kS52hcwDg05YLpANHsSlovmtcuvPTjPk0Y6ekXdiqHr3N2BkJANltv5VtcwxM2nEwzlBKWe0MLIxMImC4KyOB/5osClzLSizpGxTnCAXuRL5/nzSIexp1Hi3J/y5cvS4A4eQw8eF+nIsODW1KcK0OCsMw6nqMZUho7IYHZiQg9sadJzNr8c5In4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oMvvICb97Dl4M5g9Cl6OJfNXVQ6D0xaSch8E3gb2f4=;
 b=gW5pbAl5w+4Q32cngP9eyhDCz+Ls7qaEJIPk8c+bY0khV++qHjjV5p3HwW8MRhKd6ytaBrp5587+9vqC+E/C0wmw2JOoAOWiF3ENbsNUZxppvtpR7K4rhy7sTpu3yamnS84E0gy/14cK3ONtRmWJpwmkqL+1NWF0suX2znar/wjpLk5Oy0NoH+dYeEt0qSkieanJaojVzi4H+vCAL8vYN/GLcpeb87HhqpVB9SzlpOjZAvxdDs9oJZS7/AGJl0JsK+o8J6dV2c0bMO7cg8zqbsTXGfxExIDW6B7Wz7+EeLkyJU0Vmemk9jQokUcBQH5wEEHKxii8VaU/3oWCjSP7UQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 22:36:11 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:36:11 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/9] leds: st1202: validate LED reg property against channel count
Date: Thu,  2 Jul 2026 23:35:58 +0100
Message-ID:
 <GV1PR08MB849718B43321DB7E5A05D17BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702223558.134418-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA4PR08MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 1223c4b2-5871-47d3-9693-08ded88a50da
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|51005399006|8060799015|41001999006|19110799012|2604032031799003|25010399006|23021999003|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uu8n5rDsDNrCYDg5QASJC8N8rn44EU0fHVczmYBMl9Jgae37DasvoxROWSQM?=
 =?us-ascii?Q?7P2K1R2ANrJXpJN2XAeffDSUzOfUOPE7w3ou8a6hKkOaus1FjBuUmJCbTKCK?=
 =?us-ascii?Q?h002uFidQEvdge8KUG6uuiRpRuSuL2KQ4VNQuXLlCNaTHD4L1+Ezl6XrSwZw?=
 =?us-ascii?Q?iKr//qAhPhBBpfkicm45W9RKlxGos9I7s8OBTwXwHp5iTXsDIqHcPyOafN3e?=
 =?us-ascii?Q?V7awOKsS7dtdD8GHxZLuPAXjerWaNfZMGBV1iD22PFX9XLYuxWnVcHLIrHZs?=
 =?us-ascii?Q?aQbOaUVwZP058N3zNkMDuKzhkXsMSz/AdvhKTH8ZLHRwO3BeuyLiuu3dXT5V?=
 =?us-ascii?Q?qAUas8+EuGymlNc+Am1P2VV8aymHzBX9LFiIiDXFaC6vHudYJgCKuS3tSwPD?=
 =?us-ascii?Q?PTb78hP23tYgiMRUDTLcyhVzZROw2WcnASBID1Nlz7SusKdu5gAzBpgzKgAh?=
 =?us-ascii?Q?gHZesCMzp95JxllaWkQOfKI1M4FGaxhNfLEHK5OvGCdA4hNc61Jl2zeisS3g?=
 =?us-ascii?Q?rgFwRfIIbNT/tDdUnq3f4cilzOJzVfqGL5FE3HA5W/lRitEPpluS1OckNF0w?=
 =?us-ascii?Q?9AlOnNd58qpeJ3vboKWfEb5uDJV6rSDT4b1pcToppRk1JG4vUuKj0TEISKjp?=
 =?us-ascii?Q?cKe4rDgTW4LuBE2Uj8jnPhQyc7Mzt2pAZObd3HBxG20jKNTFWo9itY0IrDqg?=
 =?us-ascii?Q?EXkAV5d2Wpe66RZ+9sM+J+aB0i6IjormtKTLiiRofmsciK6ty2VvLFy1/iPY?=
 =?us-ascii?Q?2nVZ1R5PTN8WMl1t05SWAKgy6EkhzfuDP9xdoIVav+XlWTq3Y8CgDo2i4O8/?=
 =?us-ascii?Q?ePM0UzvA1vEBpuuq41FQtv+3id1dwoUKLvEktcSFn0XtKIwhK7ZU1NEfWYY/?=
 =?us-ascii?Q?V7/SBsLjQzB0eJClaMpAII435iPDnaKcdIo2iPIDOSyOkEw2miTF6YXDIXGD?=
 =?us-ascii?Q?QBSatx/O0zy1WKRlgjcnqAGbHTsqvmSFbNA+0twIe1FAuV1eI8Cl4yZdngYm?=
 =?us-ascii?Q?gActagdlRPae3far6AFCpX302hOJLtCsq6ha/0x2sD1pHEc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?inyBVcixbTiDaUI8bV9aw5YkdOCT0Q4Q1hR1rGTqaBzNK0U/ArizhiL5MEDP?=
 =?us-ascii?Q?g7QGf1Hl2DtjXByJnmWLMsd3mXyJl5FW4kBEjzcCjIDEwgCtLvVpiBHUXqNk?=
 =?us-ascii?Q?jgNOcHsiyblICiHqvnOeifPJXl5mYOL9LDFQ+jamIqtDFNKgQLA7/vfncBTl?=
 =?us-ascii?Q?n5zc/5mKbB7zIfZksX4Ko3FNMKLQIDK09qCPjN1nLaNF9ASOoOF/d5FXQRVI?=
 =?us-ascii?Q?9MKWHDhdXqp0/OXNnyNoL6Sqm3wI6U6dXA6rse2kSDQWSh4Bi+W/3h8UGBqm?=
 =?us-ascii?Q?mK2osyZdNtoaMyxzqK9eeT2lphZ17wH1QrFwaf17M5i06VLm/DU03iUT1c2Z?=
 =?us-ascii?Q?igWcwIgqzFBAf/4xr2Bq9hVJQmPJ1cnfacd7uYkJ87yFlonzhhShrxde/jsy?=
 =?us-ascii?Q?McLS0b7uP51m/bD/epAfkKGyWkprD4Tr1nwcU8O23FiUIsdBV8KqKLfPmlKB?=
 =?us-ascii?Q?CZN09GqY5r+0FFQGQy7yVX2ND03Zj9Jvy1pcwR77jy1nYp/b/n0qLBnf08vj?=
 =?us-ascii?Q?D8ccvBXGAjDDV+xkGSYT8Dz86PNHA7RdT1xkpIELW8a1QfmsO4khu4h+V/TD?=
 =?us-ascii?Q?6tGhJKom384o4236zLXzdEWBVEr+2IUgoC8qgkKlH06ZaFUOM7Vkb/PdzTbm?=
 =?us-ascii?Q?AGIdmn6Pa5trH1n58Vc+p9YOMXubZ6aP/9B0sbYLmfa85hGHmu6/pNTBqozC?=
 =?us-ascii?Q?pAP3xpDhGKPc8P49EoLOtV2k89QDXxFrUy2DYIYGL6ekEM6gV20ZWqxWnXxJ?=
 =?us-ascii?Q?B7jf+2xxykYB98prvl7CK/onkVjBTACwqSt+Z2ll1+smy4RYbg5AvnmxhWCt?=
 =?us-ascii?Q?e8E1QrUDnaKB7lLVZZRUupNvi5GSvUOG2uOH2t3e0WClSzLR7aetusuKNH5P?=
 =?us-ascii?Q?RMdFOt7r0rmLhw6XfPCtlay+gjN4sIfG5Yz3d+Ji0EO122vvOC4dum/A/8F9?=
 =?us-ascii?Q?ZEgcU29PT/6/sTB5dhUh0Zfxy5eY+iIqK8CyD0/jJ/MDZ3LVjuhTtiBLFVxs?=
 =?us-ascii?Q?TMQ9sm0lehZn8JJfI4RO0THmQzOxFvCl1p80ID3pQyjBJLQQq7n30yVpLnRc?=
 =?us-ascii?Q?9yaA1a/rWLuo5OkJZnQKepveoJcPhEO02lhUZWYve6qCtUmoXDsH00UhkimK?=
 =?us-ascii?Q?3OOaes2iN1b4Pqs1O0uHqi47p+vNNdcpqb8IYoKbSVFsxFTqP7F7VmcsjKPx?=
 =?us-ascii?Q?y49OuCuie6aPyRkbGhnU4LwoBTfpbs/m3FhHqutH72qhE6F/mvRKekqOiBll?=
 =?us-ascii?Q?Xi5r3NNGKnVs5W32hUp07a1k+rE3bHkXj2Xd+qBJ1WrYTxJ2qqVx/4Jl4qVK?=
 =?us-ascii?Q?L7nQV8i4lT+mEgScO/sHDMtInbNWhy1wxC53XOrAsYOemQpmmk7OD0IQwzH4?=
 =?us-ascii?Q?n41PFjbTT87axP9QzAvhWYzOL1taz1gUBcp9YWUiZ5Ck++/DX+O+7gtp0JgV?=
 =?us-ascii?Q?N10ov0egq4/FkinoPbxxzpfC4ePl0Y9g?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1223c4b2-5871-47d3-9693-08ded88a50da
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:36:10.9966
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
	TAGGED_FROM(0.00)[bounces-8887-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 168466FD422

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
index 2ecd36aae336..168df5ecf27b 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -279,13 +279,19 @@ static int st1202_dt_init(struct st1202_chip *chip)
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
2.55.0


