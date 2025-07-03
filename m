Return-Path: <linux-leds+bounces-4979-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F76BAF6ED1
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 11:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90A5E1629E9
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B422D46D0;
	Thu,  3 Jul 2025 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="M9D3vAK4"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362BA1DB92E;
	Thu,  3 Jul 2025 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535285; cv=fail; b=DqAkWAK9nQ9JlXQvPBdauNS4Gwd7FOvT3yUTFhTVV1ZfByVnubK+aAoy0G9XwDE5GsV1Jae8cvfVfuH9Y/xVUOtReJl3b5jdT3Z7eOW9/llpIMDGNLZh8EB0Rs+riB5AsOjtbfkBr0zEVSjdxKiajtcPMUIeQYllmfDEz3aRsng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535285; c=relaxed/simple;
	bh=RI1fpabmM6l+s9KBIAD+3zHSC5N8gH64doqIKs5JcQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/dpybvpD7NWqUMwRNqgahx21HYADq35DnO8yGjj5EVKgXsgajQK1GxINfnH/SUZAU3XGHw7JTfjBgMNagjtZGq461WdeERjX5A/OB6i4jAA7N4Mr3f5qJ965dZpflML5ksC4h+1/O0OmXp9BTbK5iiMASTLKZBx+VU3PgQeXRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=M9D3vAK4; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESEyff/diRw26c+DiQeo9F7qo4kiK8L3JKn/PcnSPxUShKmqh/4vQxSeHQ0BQD/wdAbegwA2syRfb4ibhX0M/zI71dHE7v/vAG8JFJA3MQZRGkPimpeLpxGiNk0FRWla42Qwk5EhzkEoYPAi3+bNu/nBU46FejQ/CdWFYDC1T2LdHR+RP/UKZGEYOB+IfY9rvSI++O1Xcb0xWfywZoRFK5yT9p6ilNXn5edPuqSj+C1y7K8Sze4c55jb/dugsM0h/H+2v63PVt/gk0/y0Bhx34YolkeNhchztisfwX2GfAfkNss5N2v5+Y/8MjWJtOMURpr/UpcXEhTstSmYHKmaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIiU06X+nvBHOl08gDW4cyKjkBEegTGHc+neVcddiu0=;
 b=mdW9Zts/OA+64etDeKB6WP6QG0Cx9ylUH07V/+1ESjMiqACS3RPth85cv2FQPES1fxHeNT2dAarhHGR3J3O9gD8gNpQ8+sLI3klc6iNnPUCH7o4+DRvzdtD4rrs4z6mhnw5Fr5iUPdYUfqHlIYfABggn2v2dzyvVBAtRQdrKKZYFJ+XDLDOZrZcCTB6fIJVvuzC41LrFHXa+ZwagTJX6gInQqmdIMD47wGDNqlfKkxVlQ+3tANREl1fDPSUY7hXlANMKcOzUvpo+25tYVhruO6Mqf8BQzxwovVMrRjnGZ6nhVTWeRdaRQSoLRklF9mq+r9RLrIgdLhOdYpzidsvvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIiU06X+nvBHOl08gDW4cyKjkBEegTGHc+neVcddiu0=;
 b=M9D3vAK4maDPGq4C2kWxslqwAa1Fn6lP3ZuCGlxUijJN5TAu3WJLLccXwMaTqE//PMV1o5KJwbztOr6+Q/Bz7+lJQpOKFtvzd4XUQcAmPFfBMoSMnfvaVF/d2Iixinq7NnIfQUCDrgNS0UcDQzOprkA5gyqSxJXnD6kTv8DmBgw=
Received: from AS4PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::17)
 by PR3PR06MB7035.eurprd06.prod.outlook.com (2603:10a6:102:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Thu, 3 Jul
 2025 09:34:41 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::83) by AS4PR10CA0027.outlook.office365.com
 (2603:10a6:20b:5d8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Thu,
 3 Jul 2025 09:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 09:34:40 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 3 Jul 2025 11:34:39 +0200
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
Subject: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Date: Thu,  3 Jul 2025 17:34:29 +0800
Message-ID: <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2025 09:34:39.0711 (UTC) FILETIME=[B2D4DEF0:01DBEBFD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PR3PR06MB7035:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d35ad581-ce3f-452b-6748-08ddba14d5a9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Amnc/jjJJXiLmbR5Z2fojs3uXWHs0C0p25pdkGOJz00S5mmt6xgkVXFMrFF0?=
 =?us-ascii?Q?XlhHWLn1cGmjyoberahCyRntOEwI5KTjAYaepiAHH6n2Tp5GF9NZk6RcxObj?=
 =?us-ascii?Q?JfHX/uxnfj4ugy5NQCwHg0BP/7OIQStgNC0t9IT/HeUSGz6qZjmyWjC3hUJB?=
 =?us-ascii?Q?QEuN9Y1JL8aSnGkBfIIJR5QzNWIt3CGo++zvOjYcdaEdczof8TWtFCkLdi1Q?=
 =?us-ascii?Q?axrc5hESiqKicjtP1wMx6YnOT5V4vd0Qhp3tbQM/R8m8Ee5hZEWfczszcKw6?=
 =?us-ascii?Q?+3YC+mWahQUc2/f9oPax25AY/ueyXP+JD4D+ZQ2yvg23EqgR6+w04hynaSNO?=
 =?us-ascii?Q?7ZDIWvtT3+icO2bhBRilteSox4XhWTdQjFesRb3HX85asQ3HEJLkvjTZkYfO?=
 =?us-ascii?Q?HrVQcNO8IrmrsqrCNiw9GD3AKLUxl5VnyYQYUOHfE+/u7RyuYSii9gnbhdSb?=
 =?us-ascii?Q?c0b/sjl209oq15NjwTbq9POISXMD0ckuFU1WDSlGzcJS/J0MAbcLmvyJZdKz?=
 =?us-ascii?Q?bSzanHogR0Mudf7r3m9JKpI4GAnhPbjJ2BYNM38kQGgKgNH6u7Oy43jJiTey?=
 =?us-ascii?Q?q0j8IoJiLEkn1Jn6tQ+trNk3DOu2aCQZGLr14v6rMgyAiSBYfcgEho4pX0Vf?=
 =?us-ascii?Q?nda4dGDnVufMY++6oh6USKy8R3U+yWK/V7UXzStTu1HikmXaEBrQkIJFM7BZ?=
 =?us-ascii?Q?gPIKyAmoEpmm7kn0L6dZf9f7swtaSUS6AxuDIEBP5RBbx4ff25n0AxXsOgcS?=
 =?us-ascii?Q?HaOMUCSycAmEIYEtVAKVXVnAKtE1WqK/W1QfNCbKcx4QnJgJXR8phNN4YhUR?=
 =?us-ascii?Q?5U3xfbX+mksjEUH28ukIeTAK7VvZMmhBtN5l3JUsQ5tcCd6kKWxLmXd5w0Vb?=
 =?us-ascii?Q?ijV7TDxkGWoM+oMUDCRiwAWmVfQCgRtPWKDqeYt2ifZDeQpkurAkuc8he2AY?=
 =?us-ascii?Q?5ppdG1lP2cUUIh517yr3PTM/wgEdvCNfcsaTcc6Ss2bVuJxo/eRgzI09uump?=
 =?us-ascii?Q?xLqnUkKq3CqZjs4HlXZFxoXBdrMZisOqcB/2aI3sypcEHN/aO4J5pOqLXxR4?=
 =?us-ascii?Q?IYKnXu/jdhm3D9uFVkLStKMNZ+YzIPg+ukUH4EJFMgUFxVUDjzvVXkI2tHfD?=
 =?us-ascii?Q?u6giBNG/zUcSlQtJL2k+mzX2kcsZXQoi0d2zqmbjDlqXmxPu8s7XPsXC9xu+?=
 =?us-ascii?Q?shEzaapFDORUiUk3NNOWL+4t2tm+M0RhW983yvFKCoa46FExUMKGq9z7Ar+v?=
 =?us-ascii?Q?MWil8yXCSXlJ3/dP2Evivys0E1OSvOuRj5/v+hpAkSpdaKXk1twSbbji8/Fq?=
 =?us-ascii?Q?7ccTNqoIbDFkTOeNkyzMnVWeqbtThJhOOJV76wQyjdsCDYou675pCH6wsmSv?=
 =?us-ascii?Q?JMvtbw2JY/XnByBDsIPtHFG17nwu+mP1/UOMXTxRHQz50bqP2rGtEfOjIYYc?=
 =?us-ascii?Q?MVnMHsbhknFTqAg6uV/DwBcd8y5006zHbT2GPWsy1/5QpeJmKWY52IPmD+1M?=
 =?us-ascii?Q?tM0Pny/faGnf4oGosogU9VJfyjb2ei1cXa5u?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:34:40.2176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d35ad581-ce3f-452b-6748-08ddba14d5a9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7035

some pwm led driver chips like tps92380 require a separate enable signal
in addition to pwm control. this property allows device trees to specify
such gpio, which will be controlled automatically by the driver based
on the led brightness state.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 61b97e8bc36d0..6c4fcefbe25f9 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -40,6 +40,13 @@ patternProperties:
           initialization. If the option is not set then max brightness is used.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      enable-gpios:
+        description:
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


