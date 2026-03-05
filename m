Return-Path: <linux-leds+bounces-7108-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLPkKY3pqWnuHQEAu9opvQ
	(envelope-from <linux-leds+bounces-7108-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC8218374
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ACFC301E70F
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 20:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3740340D9A;
	Thu,  5 Mar 2026 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EVmUl9Pz"
X-Original-To: linux-leds@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazhn15010018.outbound.protection.outlook.com [52.102.139.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58F1FC7C5;
	Thu,  5 Mar 2026 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.139.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743036; cv=fail; b=Dbju6oYf6MCMO8w+KeaYOTSeQttewI1CLZxzWyhQwC2zvh3mx0rN8c1y3tWhRr+AslUqgZs1WB3a9nULUZlh4PSZtaLYwTx3tD/Tg3ESqv8I+qS7z8AvJ6nDq42c5VubLlHXE30amTZHGSvTTX6ZhN8n+sQNi9QjAOIz1cNZAnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743036; c=relaxed/simple;
	bh=BNDeWu7ffT0J7evFX+9DgAuZpADaL6wp3jGSl3g5EtI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIKUdVJKQou0FxS9ZwhGg/eEiE2pFaY5qkV1jY6v2c4uF3u5rciNx/1DKs/PM1a8BxvdplfUYkxCTEjiToApDdARLInVKvtpNEmUQ+T+oVzFAQaulCx4IXTCLNcqGVwVvQGFHIYGQGbW61UZqMQSjmErp+8cnzbDn2RicIJniTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EVmUl9Pz; arc=fail smtp.client-ip=52.102.139.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXpLVSjyR13GJYMwCattnYol4FhnW2TW+ZYH2iyC3+kSC7hKGUq48Vw0NLFtT3Ca1key1+Ofzcko4SK4zn4dvouy2Fka16NHwpS37zC4EsmbXDcBOfeOJzHleUR/Il41r+m1RacWdQaia0QhKHv+uMbljNYQzW6vVjueSAjc9OxlehwU7YD/vu0ww/bHv5FYLNFapbcNV08orGmjJMnDhAfY6WF77PmYnRaT0uixZJfVi0Ag5cPR9pLXzwjUiNU0lvHOvekEdhCO5GX0Zj7Wf5nXg3V72jJ/8O01vB9fHn7sv+9Lpd9AbYE57T6AI+uE+Z3A8trOrnb1BAJt1+wIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D103TQbfPQ/Wc1VwaaSm/+eK4XhDEXNpSXVS6NrBC78=;
 b=wLMICIbGoXkm7pm8rauzEeyepZEhXfWzJqOZqVGsyy8SkM1XYc+y3HGWM3a65EpOHJo9lyfLR0uYO9ZC22e7v9P/pMfBqZ0BTJppBlMhwr7TSCMBd6VNLNMvnugeLPnx97vHSjPak7HdoaLiQ2glMFX7cGOX5A+AwtkF0X5bBeyRcMT5C0FxPfJS6psCnxpaBMXwGWjlEwuW50VU4g6JsTzpuzvdlaM5/74mRjaL72OK9s/uiXujuMvwNpk1QkmX1GTOAXvYQPytZQ7ztai5XyBipLdj23TSVbAgQL3h68n6P6mtLCHILBwPbYNFT8PL3SFuJ45mgiCnFyQpFTQQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D103TQbfPQ/Wc1VwaaSm/+eK4XhDEXNpSXVS6NrBC78=;
 b=EVmUl9Pz2v9tnSUVoVRivd5VIeQjIyXZlgkQLpd45pnkYJtDkSTS4IUajtSdaAM5bGRxkH5q9AxQgC3djKv4XURXuSzKAsdTrecIVT+Y6t3dtC68qkREJ/4P9Jv3rMw9k87UCFv222DGhDwMrqnjRIUS9BxCzCUkeWYb3Hhqjx8=
Received: from CH0PR03CA0096.namprd03.prod.outlook.com (2603:10b6:610:cd::11)
 by BLAPR10MB4834.namprd10.prod.outlook.com (2603:10b6:208:307::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 20:37:10 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::7b) by CH0PR03CA0096.outlook.office365.com
 (2603:10b6:610:cd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 20:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:37:09 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:37:09 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Kb8iN2510342;
	Thu, 5 Mar 2026 14:37:09 -0600
From: Andrew Davis <afd@ti.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, David Owens
	<daowens01@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 3/5] leds: lp8860: Hold lock for all of EEPROM programming
Date: Thu, 5 Mar 2026 14:37:04 -0600
Message-ID: <20260305203706.841384-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260305203706.841384-1-afd@ti.com>
References: <20260305203706.841384-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|BLAPR10MB4834:EE_
X-MS-Office365-Filtering-Correlation-Id: 8210437d-7d1f-47b3-84ed-08de7af6f97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|34020700016|12100799066;
X-Microsoft-Antispam-Message-Info:
	Z2MknFSCDZv9sUzvL0xFYi9wAOAc4itlCHgHWZZAtvVTpQ9Hy8Cg6fR/ZDp+clUk0iCs5afw3zYGYObE5MDgHa9BKHOMBk8Amj4tBkmOCLqyMKmuGc0dDaY4TjO1SE9kpCeL4xnHSbppQsUM6unVjcyg7Wcpa32tN/ZUI2X2KCOXfMnsNiKOzbjMmtRqMaG9faehRAAR4zzyRkI95scAXE+Z3TwxE3ZGpDm24CKhb9FCc6wVv3OwEvx+ej/dGNdEnGnGPc3Obhp04PTt6m38BlH30v3qCb5YDnsbOLTBWm34C5ugc2SbQBLrmvzIRLI6e9/NCZ/dzFLOkrkctU4T2tXBoH4bRS4A9135WmQTZSPFVt+FU1p+Dhmyxt7hk8CHZVHmSUq3lHRp8rlw0mLKvaV3ohw8qv34gOhnXs+WFG3zt1GuOtVFXTCRjMUkn80k6JMvfAUr380+vbw7tNYWDZyRB1OkWpPT4eXIeq0A2uisE4zyom0SIy/CjoTfgLGmSDZxh9Zym4R30cxePtW/XO1hO1HfWcH5bf0isRFdIKI+TlcibqZ/6FT1u99ebC5pIC2RuIvKR46Nl79A1vcWcNIBPqnvalkMDirVI/9LJ6r1YY47/0wsNIgdSbaFcp/vhbUNbpeXm9ujzq7gKOm2CN2Xhhllm5eLaRLO/G45Tvm18P/aS+xezAC2h5v5j/icb8Ir6gpjjZPyldVCMUs0pbleKng2evggrZNNaq9YCvBo5Njy/vb0eUAUdcdd5/joMid/1JxGWTYUrM0r5PFAcA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(34020700016)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VAR6XZLAFoAHyaSU7+x4WjB9/cDsvGTZd+Rq0yEL4YQ6jgVElQj3v41Mp623OvKGmZUZZIE6qf2iNsHEybyutrK/+yo5471J7sfqyxW9VotFsXwneGirVDgbE9zOBeMRTtgTFflDq4q1Jdia7atJXz2h2V2q5jP0b0hSxfsqWwc0slNQzELp+/lhtJqV94RvY/2GHg1JLM7MvlIbDImhGUYV35qjxdEK4PAhbyguCcJfjQCDL4vIBPHlW+NCuMJn+1FENidHszXNPO4qglh5cpnyWImQTgVTdZoyehe7UgEgEGR2uo22TMNgS4BdzDMREcCfdc7VEer7ZjFLnrq35qWXAFwv2rX9BtEoK25cnOawfRA+xmyVtQmL1EuVsGPoKJ64MfcHkzuVCDNpoY4PnTHa6OTk/xjoUr2M1bOu88iIdjJFd3gAkBilDNKYmOFu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:37:09.8301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8210437d-7d1f-47b3-84ed-08de7af6f97b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4834
X-Rspamd-Queue-Id: A0FC8218374
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7108-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ti.com:dkim,ti.com:email,ti.com:mid];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The lock is taken while unlocking the EEPROM but then released, it should
instead be held for the whole EEPROM programming process. To do this
merge in the lp8860_unlock_eeprom() function to the only call site in
the lp8860_init() function. This way we hold the lock for all steps.
While here, rename this function to lp8860_program_eeprom() to better
represent what it really does.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 47 ++++++++++++++------------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 71dcd55f0808f..16129ae94d65f 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -125,32 +125,6 @@ static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
 	{ LP8860_EEPROM_REG_24, 0x3E },
 };
 
-static int lp8860_unlock_eeprom(struct lp8860_led *led)
-{
-	int ret;
-
-	guard(mutex)(&led->lock);
-
-	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_1);
-	if (ret) {
-		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-		return ret;
-	}
-
-	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_2);
-	if (ret) {
-		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-		return ret;
-	}
-	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_3);
-	if (ret) {
-		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-		return ret;
-	}
-
-	return ret;
-}
-
 static int lp8860_fault_check(struct lp8860_led *led)
 {
 	int ret, fault;
@@ -209,11 +183,13 @@ static int lp8860_brightness_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static int lp8860_init(struct lp8860_led *led)
+static int lp8860_program_eeprom(struct lp8860_led *led)
 {
 	unsigned int read_buf;
 	int ret, reg_count;
 
+	guard(mutex)(&led->lock);
+
 	ret = lp8860_fault_check(led);
 	if (ret)
 		return ret;
@@ -222,9 +198,20 @@ static int lp8860_init(struct lp8860_led *led)
 	if (ret)
 		return ret;
 
-	ret = lp8860_unlock_eeprom(led);
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_1);
+	if (ret) {
+		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
+		return ret;
+	}
+
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_2);
+	if (ret) {
+		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
+		return ret;
+	}
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_3);
 	if (ret) {
-		dev_err(&led->client->dev, "Failed unlocking EEPROM\n");
+		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
 		return ret;
 	}
 
@@ -318,7 +305,7 @@ static int lp8860_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = lp8860_init(led);
+	ret = lp8860_program_eeprom(led);
 	if (ret)
 		return ret;
 
-- 
2.39.2


