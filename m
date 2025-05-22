Return-Path: <linux-leds+bounces-4699-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC5AC0DD6
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 16:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0CE169A42
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 14:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D1A28C5A8;
	Thu, 22 May 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="mvvxM8f4"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6D428A700;
	Thu, 22 May 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923301; cv=fail; b=uaPv3HK1gQB8EA7fXOsTegmJHBjWYW2posWXlYJgYgXlTP5s3klO1j2XBA4Y32ZbX7lsl8r2T7qY575//1oyT4TJmK3L5tjSoK1nTYN99e4zSUUVpPldejxYmBsbL62SZ9NcEh7mHV1AFP8EaBLOHt3uPAdD/PcdKAQqAn/ok40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923301; c=relaxed/simple;
	bh=nYFrhXcu/vwQhddH5Qjkjz8KaUNGAFNxIKj20+OiEts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LOYMGgqW5BHm+cXJHW0IeltnRY3Oir/N6OOqDXU3VEX+WVDIkUJTdGi3mplZH7KxE5bPWD98enG1HoOtDibsTBxsI1xVo1rY9jN4VwholbuM5bGmjWA1C01Ey4k7pomQGt3N5R82YiGIybkAYif02eVm3Ez09OMm1J0e58RHr9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=mvvxM8f4; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWlrKniOn+Mng/PbGCqdCZqu8m6GWwaNDQb2h4EQtzd07Vj2WyDWUZMwhsWrKSDSkgGcs6gBkgguUow5Ms/+Z1lifBoO1RfREky/CBYgVMKB8uWBqLejgjzbBJv1Bvpt+ccGc6zp5t6FKRkINoZDqClhRw+ocDVDJkgWUiqnO7yRlPd6F+yf8QHmPE2uwZH5vzzpJgHEOUfJOSjk/kHGBKIaGMkorCzfDWMmMBkaPo58slFULIg/8nsonVy7x0YvVrAmfxS0thb6EGEygzKUz7lyNrB0X0ojBX+wKhvufflVTpEGIysbqrwHW6+FItaUns/bh8JDGLo5c7o4k7NSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV+OAG0WWT9htGsAyw/ZW8Xg7u5yx6fjq9oImNEHCKE=;
 b=Tn4Q8kg+hLIVJ/+WElMgdIfnNFPb6V7u6RcQu3ociX2gzR5+0vG1ks6992CKaM4gNpPhM+F8jgI9fR4bCKpMVl+W7tN+dfVOj7KQvgwmIRtoQp7yipeIk53juGm6kx9c5AKj9vxT5sHWjjQyBW+OAgFzjNPiLh4Xc1qeXOairM8P9fj72kUyXvxyucJiS/coDA4VtbtCMHABntFULcg2rqN+skHL9Vuryy7+9wq4hF7q3fi6ENc3r3gXA4Y9H0XbCfK7BylAQL7hgPgG8yGTgPo4g02OWH/CWEI8TZO4o8ntr4hcWaAXbYzuqx/pfWVcT1a2IsZnFDsrgt+SgYLccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV+OAG0WWT9htGsAyw/ZW8Xg7u5yx6fjq9oImNEHCKE=;
 b=mvvxM8f4sO6vhEnU1ZApChYfqPePvcZjHoCI///vmolJ6Usu4T/IkhZoQ+ldWJO5Aivjs/joUsuSzORndZ6L7OHSUuCD3LdLbvnPfDMC3BE7SgiVaujGDSNZ/XVMUBhtwxPdH+qWgRIzJr1V0CD4AuSqUiGtJ8tAf5qhC75xsSU=
Received: from DU2PR04CA0270.eurprd04.prod.outlook.com (2603:10a6:10:28e::35)
 by AS4PR02MB7854.eurprd02.prod.outlook.com (2603:10a6:20b:4c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 14:14:56 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::2) by DU2PR04CA0270.outlook.office365.com
 (2603:10a6:10:28e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Thu,
 22 May 2025 14:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 14:14:56 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 22 May
 2025 16:14:54 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 22 May
 2025 16:14:54 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 22 May 2025 16:14:54 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 64FA027E5;
	Thu, 22 May 2025 16:14:54 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 621B940364CF; Thu, 22 May 2025 16:14:54 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Thu, 22 May 2025 16:14:49 +0200
Subject: [PATCH RFC v2 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250522-led-fix-v2-2-652046323ec3@axis.com>
References: <20250522-led-fix-v2-0-652046323ec3@axis.com>
In-Reply-To: <20250522-led-fix-v2-0-652046323ec3@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Johan
 Adolfsson" <johan.adolfsson@axis.com>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|AS4PR02MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: 77aee130-4027-40bd-4c3f-08dd993b07b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEo3OGlxZC82dDcwczlBNGZqVjhYR3hXZEN4YnBqNm8rUHVEdmt3Y2xwR2N4?=
 =?utf-8?B?NDR4OG1WUGN0SGwxSlArRFhVZjFyREx0U1U3VzJSLzNRMUFrWHNGNDNYWVp1?=
 =?utf-8?B?QTB3TGQ5Y3hyOE5rZkMvdUk0QVNxVFphYzRzVHBXR1pVMGpxNGZXUHN4Ynoz?=
 =?utf-8?B?UEtvUCt5NXhUWC9NTXNSNmNQQ2xSbWhrTHhySzJXRTg4aG1hUVU3Q2d5L0VZ?=
 =?utf-8?B?NHdjaVJLT1lLYTUzd1hDTjdESGl1SUpGYjZYd2pvWEtUNzlmd2tIWGlCZHJF?=
 =?utf-8?B?cm1nMVczdkpja1l0NlRXbTZVb3VudkhPVGF2ZnRuWDkrVWVtNFdjUFBwZ0tH?=
 =?utf-8?B?NjBjTmk0YjR1YnlUNngrN05ZbnNHNkJQM3FWdUVEanZ2U1g4ak5VMlJSbng0?=
 =?utf-8?B?VTdMTVlkaXFJbUFBdFZoZ0k4UWNYbnJMaFRvQjl2OHFPUWNiOWllQm10cngz?=
 =?utf-8?B?ZkQ2UUlZWUNQRVZtM1phYUg3a0FiSkM0NmFiK0dhbTEyKytXT3BjSEpRS0Uy?=
 =?utf-8?B?Vm9zaHcxN0NpY1pMZGZOQ2JUakZBanZTZ2NhK21xcENKcXVVc3lvRFJhbDhG?=
 =?utf-8?B?Vld5b2E4YU5jSXg1S0dTZ295a0QrczNmd1BZV0wrRWhEVk9Xb0xBdlBHWnFh?=
 =?utf-8?B?dWtEWDFQVnBmcHM0bVVLa0Q0dkhOSEtrR21sTXlGZWkzNkloZU9lNklYeElC?=
 =?utf-8?B?aHlFdng0TVBnMUNKN00yM2RJMGR5dmlrWVlpd1RrcGNyNjVsZmREVEVoOTZq?=
 =?utf-8?B?UGg1VDgzS1FKR2x5bUFQR1gyRmhkR2dCZFJFNmJkL0sxR0dadU1tK2g3dWNj?=
 =?utf-8?B?MTJ1cFYxSmVFT3lkNTc1SUdMN2FMS1ViQ051am5LeGVjSkV6aVhqZGZmeWtO?=
 =?utf-8?B?VzM4MlJpRXVyaWVNMWYrWFgvRVkrWFVtVUh1TXhYZHNsbnpBL2pNZ1prM3U1?=
 =?utf-8?B?aW9Gd2NaRkR4QlZXVW42LzUvV3NPV2wyZFVCOGdQZE1YNmtTVVlkVjA4MUhZ?=
 =?utf-8?B?aFNyaXBORnJ5UjR2VWlobmdWK0p4eGpoK21qVmUzYUNYNkthcEJWSStOa1Bt?=
 =?utf-8?B?S2xTTmtpMFBuOWk1ZTBDWWJlMk1WMTVrNHZ5cElwNmMyL3IwejdYRDd0TjVM?=
 =?utf-8?B?NWZpNTJKSE5ra3ovVVFTdUxLd3hJdFlRQjRSeTF3ajNPcnJHUm0xckhudE05?=
 =?utf-8?B?M25hQUNORFRUWjc0ZnphUDFzQ3UyV3ptWGhMR2lrQlNKMkxLMG1UcXEra20r?=
 =?utf-8?B?WTNHVUlDcDRFS2JjR3hVOWcwbDFoMS8xMmplZ1Blek94dUFBYm1ZcUZHZW9o?=
 =?utf-8?B?bUxTT3hWYTZzUDhRTjRzN3JSbFVWSE4wZTdIWGJuNXJwc0ROcExycE1hU3Yx?=
 =?utf-8?B?V1FoTmphamQ5ZTEzK1pVd21lK1EwTUh6bGZsWFE3dHlDN2lscklRak1wbjlh?=
 =?utf-8?B?aGhIMytKM25hU1ZrTkVjWUltRjRIbXVMNU13V0FXNFZXU0g4bHpxaWJkY2w2?=
 =?utf-8?B?ZnNCcG9hWWk1dHFHLzMwSUZPMUtPeDZOVkZqbTBnaGJ6L0g0eGdnbFVvL1U4?=
 =?utf-8?B?cnpOZTJZTW9PaGhycFEzVnJ6RCs3eEpXTXhCS2xhaDhDdVBFS01QVEJvaXdp?=
 =?utf-8?B?dUljZTUwMGE3V0UwSjFrNFl6aHZGbUNCazdqWHB6TThnMEMwajRaSU40bU9M?=
 =?utf-8?B?ZVRMN3BBdmpuUzI0cFU4eWx1TlVlZmlNTmx5Wm1peXlDVkNLcDFaNlA4eVhi?=
 =?utf-8?B?YnhwbDVqYzF3aXVBc0dsZ0xSVEo2K2kyZktIc2xWVjRsalNMUEYyWDAyeVY0?=
 =?utf-8?B?MzZ3dUhJMHd5ZFBrQ3FOd0paRWN2Ymh0ZW9pSEpsdDg1SjRaNE5hbjh4QlM1?=
 =?utf-8?B?djNZaHhTODZ3bG5rMlpoaHFLb3ZBSDNDTFV1Zk5BcEdBN3FKZktnUlJNMlRO?=
 =?utf-8?B?VW5wNmI3Z2ltVFkzditTN0paVUxIT1NDZUF5cjlROVh1OGhvUnUxM1Ywc25y?=
 =?utf-8?B?ei9rT0dNVGJ6NlhGbEoxVFhoMWdXaXAxa3hlbzFFN3lVMjdQaXhYaytMSjdm?=
 =?utf-8?Q?he+Lzc?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:14:56.7418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77aee130-4027-40bd-4c3f-08dd993b07b5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7854

The led child reg node is the index within the bank, document that
and update the example accordingly.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 402c25424525..8ce327d00c2d 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -82,6 +82,11 @@ patternProperties:
         properties:
           reg:
             maxItems: 1
+            description:
+              This property denotes the index within the LED bank, 0, 1 or 2.
+              The value is actually optional for backward compatibility reasons
+              but is highly recommended to handle reversed devicetree
+              processing properly.
 
         required:
           - reg
@@ -139,17 +144,17 @@ examples:
                 function = LED_FUNCTION_STANDBY;
 
                 led@3 {
-                    reg = <0x3>;
+                    reg = <0x0>;
                     color = <LED_COLOR_ID_RED>;
                 };
 
                 led@4 {
-                    reg = <0x4>;
+                    reg = <0x1>;
                     color = <LED_COLOR_ID_GREEN>;
                 };
 
                 led@5 {
-                    reg = <0x5>;
+                    reg = <0x2>;
                     color = <LED_COLOR_ID_BLUE>;
                 };
             };

-- 
2.30.2


