Return-Path: <linux-leds+bounces-7110-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOiqNZjpqWmLHwEAu9opvQ
	(envelope-from <linux-leds+bounces-7110-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:44 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F117B21838A
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 21:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DB75301BF95
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 20:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E5B341AD6;
	Thu,  5 Mar 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iJ6ChNfX"
X-Original-To: linux-leds@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazhn15012016.outbound.protection.outlook.com [52.102.137.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F1340A6C;
	Thu,  5 Mar 2026 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.137.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743037; cv=fail; b=NciuUj09+yaPl/zSe/MKNPz5wmwwIVOze5Iu68ur78WsCqJZD/P6zUa2aEczGCbMxsXImklPvt1xKSCCRF45MhO2j/mHIS8Z24x9bLktSwQAHEBOUwT7zUdfqIYxn1UmoMmvhIOcmhJi4+UK5CuCmLJRMdk6yL//INPTcufsZs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743037; c=relaxed/simple;
	bh=LIhtjrgLQxFa17u85OcBRK1V4S+OF2p4UzfgxbW+kc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYUZIKUhAXiSY7SkdtB+J3nETl2v9TIbhNQQtQzBRs1q887X0DR2XNzHHwcLF9bmG+6ax7kJsYRRl8c7S5eutO6QIInoQ9a2S/2CYfecWcLgwjEPlJlg5nA6Ysm9f5mguROMaVGzjYbc94lsCC/s7vJqpdUDOUpuw7WoOJ/cGnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iJ6ChNfX; arc=fail smtp.client-ip=52.102.137.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daObdDeGkeofNgfnC9joFi9KCAOkd5XmFMlhD0WSn4X9403Yqo5DO7L4XWENchI8ii1juruWSCUJ0Y5e/HDoPGkWxKNIwHw7lzFZIMPtPfd2oSEBLAcYg5vFQ3tjyEgZ/ytt+qWEc+Z1tHFxI2pz6smVO95u9G/J4a60ofQ4eCZwoVsTTfQgkhEAFKdDw9p90RFiPydqOZuHAi6STMlHsR0jOeMrwOw4Tsqy+0pcA3TvRSOctg82JY2Hy+uAgJPe0GveGE41rZTYBRyvL/2MDvdpHHDXvnKvBAc5PA4tTxtaIeDe7jaiOt+RwtbdnoxOL/FSzbmRsTPtzln9Waj3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLUZHimODCrxbNvcVpjeg0i1cH3VE3VKQiQAZ09I2io=;
 b=D5yUDIaYjVl5sAVnjHqzT5dcTnvoeBKjnp4gNduBCkMukQ6iZRYcS3opcN95VcM2s0s3ubrr5dZDHVWz0axNQxipVokvW4fj5v9c86LTgs5+Ll461QfU6dkLYb1Wstb9/xVGJy3hy5f4QZqoGTyk+YSiJVs2dl/NftzCXWstQ+BWLfQZ94mGG43gkKGYjjoVwuTysx1O3D8PcKjCEoLW14SLbMQjmWyKIyExDIf9JxB1Mn90XzXf6IKf2jc1/kO6Vj/AnZPwBV3ePQ14S56z+HqY1Pb5ZZ3y6p3RWWnC0mCVVSiECbai4XCuohoo0fv+81huD2HiD9jFPcNAYHJ7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLUZHimODCrxbNvcVpjeg0i1cH3VE3VKQiQAZ09I2io=;
 b=iJ6ChNfXLfoptTaXOQpmrNqJURF86nQzTBvaBiTm/GXMUYnT5SKGWq487OlXCZ7ALVAUO7xhOYdR/0xoj5L8giK7dPKaMXcmo9+peR5YGhvxbqjhNbCCCDB4Aa5+rSuTMI8Qa4T6koFAaO62NJSclOu5x1fG+Mq3Gx5tSnZGD1g=
Received: from SJ0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:33b::20)
 by LV3PR10MB8059.namprd10.prod.outlook.com (2603:10b6:408:290::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:37:13 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::63) by SJ0PR05CA0015.outlook.office365.com
 (2603:10b6:a03:33b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Thu,
 5 Mar 2026 20:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:37:12 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:37:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:37:09 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Kb8iO2510342;
	Thu, 5 Mar 2026 14:37:09 -0600
From: Andrew Davis <afd@ti.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, David Owens
	<daowens01@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH 4/5] leds: lp8860: Remove unused read of STATUS register
Date: Thu, 5 Mar 2026 14:37:05 -0600
Message-ID: <20260305203706.841384-4-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|LV3PR10MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d36c50-8c4b-4ca2-5ea9-08de7af6faea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|1800799024|36860700016|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	ow93IEH5uOtZS9M10flNj4pmbHS3pWLgaiuB/sg0fHVmBn36s9yrq2zbjnTYQLSxYocuXeUqSfdOfG1MjXOuHEPpnN5c2Tt+7eEwGNHreOJuVbUgOEOi6i8y54EHMendfDN1VqjARLfqy7q8f6/zmKNFdpCChREPSaP1vNMCrXhydZRHezXwkeWzyej25/Gmv/tpM8WUZyeM9QHFzmaLSE4wVU9RK/65ijuAF3zFRp/+Kp7ILe5WOPbuC7LXcMKn6bj24J3SvaNNOwIr7Re3YlQf2Ko4OCxXBJ0jpLiuKgiy/7CRJ4vN1E7zu52gIPmvQKfdnq+HcGjE6AYc7ntf503Z500/hY8mE8HkJchVpGsi2UGmwDo0z9jNcfYGJsHL/E76wX5QbIkkERE58Rqp0LX1vd3LPDizvoKWqI4etOL3GM/eW3uFswlAgrBqmmke3YZKaLnOcjQZrwQEZdnqZeEb2PDsNPm175/ArUMrBobj+tjvY3H9ajACFMwbUULxMh36UgUsXJiSLL8p/5Eu5DtcJrHxizKGQoffFI67g5xLcN5jZ4IKo5Hn5yG7l7X5JP+Izgv7ag9yadzQqG+ciTeuo3zoPTh44RS+ur21a9edfDJUBj9j2ugqx6Ii+K02hOtO8cHQeinbn12qqnLoL919WtWcNZUTH+x7n9cfJNfFS92rKNQwPWinS6ZAtgVldAKyNje22P6OaJdhJ9lIvkOFKASXvPDQz+PDQ5SaxJ7mzYBu+vphZ+g8Hi4ZsujSkTtnB7MdEEm8OXkvGFYkaQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(1800799024)(36860700016)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z72OSi7GZrljo7DaeJfp0zxzK2q6pfqXsHEd526XWLqehhlqIC84yT4zLgoEx4HC6tX7ckA0147/U2uLl+3ckQ1tgKWK/nOVO0Vn28Psw4smtVcf9DRmmqf0nDTEEsEtB7KyrQLJ1MCa9YHB4CtAq6DjIRr3HfILGjJMJ7n3EP0Ud5/adeoqXOhJ/glkV+0EzgE/6o1nTKtrSglF+K/Kh0+bihjVfUvVo66LmvsH2EAZOZLQxatO9MbtwNrqm4HkBdoaviYdrxOJKm26FvCB1q5mF4IDZukIB6lsWzB1ErRU0N7vxfJUu6ZEWLno5LLD/S4LjvDqZBanAfo8G9gJzkt05A9lLqbMs3YDGL7mcSwxc3J6ryesm9k11sYs7ZQdjKW3iWgMrsMb7iLPBCt625THREcfis2i/xCRRO1p+0zTFnMw0doAk76IuFTpBG38
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:37:12.2115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d36c50-8c4b-4ca2-5ea9-08de7af6faea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8059
X-Rspamd-Queue-Id: F117B21838A
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
	TAGGED_FROM(0.00)[bounces-7110-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This register is read but the contents are never checked, remove
the read until we add status checking. While here add an error
message should the preceding fault check fail.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 16129ae94d65f..6d1c9434e6d17 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -185,18 +185,15 @@ static int lp8860_brightness_set(struct led_classdev *led_cdev,
 
 static int lp8860_program_eeprom(struct lp8860_led *led)
 {
-	unsigned int read_buf;
 	int ret, reg_count;
 
 	guard(mutex)(&led->lock);
 
 	ret = lp8860_fault_check(led);
-	if (ret)
-		return ret;
-
-	ret = regmap_read(led->regmap, LP8860_STATUS, &read_buf);
-	if (ret)
+	if (ret) {
+		dev_err(&led->client->dev, "Cannot read/clear faults\n");
 		return ret;
+	}
 
 	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_1);
 	if (ret) {
-- 
2.39.2


