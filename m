Return-Path: <linux-leds+bounces-8427-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAoIHPe3HmrZJgAAu9opvQ
	(envelope-from <linux-leds+bounces-8427-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:01:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF762D129
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7253030207DC
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 10:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADC138944E;
	Tue,  2 Jun 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="JRnWOpD8"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021079.outbound.protection.outlook.com [52.101.70.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCB1303CAB;
	Tue,  2 Jun 2026 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397879; cv=fail; b=AgxA/AaaUIzH9fp9KKs6gu+tc4zQpvy54VBrtd5vwTGqR5vJEW4yIqw+CEHAK04vQ0b4o7R6JbwsyXsCvMFR+Bh+WlSW/dsKCXfkt4d1qcRen9ltJcxeQwDCJi/TnKusikYWjq3e8ZP9MuM3stOKpbqLm99f2UzNfO6Bsb8kiMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397879; c=relaxed/simple;
	bh=ZFVitIh4l1uSW7o1HlDY1D5nocD9XS+tJgXynsxISVw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FDv/elJVaPJ51a1db4rh/Hp79+ieZHWd5YChq5uY3FG4xJJG24lvrEXLvxrItKgsztbXVgfpP2R41MOZp6WEPHla/fAWYL6WLqcf4pOYxqjU6GlaCPJ7DemuaY2/qZYpZip/QyTIVR2aOoMumONs+7nIJQiTqNnI6CaRkqy04WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=JRnWOpD8; arc=fail smtp.client-ip=52.101.70.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwX2hPGcN3AsbRGsh9RG5LF62va6Y7877Z5qGSQQjTnpCqL4WoSDex/Ip+BNh0c9290QYomFmN7StUEjbYd1qtLxCIusZTJHnwVDOk27p1r29biU0NgXSQsns/EomyyaOvXglnTEljDBP6IEAjteDeen12hiNtsv2WsnZoXWGZ2/TqtDVyDqlnkpljoRpI0MsAgM82caBQf3lVZS8MjP1c9UrzuYOUYySESGPxE6OGhgJbUykzZdo0+x6djkdSxqGslPQouuoNPO5S4Rj4lY1sMlO3p6zFDdBgkAcAmJS3JobzCwviOS9bYbBNQcei+MuhmE3n2FtWyRJyo8F79YAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zEPkQutJyROkXVpGPm1DqAdB17usAkDLPPUC98bTfw=;
 b=vgt/RBvg75Fb/wb9X2xDi4QensAA242t8hMutGQppKjNW5qi1hLK7Jc+5t+bmOM6aVc3xou4Ka0gnc0bq2sLAUQMYA82Z7hA4dYefHnuyGFBdz/7CI5O7HlXk2C3KICynt50QF6HNiBe6SaH4znoDTBzEgZC4F/obPV8ry9IA3oDLau032DliyfMBrMAAK4tS7o9GEXIQcghfEaf3Du4HGM1bHjKzNArxM6shyJZ/c3/YVG7qUkFBDPGFWrPXSQMw4tOItixxVU/n+zLTDpAA7LdzHllp2tZN6xnKl8scZeZz2u/LwP5ShT6TvhVrZBh7mEE5ZvgbeGIfO2sYYfoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.61.153.67) smtp.rcpttodomain=traphandler.com
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=prodrive-technologies.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zEPkQutJyROkXVpGPm1DqAdB17usAkDLPPUC98bTfw=;
 b=JRnWOpD8+HJUnUddUR3j+q3tAvxwKGv7M71lfSthYLL0dS20CiStr1uOBkt4rDGnFAbPBmVkxGbrZaqnQFimLD9XWAnx/ojMqW/Q+shHjII6V4uWvj2EA5D8CZzmnMi6wPaji8+6eMHtUFm2mtIQ/Xsuwc4t0vPJewABcBuvmCs=
Received: from AM8P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::21)
 by PAXPR02MB7933.eurprd02.prod.outlook.com (2603:10a6:102:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 10:57:51 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:219:cafe::e) by AM8P190CA0016.outlook.office365.com
 (2603:10a6:20b:219::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.18 via Frontend Transport; Tue, 2
 Jun 2026 10:57:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.61.153.67)
 smtp.mailfrom=prodrive-technologies.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=prodrive-technologies.com;
Received-SPF: Pass (protection.outlook.com: domain of
 prodrive-technologies.com designates 212.61.153.67 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.61.153.67;
 helo=webmail.prodrive.nl; pr=C
Received: from webmail.prodrive.nl (212.61.153.67) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Tue, 2 Jun 2026 10:57:50 +0000
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 12:57:49 +0200
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 2 Jun 2026 12:57:49 +0200
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Lee Jones
	<lee@kernel.org>, Pavel Machek <pavel@kernel.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] leds: group-multicolor: Add support for initial value.
Date: Tue, 2 Jun 2026 12:56:07 +0200
Message-ID: <20260602105608.196291-1-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|PAXPR02MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: c82f55cd-214c-4333-18dc-08dec095ca58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|13003099007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	p5DkDS4GFIIeK7IXJ2IZvSDPbRJLdVDIZJosjNc1res04L06bMn6eLPJ3yMlOh1lurttrnEX43DaW/nFSECUeqNPV8awqSWgPqbAehpQ9YnkNkFXj6RERtjEGPV0B5wYUe0NmIKfmbRxh8of+zFcnartBNXoUJobl25P/Ir29Zx36hKVkYuZnXIHWnAYQACnr+o9TJ+6LRiiG7c67E8zSWbBQ+yB/+aUnqeuqUVC4/EBJzM5cvMVeBtquHd4K/pyqe2XE0duPSiDE6fsGHTCQpyLNsjyZMgCEccieGWfH3Q0SgZXeXoeRhr55qSAjSwgHrHupPgDBcnI1pguuahKVUvwPuGqz2lG5dvDjtgMjsiE+JQ+TRaBFHpa9x17n3Pc2Jnzvo8E236J255KNpXTUa1km79kfDR4toZx/WBYYVIaXSe7Z9/XuPkGUODYUt2/yJeBCXY2VIPr90cCUFVW8sg1Wv0CzutLsyYBMUlU+Ca6YKUtdyM/Qteu8U0lEbh0f6N59k18fWgoS1JGyp/3sAEHQySEpZFy8kDHoT1lRsrH9FeIbfV0lkVIVjBzrvfJTfsSKnQdb+e4NK70Q4+w75ClzuIP7Amd+7QfUmejFrUQ/FNpP7ubwDt0PE9GJMQmxdLIB0/7i3aLZOeNh9wYY4ztqxQSJXoRECtP2nxWFuwzRPbnklUAZ+BkOfEL/gGc6AVcA6HdFvZG8RqQSO/hRgLAWFez6WXK0RYabU52q0g=
X-Forefront-Antispam-Report:
	CIP:212.61.153.67;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:webmail.prodrive.nl;PTR:mail.prodrive-technologies.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cGLJDG7qhWziMyl+iFVAeikyPgjNxtvmSxDuZWei0TP0JoeV+RtLk0eNXpbodo8UKH67pK697msOjkFQLqNoe8ZSSmSG2zaiyU8Xq7dp4VokE4smpb0ipaCzsXd0ZFl5aOvBh32nOOrj7gRzALwIW3Epq3fAplLM5CqKf4WU6KubOgxXy4O1Wtd7TF7kQXcSKXm8Zw1U08j4+5f/9FOZTkX1zNUawCgu+80ZWv6+hg+XznV68HxXaFEUNaH4ltSKCN8GTSDZU4T6GrSzlWWt/+/X4y527+qCeOOGwGcEXwB5wNSKIWlX4sj4Z6j5cYwZ2F5WXWrWg3P7+GDXm5XY2k+xPtg5pEnrx0Vy9iVyzNjKH02W+cKYjDRDkUI7FcgMMB9SE7rmBtrw8prQxLhUvc/8wnL1GQAZcjW1Zt/8WC102P6bE4XccJn31q4QIHbE
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:57:50.9760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c82f55cd-214c-4333-18dc-08dec095ca58
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=612607c9-5af7-4e7f-8976-faf1ae77be60;Ip=[212.61.153.67];Helo=[webmail.prodrive.nl]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7933
X-Rspamd-Queue-Id: C4FF762D129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[prodrive-technologies.com,reject];
	R_DKIM_ALLOW(-0.20)[prodrive-technologies.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8427-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[martijn.de.gouw@prodrive-technologies.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[prodrive-technologies.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,prodrive-technologies.com:mid,prodrive-technologies.com:dkim,prodrive-technologies.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

When the driver is loaded, it turned off all LEDs in the group. This
patch changes the driver to take over existing LED states and set
the brighness and intensity in the group accordingly.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
Changes in v4:
- Use DIV_ROUND_CLOSEST_ULL to avoid potential overflow when calculating
  the intensity
- Protect reading of led_cdev->brightness by acquire the lock.
- Link to v3: https://lore.kernel.org/linux-leds/20260316201321.2789158-1-martijn.de.gouw@prodrive-technologies.com/

Changes in v3:
- Use is_on boolean instead of storing the max_brightness twice
- Link to v2: https://lore.kernel.org/linux-leds/20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com/

Changes in v2:
- Fix multiline comments
- Improve comments
- Link to v1: https://lore.kernel.org/linux-leds/20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com/
---
 drivers/leds/rgb/leds-group-multicolor.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
index 548c7dd63ba1e..7a77ee6776255 100644
--- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
 	struct mc_subled *subled;
 	struct leds_multicolor *priv;
 	unsigned int max_brightness = 0;
+	bool is_on = false;
 	int i, ret, count = 0, common_flags = 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -96,6 +97,15 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 		max_brightness = max(max_brightness, led_cdev->max_brightness);
 
+		/*
+		 * If any LED is on, set brightness to the max brightness.
+		 * The actual brightness of the LED is set as intensity value.
+		 */
+		mutex_lock(&led_cdev->led_access);
+		if (led_cdev->brightness)
+			is_on = true;
+		mutex_unlock(&led_cdev->led_access);
+
 		count++;
 	}
 
@@ -109,14 +119,22 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 		subled[i].color_index = led_cdev->color;
 
-		/* Configure the LED intensity to its maximum */
-		subled[i].intensity = max_brightness;
+		/* Configure the LED intensity to its current brightness */
+		if (led_cdev->max_brightness) {
+			mutex_lock(&led_cdev->led_access);
+			subled[i].intensity = DIV_ROUND_CLOSEST_ULL((u64)led_cdev->brightness *
+								    max_brightness,
+								    led_cdev->max_brightness);
+			mutex_unlock(&led_cdev->led_access);
+		} else
+			subled[i].intensity = 0;
 	}
 
 	/* Initialise the multicolor's LED class device */
 	cdev = &priv->mc_cdev.led_cdev;
 	cdev->brightness_set_blocking = leds_gmc_set;
 	cdev->max_brightness = max_brightness;
+	cdev->brightness = is_on ? max_brightness : 0;
 	cdev->color = LED_COLOR_ID_MULTI;
 	priv->mc_cdev.num_colors = count;
 
-- 
2.39.2


