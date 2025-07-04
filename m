Return-Path: <linux-leds+bounces-4997-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1180AF90D9
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 12:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA9C3B23B8
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808562EAB93;
	Fri,  4 Jul 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="w95tOOv3"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCAD298CD0;
	Fri,  4 Jul 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625833; cv=fail; b=XPUE3nWJr2QfAK6uFgdAeI//TLNBrtinzEH8jG/+LuCMNRPeNmdN98T1ppYA10Uw1LbCmDOtIYXz0Wu4PNglU84HGZb5dSnlg2S8F+lrwCY904g3JJh5tYXIfmWerh9ifiZgsrsM9yc/sUFd3eb48teF6cHG/bPDU1isFezuDbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625833; c=relaxed/simple;
	bh=7r1UgjmWoVSY6C1YR/lxZfIubOFzAfKrYcZIZhcBe18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rG5hokaHzggOqXpYwlU9fVF+rynisN+BXzYGu9wUdOBjQKX0jWXuoBHv7cyBXv7vBzR1imxuxMIrI2huC0TCF62+ht7ia8JDT6vx+fqSJRYjh9VC4g6JffUywqgzf2eZjFh8xR7A8pYLMofmQ4DW0wWYR98uk7hEUpBUfMtWK3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=w95tOOv3; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvR9sqkwwKzu3vIQuDpYCbyB3k5PktKBkH22kZuSUW1DpXLRHn05gY+Crq0+Ps6fQTACetjvKOXXWKdfSHqv7+PXL/SjBW+FurtNGaNBgBwesRyghe/L7ehkEByq5I7onVmisoqWlZ0dgGi9jZRz3SkkQbIf4GeQVZgrY/jsda7pv4mOIaf98xwurQC4bOJZU3tQUsLvEdtQTTeEN5sLyK1U8vnZgrlzmu4ij1T3aVLZ5hHCr4H2LliCzIL7iXUGNwjvMoLhVmwKrVyz7UKaaPsoVCxkDoCUESnEoCEvQRhZkxkC1gkGStc4EjsWpACZ7x0lfUHyBU21jhYnjPUgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du9IJ+3f9IVBmigTnWr1wSHfdpTJ3EnxP7Ik0rtjbNI=;
 b=c3MPAccYpZuBWrGkFiJQPeWQTDk27peeOWah3nkLYe6h8eyiCwT8tNJMuQo1ghs4oKnMqmPtTfobb841GxY4YBuDZYRB2Yxp496cb+52tllGPD8WZXxsdy1NYXSZmhckUShUu7TbqpKE5Ji2bWne2/xxrnuRUi90jHlTdCqAREPUufLh6TfdqvV0OvHnc7QTke0MzUAaTu/ALTQYuyXE9BBAn3C6+d+A1Ny6ncdHGmCyoecyELyABtppVgeOp8tIGY4larWPjFtX4PBetbJgBMvGpDtt1689kIsR2cL460Quj+x1UqV8MKPVOrzGM4+/Qo6vRMM23cj1jU2AlgnU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du9IJ+3f9IVBmigTnWr1wSHfdpTJ3EnxP7Ik0rtjbNI=;
 b=w95tOOv3XjPcWJHJdkW0zXiN+eCr8YycGhcBLoDkqd6Q3MS0DMF3i47mBVpVblzKjTh5vjDU75g6qBQtgssO20IPkKmrR666xKgeL7hKciOH4Dm9mQA2xEk66QRKWnpppJoyBWsmRRkHXFf5VH6MK6DmWRzUTaLcABELF2SJMIw=
Received: from PR0P264CA0109.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::25)
 by VE1PR06MB6974.eurprd06.prod.outlook.com (2603:10a6:800:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:43:45 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:100:19:cafe::a6) by PR0P264CA0109.outlook.office365.com
 (2603:10a6:100:19::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 10:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.1 via Frontend Transport; Fri, 4 Jul 2025 10:43:44 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 4 Jul 2025 12:43:43 +0200
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
Subject: [PATCH V5 0/2] leds: pwm: Add optional GPIO enable pin support
Date: Fri,  4 Jul 2025 18:43:36 +0800
Message-ID: <20250704104338.46546-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Jul 2025 10:43:44.0064 (UTC) FILETIME=[8378B400:01DBECD0]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|VE1PR06MB6974:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e402c2e-da66-4268-d6d9-08ddbae7a63c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oakelHpzlzX+c0+h82YfSu87cUPRCOgpS/7oGjbYHlxG9ZnfkilLv3+/48RC?=
 =?us-ascii?Q?0A+tF8aJ+pITLkce/I8oJCMhQm/ZMwmLFVCgvtWSKarXlVCcGl9p8lsPH6jx?=
 =?us-ascii?Q?obsTVdKTdcgiqUSVPRREF3LJEQVFVPWdVv6oDwnTpIkgLfttg3hfCvxLJYEM?=
 =?us-ascii?Q?GWJgTyPfZxO+deL1w7gb+SgdBz0CtZd26CrocJNyC7zvb1uvoNePIFHJTloy?=
 =?us-ascii?Q?hYc+5BIYORDXbh1bwVCTWEOtyjJUWYPSIJFvPNYXTDDM+PkzeVp0u4Is4Xnz?=
 =?us-ascii?Q?1n3xc8jx4JVFLHNktd2vjyAadQaFCYeSgA4euJqO0eIHGfWZLXi/9D8cRWwq?=
 =?us-ascii?Q?D8KyscTFXixIlgUcSA2HWnzdk2qxIzI+PpDh9V5z77TgUzlC7265ZjEV54+g?=
 =?us-ascii?Q?9uXjyxM60cmPXX/mdo8gMymG+K46mPsasW+OZVwfCoQNRPislP6KIvzoa7l2?=
 =?us-ascii?Q?4JnEdXM+TPBLd/q3xHyyA9uMBdsMfY9HTMvbEabTB245qlFswy2354dXKu3J?=
 =?us-ascii?Q?XhNTH3Ohq8WwphZeztxw3TDgGjbX5GiveVj9AXF96H7D0gVQk8OFXUmwn9EZ?=
 =?us-ascii?Q?e1ka3X5Ff2V1faOmtEhHHV0fjGLlbnmox6va/T5ufSHaPkty9Ou2alhwiKh+?=
 =?us-ascii?Q?TH5jH4aL2tFvqtEhcrKBT4QyqXSe5hHcUMY5OHZGcHZs67QRFwdywkEFmY3M?=
 =?us-ascii?Q?Ax+Hur/qv62yFe92fE7ymNUHjK8VcScLnTcF3fpDojPQq4aatOIRaq9N7WCa?=
 =?us-ascii?Q?omQ7iNPk9smD2oRWNvhpdzbrYAG3uTknDkUiaQsUFFPafnfyVLF/azs8wv8H?=
 =?us-ascii?Q?v8Y33yoHiECPFK60A1D4zOSH0IrW0hzPhIF/3NpxlmNzIDr2Pe7y4/EgSuVf?=
 =?us-ascii?Q?CbkefJLF+VOobRogAQcHDKbylk7bqS9xaBDoHuOwKE/UB8vP1F/R4qzV0Suf?=
 =?us-ascii?Q?0CPeRA3hU+ui3oMrzQaB/tbKNYYYqlfEuX/UrJN8gg9PJqjH82H879HpLIoV?=
 =?us-ascii?Q?y65whfzC8rdiKhcq6/WTz5H4X48iJe8uwI6nHwaiY15MPBwZh5od41vRytPm?=
 =?us-ascii?Q?9VATSlvGXlJikYt6+6nOE8T55ZkgBwb7oKGoTY5C/p92jhTxZf33MlZcCTDY?=
 =?us-ascii?Q?YCf5MO9N6JrcVMr2Apaviu4AI4eKgZEku5NHISyoVzeA8zVKRa8eSyvOxqKR?=
 =?us-ascii?Q?6698Om+SPEwCV9uizqrDuQ/LGPNatvrSwM+ot2L9mCask9zm/WK9dDo7zCMM?=
 =?us-ascii?Q?52oJzAmUVJPa+FYC7GO2Vja7zg448djzQGjqyVfuVnQHJmn0wy26/nbMwhIZ?=
 =?us-ascii?Q?LVr4ljgRA9PUF7GGUd5sav1PCfcGDAtL7vIzT3mRi/kpLFNjeIgfuCkh37nl?=
 =?us-ascii?Q?lGpkHtSGsuM3vdXil7DEWSSwp8JzYn+gJ9gF6sKhHy7jFD9bu12oss0jhI9s?=
 =?us-ascii?Q?k6DTEwT+rx7j/KdS722c3p2WASRKtzJTAXmk2jpvGiguKfNLjOGvhS5Jqy4U?=
 =?us-ascii?Q?r8I1og85WjY5YZ1wWLTVn+aVRp0ETKWxFdbL?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:43:44.4646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e402c2e-da66-4268-d6d9-08ddbae7a63c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6974

Add support for an optional GPIO enable pin to the PWM LED driver.
Some LED controllers require an additional enable GPIO to be enabled
on the device before PWM control can take effect.

Testing:
- Tested on i.MX8MP EVK board with TPS92380 LED backlight driver
- Verified GPIO enable/disable functionality works correctly
- Confirmed both GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW polarities
  work properly


Device tree configuration used for testing:

	backlight_keypad: backlight-keypad {
		compatible = "pwm-leds";

		led {
			color = <LED_COLOR_ID_WHITE>;
			enable-gpios = <&pca6416 11 GPIO_ACTIVE_HIGH>;
			function = LED_FUNCTION_KBD_BACKLIGHT;
			max-brightness = <100>;
			pwms = <&pwm3 0 2500 0>;
		};
	};

Changes in V5:
- Reword commit message add TPS92380 and LT3743 LED driver chips

Changes in V4:
- Reword commit message to specify the LED driver chip TPS92380
- Add tested device tree configuration to cover letter

Changes in V3:
- fix make dt_binding_check failed on check leds-pwm.yaml


LI Qingwu (2):
  dt-bindings: leds: pwm: add enable-gpios property
  leds: pwm: Add optional GPIO enable pin support

 .../devicetree/bindings/leds/leds-pwm.yaml    |  7 ++++++
 drivers/leds/leds-pwm.c                       | 22 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.43.0


