Return-Path: <linux-leds+bounces-3713-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE0A031D1
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2025 22:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F021882AF0
	for <lists+linux-leds@lfdr.de>; Mon,  6 Jan 2025 21:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7A21DFE2A;
	Mon,  6 Jan 2025 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e5HIFZyn"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2073.outbound.protection.outlook.com [40.107.241.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B881DF27D;
	Mon,  6 Jan 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197607; cv=fail; b=iEYVbRGVeCku9Y1fa8NmLIriSoVKgp1ZfTSDjStACz+0l+KW8IQHJkvUO5SsDAgrOg5AK9zeN1wcogKgvxnfOsdElYdPd1PUjrRWiB/3xPTUYkdWBWhLkPiQm9nHs+1qCoKzDe5jMJIGD0Ijg+Olkwq6Rc9h34LRYpU0tIj709Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197607; c=relaxed/simple;
	bh=XnD3sbRyrvJr6KKM7w7AFKfyoTO/IVGvxe6G6JwqaDU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NX9OqUW8Mp2v2pWyrPzTBc3hHhEp6DogMlnVszmvqWEhVMojgzODdV8j3TGnA3xnk/7QnILg7S5BthMTFb4vWKXk7bxu0l3IVWk8V3UU4FRLT9SoEawBc9AZyE8FJ0mi615iW15Krim6+yIqPbL6iTgv4YJE6lbPC7URCVqCKJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e5HIFZyn; arc=fail smtp.client-ip=40.107.241.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtpjMK+QnAY/mVeUAJmwVTswmiD3XCfOjy9dGIzYynGI4pSEU+BF0VEQ0KO00KE5PaDLQg7qWJFy1753qltIBdJQyVvbdyONZMm5eDMQpB1FHBZGgD3FkjZjwLXOxP/dOVybvSHKSOyi+TeIhFtmXxV14jEwCoVLAbg2eFquo7EV0mA/s/ywrH6o4DUngJiEVhWnezwvPDO2NYKQVz2uh3r9oiLAYsX7bJpEQ4vmj/XtL/QcIR9UFXmrCXjthXcYM1Nm7PySYt7C6rH+QiQ6bEhFddlTA+cboxzLFv2vVhEUbekrDtibTVgGC7PhkSJvhy28EnoGvYA9CbLe1q2orA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxR20OyRv08QU/G65IPRpzjY/h2w3dpBb+pkyV10cdI=;
 b=KzD+eZ1u6X5YrOhEybtisrTgX/6D7rG3n94V1sKeJH1zOHxHQd5G1OWIVp8Xly/EU9T79XXVs7p0jt56rQPneeJCqWfDd1QH7Rwz4knpw5ONum3Ay6EMC2nrecefMbdnea7TVWeX7Rla1PErGY1w88LftAezPo6MH/0VCc3JtNmjPa1kunna5PIt10BWJBwAN7ADn0tdKwvNPlzRCd3Q3EOsmGyPbXl3loJTE1cjUnOB3fnDL2WZEnnPlOX9jEmZZ7YyUPLXBF/NJ5M8i4ZxDA0nU2/pAFAxru4xo07d5sM/2wAxr2+CSmssqokRaQLXpUXPPEsr3nTcGCTdxJL69g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxR20OyRv08QU/G65IPRpzjY/h2w3dpBb+pkyV10cdI=;
 b=e5HIFZynUVokvevIA3dY41+jb0cQMoixsfpS3UVVOKubouTT6XD0EBkgSXqPXUmrCzdSnxbEDQRFOEYfY8PlXKFzoEkHL4ib8Fw/9HGQXq6g8kDDwRYYKTRoogr6rbpmPX8ZBDDEkt/qL4o0Xkdnz7r8ljg2/JuozFFFxUWGeX9KdWOZMRJCsDrR8J+2s1OH6xIElvESIMdBemDKfdvOjW9XsobujuLFAx7uMAegmntYuyf3k1iXLnHQ5FCQxpAjKSVNiKG4Vohu7yBCdnxdsNc18vxEcw0LavdWQSCRzR1MzqT2MjM5B2X88e1HwWUFygRdmz1Fsc/9OCcypdp4Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8926.eurprd04.prod.outlook.com (2603:10a6:102:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 21:06:38 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%6]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 21:06:38 +0000
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
Subject: [PATCH 1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to yaml format
Date: Mon,  6 Jan 2025 16:06:20 -0500
Message-Id: <20250106210621.526224-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 19561155-acc3-4107-2389-08dd2e9602a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fhVfVnsm9MhCQlzMngKR7gQPGJyQ8t2spyFnV9rLtnez8MS5FRXz8Ej43da?=
 =?us-ascii?Q?jBH3bSdLiol2iJC2kko+kkzWsOuQg9cvq9w6s9gx1/vzAFuhiyLYzeLt7Yjj?=
 =?us-ascii?Q?IMvL9AsdVHEbh6vvC83QHJos2tNCAbjkXisZ4X+yJkWjhVr12kAwJ8FQfDZn?=
 =?us-ascii?Q?3rMWRggEuUKiaRLIVjph9pfVMSLxz2TKZV+8k7z/i8sKsXuUCxowAlP1vvlM?=
 =?us-ascii?Q?MrMbK50G2Nj8AOdjbscPy+RkibErszUknnzn+D7PLaq2mJcvRASikS6WIH8i?=
 =?us-ascii?Q?7HGpGxOBJauD3Aj3Q8jXHae9cQrpJBL7Cozawv/V48Jp+roIDDgQQPWC7ahy?=
 =?us-ascii?Q?Zxz/+5KUICsS3VfQIVSf62aNu1tsGHEeURiDovi/Fvr4NgAkA3WZSPs5sufq?=
 =?us-ascii?Q?bv7aC1fFnV5ZlRraOzHfLJPJpKqtV2hQQl/WCsliPLtB5IK1cXfT7KulH2IR?=
 =?us-ascii?Q?vsf3RTbcIOK7Nt2AINOYHfRJFi/rezMikDUqGymVkQxgAOPzDLNCCyvFe8ok?=
 =?us-ascii?Q?02xzbRMJKW6E9pZE0lKed0yye3PK0F5SJWntq20y0JJriz+qq9wDLRv/pAAu?=
 =?us-ascii?Q?JvktE9E7cjY6Pzgv4F9Zo7u0D0FjTmo/kyc0lKVbEdLE4UG9mdGgQDsZrrh0?=
 =?us-ascii?Q?qm17HYlzSa4G4qoy+swM60Mxi/Qp9mWFptmAqVvTDbanPRg73IVY3LibWbw1?=
 =?us-ascii?Q?pSPpqjKdEnzX5Un1KVOWhcxs98hW/ZKK0uBRyCs8eg+a19Znu9CttRRhwjnU?=
 =?us-ascii?Q?kZSJdiktyRqK6RpEtrKGjOgrw8ums5Tq5D/c8FfrjHYaVVo5IXbEit+p4uPQ?=
 =?us-ascii?Q?LSVyTaRilXBadvR83Plo9AAe2HtlIj0KWSFtEzGedZYvNLwCA43+vZRPdRXs?=
 =?us-ascii?Q?l/l7ms6n5OWj4gkNKxuwgtPoKwb+LE33D+CpwIwL8FS/HWXPEzON92h30eCC?=
 =?us-ascii?Q?sj02dFXO1Ar7xvTv9HzgrNsODE2XXuM3UJzz8P4x8ydps3Mfan8XDM3Shjq8?=
 =?us-ascii?Q?O3vTDODzc6gTqQBOiYQn8hurgQrx3sx8zepjDwxYReACdXQZbGFN+NPgbMpp?=
 =?us-ascii?Q?efAeG9mb9VtoCCOPOADZYskn0ejpORfGaFZL4rz9sbpk6BOJcXhyLPBfk2Tm?=
 =?us-ascii?Q?chhTtyZ6dHA5zfLNZO8fRRk93ydj7XnZUTQOi1EQpmQbLl7zC824MD/5Y3FI?=
 =?us-ascii?Q?5QWxmwIO1+LhlYSHIjBFaiTOgzM7wLSQnYn1Gb6+7yVta1pRjlHJaL6MKbM1?=
 =?us-ascii?Q?fnrSRdiSRjj+5u6RZ+0mSAZhyTR8Bbo38ah3W7WSe44/WXZ3c51C4Aof5xpL?=
 =?us-ascii?Q?tTQmhMIg/mQtAMWPr20YeVpA9UbZW1ffp/RTiSyQyTyQo2/8pWbi/qJe9kLQ?=
 =?us-ascii?Q?/jsPTa9JF/mCrWMMpl8e4LDTtaLU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ou3NayS4C1VYUd6/U+v4gxqvhvRHfZi9BgeqqIO7OAB48LZgBUcRenwPvAgw?=
 =?us-ascii?Q?bcf2fzeVObVMJRjkxhoWnWvUCvSFDCx841FoklDwDK1Vsq5eT/2ECcGsogAs?=
 =?us-ascii?Q?Mueihdhq9DIXVwUkFHr8qjK28fQjCLX+fwJyqBV07pgfekWgFqS+vowBbEVa?=
 =?us-ascii?Q?OFDSHQgSTDcBUWFYKmLmNZm8EvyVkkAWvfoD0jlFylT7cPqP3bVKqSMd77iN?=
 =?us-ascii?Q?MoLiqUUyWjRy0wz8sULYlSVj2j68lvp4+PRJClRKtBCP0uq1x0R8ecEE3vTS?=
 =?us-ascii?Q?+rX+I/91pIKurbfcJnD3+a0UXh2HvVkESp1N+aXXEeIR87Bni+rwt7OP3Zp1?=
 =?us-ascii?Q?d8SYEwGyr3uVSS+uwvHMdUXbVbfkiOB/73yvx/hvFpaOfMcynAwPgQ4XLvny?=
 =?us-ascii?Q?qAGgIDOPEedf21TcS5CSt8HzZq+zB7B4xUTA2TDCnWNA0xOml1nO3QSlcPVB?=
 =?us-ascii?Q?TC40m7cftDWSQvef24zvJuekuGBQJcUcYiPjYajaUUjkbriz9rwW04VPolIT?=
 =?us-ascii?Q?4VE+A2/0wJxb7j1zuZ64cDbP28hV5JRov6bzx9giTjKL0d4BzRoD84UVcc6N?=
 =?us-ascii?Q?0+ool+qQHFc/iI/0F0n7wpjd+9D+358Zn7d1xhKiv7vlMNk3H9KaPRsl4PZF?=
 =?us-ascii?Q?EZf3QdlUsVnqGinifOhzSS2ZDFPL1nFnu7p3q4aJ5YnmT6iim68EU1I7OujJ?=
 =?us-ascii?Q?SfIo+XBxdJC8PrNMnWYY7dEQmPmudFe9yzZJ95fU1JA50ESVfE1HsPq1Fxsq?=
 =?us-ascii?Q?3gr/DgOdktCbrdjv0BtZKTobmvxhtlcWoA5Wm+7iBo6XiXyXrD359Yx6Z3DY?=
 =?us-ascii?Q?hjUrvhrgM2MQpDD5k5whxzViLKLAB9B4BRNdLkLs72U16CoJV59qo0lhoDUO?=
 =?us-ascii?Q?J3UeEVQs9lwzbA+rnLZ76908fNgW2XZYhlMURiZ3vBrhtH7AzvU+errNVl2r?=
 =?us-ascii?Q?dczg0PBOP/7rZxE9nN8sBmGAMEdwWF/17YWqzysI2qSDzO+og36N9IUvV1tx?=
 =?us-ascii?Q?oM9qdaOPF2gLDMInOSJaVozJ/IsALZIsUPGo1WaCbPIpJ9W/8qRm+sgX0XiM?=
 =?us-ascii?Q?qtx1GS9apM8R1jUE1sVvUimf1FkJbsQF4tpCUTkbm4REzrD3ymUZ+5Cjdi3N?=
 =?us-ascii?Q?Q/klVimvpFzUnTCIbboVGdp9GMFRa1BBbZFYwbaPTPL0q5emVdMkXfCmTEVo?=
 =?us-ascii?Q?RVGazAYFN172J3KjGc1ttm8Kd1lTIKfOoGP1D20/kVb36XbGfegtkRklzWmm?=
 =?us-ascii?Q?LcmJClsGHeLHd0JZz8IIXLhgVlurB/ZGKm7/ViLQ/5OPpO0C1gegC/ipzuEZ?=
 =?us-ascii?Q?ceJYaqwmyEItuT3fREeOFPkJVOh8szk7s0I3GexZL3MfeFBC+pFmtDmyOjlK?=
 =?us-ascii?Q?Pm4057nR3jndW2ZtC1N5k8xrDivuaywJMFGQM36CndjXukc00ukRz3Ptcq9f?=
 =?us-ascii?Q?1utTDABel2ACoGWhE0IXd9fh+YtYOWZNQF+KA7TXfUHZbZw+u4f60R8GVvxq?=
 =?us-ascii?Q?0QWJt4BLIzlLctFMG6ofuUjEl+R9cM1bVTqgsWEZIb4Kxv+hsFy6ZJLTN6tI?=
 =?us-ascii?Q?IGIa6IOmWvpy33Ija0glwJWEmpQC+R+eO4Ot4Opi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19561155-acc3-4107-2389-08dd2e9602a6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 21:06:38.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sftf5NF55p2Pfsc9imqzoSaLUuQ2/XLnYPV1fQQD5E51Gj9J8U+iMnkhdAi3rkVYzWRjG99NHSyAPpmbra/faA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8926

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
 .../bindings/leds/leds-tlc591xx.txt           | 40 --------
 .../devicetree/bindings/leds/ti,tlc59116.yaml | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 40 deletions(-)
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
index 0000000000000..cbf1a79b9cf6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
@@ -0,0 +1,91 @@
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
+  "(^led-[0-9a-f]$|led)":
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
+        "(^led-[0-9a-f]$|led)":
+          properties:
+            reg:
+              items:
+                minimum: 0
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
+            led-wan@0 {
+                reg = <0x0>;
+                label = "wrt1900ac:amber:wan";
+            };
+
+            led-2g@2 {
+                reg = <0x2>;
+                label = "wrt1900ac:white:2g";
+            };
+
+            led-alive@9 {
+                reg = <0x9>;
+                label = "wrt1900ac:green:alive";
+                linux,default-trigger = "heartbeat";
+            };
+        };
+    };
+
-- 
2.34.1


