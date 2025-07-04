Return-Path: <linux-leds+bounces-4996-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B51AF90D8
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 12:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BE247AFEF4
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 10:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7732BEC3F;
	Fri,  4 Jul 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="Ll8Dw8+W"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE34184;
	Fri,  4 Jul 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625833; cv=fail; b=qJCQUO1FrQDn9bZfhK02ct/yzByr66f4TJpMfEy3cgCGl9RARRsqcKrgGVzZwVyme0gqIbCkNEw89yd2VQNqPljxHBedMLoy+qelkLJgTNhV7YSBUnbBjpP1Iy6Xbc+NmjO7BOgNahY4ZL+m8NPVuxiZI/q+i+i/lZFlEfrFhY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625833; c=relaxed/simple;
	bh=jDoQhaogdhJjFi4Ft+/aybjePq8JD08t4IqjZ0bU51o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBmfrmqiMLWdtGzQ66RsvOGK1aTKsiJN3UhUk3V6Ub9eEN2vYXr5sUU0+NZxXPhNvYsJCcW0PxVkPgzRrx6/UwDu1oWQaa1cve/vBfh7Ncis9EEEte9WxlHMH8Cwj0vsyoQXBPqYiwL+PfYPh5gTjez9YG4A7M1D2H9H6KeToCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=Ll8Dw8+W; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBIxXdTFiByV0t7WZTs40JdcYla984S9I35Vbc0MDNyfMDC3R9RwXU8BTHAw0aeEt3VWiSViWbpK+D4xuF85TO+OkDVAo8qd+uZFhKovKyfDTknNM8E/PLH4mwtRyDueiMCq9rLana42sBD6j106JK8PjpDRZVxkzSIKlXzxBpSB6oSOpzzAu6pvHcD8MQST1EFOccNPsCdqUnH4W6Aw6XWmGLMco/K8Z7YfrIvTFMT67oUrlZ4Eyl0UDzUf4DX9LTODv6ZtFxGxfhWxAR8lZCWRxIkMXn4KFKoO4LRf1oroW1/LG6kgaW0+Ozvg/q1cwUXxyDhoaq7Cc/rzhcSO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR6EaVC5ysQADqtF1f0504PjaTHo9m0RQfRLOUvQYb8=;
 b=KLR8UuNh0d9aPEc0yPnodMjYyv3zYcq7xjmZ058VvsOF0EozU6Y2qQ3OJCAxm7f/hdYidzDgp5vmhJXRp4zJjvby62CaAiXarS2f+Wphh9UmRoa7vgjzckkfy912er/3GSvc3nzp4j+yXTlRb22ZDV31toRQ3T/4zaT2ldQnYz5e6Mr6oYPh4cKeExLACDpykv8Xsfs81bs7gcmVXkL2ijQJ8vm5czIDG11UG6HlizD3x1kUkP79ycUVRBg+smdwkJGXJ5E4vFwmngaq4/apuQkXi6NTKgtCeetY9CBePa3/TZwLyNAJitb6o0rUoREStY3MQtDgtmnWWZL6/++ADQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR6EaVC5ysQADqtF1f0504PjaTHo9m0RQfRLOUvQYb8=;
 b=Ll8Dw8+WqKgl7cNalV1VMMJ0heVlG2GMf5NyQPbgdTAtKvb1CGrZqe/tQZ16oM/hCWn3OcEuvb4cryXNaA/LJIPtm5Qd5MB0Y99bpcDTlZxCXKPUViraxB1xQvD+3loiIiFKAmFkz4TB6tQMvlhLlOs8EsVAmWO8DcngCh5QvyA=
Received: from PA7P264CA0415.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39b::18)
 by PA4PR06MB8475.eurprd06.prod.outlook.com (2603:10a6:102:2a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:43:47 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:39b:cafe::d5) by PA7P264CA0415.outlook.office365.com
 (2603:10a6:102:39b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 10:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.1 via Frontend Transport; Fri, 4 Jul 2025 10:43:47 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 4 Jul 2025 12:43:46 +0200
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
Subject: [PATCH V5 1/2] dt-bindings: leds: pwm: add enable-gpios property
Date: Fri,  4 Jul 2025 18:43:37 +0800
Message-ID: <20250704104338.46546-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704104338.46546-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250704104338.46546-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Jul 2025 10:43:46.0845 (UTC) FILETIME=[85210CD0:01DBECD0]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9C:EE_|PA4PR06MB8475:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4eea86b4-af2c-4d17-3f53-08ddbae7a7de
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vABrjRbijw48e1k6Sh4wkatk9XQ1IjoPqujAP6D4Mqt81s/yEZd6/VJqqSmh?=
 =?us-ascii?Q?64KxYg4uiUObO7xt6I9ks2sP1l/pwC892uM2bNsGKxDpjzSw3zNMg0SNgCSR?=
 =?us-ascii?Q?/EpO6u5AftX4tY+ftIFGb1Nk2E57iIYXYbnH4OJ9svPXMhhzBbdzV1DUWvaH?=
 =?us-ascii?Q?ccBirF+HL1ytTiwHGv6BuqgH5AUWWr2SzYqmcqtB8P4kX286hxR6Je9u/54q?=
 =?us-ascii?Q?DSPuSWEXJr3IVvmrLWl69bmoMpHM54fRYUWWZeMKAJjk/N3O24T5LhuCg/I5?=
 =?us-ascii?Q?kvH6FCR4Ce4+45IU7DRIR/7WbQvDoNlKkfOidVyRI41RZDRWCaVQHbp6kcLE?=
 =?us-ascii?Q?bBKvmhsTNz6tfZs40gtn2BqY+HxhMdZdfeayaNyzAo9UWLamE/Vlhy8WUt4z?=
 =?us-ascii?Q?fIzvpMr9YKJb7M/yJTEZOkblzipv9YE9nEDVp6BqKWbrYngu9TXL6/7XPrOd?=
 =?us-ascii?Q?MpZSJ20sNkDWqk3iLkDj2ucQ/E0fQiuy8ow1509wPdcY92GsVxUP7XLjE3+h?=
 =?us-ascii?Q?D+BkAfO9dC1ALAsflS3Qr0O7fD/NxLbcrOs4wOZQ4bpCtRke5q1/rWyvjlAE?=
 =?us-ascii?Q?2WE7IbMS0yuJO0AJXeMYDBnWx60vae9oMcPjCLA9IuYb+uDG57o0jPZ59liz?=
 =?us-ascii?Q?8U/gSwo8D2juhAfs/qXc30BoTlY6PO6S2F+Is/NPW9R1Y4uFTzt5JOtRmSvI?=
 =?us-ascii?Q?Sbw/wrhWufQwx78msQkzIMa0WNY4o9Bw+4qhYXbtseuqoNSFgI5zK36+w0UI?=
 =?us-ascii?Q?bF10/ESpBqX/7MlxtDwhYb6W+9sj6PZAVrboFF36AXV4jwdJ43PiRbjvYn1d?=
 =?us-ascii?Q?RGBocpoD0zzWC4AxM9+sbQtIKZ2xcrbILZ6148mXuJgVapIjrL42/J9mp3wi?=
 =?us-ascii?Q?oTsNkZqo7hPNSNnx5YuxW9jn0NTyr6D1f9RF9W8HC7VwtSt5UqLGCWHuK2X1?=
 =?us-ascii?Q?shwoNZ47SM+O0K/xYawOJR76nMbXOcTeTi9Gw48/M7U65UU5hCmS3hMykP3B?=
 =?us-ascii?Q?/KFzxkOyVfxpbMBG98P8AKL9tJUGusz3PD63txOYIcFBhQ8ku4hu+GHcuZZ5?=
 =?us-ascii?Q?WWNoDOqVWs7Ft1eiUIQvZQDc+4SBOspCKAIclW/ZJiyvjrjN+o2qyD39f1lM?=
 =?us-ascii?Q?bso0VoRCuBXeWR0G6e2uHJOM7W5ZDytBI0SDe+QgHkFmWbV5JeGaUNWt6yn/?=
 =?us-ascii?Q?A3nc/mlVvszonFkzEKmEyAjMOw2B4PJCPBqsh8WQUMUgCLoqk7BmTzLPLYMp?=
 =?us-ascii?Q?6+2x8aKqFWU0ua+a+jSw4LTUGYnkxSCVMNdbsHqBApHmhLhmG82uJYQjZbUr?=
 =?us-ascii?Q?Urcz4ePl0eq5WoDARkKrpaa5Izt6fiGL7dYXrQA7lp5Ke2/VcyHdmq7AMWlK?=
 =?us-ascii?Q?sYMP8EZ65vKDqjdx+ZBKOwBwr6ZjrKWtbFV77IEMsXMJZ6k7xHm15FES844u?=
 =?us-ascii?Q?XvJQS4BB7bwUZid+lx1B9jLx1yBd1kKwzSojPRprjF7381pMgV6w84YEshmW?=
 =?us-ascii?Q?4TDFijSKxhijAV/tyN2ysEKoNGpCriEK95oaP0C9UhKhrQbiZX0voDQrrw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:43:47.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eea86b4-af2c-4d17-3f53-08ddbae7a7de
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8475

Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Add this property to allow
device trees to specify such GPIO, which will be controlled automatically
by the driver based on the LED brightness state.

Link: https://www.ti.com/lit/gpn/tps92380
Link: https://www.analog.com/media/en/technical-documentation/data-sheets/3743fe.pdf

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


