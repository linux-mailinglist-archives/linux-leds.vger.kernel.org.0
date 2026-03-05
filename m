Return-Path: <linux-leds+bounces-7109-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UX40IYzpqWmLHwEAu9opvQ
	(envelope-from <linux-leds+bounces-7109-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:32 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D333321836D
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57520303EFE9
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 20:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85851341650;
	Thu,  5 Mar 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JO8ZXMyL"
X-Original-To: linux-leds@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azhn15010016.outbound.protection.outlook.com [52.102.138.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FCB340A57;
	Thu,  5 Mar 2026 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.138.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743037; cv=fail; b=Ga5AHKxBP/XnzLNzil33SVlQDavXSswubeQC3qqJLD8hWpH3dEzDtg0Clo9l4bXBkQgfBPznIexkpvPqg/kX4Gf9vP6j9bSBJkkQ6+/3Iykq+GZ8pGIGE/YXJfDcf7cFvlpZYsIwGN1AKXR20jwdAStS8zxJKlmb31xo5AvVj/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743037; c=relaxed/simple;
	bh=IlnGY9NhuHzdV18CB3A/F35tD8hbPqohYzDHLCV0HLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QaZQNavAvDy4Uch9liNy+2vVgWIr7xREmm6FEd3spmCFLpKAlPFuGTx7LYSH+CxeToR3mip9M526eNfzKJkIjEr5Oz2YfPwEl2YO8HOifO0migZeEULFga+VxI9dks6HTgICaKA/B4YB++W0530GSY+1WZlaAmB2yVpFaWlP6rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JO8ZXMyL; arc=fail smtp.client-ip=52.102.138.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo3d3irfWt1EOBxlS3+Z5wEXZkoeXZyfqmfxaQV09N6PmPXNvTuXp5STYWGRH666md3cvab3EQHjmnDQcdp++DUMgfLwRsqh4tcpumMud1Fq57r8itgR7GSPZuugUc2EXlAKxkbSlGVKZYmUsxIWGRXcGmQHgyy0NpPAaRlbM1LEWLTUGYghYcU2gPE9acVRV0nQfmSTsJp2YtTOVkRjdspQjC/Q+7hP7yjX0A5MYJaUQ/bzifSs/pcGp1I4zrejLoLuaxGBZwwCbjF+NX7TvVbTvWlON6eyAnhossnioXpuIe3D/3AjW+I+49/+/5Ulr7u/z3Rucy8d0gGcw4pt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzdBa51JLJaT0rdN6l17oaJVwdGe/Cl1Ob1biQSCOUk=;
 b=wJ4DcnftWMAHUZRghufRUWWSHfQDsrzpwj055KTXuoiznyNzmdxsRHSpc2+mfyeZBuVpmMYxQWB7ZmzsPcjepXyFl7IBNw9YdsbXA7uf0BHvLlHIODFRbvUmDHgfYDeUHJQCg93mhULgT1KjsLuBRmZJT8wRiZT71rnv2eUAPbtqCyUNEPmAqUzO+d6gSWj2ZHWFr/GLJd+KeyOk9+/NuZcyekNocdN1Uie47M4MmUCIKfEuwTCq9SiamUAyzG2Ldvk7068e7ZNaF0dqvu8H3mU56GgtlJRDgPaCceLatS3c8QK1phJjjgTLv0VCgueDyWXWZISycq8FcF/quJdDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzdBa51JLJaT0rdN6l17oaJVwdGe/Cl1Ob1biQSCOUk=;
 b=JO8ZXMyLMSZfyqkiJPme6BjvqgytiVe8Cbfqwx+FWeoHziEFYUQNn04S4pzFkXB48MqFWkCOFoc8+BIafdH2MUle4ybYG62mu7HUHLlMrxBnU/08rghWr+mFjQOpkYj6neZ3T5yTY+Am2Zb4xKoWLn1N+1b9MUhSpvLS1LxwLGw=
Received: from CH5PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610:1f0::9)
 by MW5PR10MB5714.namprd10.prod.outlook.com (2603:10b6:303:19b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:37:09 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::6c) by CH5PR05CA0004.outlook.office365.com
 (2603:10b6:610:1f0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 20:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:37:09 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:37:08 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Kb8iM2510342;
	Thu, 5 Mar 2026 14:37:08 -0600
From: Andrew Davis <afd@ti.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, David Owens
	<daowens01@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 2/5] leds: lp8860: Return directly from lp8860_init
Date: Thu, 5 Mar 2026 14:37:03 -0600
Message-ID: <20260305203706.841384-2-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|MW5PR10MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cf3322-1805-4d0a-e064-08de7af6f952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|1800799024|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	0Y5EROXYNOMl1eTArLdeIHmcgxD5xxH3vf3tIeAO5LR3EQf4Rb2Fgo4z2cjtLHABqchXD3aHM54Koi8I+bbL/DgeNHvg53xoD8z3a7lYPIJWzciaLDcivPRiNQLHRFF5or/xiAXtCQpDdCFmwMSUEJdypH/K+a+ZGXJsugybfp6CjLjvBRbwrG3KU44q1mawmoRnd3dEv2gqwAzMqEisiFYtl0/e78xAy6dpiYClHkMC3oI3Px/inPxS2BsglGUIev0jlRQV1ubSNYBWx97PL7qcJ0BacnJwZviVCZStwO6TAUVKWd5bPNSEK+iIIp0hVuVEcyEQSJo7MVeKm09sok/kJc126DcihZm5KhMrRMh2iEcNWZ4/YcCg/ko5WXYHhpFLhWlugfFYdT1eWbPlfCxO6bumiDaefH3KE+jQgqP/ZXQ7tJ87d2aeJ7SP7HkcpiQMsOrZaTQ1zuanMf5xBeEEFVlBd1kUx/X+e6xTJe1m+zW0rSGt4nA7BX5jPIGSsOe+1zcZmAgLPwfnyCyGtfAUvjOfxh8AqjB/lk0roQQcJFF6DNPaAd2WDM2gPUckc1Ue7+0VH5Y9Wk1aD7SE/gaLs4ks+CTMQ1KkjwSGEHgc8skgKyMQxEmtYF4d5l8NaLpfjtJ0eaeqRrIoZaHPwDlSqmE0E3AUas48MSucNK5z3XWZj2Q/nRzePM2bDxt5DH5T1wgH4welET3XoNWtYq0GqK8y8v9luMBpZg7o8XvrHkqZux0+ON68h1jPEXduyq9Ff0wXT4mcKNFpH0cGGg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(1800799024)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hoZnLxTugkibH4ASQBwtYbZx5lqGgRjbWwYb7wYwB000NJAvADJS7Aosv6yfbx+MYo+5g5CBpSh08yYSj9DCTTAwRpfkYcjc7tBiCOSqutc1+bTqIotUT9JEZ82EQ2OswN+S6FHtMEOCnuH3Tw6zIyJch+X6i9NuvmduuK8hGV3cRpJL8aruoNyOvWQ7GtRGBQO9nz92G1bfDrUopGoUkL3x3U5amn3RzIu1MsYGtuG/SP/MvQaA95hieGKE9ZQmKi/ijnT+o0GSH+ES8sifI0Lwn+85GezAIhQ6P+aPiYUM5taXAi8y20rsYzc9jtY7y+RiLE1cxMqlfy2bb5McMPYNi9/s+9tuU4GHlHjUPsm1zIFrt0tlkLvsasovYpqNjrAjyw8Gov2YHS+EdlprMYUjY9ZgHwyyuaXkWHS55lssIczWYtDl8AH+D+jQeYuh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:37:09.5681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cf3322-1805-4d0a-e064-08de7af6f952
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5714
X-Rspamd-Queue-Id: D333321836D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7109-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:dkim,ti.com:email,ti.com:mid];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

No need to use goto to jump to a label that also just returns,
return directly in the if statements.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 87d298b6be7d0..71dcd55f0808f 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -216,41 +216,38 @@ static int lp8860_init(struct lp8860_led *led)
 
 	ret = lp8860_fault_check(led);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = regmap_read(led->regmap, LP8860_STATUS, &read_buf);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = lp8860_unlock_eeprom(led);
 	if (ret) {
 		dev_err(&led->client->dev, "Failed unlocking EEPROM\n");
-		goto out;
+		return ret;
 	}
 
 	reg_count = ARRAY_SIZE(lp8860_eeprom_disp_regs);
 	ret = regmap_multi_reg_write(led->regmap, lp8860_eeprom_disp_regs, reg_count);
 	if (ret) {
 		dev_err(&led->client->dev, "Failed writing EEPROM\n");
-		goto out;
+		return ret;
 	}
 
 	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_LOCK_EEPROM);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = regmap_write(led->regmap,
 			LP8860_EEPROM_CNTRL,
 			LP8860_PROGRAM_EEPROM);
 	if (ret) {
 		dev_err(&led->client->dev, "Failed programming EEPROM\n");
-		goto out;
+		return ret;
 	}
 
-	return ret;
-
-out:
-	return ret;
+	return 0;
 }
 
 static const struct regmap_range lp8860_reg_ranges[] = {
-- 
2.39.2


