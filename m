Return-Path: <linux-leds+bounces-7111-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACh6MMvpqWmLHwEAu9opvQ
	(envelope-from <linux-leds+bounces-7111-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:38:35 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2372183A8
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BC0930363E4
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 20:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54D2340A6C;
	Thu,  5 Mar 2026 20:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nhVE7SW5"
X-Original-To: linux-leds@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazhn15013047.outbound.protection.outlook.com [52.102.146.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1A3446CB;
	Thu,  5 Mar 2026 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743041; cv=fail; b=HZ2UIZVDwXY0G+3acd55CWq7cOnpwJ6Q8zKlBoFIduSyb5IwQ2uARA43CSh9+1kTR/yAQNAjtHIyP9doA7Th1JaXQptodlNQ+QAuqyp/cdaJzs8i7221fTI+4/MGtV4IYCFm3BFsnQ1eiJvOnmGMxmukbGqGD2BcyU0RX+DnDSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743041; c=relaxed/simple;
	bh=h1baKr9WSiieQHmnmLicWCz39kMywu9peb+4L8Bx058=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YcF+TLPO9NxJ8LaTboLgl7R/z0JAwHAnm4lmrIMz1X01tMAJoH5WHR9p4GLwWH07S5EruJ092mSuY5G+qVAwJs25OksRtAD2pqF9LhGm7UBHk0tXREzsLFknOW6kxHgH/TTSaAhYNjvov+Rs/lHWIeLWjPY4f6OaFryBxAZZCRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nhVE7SW5; arc=fail smtp.client-ip=52.102.146.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/KceoGLekRvAuu6d7XLIyt9YpOj/tPAs65jBLuGhzXmY2bmJ7wy3ItrmsxEiKEuC3kj82R4WJnGkSHmZVjAnlwBJknpfUtXuEcM5eRiw1UD0RbhVMs3VLlJ6S224GRzXjTgVj3Rw2p+16dTQV+Ir7fXMZ1dSNgmIXa+i0HJF1CId59kfgBksbKeKbjhRMfNdaqJGnkjQHb+dfkzHEbLR2NUj/IVdRN6dviWPjDd3e6OiYl5WFsLuZlpO0Z7gMikMdyEQ7E/LLsa9gN8pmR95KxrjWpCECzO5r75J5uKkd3+tU0uI79a7pms2i6Qeu9RF6NOgdVhq8VrNAKblsjr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09E/Nt254mFhkR8vGFAfz8lW0cpQ3MLD9gMsG/B3paA=;
 b=HH05qqOxuzErgMh1m4SQDTPTdg+yiNcPM1Q/6LaPvSabZwrsRL8XcSMEQfK7vX+MgH24mRYFmkaghJtC6XEE9ASxVQc4fIHKpVObuRJ+mcrQ1C8n4gcJ0x3oC9vwJQO2KCo9lxuDzkJeLNd/O6E1iKBwqIEur4TLRmdY9sSSg2lKtQjgtzwOZeXp1DM9h4tjEfMlFc+wa+xkV5De1VHIX+XIJGVKwOck4HwEc62khv3fVN+3EU2IhpRiyiPeB+8It0pNI37bSkGBcJtaj2TqeyJw0bbRAoMvXPpXpkvPRVlS5M7VbzgG4JdA7fmgdcBV1GrK7R+8FTdStobWXCTv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09E/Nt254mFhkR8vGFAfz8lW0cpQ3MLD9gMsG/B3paA=;
 b=nhVE7SW5oJgwPIiWa5H3K6vhPb9gVF9Zy02ZjFibtdV7BHTLN6F5i75fNnwjXE0bGZfxxVlR6ZKO+L35StW0RarGcqLOkBM9ENYtFEBlObIvv1p6Jso1iVdGJ6VBLffe35om2r7SkqTvHNCFj/L7uJ8QJC6u5OOZszec2kMun4k=
Received: from SJ0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:33b::21)
 by DM6PR10MB4315.namprd10.prod.outlook.com (2603:10b6:5:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.27; Thu, 5 Mar
 2026 20:37:15 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::91) by SJ0PR05CA0016.outlook.office365.com
 (2603:10b6:a03:33b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 20:37:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:37:14 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:10 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:37:09 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Kb8iP2510342;
	Thu, 5 Mar 2026 14:37:09 -0600
From: Andrew Davis <afd@ti.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, David Owens
	<daowens01@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 5/5] leds: lp8860: Do not always program EEPROM on probe
Date: Thu, 5 Mar 2026 14:37:06 -0600
Message-ID: <20260305203706.841384-5-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DM6PR10MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: 6335eb50-77cf-4611-f104-08de7af6fc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|36860700016|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	l8iQm2oV6wYd1uP57eImhXre1lW6SxvjKSYZGXRDpJ1bpC9yFQU+NcGRzODbzUYkfidABVCV9EPQPvYquuF4qX9NMCz0MmijSxhYx2K3pjYeVXPsSaGZvwUlpGGnrSWamZzMwbl4nKCKTUJMapPjkgOQjjKxckJlpIWbkUC3aYclUrsIgr55Q9da9wwHckiIREcWXbCNYM8mcy+61L/hzdEFgrZjePtfAI8HyH7Ws9edCBtLpGkWcDsZMASjHc4O5nU4Yl8+wY259+RqH0V1Dnf54P9hwDEltAIzxRSTFIlMqpIhNJHFabEabjgxqCXmdQ+bekwFqXdCUOaz4rmN1vU+6iDjqzTPMKKu450xkXaRXoXR8BRvk4UUSipHtr0nUv6W81NBbn6LksRt1ZZEfg3pYYGXjh+5gmV7NGvNeMHvbBhPIWUU5Yem2MHvf8NkL5Y7ypxzjcizWdujLDmwAl6hTS/Y9sjFudAO13n+DyDOZc/8ENMbZ0ZGH1uNPftMtpR7YKOhHTea/UqxSQUor5DQzEKrElyRqsrmRiAOsrq1Hm3OEuNE4PVk6fQq+CY56kYc28yDa0rm7eYihHODzjZqjX1rrEcUej9dkOBZ8y9Gv0QrsJmlj1G5SH3yR1HxLFkiE2kBLtuB4PAGw6acatXsYy/YwLo2y5R/zJ/3BQZXuoBEvD1q8ywopQRTTTscMeHWBe3vpbK7w67Sibn2KZ86Oi1LotNd1XZ/DKwXRZhoJi7B5VJvF3b19BjkvBegfjItNQ4XcR5wGHZL0atXmA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(36860700016)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TaHr3YWhutimrxspH8+INs8za7BKl9gApvBSCgzWeG02pspSUrU8uJ9uttxsS6Lfua/yARxTS+iwzmQtijyEj7tRwYCTnQUuozlz5hiHnAMyM33py+eLf98aw2CaotBM2x2rg7Weg3x+Yi0IdUnPVfHyfjWdvjkKX6i5AZL9tXoIlJctf6TB75u+2etAfHWaZrJX9KR/zLzYuqkCvY0F83qEgwB9WrwukwTNHeneoPugzl8sRfddpwQv6A1n/hIoZBLgbH7YjbsPXgZCUGJPC544Y4IaWJ+sZXkQ+RfCQGkmzEpw6DRbV0xFPTEBkM2GOS0LytktAw2ZSxkKExqA7CPtxqNng5CcR6y85LpD9DXR5DaSCVeNkNGtB0iT7w5zpv9gmpf0Sj3GU7fxvJ8HvjeFSq7qkzWmNmlA1tyFaCcx3+mEoYK+aa1Mbt1XjM97
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:37:14.1432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6335eb50-77cf-4611-f104-08de7af6fc11
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4315
X-Rspamd-Queue-Id: DD2372183A8
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
	TAGGED_FROM(0.00)[bounces-7111-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The EEPROM has limited writes and the contents might have factory set
values that should not be changed. The values currently written by this
driver are just one example of values, but might not be correct for many
use-cases. Do not overwrite the EEPROM with these example values every
probe.

At some point it would be better to populate the content of the EEPROM
based on a configuration provided by the user and check that the values
in EEPROM are not already the same to avoid unneeded write cycles.

That configuration would depend on how the device is used on the board to
which it is attached, for that Device Tree might be the right way. Until a
method can be devised, gate the EEPROM writing behind a module param.

Reported-by: David Owens <daowens01@gmail.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 6d1c9434e6d17..7a436861c4b71 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -97,6 +97,16 @@ struct lp8860_led {
 	struct regmap *regmap;
 };
 
+static bool program_eeprom;
+module_param(program_eeprom, bool, 0644);
+MODULE_PARM_DESC(program_eeprom, "Program the configuration EEPROM on device startup");
+
+/*
+ * EEPROM bits are intended to be set/programmed before normal operation only
+ * once during silicon production, but can be reprogrammed for evaluation purposes
+ * up to 1000 cycles. To program this EEPROM using this driver, update the below
+ * table and set the module param "program_eeprom" to 1
+ */
 static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
 	{ LP8860_EEPROM_REG_0, 0xed },
 	{ LP8860_EEPROM_REG_1, 0xdf },
@@ -302,9 +312,11 @@ static int lp8860_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = lp8860_program_eeprom(led);
-	if (ret)
-		return ret;
+	if (program_eeprom) {
+		ret = lp8860_program_eeprom(led);
+		if (ret)
+			return ret;
+	}
 
 	init_data.fwnode = of_fwnode_handle(child_node);
 	init_data.devicename = LP8860_NAME;
-- 
2.39.2


