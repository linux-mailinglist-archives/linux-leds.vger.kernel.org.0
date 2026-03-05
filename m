Return-Path: <linux-leds+bounces-7107-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBYIDoHpqWnuHQEAu9opvQ
	(envelope-from <linux-leds+bounces-7107-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6721835D
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C59C3006017
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 20:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166C23112BA;
	Thu,  5 Mar 2026 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="St7qvLDa"
X-Original-To: linux-leds@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azhn15012012.outbound.protection.outlook.com [52.102.136.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CE523FC41;
	Thu,  5 Mar 2026 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.136.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743035; cv=fail; b=bw/pDmOcvmSbN+Ytnb8Nrvx92ksibvwhTAMgehzQAw9dqtj2AqyIKWPP7X1dy4fvxmQJCENZOnzpxqwMWTM18itr0VTMB3+hOFn1v06VaId3Nr8vTuKgc0DWAlPRLlMNzshui3HJhz4gVOl70EBEykUR0DZJAZ8rwL4DJnZGNZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743035; c=relaxed/simple;
	bh=kzzNr1v7z5Jrz4ZfSRR4KSbTaGxOnOt02nP5ZszylTg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pbe1jyosoumtfLs8DFTa8QSb7aJZ5UkDfZfF5Z35Epghl8EgSOdesft74bYAjvV6l2fWDByuoPqNMGV99fnid5DcJboi9R5REZsrFWjVI0OxU/wWlHSBE0R22ms8Ttj5LyeyYfvleiJBgTCiDRo58eCMXol5QO3FsjF7gVKT6do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=St7qvLDa; arc=fail smtp.client-ip=52.102.136.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gsg930n6K2XysZ7sMbY7Ke/vGXcRfjivFTdLXEwTGZuAy0/OEBo5tP9TaSecJqUnejVRge/cj9luJe1jlJqw0uHO0GFTq6zi3nEkmW2lisYOSvsCJrRMWEzfiSp0RVWrOVzAwRktGnHWImbIk7n9j/tSwDIOv1p20/sBx/2j5zjV3ysBBCNpiXzQuO2ka9F4m7hSdprwNSNsrRD8OsoWR7q/KyZ/cmDTu/0Zfnwn7EIV2ItI+Jy0k6wJNpf63+h+XCIQjxRI9faQuGrrxuTpxezLwWsAh5kFkoziFjWIV4PAQIhXr7YYTgmykIpt+mMBJOD1+Lacbrtv3l8uQThLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xfgJcyWMVKmUP7Za2JkXSDDCO5nNmXNywvlZ1bnU+0=;
 b=PQ63cte0AXuEqz6jSTi+R60rTFpHr60eclJInccu01VR2rHsB1EXI2ctmuf3L5sZi/VoBcHfDFo9wv4/ImTYDEKbTnxtRoyvsj4t1fRvvr2oLDO9u74isG80KLsS4SISFF0L+t/IsbJe8eXbXjLJfthjs5qc/Ld7LkPzgGS7lbqlJjmnj/lU8EMxqFAFEOLo9dTaTQmvnF3zJQJTttYNZfBJSjBsndsLPxwzDc2hfsDkyL9HZJgkDxHC5FuQxpB4a9Bq3tZqp1Q5ebQBBjsIbjLkCQq6BtCsfwRazJx0NAw14IWPp/9a27hmHInDx6ZLpsSvuacYucQHbBY91FAWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xfgJcyWMVKmUP7Za2JkXSDDCO5nNmXNywvlZ1bnU+0=;
 b=St7qvLDaBIGOCo7uZuJBxs9Z7CdpFhGZxVeMRFWBJlh0SjlgVxduPTzK3JbgVzraRA0thQXE3+qxeptRQwAM7coEfaNT/UzGIKjDpUf19h0+qo20XKjt9a9PxHZhcK55udyeWxLE1bSpXYtv9OZ1F+h84urhB2dgrZ0BZH0Ht/k=
Received: from SJ0PR13CA0114.namprd13.prod.outlook.com (2603:10b6:a03:2c5::29)
 by PH3PPFB448A336C.namprd10.prod.outlook.com (2603:10b6:518:1::7c1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:37:11 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::5c) by SJ0PR13CA0114.outlook.office365.com
 (2603:10b6:a03:2c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 20:37:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:37:10 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:37:08 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Kb8iL2510342;
	Thu, 5 Mar 2026 14:37:08 -0600
From: Andrew Davis <afd@ti.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, David Owens
	<daowens01@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 1/5] leds: lp8860: Use a single regmap table
Date: Thu, 5 Mar 2026 14:37:02 -0600
Message-ID: <20260305203706.841384-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|PH3PPFB448A336C:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba3f064-3138-42eb-c64f-08de7af6f9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info:
	dFhut5jacV21DwzDi2XGHq4t7vubxg6E/Yzj/zig92NrBuzgLWdVdWZZr4n5hCtup6QXhK/DbdEL6EOfG2tovgC2qcIOC98u0IQmweutp/u83BPkskmzZYagh7S9SQCYj+n//DXFXsEdFlzD6JDVCmcKZKAQ5M/10Loc8QEemsywf5cxrLhzC2PiZBo2c52/3qxsgGm4m0AfrOrPPPYjvFEk+FbQnn7KMkdSCEwMAz/APV/EvZEtNsOErMhNlvdsZGssrTlr75a5ZXCnMLv1VUmFV1ifGmKUXxwk3pejc+pyvUymSE2l4/TWQTknSF7i+O/HqF+WpS/KQjRfUqMVUsFrR6umK2fK6uxoAL2EHc4NyC1jv2mY8oXO+ZU0a38G4Ul3sERCcMw4yzw6zJSYZ5l3BFM8+8ClQe4xHszRPc/eQ+SZhBF4RN4bM+6vnFJj47cpHbm8pAoS5tzkK+xH8VVvGNiYv1+XtwEs3kYcorVQW9k6kcs7XPsr2YEyAMLKrOk8B93Fcs8Ar/0+8YQgeU9hI3xGWoB+9skFfJ/1iwT2q/wQ98g2G/gSvTACvg8TUag4w/tTiFFMpOGBT9JAPgTX+gWQGduZ7ocBpjV3+awUM7AOSpk9sHbjQjsMcjZvvm6sI1lInRKgEEBGdYPjOAc6ffNlfoHJXmltahxAMNY4SuF6omVVwOGr+qe8TR6nxGyfCmFJJcZtBWjUNktlIOY7lXMqy4+of/C3nyuDbonP0nlKcsrg+58M6b0/10UggN8NH1yH1Vi0mwQ6kMmdtA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cOqaZpbWamVBYK17KJS4ivTaIMKdRPTCCU1UwBksW2ZPjXdtMR05UScVms8O1WpHSB3gnI0pzQfH9oWWVYTVSHm3c3i2pEm197h6lkkm+g1S4QN3J+sX/ctEmdz6ccVSFPlRslf69uAP5pkfAPn2gaUmVXEs7OYqLSQQZcqNeVrH8wCozkOX3en0s9jebQ2irh0puB4jgt+S5j9hyQAV68olU/C5HcWXUeLdH3PAFO0/5WtcbVYSCy7m8yU/c4dRjQncvFrU9IYWhml5GAp0wl77MPC+B0V3dmghPWsf9MNjk0h4tW7xtRutKZobCRuk241/CJSq1N2AE7H/r3z7NPDeyjFduny/T6RAOoOdPweH5UUVYF+86hMZIf0HvjbDe9y1X63efYTSVC+FYAICrSLcv3QU+J474GKYqCH/Mu34YbehztW5JduCIdsWJq+F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:37:10.1854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba3f064-3138-42eb-c64f-08de7af6f9b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB448A336C
X-Rspamd-Queue-Id: 3EE6721835D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7107-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Instead of a regmap table each for the normal registers and the EEPROM
registers, make one table and use an access table to prevent read/write
to/from the registers between the two ranges. Slightly simplifies the
code.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 0962c00c215a1..87d298b6be7d0 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -89,14 +89,12 @@
  * @client: Pointer to the I2C client
  * @led_dev: led class device pointer
  * @regmap: Devices register map
- * @eeprom_regmap: EEPROM register map
  */
 struct lp8860_led {
 	struct mutex lock;
 	struct i2c_client *client;
 	struct led_classdev led_dev;
 	struct regmap *regmap;
-	struct regmap *eeprom_regmap;
 };
 
 static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
@@ -231,7 +229,7 @@ static int lp8860_init(struct lp8860_led *led)
 	}
 
 	reg_count = ARRAY_SIZE(lp8860_eeprom_disp_regs);
-	ret = regmap_multi_reg_write(led->eeprom_regmap, lp8860_eeprom_disp_regs, reg_count);
+	ret = regmap_multi_reg_write(led->regmap, lp8860_eeprom_disp_regs, reg_count);
 	if (ret) {
 		dev_err(&led->client->dev, "Failed writing EEPROM\n");
 		goto out;
@@ -255,17 +253,21 @@ static int lp8860_init(struct lp8860_led *led)
 	return ret;
 }
 
-static const struct regmap_config lp8860_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
+static const struct regmap_range lp8860_reg_ranges[] = {
+	regmap_reg_range(LP8860_DISP_CL1_BRT_MSB, LP8860_EEPROM_UNLOCK),
+	regmap_reg_range(LP8860_EEPROM_REG_0, LP8860_EEPROM_REG_24),
+};
 
-	.max_register = LP8860_EEPROM_UNLOCK,
+static const struct regmap_access_table lp8860_reg_table = {
+	.yes_ranges = lp8860_reg_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lp8860_reg_ranges),
 };
 
-static const struct regmap_config lp8860_eeprom_regmap_config = {
+static const struct regmap_config lp8860_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-
+	.rd_table = &lp8860_reg_table,
+	.wr_table = &lp8860_reg_table,
 	.max_register = LP8860_EEPROM_REG_24,
 };
 
@@ -319,14 +321,6 @@ static int lp8860_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	led->eeprom_regmap = devm_regmap_init_i2c(client, &lp8860_eeprom_regmap_config);
-	if (IS_ERR(led->eeprom_regmap)) {
-		ret = PTR_ERR(led->eeprom_regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
 	ret = lp8860_init(led);
 	if (ret)
 		return ret;
-- 
2.39.2


