Return-Path: <linux-leds+bounces-4953-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C78AF09BA
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 06:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B202F7AE927
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 04:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0357F1DE2A5;
	Wed,  2 Jul 2025 04:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="n/KRad7O"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C2BA2E;
	Wed,  2 Jul 2025 04:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430950; cv=fail; b=Jk/JWclRpEapVTEE+EWyYlh1PuZ4FXC9r+M7T/0p8Sw4y1MN5kFd/sr8+uB2NrkI48FfGRsMkMD1WD0HcIcH0eAFb7+JqNnHBSJRODwCDh8MbgiObNQGtTYTtyqk3jKalgZr4CsXwoPDawBZF8IXimj+61rQNzdOrZZidiJHFhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430950; c=relaxed/simple;
	bh=wVH+8cFtNx1V2ck+eDdeU+T+XxWg44sUrFzbRm7B5gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YB4E3Eu8AxlTUg/i7W2H4utyGM3TctAAKPuKLEOZ0w6VeiBJ5+ZZfIDTO44K26m8WZx2zoCFegCXuhoUmoAtgQzQPCM7waPEHnYveCMgXfNSkRbco3CJj/0W+xOO7dDd6u1JJx0aaFf2zaCMZz2k3XZcoasd2LLJ+3BBvRlD3ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=n/KRad7O; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9zT0dpvSWCg6surgKWLmryz0b3I2rNhstVIjRRuJaw9WqY7NIrysE4ngYm75lJKpZaZGgLI5PcvT/hFCbkQJAC0ecJ6Fnb3JiyWBYVgV2teFor/+tfdO6ZXEtX/iKpxVBfQFAMqrj4Vi2jzoOkSvQ2U3rYB+O1TYjy/hCZpzNJt1GillTM89vLpxeD1K0305cnm9mEyIFdWoXNmSTSNm3SQUsJKv6avke2wnh9VFxMsWPQ8H67mPkMzaWIHCGuZAeXSQUJ6RRySQDWtvDWKUA1qfZCt7BpKMoP7YK+Zn6v1AiHPaFVUB19xxG6gtDdAa6on4tEcFX0Oj+bskSKssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo9Z+XK34hJZczwAcldIfvykgztqu0kNKu1iXmcDtFY=;
 b=geMAADLfDJYdtJaON011J18g9G0YcQmbXCrzz/C4nQfw4+gbWCG9vXJi6JsRcxxWEMQBerjeC/Wfx1KvdY07z4IJKa7MXzeek8n0oigx+pN4FUKZRq108ptLsR1Z73eeQzgXt03NovrIfOlpzyB6RuYJ+9agsoF42ML3BZ6PSlGS991YAzRt6TfrwLufPAodPPki7T1B+7FU3INXygcN6iMcjuqDdVPUtT5Pda+bhUr2k96GQOpRx68OWgjGRG040q3a6wWD6gcXTfaDPWoVKZIOSwnhfC6RvUWgSDcgt60O8DGdRSOT9nYxT+Gn+cCmEkZyj7rwlP1wG2ybsphBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo9Z+XK34hJZczwAcldIfvykgztqu0kNKu1iXmcDtFY=;
 b=n/KRad7OcN0vvyG5+4sf+8lUMnkfk37SnNNFZmbUNX+Yl0q/iq0Z66N3u11/EEfTHzoTtOala3ypqo+BHq/7M39zIMF0U/Hvn68+TIvRkXAPD9hML3a7DAjadgTXsK1YYiGvxtKNShfFt9QRXhcuBCv7DUpKnO14TFAnC1faCZI=
Received: from DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) by AS8PR06MB7189.eurprd06.prod.outlook.com
 (2603:10a6:20b:23a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Wed, 2 Jul
 2025 04:35:43 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::1a) by DU7PR01CA0038.outlook.office365.com
 (2603:10a6:10:50e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 04:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 04:35:42 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.182]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 2 Jul 2025 06:35:41 +0200
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing-wu.Li@leica-geosystems.com.cn
Cc: bsp-development.geo@leica-geosystems.com
Subject: [PATCH V1 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Date: Wed,  2 Jul 2025 12:35:36 +0800
Message-ID: <20250702043537.220478-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 Jul 2025 04:35:42.0198 (UTC) FILETIME=[C4D3D960:01DBEB0A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|AS8PR06MB7189:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bb543922-7dcf-4004-39e2-08ddb921e7a9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GBTznCbPvI338msNdwKbqMsn5jr0pUe3hhFeia9IHvCnlWurNPXzOvJ72tAF?=
 =?us-ascii?Q?9eKmYlj4n4yQjVeuST4sBKtYiyM4dq+eRG/HP2bw9bkoaKLXoPSrVg0m/Y3P?=
 =?us-ascii?Q?oLOMSTNH6uEF9BJers5AWNKhTTUyK1yr1BaUt69GaihA7Zx69WAau+04SR3H?=
 =?us-ascii?Q?a0oPLV/1PD9OsJbwOEWLnYg9qWs0VMddj8b7/KhFlt+L9G/JgrYm+giN8vGE?=
 =?us-ascii?Q?ADY2rh3VaiMd/+tfQqPGF+jXAEwF0kgtkTvtK3TFos+KmXqPpvIznDFC2HN0?=
 =?us-ascii?Q?cS0NM10MDgLDMsYNXcYL3ZSqY3yICLTogwqX9AH47pxAQxSJaCTg1rYOwV+j?=
 =?us-ascii?Q?frz5jN80GwVQG46hBA4E1NwUYPCNl4sEEVGvEiq2vsmPC0CUmMe9lqSfwI/B?=
 =?us-ascii?Q?l/zRBNDYt5A5+uF6w+Ubtkqj7t5bZTcLGFtqJL9C5/eD6NOKmN6N2RL+MfwO?=
 =?us-ascii?Q?bJCdTsyHTyNm9V2gVrF1Dzjh2PHFGlo+J4sCn1reA19xVitfouWzctAqAQ4F?=
 =?us-ascii?Q?tDmfpxwscvsNsdKm9sLBdQnKRoaa+qk+8n28pprV9XknuP1SH0ycbTYfEnm1?=
 =?us-ascii?Q?/oHsmzBannXzrQmAH5sQ6vUqpifYN0Sla1uhv3Tf64umC0xtZYH0Ydzo4uqT?=
 =?us-ascii?Q?9HQgBOnXsq2qOQLQQzH1e31pJeVwHE+a+WOvHKgU1jTZC2ERfwo4PyRFMmQv?=
 =?us-ascii?Q?Sp2wWY2GGKGYzD4OZ3Mfno6iDemmAOTJoPuyhlets5Yb0EHlqKDQERi8R8Ve?=
 =?us-ascii?Q?67AqnQ3tcF9ATqNlf0etR3F1HOfgCiTbTHYbsEdK5GLtyaXmOtVVjAyAltFb?=
 =?us-ascii?Q?H5/f6Ab9UBpw/4n6eDMUblntDqbaGWt6BEW2CzObKvvBZc8ZhxR86XYhukI7?=
 =?us-ascii?Q?U3etuCFXoA9I6RcazpRXv2ZhvtT/y6RYawyusxpQytfrY6YCLLxzZKHTSxjP?=
 =?us-ascii?Q?qzy90FfKDb9qynXv2l76eZ62MzGxzHWNGgmG/Rs2woWPKXg999p1eCdMtukA?=
 =?us-ascii?Q?0BouCySnU8BKDSj4+MaXxIeyrdRDU2A21wrzywKfpe7DqL0kbgro4RLZo01F?=
 =?us-ascii?Q?du44e16x+R0ZPEqKkYiCyMdufQzs6y/nkwZVmEIVHX28KIzKXCLckwWvmje9?=
 =?us-ascii?Q?Cxc706lMbGdUw1J3sVD8bdyu+nOGN6jT51cwzVeTiG01xiYxD8xedd9zlgn6?=
 =?us-ascii?Q?KY3zGqgbdm7RKDlAN+UjjwSTOiu65VEDSrZbVVm86l9DOH0oVd+7ysA3ThLb?=
 =?us-ascii?Q?RSzm1kuUjJy4fXBjlV4Frz98Q5+Nb+u/fi48iSJZ6bFisABsOTe4PoA99+/9?=
 =?us-ascii?Q?G46Ym9t88fmW0W5dI01Ri6mf4lglglDfdvmtDGqwwv1xmeuD5r6nxG0Mf1Cd?=
 =?us-ascii?Q?jPtidrku4Xx9W+iFLQICekmNTpma3MxknVwaKyy+G6qJEGPNu9mUse671x4E?=
 =?us-ascii?Q?asyZ6JJyp8EAZj2Pbf69T5x9PVb9JOMX2OsPuBLRmRV3xe0a8jSoR6HLm+np?=
 =?us-ascii?Q?xYVYF7xMAl2Yrz02+snVWzwwH6xcdpYp+NJa?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 04:35:42.6769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb543922-7dcf-4004-39e2-08ddb921e7a9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7189

Some PWM LED chips have a dedicated enable GPIO.
This commit adds the support to specify such GPIO.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 61b97e8bc36d0..2d38504f74c23 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -40,6 +40,14 @@ patternProperties:
           initialization. If the option is not set then max brightness is used.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      enable-gpios:
+        description:
+        enable-gpios:
+          GPIO for LED hardware enable control. Set active when brightness is
+          non-zero and inactive when brightness is zero.
+          The GPIO default state follows the "default-state" property.
+        maxItems: 1
+
     required:
       - pwms
       - max-brightness
-- 
2.43.0


