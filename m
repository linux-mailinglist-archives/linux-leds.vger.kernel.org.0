Return-Path: <linux-leds+bounces-8303-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOLlFJR7E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8303-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:28:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECA5C4921
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34392300651C
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F1931E83E;
	Sun, 24 May 2026 22:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="c1BdyFU4"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011036.outbound.protection.outlook.com [52.103.53.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317152E424F;
	Sun, 24 May 2026 22:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661713; cv=fail; b=lZNkEd9gur2WMV4Uyn8u6EfZ17H6/VbSmJ74iyIqqASj3onfFky2IcZJfWo2ruyspWfbO1mJkro/SxKKtZxfmkWLiSSIJTfMLWInTY930vKVJQ7nu517W1o308XHwUHvxJv3BwYmeBIFcjqqAjWJIToG+QSyO08g5bgT7QszUaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661713; c=relaxed/simple;
	bh=Ols+MLzk7rgWsqk422Ze5zCiT20feSseAGgWH9oLN8g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pnSohpcfjtagHQTLKy361JL3IWbhCJsqma7aJDLs+tV3A+5nXbQwA3Iv1I3e5twSG7iAGnfZXEkJXEHOTw9ECmyaazDeXGXFBr0HLAG4MecGTH2c3kimVAgkKs+lDQAj50kNQcffxsU+K4T+pfrFZdAKEqIh7sU57ZFUZQ+ONy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=c1BdyFU4; arc=fail smtp.client-ip=52.103.53.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfYZ5sry4JTYbhyW32DE3Maa2LjIYyy43xFaIDc/6teNthMt+rji1hvv8jUylONMZpa5RS7O4rYQd4e8S8JD2Cy3V4q2V9pjC47Vj/qUOZNJrQ3lTgLJTBLmIEuI7nr9bFCQf9+CwkVM5WIMfkuctgDn/InnuR/3CXf8Lz5/UPTH7tc/WTEwyanfQ+uhBxD1/tJLr3qCnrOxiUQrd4Xsg2f6JJzPm26NuDwgN0Mcum7mZD8hLhfPiHNT5CZwsYiHEGtBvZBd0WKe6ax5s3cXPwXJ4qtmcKuU2mlSAYsLpjoPl7ttVQ0VGl5LjUqj02QZmnGJci2EpkMWvrjBugM7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIspuV+JVtDAydGZtWqgVVzyTs8q75yHpsY7XnmgIsM=;
 b=X8LtT6EZXoDL2FKjYeFnfkk6GvRlANszyoCkUXt3V0gT8ca+hIiZyEUIJ6b8WU8uzd5v8b90Qo254tw1xeHkCfTdfhb15LwoRO/iljpdQQ83IlemA9sKNJkHB/UMo+e80pJ7nWYCr89Q+c7qXoklfp3S+XZatpHeSHMidGR4V/SZmxx9mZCmCpQPRLYP6OQGijdgPB1IdZKxE28wr43gnOEsy6JA70H3WJFcc+/TfykoKOsiksPjsnu3duPIrjYwXsf/RNMUvnpJHM3mXKsny3mlBSlVh/AhoU/+6gXbQ3QI8aqhVpPAIM13l5Sr337J5BZG0750v7wk/SENdn5wsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIspuV+JVtDAydGZtWqgVVzyTs8q75yHpsY7XnmgIsM=;
 b=c1BdyFU4vcBGgc9FuPPvT9SqI2oYnhAQnDK03KAaIG0tPi6NW75V12qEqoCFMPvkUsHNiDY8yE11PbiNPvEhF9KTsY7qWcuAZOzRJ1GDMnmdBqadReBiw0a4llNmltCoPVxxxc1WMpQfuiVH6fHnAhex9i5xw8lw+MeCWMjirYSFZyx4E1LOAe89lO2Kib1LUmv3i7AciD3Aqhl+HKF1U1K/+XS0XDpkn4ogAzG5Hs6IOoTgqWfQPODEFU7foad2i2mdXP7EPUrdqt6+gS8VmO8xUGbrcn/gJCdl8Iph17vDI1CCPPYOEnwZJr3Nwtf8TpL53spVOtzodwNjuN18tw==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:28:29 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:28:29 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] leds: st1202: fix spurious pattern sequence start in setup
Date: Sun, 24 May 2026 23:28:16 +0100
Message-ID:
 <WA0P291MB038573AD09EBDAD1EF3C6C7BC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222816.382927-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: 624031a3-f1d6-4ab6-5245-08deb9e3c788
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|23021999003|41001999006|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+XOKUCJn42+/LQ0d289YOPN9sak2MgQH74BrjJjihrRbDiI5vkQHnc5Ybu4o?=
 =?us-ascii?Q?XhqUyZw6wm7R4VFIbYAc44IfrJNOHR5EQmgYoHkmJ+cY8f/ZD4lsomQiQu7Z?=
 =?us-ascii?Q?IgnUp+T46mfAjwJoYQIJ4tUmCJqOZYvLsmzw+9Kigi1hoTKJyyc/4zawtbG2?=
 =?us-ascii?Q?MQht3dTE3hvXIEyfGYFN1rEhGZkD4QFB2fDxkuiSSv+WF3xuW9ktdTFtfmd9?=
 =?us-ascii?Q?6ncJkLJrkgBlx9QATGAsoYuSqpwyr4GMvl9wpMVk4rjs+/Z9cy+6NHxG6Ags?=
 =?us-ascii?Q?JeXlPrEOyx0FV9nbq9tGyGzrVpj0ZI4+Ux+fREAf1gJ9V4CO0Q7vFd3Nvvox?=
 =?us-ascii?Q?Rwj5qjfDyoso94+EvT4MWnKwut9DPehArXMWVDESHx8/tX32h/WqjYPK6nKb?=
 =?us-ascii?Q?DuYp07on0xtpqmlzm4NZSOrfbRf5HagFLmprUrJwQ1A0/c4oJJap0X2WRR1U?=
 =?us-ascii?Q?D31TFPT/QzC1tOVxeCt8FtLyDoH/wKxDTTM/8G0sDz+pmivafi6orqjxdxn0?=
 =?us-ascii?Q?eHCTQuXce1N8lCRd5JL0v/zH7XtCVcOUBRWKVK6CTpHpjI4GdIFIOFKDI0K6?=
 =?us-ascii?Q?sJz5IfRn3w2FaNhoOecVgn6rWIWITkmGPfdjOsiDZo7tsApVDV/DKMVNoRHZ?=
 =?us-ascii?Q?ZmXUJ0RB71YCVfzY/+QBP/k9JXMLJiafrMlTJorVWFyw7RMxcgrDdWroQ6No?=
 =?us-ascii?Q?waaE4dmX9q2FZ8Dk1Jum4M3ru2WuBI2l84QDQbkscuDu3aTomCJumwij+pyn?=
 =?us-ascii?Q?T07Fp1JAIxIDu67ejh0pBF3GqCGTOATO3QwQpHMpGF/7P0KjYjd+LnwTibAw?=
 =?us-ascii?Q?sImsECCxobL4Mipv7e9l98A2POMtmmJb12QS2DWGP+XNeiXKcGwHLVt/KN+f?=
 =?us-ascii?Q?GNEga5yFFJ3QlD/OoaHk42j9WiDefKXmjnZNH3PMEe5pmk11PC55vlGDHJPf?=
 =?us-ascii?Q?qG9EnOaY1NQyuQuKczW6eQHccFqx53PeSso7cV5J03m0fvSNv12M+TGLLAwC?=
 =?us-ascii?Q?QoFZUJ/Mo3HQCJKpkeywr7u/6+EDB/wz9rNvAztatDXYIKU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i1e4+D8Z7PfUXbAX5P7sv/g0r5Pdu2bIY2zt/Gz8NuJU/cUCib1a1URqEx/a?=
 =?us-ascii?Q?UVqoR1zO7hHEYvsstJ6RHj+js5uxguTjyr1SZldozLMMjJ/9M4+9KGuUqC0K?=
 =?us-ascii?Q?+Chhx2v1wb2eyn2VXpuCq6LgEubKBO2BgZLdrcpcDBvn0NIUdIE6kq8tyLpn?=
 =?us-ascii?Q?JLP+q7HPjBs44sn19z/NioiGGrWRoQ4oalscMS7ZlIQk+JVRG2J+5/zIPP90?=
 =?us-ascii?Q?T5G6fM5MrBbpVAmVFTVKU5EIH0Tsq9HnW14mq7YRzBOhXcVupJHGSYc8/H2s?=
 =?us-ascii?Q?AbFUTrqYJAS+99HyHQMlqbnaLCfslI1TKqQRHk20AwnZw31nPrffQDEf/Do2?=
 =?us-ascii?Q?rvl1d47Tr6R4Hbo6as+a4jvBEODWpa6jDJoFVYH/cCBAcYzOH3L49NyUDenP?=
 =?us-ascii?Q?+F6Kfbvl/jqbWkhcEONQbPIZl8+V9vQm63uJFLD8SstLoVv31HEkXsuIQdD1?=
 =?us-ascii?Q?wLWVjkxFimn0AnDxMZDbZEXq7rZ1vZZOVDgHmmWeas1vGDRApbHbapNoz70y?=
 =?us-ascii?Q?FeQfg8jw/yHHALptiWNBsT147hkrxebgRS5TT/wMvNlHvQX31vv2G0feAVj8?=
 =?us-ascii?Q?o5FDfUtRN+njNp2pd5j9jkZuUhwxsk9a9VwEephr2Qt0vihdkjfE12fJLxo4?=
 =?us-ascii?Q?0VB0ulOIX5t0poTpK9L2eRLt/TgN6F/g8yrOmKd6OyOE9IdYGnj1OzbaSlbj?=
 =?us-ascii?Q?o83AAErgVgRM63ow9iWLW58IpUjCW1fkSYG/VDK8uvbYasKy/44lhzxaU0Nj?=
 =?us-ascii?Q?+PqNllx2MzCvtXJZ676P/mbh/z1fF0DuYKmD0j+2Wy8iLZChcVlC3w2gbWoQ?=
 =?us-ascii?Q?sNk0Y2SuF+0Tl0kXLUwgVH6JyYYx31J2B7VO+9qQ0IX8NyPWKbtmuguaqJxb?=
 =?us-ascii?Q?84Xb7oOXYSD122LfQPQyEHbd5YBXsJ8LS34JQxKNo66aiW0fkM66cuF2Ef/6?=
 =?us-ascii?Q?/h+tDmcoVStkONvi+JGDs4vpXzCKG+DxbLPNvwony9sPygPqJyBkZdzvTFbf?=
 =?us-ascii?Q?o8sIL933htN63HN1yK4tBElLWLFIlN+6i45sRG2HrOldQMrQawnsGMh8dKJF?=
 =?us-ascii?Q?YVWScuiFClO1F+MFRQZzD/GuLUmP8n3jH/wj9BEOiiQ3f+eOdLlRBoXn3U/9?=
 =?us-ascii?Q?vUwAu/pSfYCat0EyRjVCFEUadcTkxDG5c7hOa4zztULMgom5VkictgOoWEGQ?=
 =?us-ascii?Q?k1CfaSazLzjapH94LTbeBq+cjd7QpqC7eLcvEi7cDn9c5rZzeq+NjL1epiZT?=
 =?us-ascii?Q?zQTkHsb35SyXBoguViNLCwJ7HFOFrLD83MbBn3xybmUXp0H8mdloFNlZHJK8?=
 =?us-ascii?Q?q4ZI2ok/B/Dn2B1WDRNkAcMp9ASPATjDTAFAz0mpam02TJgCJLuaHE/uFwav?=
 =?us-ascii?Q?VXwYYhqE3GsEoJ0IWHCixCWtiTseSoRFVP54qaE1IAt6eMYTQmPOxn7Fpy2+?=
 =?us-ascii?Q?kx/I9yNblreYM4WQjO1hF6CsC2APBwTj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624031a3-f1d6-4ab6-5245-08deb9e3c788
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:28:29.2193
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
	TAGGED_FROM(0.00)[bounces-8303-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim,WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C0ECA5C4921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

st1202_setup() writes PATS and PATSR to the Configuration register as
its final step, which starts the hardware pattern sequencer during
device probe before any patterns have been programmed. This causes the
device to run a sequence with whatever values happen to be in the
pattern registers at the time.

This write also has a second unintended effect: it overwrites the
Configuration register without the SHFT bit, silently undoing the
phase-shift write made earlier in the same function. As a result the
phase-shift feature is never actually enabled after probe, despite the
explicit write intended to enable it.

Both problems are caused by the same write. Remove it. The device
reset at the start of setup restores all registers to their power-on
defaults, leaving PATS and PATSR cleared. The Configuration register
correctly retains its earlier SHFT-only value.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 933c50c317c1..9150b92ccbac 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -341,11 +341,6 @@ static int st1202_setup(struct st1202_chip *chip)
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
2.54.0


