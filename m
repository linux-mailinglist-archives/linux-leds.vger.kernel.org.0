Return-Path: <linux-leds+bounces-2437-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DDB9521A9
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2024 19:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22EA81F219D7
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2024 17:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0D91BD033;
	Wed, 14 Aug 2024 17:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xwl0f3J5"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F21BCA03;
	Wed, 14 Aug 2024 17:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658286; cv=fail; b=PlZqhsdsVU5xFVgwWVZL7RJCbq0OBtK9iXuun5WW1AAXJQXfm7YqFqNUoaZTuvMX77AD4zFR3pTC35B/zm+MUtkT3KCavZIk8VHHX9D1fsrzuOykYUmiPQtfplLX25OFAE2dDUOrcNj8c9Nf0AjH5A+X+/iKghKzvEFXRVi1Fz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658286; c=relaxed/simple;
	bh=+hDA6f5aTDO+kjNsnxl3FDMcg8Vc+CmKxQb1yNAx9/c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HM9TWdYVSHW+O6rkQ+SpleC3zvQGhakXSbtghxuDkrdw38G45ALHUjwzwTmgtR8qPRa+BiDAx+wWCpswbxxxwxDTCOp4n6rj29EhM6m4v9nggFrcb7kTy6rwB7BKUcGGM+nexvUhJFbutVdmHjptOoS/3BmLhtnh+aV8Wa/fyWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Xwl0f3J5; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXHHH+ODEhpOn8BzAN/7hj076qZOxjKsSA3z2n9tfBtyfFjEmfzPDPzxnMPf1+bQ7zU9Nb4wVWuLQyYNLwHgDwI4US6c7A8Gz+heuZrKGHFbiiDWkWPulpHNSyljAG8o8mSGOeZ0lcwupKTfr4JogmBKRGj+MNZW/odL7aV4Tna10kXJZ6nxXc59C7+fGVrC703ousM210ihYiCSd77QiYxSih7aC2seFJbnZoRkXXyT7m/m6JWIq/ht5vL+gq+vgmjQgQKPjYJ/U8dg0Z3nGsvxmVp1BEZW/uTw1oSGWrXDzFiN0HcWFJngboQAtlFCv4aS+sZMQHENNM+aJaMMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0vZFe2UMhUfLB16EQjJALcSFwGjD44ineKyHEfkYW8=;
 b=pe/rvBk912/bmo1rBnjjTfe1id07FOJ37Xu9tH740KeRWIrl/Xfn6igSfn+x1tT6p0hmg1qCRRGA+SvqVAImfany/WBCal6RbIFw8KVXZk5/AlnV8DVgS5bAH1vYA4iTco4NGWIP0ihdq6lLLyQx4dE0tzNBGxlGCaQhlCthzXHZLUkqVQcIo88s+OMhD3VOPAtWsxMaalbw7pdQarEmAyeA9kbd4YwJ8STkk6tPt/bjV5NyEebVSqT/l1Qhxchox00WTvhxu/91Rxr0C+2iFBG6bVsBrFjo29V3zev/p3GgTd8fSAVevG75+mZ5YMQCxPJ+DX8G36wVUOsHGhkajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0vZFe2UMhUfLB16EQjJALcSFwGjD44ineKyHEfkYW8=;
 b=Xwl0f3J5KBJ4WZkkpHDQzAr9H1C24em7C//0gNXFJDyr9T4eF/MYiP9kAkmkquDzB3utwlHqydfL+4z6fDt55Vv1Ruc6oilO0CXyExvDEu0/ZrLlIYeViKmMH7ELWp1eSphGYnjW+iO2DyUGabM9uaxGNe958Qw09r47k+AakurEw2D8Ct1thJfJ973W/1GAa2Ubzgx3X4QByiwazIfCWDoYMlMHSHw01Te6RnQ98o08gtmtar+GjV6VUzEsggjGDNn3WYh+9wx78B+JbXPG7PgkpL4hBFi6hyXHBqQegrrrfZ4p5qnzDp5TbQtXRQhSZc1rL4J6lcKy72QMZe5F/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10361.eurprd04.prod.outlook.com (2603:10a6:10:55d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 17:58:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 17:58:01 +0000
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
Subject: [PATCH 1/1] dt-bindings: leds: convert leds-lm3692x to yaml format
Date: Wed, 14 Aug 2024 13:57:47 -0400
Message-Id: <20240814175748.4028351-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10361:EE_
X-MS-Office365-Filtering-Correlation-Id: 6733211c-0562-4872-5a1a-08dcbc8aa35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DXBOZleFlLy5uZTGYj0J1tH/w5nVmgLHVPXpH2Du0WWHWrabag1aDC1r6Wgq?=
 =?us-ascii?Q?LjWVENuW65YgEMmZ4jAPfvL58kacuyIJ9d9wD/2rxymDgdCfEeqIgkX3ECJL?=
 =?us-ascii?Q?yj0PFDyxkHIyNG4HHEvnXGwItVrfFw0WfVvEANeoia0KdpdhKNl3QlmgcNDe?=
 =?us-ascii?Q?ra81xyr9eLFvLqVNfvw4UkTdd97BnTOUUgqhsOQyGKcZko5YXZSYfSUoEw/K?=
 =?us-ascii?Q?flBtkam6481SYNP1szvARzn+lOt6imnQlC6OiidT7JzTZT33AqgTcqjimzqr?=
 =?us-ascii?Q?D1w5HZlOQtTTAC6t1v2SJgQdEgWex+OKpfalE//E784LM7zoqyov+Qm5uqn9?=
 =?us-ascii?Q?xKzFvjdcZiidSH04qjBYwUG3x36Z77gOxq9ptB0QnCx3z60qKywVET3+59yV?=
 =?us-ascii?Q?bR9H3PiWmfzBdenaz0RIvLgOjM5cpXifbG1/ugpEU64+L6trqxKKe/QZN0kS?=
 =?us-ascii?Q?//UtVPKOtjXtx3SRTl1lKrXo9V0J0PYzA8gt46K9oFEJ7TxZkPtkn862Aef2?=
 =?us-ascii?Q?DjzrQKyG4FeRnqPKOvkjBYOyEGWKMOGaGqr/6f6Nsr38c15D9SnS2AAjYw5K?=
 =?us-ascii?Q?ymHxny4mGVKJqDAEo55uJqHIWyUUpP56oQvadzDAgPvQSxrnZlK4owgek79S?=
 =?us-ascii?Q?UQILaxNe/TWMlHQMXggCFh6d+vf1nhPY6xS+lDQ7hBTGL0O9ziGzp7ODjAYf?=
 =?us-ascii?Q?OyzoJNXO+L4EjhZW5wWelZbHcBowWYct6D0APKuDZmOfvnxtJf8eDru7CLCF?=
 =?us-ascii?Q?le86AYXSXZhRyTgI+DsMYqp7eNDNMYhXyLdHTlzCiiEKKxTrrXR/DmUDWbrN?=
 =?us-ascii?Q?ZGjnD9QCrngMJZIZqOj14ZHLGehaAdCkCmJCk/wQhh/jJFT7cvC4V/ssuENl?=
 =?us-ascii?Q?EfXCNLKiKj+Ul6iz/9G+NOrY7yoZANtPF/7+Gs48SfSsBSxTbwzYI4EjSxAc?=
 =?us-ascii?Q?SlwoE/em5AOMPTv0lgqKkH1VPJgmw5buQtFPGykxdjy7zG1yDjY7jzhB6IAI?=
 =?us-ascii?Q?sbyXkRkQgT17uhs3CGrrx5Rb60+MyQKK7WbnWXC6G1SCnPAfMo7Wp2GlI6l6?=
 =?us-ascii?Q?1r3xGWnaYuUbkPCh+ISI4dyHFi7EO8w7CJ0wCU87WC6A4LhhJsG0VaZuT24t?=
 =?us-ascii?Q?gTMmZ8Y7BWP3qotZ0dsJD97qz+9taNTRfa7xkStBr+JETViiB+WgESdPh473?=
 =?us-ascii?Q?ifrg1rMwEErBid+1Bhz0eoOVXj8vYs4n+lIO45K+sRjYah6wXU3lfe/Y3pS3?=
 =?us-ascii?Q?sD4am02bBk3pyuoMjlcT+voZVuBII8RA1ELAXJidJb6iyN3eg+Kg7llzrqbX?=
 =?us-ascii?Q?wsit0IAvMELygHMG23QRIezyGNKq1ESgk7FciN4/esizskJNcfaGvPkZ1FJs?=
 =?us-ascii?Q?XC/jhcs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B3e52JPgh7EHS02DVp1X8wEBcdWcEVEn6EIEBoOQwkb0jV25csbUmpaTFkbg?=
 =?us-ascii?Q?5P9W2cEmUd9MpN74vyQ0KHrPafg9lU2w5WXbbXrJck5LVUSJg6aBmnZUW+Wk?=
 =?us-ascii?Q?chpwTLipNfOekI2Z5xXHQetZ2xP/gXgYa8RbEKH6L7uYcqSfv8fSp0pw7X2C?=
 =?us-ascii?Q?Odz/dwhGXYMA/BNf8WMxAJJOU4yjuAUUVKblssvT6fH9tvuEIgabihRQjcke?=
 =?us-ascii?Q?HvUmHJkPCZ4k+ciAUrpcVAd9Ox9mxNwzEOjkB9qQKwNLmIeK/+jBP1s0FfLI?=
 =?us-ascii?Q?MH7bHYenAkOI5gxfg1pJjiqCyPHyx8yBSEOCd+H6ttr+G2UD2uup1dw1ElfP?=
 =?us-ascii?Q?1vUa0elEHLclbK6j4PRtxQ/3NAnK9QNNIcVY3SBzICdUb6M89cFMa2qPOTUv?=
 =?us-ascii?Q?gl4Ki46xC4DTKwt8ThLzEiw61QvqWcEkb2FsIdEwk6hu3FT/MWKaUB2nomJS?=
 =?us-ascii?Q?tHto+KBNWsygf52dCFRsgDk71sc+sGzHkkSZ/CzLU522HcARRNWHdtgx/C0/?=
 =?us-ascii?Q?HgEXGPj7qibb5PDCvTf2esiWdOGEn5CNdFb5H/hCfyAzaCf8kFy2sXS0BJQi?=
 =?us-ascii?Q?vCkStOc/jumbmSU+pLVmx6UVxDLRGjtB1PKgsOn1CDNQz2nl3ukVvMA8e7nM?=
 =?us-ascii?Q?4F/m/AzgThqBfH9fzaG8FoUsxJLhT3SXrgV/sLyYUHozt8GJ2DvjtoRAe9fg?=
 =?us-ascii?Q?LvyvGK1th1OXHwoQSXWLzRKSECBaGItH6wJZWCCUgMBcTtEeEkdMFpK0EO1h?=
 =?us-ascii?Q?8rPDgFHmVd9gKWLm3VQu5Ps0mOMicy6mY7xFSZd+fIhB40zTnZF8XAeeadpa?=
 =?us-ascii?Q?IW6adT1BRweMfX5BUkTYs13EitCp+d5DZjic9S0XUWNK2OPQBFdWxQTIRPtN?=
 =?us-ascii?Q?yLNYFbEuc0xa/QDTlAkfg+s+Vwj4IPFla0w2nf+cSkCaFLKBzh1NKujrDHN6?=
 =?us-ascii?Q?8kF5aLOjYxoDIvDLO4oohcCRREogGHJCR4HCeRhl2VbRC21qpw8wKN87NCpk?=
 =?us-ascii?Q?BetJ+RAS+MsEvrLc18m9QEvjfnPpJudcwDJBzez3wg5U7LXWszAT5u33kmm4?=
 =?us-ascii?Q?IoVQkjpPz1/HVspj67ecQUTTPC4qIcaRIDrbcWOYlNfeKFh0sG37dKwl61HN?=
 =?us-ascii?Q?2KQwiJmIlmC+EVgMNnu28iSY/srL+AonN669qDZ+5FWUbVq1O90v3PpG1MOg?=
 =?us-ascii?Q?5+p9bwXxrPV8gZ6AMYK0/LxdKCIzqcT/l17CU5WRcRO950CJpi5YjvQ09jLA?=
 =?us-ascii?Q?KQCHeAv5GZaO6JMH3vO7p2y/+plQXTjQuKbF/y4E8ACBjJPeABA+5Vqt/fY2?=
 =?us-ascii?Q?Ryv20XjPLrf8nx4+FXTQFinOCZ3hwChoYFC79j6Zu9SjTLNEC3Vu/p3yrGWF?=
 =?us-ascii?Q?mqIKA9Oqpy7jQfHSHwrTkn7f1+cAMYip2/+raiHdXb2pQUtB9pjknTIgDP+h?=
 =?us-ascii?Q?phNI7+b+UuXrzMHOv+z49yt58GIhlgEYzHChnuK71gxdHTIIuFgqYz6vRaIj?=
 =?us-ascii?Q?j/Sgq9Wd/ex20NsSadey8dTcZhVpHgoOnWdbjPQKALOL8O6kxE7d/Rv2G6ja?=
 =?us-ascii?Q?oaJxwoWSVlG+zNXo3JkaRUeAwp/+SIXF8XEehmR0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6733211c-0562-4872-5a1a-08dcbc8aa35c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 17:58:01.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0LzOQXJuWHxjORkt4v5g50IJ+tRlDzCPrSxXjPgcebIkIe84EDy365ORpKpbazxdebCAm1f+K2xsm53dABbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10361

Convert binding doc leds-lm3592x to yaml format.
Additional change
- Add ref to common.yaml for child node
- Add i2c node at example

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36:
	failed to match any schema with compatible: ['ti,lm36922']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/leds/leds-lm3692x.txt |  65 ------------
 .../devicetree/bindings/leds/ti.lm36922.yaml  | 100 ++++++++++++++++++
 2 files changed, 100 insertions(+), 65 deletions(-)
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
index 0000000000000..e88165d07f50b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti.lm36922.yaml
@@ -0,0 +1,100 @@
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
+  '^led@[0-9a-f]+$':
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
+            compatible = "ti,lm3692x";
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


