Return-Path: <linux-leds+bounces-5118-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE68B102B0
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 10:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EAC97A662C
	for <lists+linux-leds@lfdr.de>; Thu, 24 Jul 2025 08:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04637271440;
	Thu, 24 Jul 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="vKmjfdIQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553B55A79B;
	Thu, 24 Jul 2025 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344155; cv=fail; b=fxJAgPDACckyYItLKG+UH91CACNn6WLwI3F6YuWzED4VEYjXADQovYpmtjy2o/5RLWe1wZlAVMegkKioPrmBicxTfrZPTStMaMKSW8+/Fs3g1S5sIJb3TPflerEKNZ5ARy9dObztX4nun2ILq+cSTqDiSS9j4aE8+/HHYW2h0FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344155; c=relaxed/simple;
	bh=QOAAYSI5jZnKRVp15Pw1+ekIfEBOEX7FIgHj/b/YkUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2jV6vVWx8EaNrExLvI2Q/0N97+SxMuvSBB205C195Qw/ojr4QXhBtPtcSDZzqjtcq9R0pM4lTVVUjOXKH/SJ2gIfzBMnmhpBYn5lhsH7rsbJFqxFgBzFyAGJsDLxJPjgSq9P+DhFXplwh0vhRuW6Pf72BLNxX2noKOYnjSjhNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=vKmjfdIQ; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfemODVc8nIITJ1x0b1I5zVVS9AVc+0uKx2EeWTxpzDGEwbaTboFsLI8EaN7EGnrSfzXi1SqJ3x2N192s0LHm7iKgi+g7G9yHPgaC8q0r+LUe8NsKCzprCnMVziK5w19RQM2ffFpOg/XYC0YbAM9oz5XSVcQ7TrQFayFSOguREAN+sFg01aPpV0Q1CJBNMDO+xzAZhLRiBkNMWIagKDwu09AVKWk2uAEeRc2Fe20TOGCcBSYvVU2iID0DaQK2lCVS3Jf+fvOzgjk7YijlQaN+L8WUaL2vviXADurwWrboj68hupMfIZuG0BnODnWTei7HMQcBFEIy/jAmznq1W4Uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT6Dj1SdT9H2YRcyDh2+gtcz+R5pfwvvnL0vv5sFj8E=;
 b=w7esWEFIkW0BHo9bmDwl+jiYjS7dRV+2V99HwkfEKeHwyOaC/hc80qjLg+PqJTN3LohzIM+eTAq3kXgMpeS1FFIl7S6P4wwfg1NLoRLuGce4iQjIZp2Mj25w+NF82ambORdvYExZNbvE5V25M4PdMeBCgz+hbGB7GWImMNaRryzFXc2qJ40uYVFoSgwIyYzPyhkxE3A7VFRkwMRqHnjL8xH/99CAQgwURiEn0FLAFeRx4JhW/o4XRa7Gy4c7w/hzSjgO0M3x8Ir6R6ym26cvPYuzvf6ZsMA1q/3Ge96G7xFdcRfWVJTTZwi44uIEVEacA5wjoy8auHHMNLwPE4BWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT6Dj1SdT9H2YRcyDh2+gtcz+R5pfwvvnL0vv5sFj8E=;
 b=vKmjfdIQtVjQpCKbg+FU7TgDtzTbCWOZcE1y9rflOVNnVaH6flF5Sgo3f/BpBZqr/oIOK3H5gDChYh3Xt1LknQCbliSQGA7knofWg5d21XuOfGnkzNsffUcnS7M/2W9TkjH4G4qSOTElpaqFXyxPL7a2URDdsgBOOqHC64rNc0I=
Received: from AS4P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::15)
 by AS8PR06MB7461.eurprd06.prod.outlook.com (2603:10a6:20b:31d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 08:02:30 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::eb) by AS4P250CA0025.outlook.office365.com
 (2603:10a6:20b:5e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 08:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 08:02:29 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.42]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 24 Jul 2025 10:02:28 +0200
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V8 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Date: Thu, 24 Jul 2025 16:02:20 +0800
Message-ID: <20250724080221.7562-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Jul 2025 08:02:29.0082 (UTC) FILETIME=[4CFE9BA0:01DBFC71]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|AS8PR06MB7461:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: beb198c8-2b94-431e-da0d-08ddca886fc0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94OzVNtYpNSfcFjQX76WgDvlL1liLQyRazW+vIwz6urlhSHFCmfaYy3YtChe?=
 =?us-ascii?Q?4fEUdugsryGsa0t4aDMHjzysee20+bDCREHu7MERXshfY3NJl6mM7hpZN0os?=
 =?us-ascii?Q?0FxKi+L488ZXNroG5awOyEQb4rBUmxmIKkx6/oC6x7W/UWD3KQzV73uwWEP9?=
 =?us-ascii?Q?QCKAicI4PSpU6hiZ21tEP6A8DjaJWSvJYrwXFZTBt41lefYV3ukFrroyppeU?=
 =?us-ascii?Q?PfBuswlYAYboM4zHr7TzzS1VewfNYzQEMOqBd6jn0MsdUdvDaX8rUxb2zFLo?=
 =?us-ascii?Q?ie0Mva2KYf9a47X85lD61bTvY7Mq11prWudpBS24BQEGgmwG5aCREgXCZy4Z?=
 =?us-ascii?Q?o3xw04P9vNuLLdQYXXjLOuEv1bTsKLON+nrFepdA8nnC6LfsIXLSvJWVdDvN?=
 =?us-ascii?Q?s/tYNddEpQ3ZWUhBtzKS/ALlkUlXYmZRC2D7QJcaYU8GhTnuvF9u0xRRPgsr?=
 =?us-ascii?Q?OepkFJJ2RMV+aZgza6tvZ+DeYP5IA9L9a2a1ni1R+Jaqvaro+zqeqbuIf3Wx?=
 =?us-ascii?Q?vBV/iDjzH2jai7LssTP0/M/kirK8pi/zsIWPh1sUQD/TouQ9UvmGEMFT1xMy?=
 =?us-ascii?Q?JFp7y+GNrywEQLwWq9XPijl+bZ4VtFhYRK1ohwSGB5LnAFQ94GZFaoIWHit3?=
 =?us-ascii?Q?2Vy+k7+5usfG4RRabRH+1kR4UI0VoUin9WOY8w+6yOf9emaM/K0Vu7pmWLnI?=
 =?us-ascii?Q?ej8KQ3oYx+4K1Smv9YKrx+EO3TOsJ+WHt6eHQWU+7q4ej54Q15KGESlc2mkj?=
 =?us-ascii?Q?Sh8eEYW/ID3QEvEKBT6vh35ArFzUysGtxpRdeuIk/aYECGjMoQ1GIpLwvBpu?=
 =?us-ascii?Q?EXy8jGJk268RaZqie07/+trc2StGYJRswR6l9h+syc0zOHKOfpn0EE2uQ7kn?=
 =?us-ascii?Q?XAKj3SOYSsGi2EEUO0qm0H9VQUDmpsWQ9pWin1Nu+x0qz02v3OQjZofX67XJ?=
 =?us-ascii?Q?XK8fFMKa4CHg829p2zABgl62GToT32NHoHMzdI7dF0q+3DKz8mlgk634tVH0?=
 =?us-ascii?Q?eJpv5W1ZVZ1fAiPbHnAVa3MUqdr59Elosw7nNh3CjzZWzDl3c7ykOSSeHcjW?=
 =?us-ascii?Q?bxo61o4noPIypIcgU4xM+EUjbEu8bLgjjVl+kwdfaxMIZePwkWLEs234nyw/?=
 =?us-ascii?Q?YwG3+OtMYMxljmHkSPhiRgf/GhbI29SJ0AJKlDhFfVqyUC0v8L97px47Rb2W?=
 =?us-ascii?Q?kKztgtBcUvJoBQI8arLkQRxnirvT8DtS2zK9AKalQccm19dOEgNaR7U91gS/?=
 =?us-ascii?Q?P/w6DIZO2Bm5eM9Qjr1hRdElXNVbvbp98my9RxrKQfE3R9Gq+IBWvT9SykA6?=
 =?us-ascii?Q?qWJtxF+XBR3wOHsdlVJn6fNSfDP+FZzkvulWhUeb7gsfMqofo2oQbAGeGxRd?=
 =?us-ascii?Q?iwAfw/dTuwZ3kayjntAGcRrr30GpFZOPbBNKrwpMcQvncfilBzdZVtvjqBXZ?=
 =?us-ascii?Q?lIWJsJFHoTM/U+tbtK3Al3aJCMKkLh0TZ/IfZSFDJIUO6VGOT+BEY+8qMpVd?=
 =?us-ascii?Q?9j6YcpbAw4J4780G8y9sfw+1q+BsidtjrqHy?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 08:02:29.4751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb198c8-2b94-431e-da0d-08ddca886fc0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7461

Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Add this property to allow
device trees to specify such GPIO, which will be controlled
automatically by the driver based on the LED brightness state.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


