Return-Path: <linux-leds+bounces-2489-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69E958E24
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 20:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28E641C21EF4
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 18:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5C714A4DC;
	Tue, 20 Aug 2024 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fT9iczDi"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153921494CC;
	Tue, 20 Aug 2024 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724178967; cv=fail; b=iYNL3MGGGllMuN9ilEW7NZyIjpavbtNzM6C2TF8uWM1wprt1UbydHmhyyg5q/4otRgjQrjGcraJmRgSNe6/hrxyFO0RhXYjwJxfdFPnYIROgtjE79GdAxgAp0FhH05J58ivdBBBTC6LjKgxraLIQ3zYD4aAw5S5Y0VlwZULnP6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724178967; c=relaxed/simple;
	bh=VIoTaj0CIz6FTuXJerOboN7LhEAHycUF2+FALh6odsY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kyDMl9Kd9Zxo5NwSqlqnBi/nYy7MgshAJmKKJRyLBGtkaCtQ8Mfcuuev+vbfs46ZmwWSJEPy1vI0gBPDxKZRhG5xpVMPytXPoUfvN5rfr1Elextgng1tdzETidnUwgERRPJMwrC+GlbfHaOzaUCUvR/a8e/rksShusz7wD8QcQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fT9iczDi; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsdstoWSQHZ2jpgjOz+QEcbrHZdE5ufwlXjIEIoKD1BJdI2y8quO3CMKk070wHJghqOjCwSVtDjwSc9NnbxMQ5AhVKdePvazb7TT6CI0gFoJ1orTYQqb7v1XAKMeClHzQFYOOuT4wQsOfkrE/FUFX4fcgCC6djr4uXghVcYkrT/muMcgoua+M1jKcVoHxqO5sHu7ZrKO5SkMBzORI6ZsuGEU1sSyFzU8TZXF/YRTtq2bV/n8M1AeaAYgBq6BT/cFbLFMQzb1AryNj36g61A5rt5dvVmXiqDIOI+38g5RahkqKg1yJuoT0VyRmWv+so9nZ8UpWeO+6GQsG7aY+A/cJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LK7rQNbPykyxBG24SQDavzwQWjZyaB+adJRWA2plW4=;
 b=mvmzZ4602HwaVPigTrkrQuvAZoNPJBNBcz+EpKl7mJ4bYDbMmT0ezLDPcqTRHQv9suuA3FQuGZOAxDTcK0NXMHCmLenEIbSXI0olJ0u33RWv+CbI8R7Khcxz098sACUsuiO0sntOP/Aq+QKpmcXNZiUI67STL3Frchfc8FOe1/RcTUQeM+CF6SWNDQ+dFv2AS4hpBHKvaN9F3ErhYCiOFDgQXwqZ3Rj+3BaLLyHqYS7O4v98SIb8jn4F+sI89NP6bN3+chXvUgGMofLKhAr+arrr+O3kJIzexgVnitLe/sbOGmXDmE6ZLEBGp+jH+AAz7sk2JyLDKbPv6MiGQQFIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LK7rQNbPykyxBG24SQDavzwQWjZyaB+adJRWA2plW4=;
 b=fT9iczDi/+w++W7WL/sm6nWESV2cqOCjqqu9N5B5uHVkdJqb0YR3NhfIEkP9lA0M0QkYbcQDSvjq7u27+8vCDQw5c5E1RMTlzr7rD6alkW5A1f/cel6amOxNsmtBracJXHPY7dBkB4yNAnBoDbbYf+zBlTE4uyDIVtnEamudDDBFEZCymeqCzFIgAaitjhKmtr3z2vMhPIvcGF3Vkay4CpYbpZZ5MWvCFF8Kluc+KmiBCot09baqlnOHPZtLC2w2RKAgEZ+BLg87PG5v3O2Uuz568TU2LQGuZUZFxOh7GEJys4To1ou4VOy8HTBeHM1RzifB3oTplG0X+YezbnnTmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 18:36:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 18:36:00 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: leds: convert leds-lm3692x to yaml format
Date: Tue, 20 Aug 2024 14:35:43 -0400
Message-Id: <20240820183544.496419-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f51671-a8b5-46aa-8359-08dcc146f025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ftSRZoKOSbTBZ6Cl+LMeH+oCaYdeqr7kBFmehZ/57CayKb3vrva9w98aD0s?=
 =?us-ascii?Q?3GUQuDOlbJL9Hmd+zIyJGx3aDhBHpAUlWoved5XT7xZ0LUqJB/KFR0znqusQ?=
 =?us-ascii?Q?GKGVHaD49emD4st5ECceYlNYGJahp7jSyb4ShmZWkaCrKq6uGA4BVMKd9Pz2?=
 =?us-ascii?Q?YjV9NXCSEV2uN9xHYH8hZL5J1MgHaN7X+Mb3gvQ2ZXlORjfsjbuhmJji4LdU?=
 =?us-ascii?Q?B9wKOtq+D3tqkphF9UWaFAF+/vBEi+NiMWUpYoTLXY6lA/Gcn8VmgzoQiGL7?=
 =?us-ascii?Q?Ck86wge0YcxBsHcWOYj9DYBOTT9Df52VYFph5gx52TJInZfLMudbptK8eKqM?=
 =?us-ascii?Q?yNf+jf/Bg1jD3eNB3AMGHMTKX84EeiGUsfk2Dj66JVJSJJx1cP62q+ggKgdz?=
 =?us-ascii?Q?V6FnLWpdnq92RRQLfys96KxNz+TR8t71c1JwXiG2UHQ58gpYfyXVxsYHGgJJ?=
 =?us-ascii?Q?zXwRCex4/xaTRpU8qQCy7eGIZA3KsAVftIY9dEFGMCT+giSFlbrf043bl0+Z?=
 =?us-ascii?Q?Fq7OgBmbl0K1rDgLxI21VGwQOuDe++yJGum3F5iMJOs3wOo8z9K99sD+GrA5?=
 =?us-ascii?Q?jezCbAz/VuocE5fPtI1wsLtjdPJ4CIDe4XoVNC7WwPfaCxQiKEAxJOb+XyWg?=
 =?us-ascii?Q?Uqf0JtaCQo/yg+Eml4l05F9GAssIIMaocn/CUbh6SdYxTTs/RKUPw1YBAFp5?=
 =?us-ascii?Q?gMeqpVKGWMBqytxEE/cECQ04X2hDqcw2csEbUCGHast7y+DMVfaV+FGNREKT?=
 =?us-ascii?Q?5kdl6REN2a3nLRFqzEa3eU4hSSBUIkkTYkMOqFQ/1ogKbSfRgRns/qVpM5yz?=
 =?us-ascii?Q?cD+mbN5YCuoKHNJppIFyMebWwNaPdnOamXZx+eax1iP8sd6jeJ7izvmj04NQ?=
 =?us-ascii?Q?WZUgbJMjC4gh4LOYjXpUGU1RhxaxgJogZSbcG0q2bH9Wz9hsd+TA6v7E0zo4?=
 =?us-ascii?Q?2hM3KeC4lkJ3sCDdF8w+2osJCI9u1Uvr1PZv1i1fcJD+6AVPdIhQTYdzvyF4?=
 =?us-ascii?Q?WVKDGWoZha9GNLN3VRg/t+ce9fr7j2JvzGfU21VULmLahzfteQWLTQbQ+LmZ?=
 =?us-ascii?Q?ohCRkkQwuI9So+5uKJBUGRjFRITf+WNXL5pYBpgIruBl1CbRFDSyZh8fZAOc?=
 =?us-ascii?Q?SC9wlQxjQL0EwVyh0hCmgvjzGMJUI7UIuzMrtKJnuOITFgH10qEmCdrSBPha?=
 =?us-ascii?Q?EK/1L1vZ+FVUSSbxKauUDQv3KdKZRwo0/fdlt0kN+btILcStacq3erMqmt0+?=
 =?us-ascii?Q?LcTEIc8Bu3K4eF10G9O1tAtC5CIFrVr0rOYbYgkvJQ8mQVLPigQaqJz7457j?=
 =?us-ascii?Q?AfG8MNbA+QQ/Pe4SeDaLm/yJa5RTsilsg9pP3JMriwRnJwgktDUzU8Y5ZG+C?=
 =?us-ascii?Q?R0eOSOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWvT/mzQvyG42B6G1Lk3sWGLYA1I8LpZjm3jvxn/se4OHnLfh5ogZtuZ9w17?=
 =?us-ascii?Q?1KObIKj3eIbmmT94aYmcHXLKkgyJE4UsuppVOWQhDNOuaO1BE4S9iqz2jepJ?=
 =?us-ascii?Q?vxkAifxc1M/UXcaf/tRyr2MYgL4kyAyXbLCbTKQS6g0RxJyPQUq5bMNnjPN3?=
 =?us-ascii?Q?xYVevTSQrRdzdaUhOLuy4doVCrYUxSh3gUKtcc/c+nz9ELdng1MTOgeDJYv3?=
 =?us-ascii?Q?+FtgYobkguxkyL19h+ghVW1bMkbg2IXZMoPV4LFh3Ivs8U9qEqkIL1QcQ8fF?=
 =?us-ascii?Q?sh5YJWvaNoh8khBFGHvVnXEAOdc2BQTGib538N4IcvGhoWtsAEjcQcg12hMA?=
 =?us-ascii?Q?OqKC0yPCz2dbD9y86PC/B8jiHb4u87VZ0vvOCqSQLIqN0/zCujIHCcQOlSJQ?=
 =?us-ascii?Q?V+DdhkZRysKmgdcASJ1DAUpj1yLieISyDdSMUaYh+Jf2zphRqlsY9o8/BaOx?=
 =?us-ascii?Q?RT3wC4D+S0zLZOphx2R9kluIq6jjmZfQmXMmcKyaX8HV02/vsZfRCRx2lPpZ?=
 =?us-ascii?Q?3hLW55Y+kwyDl1BmolOsF9b/VWoD6BQbX4Uoj8/+x/m5DPCzw2DQWadhFhOx?=
 =?us-ascii?Q?mbVnzkocGFiQUpUp+vWlcbuCjmphPtcn8JcXQGMDJp+IYUvST0+nzTETkofD?=
 =?us-ascii?Q?kaWPDA6QMbVYObYgqtwVhSvKDGkVpDoQIm9Yi55KmjPBuH8TaxRDQ9l6gY+X?=
 =?us-ascii?Q?iLl+riUG/8smtJiVgUuX6eoCvtd80khQc+q80YaBnE87/ebuwRZgXJl4uF5m?=
 =?us-ascii?Q?badxP42QaW5fosvCsh3LVtfWV+9bXi1xlxuunvkCNVJTsT7YsZ6sTHbhh9v9?=
 =?us-ascii?Q?8+XUsHstxp1FJ7BUoNLSwNJVMAZ8GQ4cIffLmPuTx/Trl/Hgftxf5k5kZMES?=
 =?us-ascii?Q?0Samxkk3ECaiWuEdIiLn1QXWItUIGy6OnNW26+XjRtCAl4SUkBY+hO33PByP?=
 =?us-ascii?Q?u8fckZX3geolBKxJ02KcYIC/nTXyAKHD3YuBdK2ycjdxeXYWW4f1pGC+/Gab?=
 =?us-ascii?Q?9QzKAVREO3g73x0N/Wh5WysRkknSvNfOC2NSC0r2sqL4O0QEFSBLOrI2kguU?=
 =?us-ascii?Q?R03oM3+UKlIjVf551QAkKWwWxl/lFWbBW6jT4X3OnFk8ygdWEwe5KXggNE6k?=
 =?us-ascii?Q?dX2jZMZ6gvGqRe/HPwNKij/7ufd58l1HUu4ejN8F0ur1c7jE2mTv1gfkm5Qh?=
 =?us-ascii?Q?twAxoG/Rm5XLvrBgOkByWsWU25G0tfyr2Bban/V5uTAx9yglRChYm3oq8V5o?=
 =?us-ascii?Q?rBazOaXb0t4/+oMYMdgRrH/vFEuSgA+226ysGoAiMbFChSftMbGuSuwuFSKI?=
 =?us-ascii?Q?td+9npRwT2cX1sqi/QGIEwFcWNLCdK8d/FnO7lDRkAGQZI+5sIBDSqbC2QI4?=
 =?us-ascii?Q?6XppI1Yv8JuzSOVqQtCluVBbyb7itNvE4QWu0T+jCsg6jUIJcabpPOlnkqe6?=
 =?us-ascii?Q?SeLHGb9UZ9dseJAGGo3pKZ8nzJ2qmU+/YPBachnRWjnw5EmdoBqur0S5vUkG?=
 =?us-ascii?Q?Q7J1Gx5cMsS2x6KPEPVYIcAhZaMK1sEPcPxX5jDiJfEzC7i+OC9MIYGUkoau?=
 =?us-ascii?Q?VPQ6OIWhEJ+9+STHmYvis+XY/nWuGyxVMuwgaWDa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f51671-a8b5-46aa-8359-08dcc146f025
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 18:36:00.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6iC7MAmRSXQRs+z4U7K6vIjIWl2GrlkwK4+YiBmSJBgliQ5Mqy0ktVPFphsaifFUpqpthD/btkcFB/0B8MgCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

Convert binding doc leds-lm3592x to yaml format.
Additional change
- Add ref to common.yaml for child node
- Add i2c node at example

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: /soc@0/bus@30800000/i2c@30a40000/backlight@36:
	failed to match any schema with compatible: ['ti,lm36922']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- fix dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/leds/ti.lm36922.example.dtb: /example-0/i2c/led-controller@36: failed to match any schema with compatible: ['ti,lm3692x']
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
index 0000000000000..ac98547b78bd2
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


