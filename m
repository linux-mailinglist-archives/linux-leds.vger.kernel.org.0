Return-Path: <linux-leds+bounces-5987-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F4C34164
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 07:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6271A465589
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 06:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0AC2C11CC;
	Wed,  5 Nov 2025 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="ch9iUd3N"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E52628695;
	Wed,  5 Nov 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762325422; cv=fail; b=ENlCbMdKWNuZgfVSSbqWvgqXFLep95jFt1i3xkZe2fVUY9PuMZ2GqEIY69ysid1DrneKkff3fxdJfjAU6vDi4Sllqt1UM7T5pSqrGLuDspRhGmJsHzd6FgT4VCawzG3TcdkC4nQI7fTj5c2sZ4YA67XLzQ1/RinJTxPPxO/l63A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762325422; c=relaxed/simple;
	bh=l7f3+w5xOqsHgNR+k4YV0lqtNntXIMgM6+rDsFPZZrc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BDjtAh0ZeqBxdk1soKZOTxcyXSzKuBns6kCNpceB6iz1yRvEYBI5XBPNvF7S0io9etKINFfNqR+OJHwMvqt8TIDWfeKTDoRUY1RDYymPzlNXUCNp5FYjzWxkW8U7eFVa3kITZNyzqN5EHznxwqyZzO+t1zjKnzDUnEAb1FvJeNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=ch9iUd3N; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imNVCn68aVsVSnf/IX+hsBYKNrLtUCFtdu5WAT3vMa/wxafbFU+reYEHDbK8ndMBcRBE5QBVgjA88od+Utn2iF/T+i5Zf/8xYgk0nSFPixX3QVJLRpLYdRywNh9o5dyYu7NEU0NWVNqcpxfzcWnoqV5DcIsaJsi144tHENIpNXslR7L4I1/boqJZv2jLQBxFRHT621gn8HeSqBxxQz/pCBiX7HhUzcNrwhQZ0mT4hgHrf5DAYWG4KPh0BsIvMu3fPwXTo5RdrJy0estzectQpck+1dZ5ogH6ICShN35faP18fqQF86t1bny1ZPbluecLZlTx1JqI2Cexjr0N+hnK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P03Z8bhtp9l9/ZfepiIsciyYDoLw6K33LT+5PCmIz9E=;
 b=zI04MccSCEtcSaFKYVBgqpHz5nwGbravVde3UyI1BJ96pHpBc9A8E1BMqXvxbE/2b9njuSus8uJmz/i+gs6NlbZStduO/qXgnx+TRyf/0VD5zAVjmLYUj7eJHUzBj34/RlfZ4xRTE4DGWrUbX0ad8iQIUinA6QVkjs7f8fwIvtkjnc2Dextt3Lc/bil0FaOaSY2yqrT85w9jQbmVOjIEUAqBA4yR7YpeLq1MTXjTYKEzRUTtginf65/WfF2uBsFcwt6jxEEGbaX73+2whBbpO2tQmvTnSobZeRp+dggsYGX3CIWNvWzmT/MfYa4yYl37tD9n2l9nnWQaXWyNW/UyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P03Z8bhtp9l9/ZfepiIsciyYDoLw6K33LT+5PCmIz9E=;
 b=ch9iUd3N2mxu3JnnEFvpmQPePB73u1huJW9RXNo70DL1L9f1dxrtBVbnSvzTHxZSwN9ECgS1vXtKCHd6UZryXXRFxWDPiCD+ixZ+XLUa9+IOkoHkFRKAC1wzFIa5O0/AeT46IhmA0cfRracoXCheYP15C9SyO2y1KQJaOB7BX1M=
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by VI1PR06MB8949.eurprd06.prod.outlook.com
 (2603:10a6:800:1e0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 06:50:15 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::20) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 06:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 06:50:15 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 5 Nov 2025 07:50:14 +0100
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
Subject: [PATCH V9 0/3] leds: pwm: Add optional GPIO enable pin support
Date: Wed,  5 Nov 2025 06:50:09 +0000
Message-ID: <20251105065012.88796-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Nov 2025 06:50:15.0000 (UTC) FILETIME=[70A42D80:01DC4E20]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|VI1PR06MB8949:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3d9522f-66ab-4597-4679-08de1c379362
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9s+g0EBqM7DkB469NR9BJACxjpYQjpy9m7z5hDC39gHakrUW3eUnHZ1RiwnG?=
 =?us-ascii?Q?g+NoS77Ts8tzs3DAoxvnAiJ5FA5hT8xuznMIzMXQ9DNpq31WEVZtMB3pZH5J?=
 =?us-ascii?Q?o6SQTnrkY37/xBOcQ6pU5aD9Ve5lVa2rIgZHC4AQvhzyLjDBLtorTr9+lnwA?=
 =?us-ascii?Q?Vf8USG3HTyosFQl2nrwzl6NeKq4dBb/QSBUdwWxmPtIz40kRv5W/mbIXX944?=
 =?us-ascii?Q?CdCiH2oILEWEdtZJcVro9W33ZnRIKWnjq9Zqt8KfG/aCOnh473QfvdW79rV6?=
 =?us-ascii?Q?a7WcRx8SyO+9HJ3MHv0PYzWZuz1cPGyil377YcEGAJdm2EwB50lWRKEF5O+G?=
 =?us-ascii?Q?X0RH0M13/zhkz2OV4/u95zvze7Qz/syuAQOvYYtL09Bvgw4usEygQBKqtHaa?=
 =?us-ascii?Q?OY7/kKMinGmO+Jz+6vb23GbUsm7fQSEJzMFJvFoltQV64jEdY0DmoyQDat/x?=
 =?us-ascii?Q?yvcSwjOJQkunI5roESwaTG1oE/Tqiklc7kBsFoICzbFYNcJTKMisfgAu87Fz?=
 =?us-ascii?Q?qBkqJRCfd9X30ssi4KzEviLr1zdczqe6OXsUvDqpRyoSnEw+5ObeaHhgDTgm?=
 =?us-ascii?Q?H4qOhBQLRO4dj2SneX4Yw5oI1BErHDTHg3sv7spxOru/LWClHjI6eMtL/B2y?=
 =?us-ascii?Q?QiUomrhq49tgp3lZrNHMTgLp3jM8IH/6uRM2hn9N+3Kk8xBUWGIEEAz5SlvT?=
 =?us-ascii?Q?XnMiI1e8NrPzfEIPlQrAf6kQjEMvceMIwPWu5+NTyUG44u8GVNaSioN6lYNU?=
 =?us-ascii?Q?sCk9WRgCHTFM9dj0NgI2UeJzzDXOcBZ7barmmSlklkiMayB4uJlL89EGkdJm?=
 =?us-ascii?Q?7DRjL96yhxK86MjEPs+4AWhQJRuxoJ/VCK6ysvcJDcGPhL8GURy25TZwULxV?=
 =?us-ascii?Q?nBM5281TXi3akNcUJrk6mp/5to0qaAz3SbLYL3gC7y1hmoJHQ6irg4cCqeHc?=
 =?us-ascii?Q?owKrrJoBkVUucGSWuSrdtrqssljMatZQgLR5dMWz6D1fXZgigGazO8FrdMPY?=
 =?us-ascii?Q?hQ8CIwhD2QLv1VfQq5yiFbIPP5umzgBpI6R8Hlh9tx24mizn3WuHjFCRVk+g?=
 =?us-ascii?Q?SXHQ6vhFqD0O1E8DrVvsP3rKUw2A+f64Itc8sydyXhwl6cfN4fZzLNH0tnMW?=
 =?us-ascii?Q?I+s0c5ilcIV1kkI0+Wcmc0EYt9K+aQmps5U3cvuk1M2VIPs9kgdsJr+MaD1M?=
 =?us-ascii?Q?G1QfiEPFo2Qh1g4B28FxaQ6HaIPWdctm8cQyaXkyZF+r2hf8HpHpjfYTBfaS?=
 =?us-ascii?Q?xH6C4NcHVVSiv8SCOQ5+0T0jaUVBM7EmWRPNOjX0LQMWDWkrpfdpNRqw/S4T?=
 =?us-ascii?Q?yQLyjlV2WlKNdlXFkryJtKPSR5CVHqMqJKzSwy3SE+fXQpa8SDc0l/63fhhW?=
 =?us-ascii?Q?33adLbF+m79rkJT3BAlltNqps2GgkEBmmE3dIbuJGXK5mhO7H/5OmsF9O4la?=
 =?us-ascii?Q?LSNpvm/yQP+nTEA1EtmntnjxXKic3BIVMDFdrsnwITW6jGiURtUWiedVQti5?=
 =?us-ascii?Q?u/wOwuOM8x1BBFGk/ITYOI8cGPckJHegYbC9MCwg98mF/9RVngxTMQKF8KcS?=
 =?us-ascii?Q?QcdJTtNBB6KwMZmftdA=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 06:50:15.3283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d9522f-66ab-4597-4679-08de1c379362
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8949

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

Changes in V9 
Reorder include files to alphabetic.


LI Qingwu (3):
  dt-bindings: leds: pwm: Add enable-gpios property
  leds: pwm: Add optional GPIO enable pin support
  leds: pwm: Reorder include files to alphabetic order

 .../devicetree/bindings/leds/leds-pwm.yaml    |  7 +++++
 drivers/leds/leds-pwm.c                       | 27 ++++++++++++++++---
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.43.0


