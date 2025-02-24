Return-Path: <linux-leds+bounces-4066-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55490A4174F
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2025 09:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DA518906C6
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2025 08:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7840185B72;
	Mon, 24 Feb 2025 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="WqXOe5EC"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2088.outbound.protection.outlook.com [40.107.117.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EA786346;
	Mon, 24 Feb 2025 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740385707; cv=fail; b=la5PW08Z4aJJWvtFEq56jGTcfLTR/u2aXLYwIVUDLH9B61H5uepIz6BNGJ/Txa0h6187Xd3xDSeLzeV0TR5X2MjCiGexpIcsB2E1VexgPthq8homGMF4G5Rl9Sx67cb4XnN4g8AZs0zAJ3Zg3p7OKXNlPkzoOYY1jLjWWxXDi3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740385707; c=relaxed/simple;
	bh=sMS1/sCn9yw/lUBxUn6eAukGAy+LF464cNGNr3j8x0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jcnSnIxdi60cb76egt4EEiFggDcM2ChNMU9V2ukUY7I709di3K2Vz2qGEIfWVcRgz2RTPzHvutvLO6aOIXVZBmH4UWHCA1x4I50DNJ1WoQs1B9hSsa9kxxexxgO6pSzCgGSKvrVVibK6nape6okUq6oi++srCdM62MRNp31q4fY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=WqXOe5EC; arc=fail smtp.client-ip=40.107.117.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dy6q9UKyCdpHuYA//IXwHmpdyboZRvsyWxONgURDtamqnk1OHg5awExrB6CsABr/NeIZbzZMxpLBR2VmbvxuaUYmbenEYlnxPfS7cqmwYegOJ4HPvuSRDVbq9rtETYkHpBm/8n3mkziA4M9KD+MLVqCA2lPXMzaStF5UfuWrsn/DlzuOecGXocHFspY4BXrfHqoECNQqO/p4IrwG0mRcwSr9IuwVxqGKHr5Hu8VHtIxJNn0cwORefNrohfgJ4YpqfiDr/38BXVT52qzu39BgHdD2N5Rfd+m1Hn1mp+lMXnZTRax9cn3AN/LqedjM4gd0pK/JScI5Ewj/bx2bxS8brg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1RjZOhXE80FYBnM2M3oz40fTLATsmw3qVz3IKRPadY=;
 b=Xt089FME95zRmer+mZxQ+cKI/TMaQPrVZDaHBqO88P71cv4y8vB8h9zcXPjrTa08zaxrb3EJb/edIVht/Mo8H7qFri3hmlX2FGaX9kQcca9/wvVDf/bNbRymwt+o+888vH6yfYXJMcxNtrbvYURl+WfUBCpyTAjspUQikG2zynp+W2lH3n5lqEcrbuRIqIj6K+kujE6z6m1/PuSOMgOl2QaBbPyKivzh3LAgwdimYbR6DpkrCYqW6dkE1sLBT26nMF+tOEsu2M34pHJu4G1BEi+LSCZ8Nj1orrGRqlafptpBQQGtIx+BAQzlTkE3r8jJzUHovGm79n+IJHLNycToPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1RjZOhXE80FYBnM2M3oz40fTLATsmw3qVz3IKRPadY=;
 b=WqXOe5ECMtLuI0UEDLdjyV9Iajvs7T07CB+c4AzzCnrNYHWNqYX1c4+vz+Auz8lVaAui9ARqukXXVdsp1EUyNlKvzw/3YGoZMKoQ9h8bYZbSnepCOysu+y8WNtTDFxNOkwsnsXDToR7HoQlOgRz6/WdMrYQrbY4CHNqBrmi8PhWhsjZFv47AEhxmrBQn6FJ0RaU3uxEeFWxyfT96AkVbG17l4krOwVHC1Z4stsDhql95la49ZFSYSRrKmIvJcd1g53iC9NPhu5E+Lv+NWF7w1On7U+nO8MGSQHh+q36EZ5g6dJ5ZJKd5ac0wf+KHeOCgzljwTH40Nlooy/puAckelw==
Received: from SL2P216CA0193.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1a::22)
 by SI6PR04MB8344.apcprd04.prod.outlook.com (2603:1096:4:232::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 08:28:21 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:101:1a:cafe::b6) by SL2P216CA0193.outlook.office365.com
 (2603:1096:101:1a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 08:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 08:28:18
 +0000
From: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>,
	Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: cat9532: support cat9532 in pca955x
Date: Mon, 24 Feb 2025 16:28:15 +0800
Message-Id: <20250224082815.1827487-1-delphine_cc_chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SI6PR04MB8344:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 341319fb-ebcc-4824-35bf-08dd54ad3154
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pOVKlOEFOhrd5J0lkGKfh2Zu+2y/Ie5xYUPaLo3PyXuMjUHl5XEuQmIpXztq?=
 =?us-ascii?Q?93P/SSCzpNPTeB1tI+HR4/C/dvqTrjxlYdI7QgN7QhvE83arRLpeAyJFVOny?=
 =?us-ascii?Q?ikF9jsenbkxmoW70Z/1NanIgx7gybAklpdpLQLHZ+5MKHIzHHVpzznCsyZJP?=
 =?us-ascii?Q?axJwm8cGFFBAQqR4fdRbyP9kKf2exl0sdUIKHyIUyM0oNSPD6h9PDnKZ86jJ?=
 =?us-ascii?Q?LyZX0HIRGEMSzyYA0btspTXgRWBCv3SN9GRReZYVGHrcUn+QI1YWgD7dE1Yz?=
 =?us-ascii?Q?55p6ZyeK9Hghn6Bg2ahBbqgAVl6DsOINPf0OSObQhV/UOW7eZM4Auwez72aX?=
 =?us-ascii?Q?bT1lNMnNNMAS/LK6k0o6TVnU0gbGbp6nuE1Yucxw9QlkfgV/k9LPem0ZAm3s?=
 =?us-ascii?Q?XuIk8FAMrEFAkvA+K0M7PpX/aSU4AUumo2HhF3Qw3L75/wCpPMmNCRtjEpor?=
 =?us-ascii?Q?ZnxzjjrwFtWmGrAgm9H/hUXzO6FE1fXP97vZM+46CDF2gIVvewY5rFzPcfim?=
 =?us-ascii?Q?obeY2bKTNJPVHEI9+HAPTZyp+0IuSBLTxJXVm6WzxvG6jyLDyd6+ldY8bezr?=
 =?us-ascii?Q?61elAI4DTV7V5BpJwUOsQIIkViTuGRNEoqgNyfJEqNUTTr3PFU5Nhq8IR7ie?=
 =?us-ascii?Q?Fm/CkxVaESSbdKVMemko+SVlVg160PQV5xb6oogeIkCqfJnbwQT1Sn9teLwC?=
 =?us-ascii?Q?wvLKYbjSwDzSUoWFDSBEKT/PJKc5Bf7zKI1zTkaJB+y/oQ2z2QdBZwMdqVL2?=
 =?us-ascii?Q?2Fv7MGijVurLjBUoUI2Y5f2ctBBXQGvR9Qh17+Jz2eykqkKBcxx2cU/aDWEB?=
 =?us-ascii?Q?nFAWOvv4ZtRbIzShx6KxDcBwqzlpx1OFT4afwYpgDhk0GXRw9ivi+d4Jq0qZ?=
 =?us-ascii?Q?GkzXY9AA6agsY1Rp/zc3fBFT8fxuTXoJsAYqljQbGcSQNqf2asn5rM5mhKVf?=
 =?us-ascii?Q?elFchjn1cfTPcEu0lLl4lXsfnQQ/BO/tjlJh23W/XYcwVxO3ndqwZ3aIp1mq?=
 =?us-ascii?Q?jFzbE8C8UnpTBHz7j0hKcyXkYeJ+llJexx+Kf+83PEaHWzGZLFSP0pl2+pm4?=
 =?us-ascii?Q?smLPYRwWfVBMFEjhBaMysfmnDJhW2Ci6bS8ykmp/0cn5RYowDQBDtcspSkG8?=
 =?us-ascii?Q?uEKyEOGDmQTcUGba7NPigv8LNe7RNQcvo83Nf7nNXyPPdEIzbD6/kAGY1H4v?=
 =?us-ascii?Q?g0coJYsZDc1VX2p6UExoh9QFs+BYxMNFSxO3TSKtrhPPEoRAn1NKjlKzb4ol?=
 =?us-ascii?Q?SkWSVcOUkIGKVziK/VmLaUoeC1q6jdF2pUP5lFVJXtVGsEIU+xF/VXaPhY13?=
 =?us-ascii?Q?sXh6WJurZ/4wtYxcWHk/fDpYPZwd23Dz/qWSm/tFt4FIMa02snnD/4mV5q8R?=
 =?us-ascii?Q?hdO0HcDAqJ0WLE4wxJaTciguUvq5cIdne4+zqSmEE2eCb6bdCVUozs44MJVd?=
 =?us-ascii?Q?RC5YT+xI8Wz9DE4R8jx7xaUQndKgJm58K1ixgEFuuJE9cQyH51QYP3OIeGAf?=
 =?us-ascii?Q?HrFGk0VTcMPI3CU=3D?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 08:28:18.7968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 341319fb-ebcc-4824-35bf-08dd54ad3154
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB8344

From: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>

The CAT9532 chips are almost 100% compatible with PCA9552, except that
the CAT9532 uses the opposite polarity in register that sets on/off.

Compare the state at INPUT with the state of LSn and dynamically
adjust how you program LSn

Signed-off-by: MarshallZhan <marshall_zhan@wiwynn.com>
Signed-off-by: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>
---
 drivers/leds/leds-pca955x.c | 41 +++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 94a9f8a54b35..447da4a2d089 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -4,7 +4,7 @@
  *
  * Author: Nate Case <ncase@xes-inc.com>
  *
- * LED driver for various PCA955x I2C LED drivers
+ * LED driver for various PCA955x and CAT9532 I2C LED drivers
  *
  * Supported devices:
  *
@@ -145,6 +145,11 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 		((state & 0x3) << (led_num << 1));
 }
 
+static inline int pca955x_ledstate(u8 ls, int led_num)
+{
+	return (ls >> (led_num << 1)) & 0x3;
+}
+
 /*
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
@@ -235,6 +240,21 @@ static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
 	return 0;
 }
 
+static int pca955x_read_input_bit(struct pca955x *pca955x, int led_num)
+{
+	u8 cmd = led_num / 8;
+	int input_state;
+
+	input_state= i2c_smbus_read_byte_data(pca955x->client, cmd);
+	if (input_state < 0) {
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", 
+				__func__, led_num, input_state);
+		return input_state;
+	}
+	return (input_state >> (led_num % 8)) & 1;
+
+}
+
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
 	struct pca955x_led *pca955x_led = container_of(led_cdev,
@@ -251,10 +271,11 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
 	switch (ls) {
 	case PCA955X_LS_LED_ON:
-		ret = LED_FULL;
-		break;
 	case PCA955X_LS_LED_OFF:
-		ret = LED_OFF;
+		if (pca955x_read_input_bit(pca955x, pca955x_led->led_num))
+			ret = LED_FULL;
+		else
+			ret = LED_OFF;
 		break;
 	case PCA955X_LS_BLINK0:
 		ret = LED_HALF;
@@ -276,6 +297,8 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	struct pca955x_led *pca955x_led;
 	struct pca955x *pca955x;
 	u8 ls;
+	u8 ls_last_state;
+	int input_bit;
 	int chip_ls;	/* which LSx to use (0-3 potentially) */
 	int ls_led;	/* which set of bits within LSx to use (0-3) */
 	int ret;
@@ -292,12 +315,18 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	if (ret)
 		goto out;
 
+	ls_last_state = pca955x_ledstate(ls, ls_led);
+	input_bit = pca955x_read_input_bit(pca955x, pca955x_led->led_num);
 	switch (value) {
 	case LED_FULL:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
+		ls = pca955x_ledsel(ls, ls_led,
+				(ls_last_state == input_bit) ? 
+				PCA955X_LS_LED_ON : PCA955X_LS_LED_OFF);
 		break;
 	case LED_OFF:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
+		ls = pca955x_ledsel(ls, ls_led,
+				(ls_last_state == input_bit) ? 
+				PCA955X_LS_LED_OFF : PCA955X_LS_LED_ON);
 		break;
 	case LED_HALF:
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
-- 
2.25.1


