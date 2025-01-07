Return-Path: <linux-leds+bounces-3717-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DBA045D0
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2025 17:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E80367A318A
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2025 16:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06941F4E30;
	Tue,  7 Jan 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dnWVh/wI"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10821F4736;
	Tue,  7 Jan 2025 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266615; cv=fail; b=c+l/nVW0WrHCpyZSRyqJ4/WQtOKpPHFS8iqTlYT9p7NPVnMy12PivTJTBnPMh4NpYTT6DZwn+L0L+2T48zfcKdyGSNEZPeMPrXlXBr+y4Vs5JMgXxqSIJx0ZsFGCp0ksEUsUCb2LK+RuFCz6++2b1vGtSRp4WakTHTPhajZ0nO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266615; c=relaxed/simple;
	bh=KYvJ3ccd0Efr1yayEfrnw5zFeEWG8CZn/Uq8H5XlGJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uWJ+BN1JNbv9mqziIsD7nR2seYinkv4cr5Hvft5TJS32uWsj3505K+13YHYzZNzkk74Z/jinzT6g95VOuK0ZAKP9BwHIM7S/VEbCee9bVbee53RauW7FDuwxNkrDqd0xrt+bqsAteHb71NGae64RhR3UvgKUeowcyFx2+AAb3TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dnWVh/wI; arc=fail smtp.client-ip=40.107.21.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5LhkY4Y9UjX79hb/5fKpZ/q4dxzA7X/aZJgBiurYC4VrYnzZXB6PrB8KjhWvmEEdm7BXzUw9PYH3j6X0nerVcCatC8kk8wEHuYXnp9fq5qosEXEg7KUJfbWfNcfXunD4WPqQpwYwp8Ay9R+Izd0ZfnLZ5kWMNSgCfE1U5eo7GAn0BUfyTb0LAfsI0U+iay/itX3CUaan92EqXDKp9AIJ+1Y+XWJKQp0qy4PCK1t4LHdIFPU+wqAQrc+Na3JVv6faVIhKQoN3UOUBrIcLAfTW9U22v5Zy78GfhOkSdKQvIXnNxDwVsmBRqAzJkJHJGwp1KbJeRa7yvyxTZ7DxOXDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBfE6T9JDPqYAPA1hdD7JO22S94pOEeKjcrBwIhvapY=;
 b=D8kt7ePcV1HDCZ0vbRTIXXAcfKjz4lB3nISefA5tbi36Ulcw7YkfX1JJBxO+OzwD0qh1l/gebjWC3ONs9rKBgg/EKDw0LoQ+AACuHTV9VVarMbdnr75LJWi85kOBswiZS0zfk0QbqDN9dmsj0ApiFfJUehKKe7IFNFGowrRg3KEMV3nt+l1LJNnsoFDnDHbQFXwFd+qxvsm8rR19RaavV0gpPIbOoXR5EIgiwjvFyVlqggi9DA9gFCelCb4wzsa+tyTTY3MzSTznaIFSDGeGqQ9Qlu6EEWu3cBOZ4PC1CkrS/9KDF6ivAQsf2k/qDYopSVTxJlnpJh2I+z2328F43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBfE6T9JDPqYAPA1hdD7JO22S94pOEeKjcrBwIhvapY=;
 b=dnWVh/wIi7RrlIkXKFzpc3BQ2bL+nNJt0m4oDIZCdbOA+CTfNt6mb+jhIWmJ2weOizeEszAhZDig9B2uNXJUC8M0559ntaPWnAgfjcFFpwAN0MPYhMYV/wWLVR3rqWV7izm1Wzo7LiQnJ27sm/tg/tWw6x6Pn/9tujaIGPjkxSBT5yMT8vSmp5gyaKp4HqOTcUTIOKn2bYYEkpPBf8YqO3WukSjoayFaUTbnpNfMEU20BiY4daorVy8i/VYLYWueKH3pV9dva4GzTN7ojM/edDp89M7l9w+1DIUDFOya9MaOvNL4Y1+mU4QdoCWvJcE6SQ9ua2rv0qgooUutri0A0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Tue, 7 Jan
 2025 16:16:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 16:16:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to yaml format
Date: Tue,  7 Jan 2025 11:16:26 -0500
Message-Id: <20250107161628.121685-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0001.prod.exchangelabs.com (2603:10b6:a02:80::14)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 31063cc1-7733-484b-4fb3-08dd2f36ad79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?odUY+OeXUTjs9UlHuNoi6/b3dO44PISyjX8oemrrWH6jYyWQxbvHzdnDxorW?=
 =?us-ascii?Q?4aeLIApf/aM10zXIB3bQS2sIhSJxBZCfy3Ra6MuJsk7O9FSEijHbPiClUpMX?=
 =?us-ascii?Q?Jf6T3sFWUL9G6d7PaIpidkCgWgAJTwf0MmwyDW+z/XLh4gDSA/kdqE1D9vpu?=
 =?us-ascii?Q?jt/ByqcX67vFR4coiw27AGEEAIqrCA5GYv3UatF8OJHxPQZFVxd89e/V2I9D?=
 =?us-ascii?Q?qKO2RIpcsZkltwzJI51As0vRlRMjBtYFthnjI+5b3ss+82EEYN7L5B5nE7OH?=
 =?us-ascii?Q?J2fu8tcMg4YnOS6eHtPV8+i87PcEZ0b9SfnwYFwbPtmQHB6tgIBCTBiLYHEB?=
 =?us-ascii?Q?ja+EHZfpU5wmjFtoxvSQfmYy2wOzZTHHXwohefaWrJMYA+8/xCOIAU3ri3RF?=
 =?us-ascii?Q?41/WMw4A7zgrDKvZ6la4hpVnkL1goHGhvVxRQ2EYD8DDTpQ01FMq8YdwbJy/?=
 =?us-ascii?Q?+s4yjvVgkkWDcPZtqGUHo1TC/4Uds7jB06E6Vqo/wJtbVznKg/J3AWM0nCEk?=
 =?us-ascii?Q?fPibhJO312eXOqCuRLazFYROjjzhhniQqf/eJv5QKMeZ2WDQrRsKQusVJ7GA?=
 =?us-ascii?Q?/EE5Jzm8Jmb1laedIYI7olXEEveQETHdRkJaRf96wYaK+uLkBdiQJ7eM/FIL?=
 =?us-ascii?Q?v8q/fT3N9SBxRKnn0w5Umccv+vq7Z3rBHUoDFJKtXrQzxaSerKkfdrGz0D6J?=
 =?us-ascii?Q?ttFVD45BzsH4+/Hsw/arB8kiieA/VMyRLotFN2uB9J6urrjHW6m90NyFLTIY?=
 =?us-ascii?Q?UOIo4pN3e9wqrq1ula9SrMfxDMTVLUloscP+TqHAFHlppdKNkdvCjbPrA51t?=
 =?us-ascii?Q?FxCLxgKaeNxOKzKo7W2fHMG+3w/QMnkPdm5XVGO8QG05k4uXAaln9Q771wsf?=
 =?us-ascii?Q?0W6+CwVYnCZWdF17rvO9vG++pJKNbspaTr8IV6PRUZ8rfbwTMTsM89/Nd+Mx?=
 =?us-ascii?Q?NYAGpHVUlbjE/OXVlZHs7Y757//zL/CqroiJzWF58dqkktViwaYa5oeiscvu?=
 =?us-ascii?Q?eEbXI+Zn0l4DWhqlxy1RlMJE1ft8IJis5kwnzPSJc1ComimXSHRgE/H7xrAQ?=
 =?us-ascii?Q?0Gfm275YkFgnGwf4DIhQnZGk4UtRn05UQqsjp+oxb3nngtCjRiRmRv7fCiz6?=
 =?us-ascii?Q?2SIT2DL6X2IiUtqui7jmvX9lFPP9m+vxpZuTLNgHSOTo+HHSU5+nA4WNY9ef?=
 =?us-ascii?Q?wHC8aUaHXtBVlmJkvgPnathIJ02IX79Ymad1mI8sy4FC1+31gtm0ly/NXQFl?=
 =?us-ascii?Q?bV74kEg56hyYBfwymIxkKtc5edSGpTN7B6Jli4aw9okr5/QSE8WyBQLRwxNv?=
 =?us-ascii?Q?oHmXrUEp730fWlJZ2vWR7TPyOAajXhjn0WIs9pD4uHSaiObZ/Bd0ElXYlDrU?=
 =?us-ascii?Q?/9ZuLkXRGkCXY4uU+LoinVj9ALzH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I3Nakh5QgREkx8OGHgjJPj1ypy1xlN7pMgUA0r8czhnVgF/lh9ZJjaKva4Hq?=
 =?us-ascii?Q?ZMsdvJGEXvYOxzCsHxjcCKDWpMQEjBpqPb/KhTKiDIUgyI9MLdc6zauJX3Pc?=
 =?us-ascii?Q?Nrf44SgF9j/eiIZbSLtsFLr1RROZ0iFpX+eUC8y+rMKabjQHNUD1QQGn7kny?=
 =?us-ascii?Q?/vxtoT81bThI6e9xfFpaHu/KzSL51y4FaUHUS72awvJzoJjg4ijWPkGfYJ50?=
 =?us-ascii?Q?NAbW9tBtisPqYHJJU4YEOaAl4weCrnxH1ORauNiIjXK3Q5Gwy+SASc4vr9Dy?=
 =?us-ascii?Q?MdPtPR9mN0mHlBRcogqYV6AL6X9Lo4CsePZ/d8Duwy7P+DSFSca0WnbR/fQd?=
 =?us-ascii?Q?R3rxE8ErgrTaM9/y2abW/jIKOch6LOsl5Z2WLvefeF/WUki/tXEnu0S0WfVu?=
 =?us-ascii?Q?aobrmdZX9sTvj5iBgLkOQHpOUxeKNP8LbCBQVMBCQyP5m0ngMI4EkBwXuvsx?=
 =?us-ascii?Q?j0Z0Za++7GclpSuL5yfsa9k7CULNHFMrHlclBgPflenD3wo02+AAuIacISPA?=
 =?us-ascii?Q?8st1zPKiB3fIToSZ7jbiU+ycrpo9+W0sd2bXew32bB+7wHHFfm9VfoAwxiXv?=
 =?us-ascii?Q?6WIGWXWCVEwO0ubGQU3SQ5Y4Ila+YYGDv5LmlBtrPLT+frzUFr5ueVSk0d2V?=
 =?us-ascii?Q?p4RWCCBM24o1O+I+XSOQ0szE3F0S88D/9/4LpIx5KjYCbrE46al/OOJkgd62?=
 =?us-ascii?Q?mrDXpOBEZrgKihUQzlxLpSAXrWw9zUXWuADHOdi0uVSFBMf7/tMCSbl2txwa?=
 =?us-ascii?Q?8nrl6eJHaJgX25LYEm0zwecYd6KMK4MDYTK5YiVk84p1QzOEsanERZfdGPd2?=
 =?us-ascii?Q?V4IW/ypzi1Tn0dnCPFb6s8jJYRaRmFoIhF92iuBWCJ1V1D3GY2g8qGp///Jl?=
 =?us-ascii?Q?Stw7SIyQ6wONdqlOkSqUHD1rB5YKAvSqb6GoptuUIQ+W4cbosZJLAjrXTFhI?=
 =?us-ascii?Q?ZHtllzDwo1bCe05jziLX/rM7eOXyRENVN8o9scpyvZuivDGXKrrFP+yVOzQ7?=
 =?us-ascii?Q?NsUHbFp1w8ipn4RSjmtHQb8/MacdksQR6hIGguBaZZ+4yoK/UqI5QnJtMPjq?=
 =?us-ascii?Q?KPQ3ydliOjNsSmJiGehbbm0pUs3h4EfHwjJ9V3PPTk4xBdg457zvD8vA4Bnk?=
 =?us-ascii?Q?/IJ0MVg49DDP1SEmtJe6FaRX9ceodwEH9ZKWWyJrccm52RmFHCMwytIBqe9D?=
 =?us-ascii?Q?8yJqh6LBhakBr1Iuoq7eQveFa3poygVqdP2x6HwXrrmvCT1qTiaQ9MtRnBdQ?=
 =?us-ascii?Q?1/UWXmCkR/Gkp/JQKU+95QZkVCgApjiXdctcpBfimvxTgEG2K98n07PImJZ+?=
 =?us-ascii?Q?JAv/lSShSlyzVJ8UUWyWsRfIz4ugQX9ocPlqv1CiI/70WU5YO/alDwj1MDLt?=
 =?us-ascii?Q?kJ60o5D+VHwZf/dozBtucx93SDmDIBDUCH0IDvRed4xL+ttQD16x6joReu9q?=
 =?us-ascii?Q?h0PaofpLqmd4knppl6w0vYGbU9E4wH87rhJ5DGf0gT0itgzLEOk71eiqJcfU?=
 =?us-ascii?Q?gdlFa0jTM1KOh8KS1N6272uAJmo1KYoSMPq91Z5S8qKaUrxAHmirMABWSej/?=
 =?us-ascii?Q?G86AoK9+SNsqHiy5bwEL2VxfcejSBSiahwZEDaIF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31063cc1-7733-484b-4fb3-08dd2f36ad79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 16:16:44.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hyOC5U8T0R0c+RdsnynlwbUpEa+sX7OBdk8vydI0KeofkaMzJe95XlKuBJ4KOersyCFzHw33rrfszVQ+ItLVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

Convert binding doc leds-tlc591xx.txt to yaml format to fix below DTB_CHECK
warning.

arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
  /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']

Additional change:
- ref to common.yaml for child nodes.
- limit child's reg to 0 - 7 for ti,tlc59108.
- fix typo 'linux,default_trigger' in example.
- change child node name's prefix to led-.
- change nodename to led-controller.
- fix properties order in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- using "^led@[0-9a-f]$"
- remove minimum: 0
---
 .../bindings/leds/leds-tlc591xx.txt           | 40 ---------
 .../devicetree/bindings/leds/ti,tlc59116.yaml | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc59116.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt b/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
deleted file mode 100644
index 3bbbf70244119..0000000000000
--- a/Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-LEDs connected to tlc59116 or tlc59108
-
-Required properties
-- compatible: should be "ti,tlc59116" or "ti,tlc59108"
-- #address-cells: must be 1
-- #size-cells: must be 0
-- reg: typically 0x68
-
-Each led is represented as a sub-node of the ti,tlc59116.
-See Documentation/devicetree/bindings/leds/common.txt
-
-LED sub-node properties:
-- reg: number of LED line, 0 to 15 or 0 to 7
-- label: (optional) name of LED
-- linux,default-trigger : (optional)
-
-Examples:
-
-tlc59116@68 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "ti,tlc59116";
-	reg = <0x68>;
-
-	wan@0 {
-		label = "wrt1900ac:amber:wan";
-		reg = <0x0>;
-	};
-
-	2g@2 {
-		label = "wrt1900ac:white:2g";
-		reg = <0x2>;
-	};
-
-	alive@9 {
-		label = "wrt1900ac:green:alive";
-		reg = <0x9>;
-		linux,default_trigger = "heartbeat";
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml b/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
new file mode 100644
index 0000000000000..ce9713793908a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,tlc59116.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to tlc59116 or tlc59108
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+
+properties:
+  compatible:
+    enum:
+      - ti,tlc59108
+      - ti,tlc59116
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
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    properties:
+      reg:
+        items:
+          minimum: 0
+          maximum: 15
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
+            const: ti,tlc59108
+    then:
+      patternProperties:
+        "^led@[0-9a-f]$":
+          properties:
+            reg:
+              items:
+                maximum: 7
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@68 {
+            compatible = "ti,tlc59116";
+            reg = <0x68>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                label = "wrt1900ac:amber:wan";
+            };
+
+            led@2 {
+                reg = <0x2>;
+                label = "wrt1900ac:white:2g";
+            };
+
+            led@9 {
+                reg = <0x9>;
+                label = "wrt1900ac:green:alive";
+                linux,default-trigger = "heartbeat";
+            };
+        };
+    };
+
-- 
2.34.1


