Return-Path: <linux-leds+bounces-4807-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A079ADAE5E
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 13:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF75016E038
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93AA2E7F06;
	Mon, 16 Jun 2025 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="QwTv8zMn"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACC02BF3C3;
	Mon, 16 Jun 2025 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073143; cv=fail; b=jXnLDlHHW1o7v1jGaxEiqSqzpbGcwnpOOGkO5QxE5YEKjw/+iEHMiz0S4+jrJzJrjoJ1fPKKPOib26nThRmUmuBzY7zr6hbPheEpaxRwhg/ad5XRL/W0Ep1AoEY4LS55PlArvRxqVfU5653aW6F8RE9lRf3J9r8wUhsUSN3rSgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073143; c=relaxed/simple;
	bh=N8/WNWWNOs4J7LSJP3EtXrCOe+XnufmueFiHJ34uIwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cKUhN9tUcNv95N+E/A8ncUrYOWY0CzvU28jNKxxSb3XMLZuCMegx3q9jtj8n0pF/JckXhZV0+i/O5KEM9jdqCmIWz6wRY21nXVQO8dH/NtWmnlkM7qNKKR4yWwr6Z43guR1dOQFqhG0aegnFz0F9ykwBGEEnEVqdy0QNwo4dpYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=QwTv8zMn; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZHeIOHhN4sT3sIZsHxKwU6qES5unJK5pAOU4TLsqEd7Cx43FPZjnLZpLg2+NTFQWocw2TJuvphRdDu8v4VNEQD29KHPoBdNfNcYJrjfqWCs7EmdE+4IqhHGstgMJ2PHfqakAyVUWCNumyCMosswht13+/HK5VZQYainHFrGIrRxahzlPm4VLWZ550P6WbNIATMG8umIboy4pFz0E4P4xGr5aWfx4bKKLIFZAnOoPb36KnPZTEr37frtLgVGFd3SxDkZyq6XD7q3MzyDHBW5pQmTcHFhId6hmqX072OcfaEwjyaVbRNW9aJq7yfaH1b8yqyVwqau1BOV3KLydJ68Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8CkLTdVdQ62Zes+DAikthEbQ5687rTNSIFATrlrbtk=;
 b=dN6acm6tI27Qk1bYRAGXfOWHtKJYT4/ukGR9ZYBTF/GZ4R3qc2q01XuIrpJldbzn4pV71Ln6cQjNjxAmMimFzWl0IRY9dCP3ZTDbk4MIPuvtiwkZt7Xn8KYhD8LBqeXbJNVK1/PQoZsFIehmgqbqoIxmzECP9oxoSO88PhMH3cJZYGI3lTiVnpRp62kKjSOWf7OzRAKdIegH2Y5FzQdhdJOUAjV75shvLvTJY1rplMK+h2KeXuNMQ3WxAGs4+MGYEHTkg0FtY2kh7cSnZL9mTDR3hSjhk1xdk2uGVUhFcRfTLjg5EzMyfWe6uS851klz70ycbxVTxe6zv3GlvfbsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8CkLTdVdQ62Zes+DAikthEbQ5687rTNSIFATrlrbtk=;
 b=QwTv8zMnFOwnC1WgnLCczygcnI5XtFpQGj2hCrgUhAx1EO8k0XVNT1jwMhR6K+yvT1Eg21GN8NtmTjrZLcvxe8S0cSTFER1Ao55lSBPzvtqhmtrhRxDacSR9BcWRK3AA5huAzpCE22Uu1LMXJHzEl3QnZ0bPw2LSsIIryqrlbao=
Received: from PA7P264CA0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::20)
 by DB4PR02MB8584.eurprd02.prod.outlook.com (2603:10a6:10:384::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:25:39 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:348:cafe::c5) by PA7P264CA0104.outlook.office365.com
 (2603:10a6:102:348::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Mon,
 16 Jun 2025 11:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Mon, 16 Jun 2025 11:25:39 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 13:25:36 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 13:25:36 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 13:25:36 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 0605A2625;
	Mon, 16 Jun 2025 13:25:36 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 03170411E6DC; Mon, 16 Jun 2025 13:25:36 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Mon, 16 Jun 2025 13:25:35 +0200
Subject: [PATCH v6 2/2] dt-bindings: leds: lp50xx: Document child reg, fix
 example
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250616-led-fix-v6-2-b9df5b63505d@axis.com>
References: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
In-Reply-To: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, Jacek Anaszewski
	<jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Johan Adolfsson <johan.adolfsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|DB4PR02MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d7920c-ab02-4e3e-cbf0-08ddacc88592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cCtFSkptWTB0VUt4ODk1ZUhMQytTNjdSeEF4RmZ0Y0NVbzNOMHFvRGI5bUph?=
 =?utf-8?B?RnNwRDdwTGlQUHgybkcyZUs0S29hY3RiY0N0SXArVjVhYXU1MnR1NkNieUxZ?=
 =?utf-8?B?ck03eDVJUFcwVTFac1hGdzdxN3hBN1RrTlI0VHVMQ0lBWGZndUhnQ3FCV2sv?=
 =?utf-8?B?TlBBNWVVWU4zNGdLQVBoRjdpNTZGREJ1TkQ3dTZYSzh2M1FRdDIwWTI4RXNX?=
 =?utf-8?B?M0ZxblpSbE05dXFBL3VJWEtvL09wb1lQeUpKSkwyVkgyZENDSHhiYUZXQ0ow?=
 =?utf-8?B?VDFjSWQzaHRPaVpmNEE5WnZGWi9ZN1UrM1dGcE5KZXA1bHdFeGoxWGdsRllh?=
 =?utf-8?B?dUluYWh1a2creDZsWUVkanlxMG9VdjJ2L0xCei84VFZpbE1ldC9SaU5oclo0?=
 =?utf-8?B?WTVCSStKYlhlQ1NvU2xhRVVqRHAyYTBGUDN5Mmh3SDJuWFhoOW93dlRINXFs?=
 =?utf-8?B?dVFsNUlybnZrZEMzWjBsR2RaRnc3a3Vkd2hsaWtOR3dZOU1PbGNIcUVWRE51?=
 =?utf-8?B?aEVrRWtrZVdNMldxNDV6clNCUVMzcStPclJXbGtuSDZ2dTNwcHVOckNDa2Jz?=
 =?utf-8?B?Qm51Z2ZNN0VKTHg5alpWSHB3ODAzNEREV3AyenR5dEZmL0czVjlYTnpjQktB?=
 =?utf-8?B?MnBEeUNvUEFaMzFGenMrUDh0dUZtVms1U29qd1Z4NjdsbXFBM0JMcDdsTTF4?=
 =?utf-8?B?cW12VjNkdUcxbE1YSkJXaHRHSElVWURaVzFUUWx5eWZWNWRETmFlNmZFcGxx?=
 =?utf-8?B?Vyszc2x0N3IydTRRb2JldStVK3huaS9zNDdsZ2haUHhWeC8zelhjdW1KRldJ?=
 =?utf-8?B?RVJ3aUJzWmFoZDlSV0liSHM3YVh2Y3laM1NxNVpKYkNrWTdvbVh2Q2ZSUXFY?=
 =?utf-8?B?ZE5QN2EwbitPZ0NOR3JiSlRtRXU4RmNZaUU5Sy9rTzRnL1Nlc2szSitIMVE4?=
 =?utf-8?B?U24yQnVUbWdTMnFyaG5QRDVPQUpZUTQxb1AySUxzcjlUWUcxZFg5TmlVZ21J?=
 =?utf-8?B?MlhzeFI5RzJwcmt4Wm5KTnJwaTJjQjdYZ2FWK0RvVzhUVGxubVZoRkdHMWdz?=
 =?utf-8?B?dlYrb2szRG5QOWlMM3lkcXQ2WUJmZXlzSDhrTnNub3lQYVB0QXJyMGJOcVJz?=
 =?utf-8?B?WUdlVGtEZHA1eitVU0FzdnFpR3dtaDZkWVMrUzVoSUpmUVJFUmg2Vmp5QVpC?=
 =?utf-8?B?ckxFL0RKZDNwV3pJNjJCSG9KcmtrQi9TMHlJM3NIYTRFRUZiYkJuTXF1a3Fq?=
 =?utf-8?B?K0NXRE51R1ZaZ210ZVVnK3pweUV4U282MVloS2ZtRW5oazl4b1d1RnZYbGNF?=
 =?utf-8?B?NkJHaktOL2Y3eVpxRWdlcjBrZnowMUJrM2RDdjNPaGo5YmRmeXRuc2dkTlRW?=
 =?utf-8?B?b01zdTV4N1dSbEVoSmh6MlloRnBaYm1MOEVGb1phemowQlhGWFhKMDN0dE5W?=
 =?utf-8?B?Smw3SVV2VkpmUmYwOTNXMWNuOWtqUmUzZnpSdkdKUUcvc2lKdGVSajhpblFp?=
 =?utf-8?B?UWpTa0ZDeTZWblovRHVvYk9oeE9NRHJwU1I1MHFiYUdSeTdWaVV4bHpEck1Z?=
 =?utf-8?B?UHBjZnZ0dXMrZUVrOHFCOW9GZWhKTDNvL2VET05CVVlUaXFlM2pWa0xycEZD?=
 =?utf-8?B?QWloelNjaHBuQ1NLUitWVGVWMVQzOGVDVUx5Uk5VSy9sNE56OVU5U0EyUGNh?=
 =?utf-8?B?V29lSmViVis5Yldxc0VnbmpNMUx6cy9NeVl6WERQYVZ0RkY0aHFEMzN1Rkx0?=
 =?utf-8?B?NCt2MmR0bEo3ejNudUROUE5wWjREQ1pRaUV5YzdTOVNqYW93YVNiTFRlVndZ?=
 =?utf-8?B?OEczMmFuQnpORE1tZEJKTTZ4S2p3cTBWeUlnMW1oaksveldJemZ2Ny9RMU01?=
 =?utf-8?B?Z1BIQ0FXTnEwZVROWklzM1gzK3hyN1ZiVlZqTno1RlBXR1V1ckNoSm1MT2M0?=
 =?utf-8?B?UklFODVnT1NCY2NDNlQ0R3c4YWxzQ3hPN1RBZGF4VkttQnBCZE1mcGlCbDdO?=
 =?utf-8?B?eHNjSVZDOGg1b3poWE5GbmtFS1E5OFN4TDEvSFY5OHJwWW00OUtuby8xNHVk?=
 =?utf-8?Q?XY/208?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:25:39.0471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d7920c-ab02-4e3e-cbf0-08ddacc88592
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8584

The led child reg node is the index within the bank, document that
and update the example accordingly.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml       | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 402c25424525..cb450aed718c 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -81,7 +81,14 @@ patternProperties:
 
         properties:
           reg:
-            maxItems: 1
+            items:
+              - minimum: 0
+                maximum: 2
+
+            description:
+              This property denotes the index within the LED bank.
+              The value will act as the index in the multi_index file to give
+              consistent result independent of devicetree processing order.
 
         required:
           - reg
@@ -138,18 +145,18 @@ examples:
                 color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_STANDBY;
 
-                led@3 {
-                    reg = <0x3>;
+                led@0 {
+                    reg = <0x0>;
                     color = <LED_COLOR_ID_RED>;
                 };
 
-                led@4 {
-                    reg = <0x4>;
+                led@1 {
+                    reg = <0x1>;
                     color = <LED_COLOR_ID_GREEN>;
                 };
 
-                led@5 {
-                    reg = <0x5>;
+                led@2 {
+                    reg = <0x2>;
                     color = <LED_COLOR_ID_BLUE>;
                 };
             };

-- 
2.30.2


