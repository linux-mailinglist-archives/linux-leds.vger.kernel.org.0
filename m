Return-Path: <linux-leds+bounces-2501-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CA95A7B4
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 00:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B161C211DE
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 22:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D3617BB16;
	Wed, 21 Aug 2024 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F3zWZofk"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013044.outbound.protection.outlook.com [52.101.67.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7825717A924;
	Wed, 21 Aug 2024 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724278823; cv=fail; b=IX1qbM/OrUeTJnMrODmbJBUFu6enAI1SVkeZTkE9cWTD17hbNsnVri93khLnbUz+iA/UGMurIbpSzU35jr8zzehJ8AoCqL9dIOFhV4zEg1xZPsFymMotD4/3oB9HMXLDnRWAjYwoVw6ECD52A2XTulqx0tA7Qv0UTWXoEBgYDeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724278823; c=relaxed/simple;
	bh=Zt3HlYQ+af9pdHOKgsTcj0mIKlCViMQmVDP763omqIU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YJUXDXfpdtsn4HXTiNo6pNEU5iAZvmADLszJTrG+fEzP62ozHber739pW31hAYmEc3+u1pS4BYrYWJft0cCGNecgkltkXnxbOD0Uykpg2WeR8sV3mWKMkeU2Cg1wafq8OrYxb//8N3AEIq1dz/K1HWeAz5n88zGa4D9cKPOK6Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F3zWZofk; arc=fail smtp.client-ip=52.101.67.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1AcKLV1KfeWqN2NIvo6DBYMC5JlO1XZS7cDBdBy88OajUdRxrDxtz3mSTNZ9oyGwETmN3t8MgUrCOd4T2vKX4IKr05G3vJUYFaA8cAd7TwD+S+s2qqpyYnklAmpRRCxIN/A7K+dBhMMU5a1FkHMuyoki21Mzl5sGQpkDdco0QnjWtApaG4rnl5/njfeggteOYWMqhHTAFVIIq8ssEnk/whvqIRTFKTX93hMSwLez/MPH9yMTgL+C56QFb2JA0GXKG1FNrmniLI+mvA26iGu4Hxy84kIIXtYd3ZBD8RGrCUg75t5iWQc6+itYG/X51baIRWaPpOALzrQmJ6aI8oO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu0wyuHIxaW4MULQ10eIg7Xwoe1j7wex42mam+qlpeQ=;
 b=AxXHKpz4QFg9wrcWwu/5/Ftxt3AJzgpJEnpmm95757p3fiv9nQLBmsMDdHL4U475D0YepjWpu/oCwK2b+bg5orjjKQC9tfkS1M5pfxFncBuzYx5qpVEUZ83IUK/W6j3UdPReK39zviYsSmYbA2rbnYv0n/o+FM+vCMH2n+8In6CPXU8TlUuZr4NiYdAPwidWzlaWc/WAYusovewP2jjYuKRnvYDNhni3mGp4acqC25a4PdWeQK8B22F7YkYJMUCUucqhL0lHeoqvMPyhf2zK8yvKSKzlpC4Ea+F5IBSI5r+TLGmh6t3Qb9RlM0NxfGLt5dbmy19VqptwLFGnleUrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu0wyuHIxaW4MULQ10eIg7Xwoe1j7wex42mam+qlpeQ=;
 b=F3zWZofkX5LJaRuAlWLU5XVom8K57J73BVO6paPBVw38hCSRPd+mYPT8cvMp3GD7bHuYPrAzJOp0DVoOQhVgbBHUjlps8bZ6hi+C4vkRt1ejoc4zq/ijY51nuvrB3OWs/VcjmgoYpQvq5QVUrouNsdKQaLaAtqSwS8DTO8qupkmm/NFDnFFuFdW4aDP//XnXJIPS7m/IEeHZ1/1d46YtBJvplkLwdqJ1jK57c9+r7xkqD9WWhFNmAo4sHRCWnLaBAQ72u6sTs5y7Cc9NYcdwjEZgr8rsZ1UHc2A/FNvMwUHxxOjOVGIx/UcdlulVPx2LmhQwlWwrHozYG+S17Oj8LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 22:20:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 22:20:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: leds: convert leds-lm3692x to yaml format
Date: Wed, 21 Aug 2024 18:20:00 -0400
Message-Id: <20240821222001.591111-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a006f05-4ab3-4278-3a7c-08dcc22f7045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sO1seIwp+YKHS+J+01yWRPlYQxBrD+53VWE4utYk+tWTzC/w44X1YvqpohUu?=
 =?us-ascii?Q?IxyfMKgVDLHTzyV7XpU2F/1gODwUF2dfCwVtv9Zb5sj0EgU14Y9dJlvxnowv?=
 =?us-ascii?Q?xiL6sqKFEpELQy+oMEy9i6Sf4vnPHWBnIuh0X3Bu7bSnmnCt3d+Io4uRgVvz?=
 =?us-ascii?Q?YbNq+3o5ywE619ZtltAs3BnKSjKTSaSafZCuFeOSTx8aR7fbQBJYtTrnFC6W?=
 =?us-ascii?Q?6nNI2frhwddmLdirv2GDnHsClF2NCTciHm/MySUH2urSbBri6Spgn3aInE9I?=
 =?us-ascii?Q?sik0msq0s8UIHw7dRZWHOycDfx+hAiVumYF1liMIpDwzJLSCHgHJPo4HcrKX?=
 =?us-ascii?Q?wJijRwLP283xWv3Hu4wuJ//7WGhFQ0cdinAs57KJzp9g5gtgY96C7Ojok1aD?=
 =?us-ascii?Q?IM1oONYVUR+1+NLv/kp2lBZ238/KpNPbdM9qji39Q5MWBbqBAYd0+ZpwLSV6?=
 =?us-ascii?Q?e1iYynT5S5VuHRi/cGIM35rBXW2YS3x+XpHPYSUKBYb+2tz3EZdbYBDsnaJc?=
 =?us-ascii?Q?mZYB9ZhOD03jh7X/epjKo2uH+M8DBzariUrR1tv9qTxrnVOieWDebIHAMb/5?=
 =?us-ascii?Q?cpcbuHVLZtCY3Jo2BzdzoK0v1Qikfsd1S7SEKk6cXgQSzeaYnWeZfiRsdwjK?=
 =?us-ascii?Q?egoxkCywwIWkzqEG5PMuhEAI/JeXGeQlAxd9oAOwrNgJDGi87brz8VMge1lG?=
 =?us-ascii?Q?iwq3xfwNXmP73+yDV1r81KeSjZBObGGAMMSTk0x2MAzCDqax9fsgiJtcZVYk?=
 =?us-ascii?Q?udnGhK2glW/tGLKyi2o3M+wus5eb8/ItgUTOqaV1swnTdqp87I4V3IN+zMBg?=
 =?us-ascii?Q?2PNfeYFr+LJ/H2xTUDIdjOgw3DB3RkeRmJL24z3q5Wd8Ful6Imqu//p7r2vO?=
 =?us-ascii?Q?Q3fhV0M10gNqgGkHIkGWhX1KKOW9a5JX8MhXXC6C5UZfnUSdlCfkWPJYcFSq?=
 =?us-ascii?Q?CPpaNla42yyvMSS0dkOnqj9lKAYzFI3t9Hfe3QYDQc7FxcRjp4333hSeDA/k?=
 =?us-ascii?Q?V3XKLSumj2jqCC4erKcH5irwt1rIz2ApJ60Z3N0sqUIaICPAv/dEUmOHR+cf?=
 =?us-ascii?Q?qJUMJ+MvcUDQxustLPR9gQqGEGLmePD+CMmFXiWzt5aoD9FuSS241bhhkns2?=
 =?us-ascii?Q?W5cK0DjeIzABtfIOatO6yPCY2fiCUNEWRnJ13u/aKd+C05Q3Co+7BmFIahou?=
 =?us-ascii?Q?xvp6LevhuSz0zyOiLFlLWKv3s3kbvtvcUMLjfgt2gE0kXn3gVNUEXAVIgUfc?=
 =?us-ascii?Q?lGrab0gFhrk25FBmAyiTUMx1oW3x7+p/ijBXn+CJ33XCdg8XO361N8gLr+nh?=
 =?us-ascii?Q?VFUSOnYwZJd4PNixt4FjAYqXD38zNa7RyNMkBZE9gQeVSLgmqyyxEoo3PUez?=
 =?us-ascii?Q?ladTvu0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FQzrOF84fV15y56W4qjLCxZEAVd0bsJX6X1iLpHbRQA1lTmHy6UhIU1lX5Zx?=
 =?us-ascii?Q?2UaErZfh5wNibZQxJ8lcYpc2aKY4NuJijQnnNVOcrKTKwHPxS+r0GcwgUo/a?=
 =?us-ascii?Q?JrgwM2G3Y/vQMPwIc9lb5W3IyDyJKldKwBB2DHAWXCmpBnuYYNNkHwXhJ+m6?=
 =?us-ascii?Q?mu7OdGF1SqYeRxcWyIvZqn8YPDNw6hHTtMHIQaXofpK0mEVRnWFVQKcKC1hN?=
 =?us-ascii?Q?E0cPMYK7ZsFnliDmPMbGSDQQRrkqZUFqubVZTMHmuaDbDQxDhzRKILlK4AHK?=
 =?us-ascii?Q?1wA3kF0tOUiX2ucC34i0twH42unbPsDB3aR8ZBgGF8ugW3+cEzL5zAeoK3qA?=
 =?us-ascii?Q?BCvIA91V/7QknBNpQB6favIkBKdyGyihZ8Xis8GbXIQHJojMXLKf/WBkzeFm?=
 =?us-ascii?Q?FEYfS0C1OTZlo2ZTox6J3Ny0n4fI+OX0Dn2y7PLx5UuIpmutpyHgEE7g3m+/?=
 =?us-ascii?Q?lK1YXf3YcipPiEfXtyKmBq5KGjpHywHKwYp4ilCYXnf3TMAdm2Vg01Guid+J?=
 =?us-ascii?Q?21hjRDeIbN2mrba7tZ2TD+hTRVJZZSLNvgrV8ZNIfm4Uq9dc/Y5k6HfDKEQE?=
 =?us-ascii?Q?6vY4eDUkRO1Gl5kg6WVc8q8IMzewP/O9wZS5Tlrr0z2X0sflZgS6BCBW62HV?=
 =?us-ascii?Q?kPngAAPHNdU5krDGyvhSbueL91JDFRzF+UOO/Qh7YO76RnPW3YxZewdrPCWT?=
 =?us-ascii?Q?8K2ROLUHFSeGOJv8p+2/9/cyVuqPLFBfwFHykQMzeX9UgXscaZiAyvMz16Kh?=
 =?us-ascii?Q?iijP7uzJUuPG9aSckZ2DlT5m1eX2NW0decudFE601tPSLQM8EqHlZuMmriMB?=
 =?us-ascii?Q?74Ua2aa5jIRHO8HZ9CGF6EA+MkybwMx8LDYyYQdWSWrFyAMN8nOO6qDUIiU/?=
 =?us-ascii?Q?oNSzqyJ+1mSm+WAGy5BjJOAMb+z0ej9fcOBY8wj3Zh9hVZZji2iXgIGqUyo7?=
 =?us-ascii?Q?YXCw1IbBWUkWPLh+ahQuHsS1KP4+G4d96xKO/cIw9x8kEyQ/FHky+0/KXEn9?=
 =?us-ascii?Q?WTO6j8jdY3tLwJ1+UfdlZKdtJ9hisXwtGL9cfYsSfuT9E9zj0ltReVrZfvGP?=
 =?us-ascii?Q?VM3wQuiitHewR2RY3ZflHQzUuroLpSSfeCZ8sG/xOCa9toXiNQ+j+mDDwa3g?=
 =?us-ascii?Q?31qGcx6lcApuOuJhITrmrtChqvVCBlpsoGadQTcwul7MMzKHVEpOoglJAg1c?=
 =?us-ascii?Q?S+6VO4nS03OQfaNCF95g8+I+Ul52/gALHNrXHPvSvqH6FDGef8h+FtZG+fp2?=
 =?us-ascii?Q?Spkd35l9t9Hpa/sA6g81fdE6P4sxUkMSYi+TpQJigZN8Tt7SPzwQ2OMGtO80?=
 =?us-ascii?Q?q9KyaXH2vnagxlasilluYCrQ0qMSluplPRtyCPdHb1JLLv9OepjY63w2t0Yo?=
 =?us-ascii?Q?jbO8t/E+DDFc2rk32MEZ9rnowouQT+loiteEHEwFIuxSe5iHwJsv3YQI3kMJ?=
 =?us-ascii?Q?8mOi5Ht/edwBQL742Ons4DgDTtkHSXuOGRHPVJ/SXkGbdtfCdAn6afo35bLQ?=
 =?us-ascii?Q?sIzuuRv5rV3vO98DJTl+BL+S8n8AinqPojAulRrVW5AAaxpTZQ0XkE+mKsF5?=
 =?us-ascii?Q?pGwmKCFIJwZnkDYIqWx2aqaSRexktqo8xQN7P9bH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a006f05-4ab3-4278-3a7c-08dcc22f7045
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 22:20:18.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o48RBqFssF15SP4mHx5Yu8BjjQUSlscgsj6cjHgWm2xsggCFwpWb+puEL+rKOon/TDHEAgDEqbWb+r3G6RJIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6991

Convert binding doc leds-lm3592x to yaml format.
Additional change:
- Add ref to common.yaml for child node.
- Add i2c node at example.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36:
	failed to match any schema with compatible: ['ti,lm36922']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3:
- add . after sentence.
- use led@[0-3]
- add allOf: disable led@3 for lm36922

Change from v1 to v2:
- fix dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/leds/ti.lm36922.example.dtb: /example-0/i2c/led-controller@36: failed to match any schema with compatible: ['ti,lm3692x']
---
 .../devicetree/bindings/leds/leds-lm3692x.txt |  65 -----------
 .../devicetree/bindings/leds/ti.lm36922.yaml  | 110 ++++++++++++++++++
 2 files changed, 110 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti.lm36922.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
deleted file mode 100644
index b1103d961d6ca..0000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-* Texas Instruments - LM3692x Highly Efficient White LED Driver
-
-The LM3692x is an ultra-compact, highly efficient,
-white-LED driver designed for LCD display backlighting.
-
-The main difference between the LM36922 and LM36923 is the number of
-LED strings it supports.  The LM36922 supports two strings while the LM36923
-supports three strings.
-
-Required properties:
-	- compatible:
-		"ti,lm36922"
-		"ti,lm36923"
-	- reg :  I2C slave address
-	- #address-cells : 1
-	- #size-cells : 0
-
-Optional properties:
-	- enable-gpios : gpio pin to enable/disable the device.
-	- vled-supply : LED supply
-	- ti,ovp-microvolt: Overvoltage protection in
-	    micro-volt, can be 17000000, 21000000, 25000000 or
-	    29000000. If ti,ovp-microvolt is not specified it
-	    defaults to 29000000.
-
-Required child properties:
-	- reg : 0 - Will enable all LED sync paths
-		1 - Will enable the LED1 sync
-		2 - Will enable the LED2 sync
-		3 - Will enable the LED3 sync (LM36923 only)
-
-Optional child properties:
-	- function : see Documentation/devicetree/bindings/leds/common.txt
-	- color : see Documentation/devicetree/bindings/leds/common.txt
-	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-	- linux,default-trigger :
-	   see Documentation/devicetree/bindings/leds/common.txt
-	- led-max-microamp :
-	   see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-#include <dt-bindings/leds/common.h>
-
-led-controller@36 {
-	compatible = "ti,lm3692x";
-	reg = <0x36>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	vled-supply = <&vbatt>;
-	ti,ovp-microvolt = <29000000>;
-
-	led@0 {
-		reg = <0>;
-		function = LED_FUNCTION_BACKLIGHT;
-		color = <LED_COLOR_ID_WHITE>;
-		linux,default-trigger = "backlight";
-		led-max-microamp = <20000>;
-	};
-}
-
-For more product information please see the link below:
-https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
diff --git a/Documentation/devicetree/bindings/leds/ti.lm36922.yaml b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
new file mode 100644
index 0000000000000..8ffbc6b785a3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti.lm36922.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - LM3692x Highly Efficient White LED Driver
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  The LM3692x is an ultra-compact, highly efficient,
+  white-LED driver designed for LCD display backlighting.
+
+  The main difference between the LM36922 and LM36923 is the number of
+  LED strings it supports. The LM36922 supports two strings while the LM36923
+  supports three strings.
+
+  For more product information please see the link below:
+  https://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,lm36922
+      - ti,lm36923
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  enable-gpios:
+    description: gpio pin to enable/disable the device.
+
+  vled-supply:
+    description: LED supply
+
+  ti,ovp-microvolt:
+    description: Overvoltage protection.
+    default: 29000000
+    enum: [17000000, 21000000, 25000000, 29000000]
+
+patternProperties:
+  '^led@[0-3]$':
+    type: object
+    $ref: common.yaml
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+        description: |
+          0 - Will enable all LED sync paths
+          1 - Will enable the LED1 sync
+          2 - Will enable the LED2 sync
+          3 - Will enable the LED3 sync (LM36923 only)
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm36922
+    then:
+      properties:
+        led@3: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@36 {
+            compatible = "ti,lm36922";
+            reg = <0x36>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+            vled-supply = <&vbatt>;
+            ti,ovp-microvolt = <29000000>;
+
+            led@0 {
+                reg = <0>;
+                function = LED_FUNCTION_BACKLIGHT;
+                color = <LED_COLOR_ID_WHITE>;
+                linux,default-trigger = "backlight";
+                led-max-microamp = <20000>;
+            };
+        };
+    };
+
-- 
2.34.1


