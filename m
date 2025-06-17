Return-Path: <linux-leds+bounces-4827-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0C8ADC811
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 12:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8284316E9EB
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 10:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337E62C0331;
	Tue, 17 Jun 2025 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="DeVB6Gve"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B368293B53;
	Tue, 17 Jun 2025 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155847; cv=fail; b=UdKjZ0hHGUK2bM27H76P46PmiCAbwD2h9kUj3wN0cpqLH3EopCxjNHzXastoYZV26zY1hgRWvb8P/466HWv2Py1smZSOELawAoYlePrRgDjortvrJM04a+rjX7g4FgbhsZAOo0z9CCwLrY6Refu3fo/qaIE/zvK4iJ03k3tNLqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155847; c=relaxed/simple;
	bh=qyKFwjs9A/6W61AXM2vyFWwETpvmUZEn0XAbYAipoMQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=oOq62WsoVdMH2uIfDeOyb9Q3QTiqyv9Lh1Q6FIT/sX8nx95ALItKAi7yV6v3n0xjEpmPthNtpzEDZbwvV5+9Rmo8V6H1U9aj2Q3DvUr6zOimSMFDfcPe15w6QDBKKmq6+RkYs7BZIEViW5fvVrUBVlwJrDXyLoeSFw2CwV4fDhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=DeVB6Gve; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZV4GRgaa9XC9pHxTlC5qiuy/Qki1Ax0V4rEW/USS9fyYYtJS+50Cg0vmRaeHzNZhO2ax/lQ5HwUTqT7HuLuVNPMUg8eUy2NUganz5cdaIWen7ffq1hXHzgqxUFNjIT4UV9uutOuKEvrsEqO3LnImPmFM+D1UBnc7/6RuWoGEjSMRO8iJJF6bjZFt3UgI7dkMe4v39TiGAILYiwhqRoaOrl/JkE4fmdxcZ6BH6GRpP+6f6gBHRNqwSfSlOvuJVPcxDTg+lQjH8tfeXn3964N9FyvqVVybimfMblY65NNPrqpRdLm7OlAHoLMnZeUDCR+Qg8XAcgOHrz1LlaOuqpViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmzBI202/cFZifj5W2xyLlSDXrdcpcejReWssge+syo=;
 b=O9wbjdBZjTmuEtdIqPauRcjPBtzd9lEPRuMSh7tOcHAfUb9Rrv8PP2L4UhcLXjN4eQlW8kQ1MDSXEA2/ByvlpiPSkyf8XNa3vvK6BD4ayzdP8MGj4ohBWfypPjjggYkRvzijuX60qwtS8iU31YFgif8uNx5Pz38UwBxbpzwZBLI9kXKGOidsx5e4Ga3r1Q0If4QWbTaZwF2C8S656VWtdNcy+kzC+6jY8Uw7lkKOq9GylPTcjES0wE8ttQsJS/tDyH9LHcynHNlQK1cBaYZbPE4Aqu41mIscMSR0fVLq6+J7ikuujHPky98O9Ub+E3N7W/1pOoBs1QLUwV4GSoGrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmzBI202/cFZifj5W2xyLlSDXrdcpcejReWssge+syo=;
 b=DeVB6Gve3cQPRhpB1GaRWKk9D/5Lxf8AkxsMz5uKD5HURK/LmLKlDvBvDpQE+Xum0Ah8BYJ6NtDIB03HFBv04EjTalqEEubmzWx2M+xrKC6RBIWiDm/CrZDFladmQrYKIx+Qh7yHo154e8R9cw+QHg3sfHXcKOT6I+5qOQSUTiQ=
Received: from AM9P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::29)
 by PA4PR02MB8034.eurprd02.prod.outlook.com (2603:10a6:102:2a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 10:24:00 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::b1) by AM9P193CA0024.outlook.office365.com
 (2603:10a6:20b:21e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.26 via Frontend Transport; Tue,
 17 Jun 2025 10:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 10:24:00 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 17 Jun
 2025 12:23:55 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 17 Jun
 2025 12:23:55 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 17 Jun 2025 12:23:55 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6D9AC25BF;
	Tue, 17 Jun 2025 12:23:55 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 6372540364C4; Tue, 17 Jun 2025 12:23:55 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH v7 0/2] leds-lp50xx: Support reg to set multi_index.
Date: Tue, 17 Jun 2025 12:23:53 +0200
Message-ID: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADlCUWgC/3XO20rEMBAG4FdZcm0knVNbr3wP8SJHN6BbaaSsL
 H130xVsKHgz8A/z/cxNlTjnWNTT6abmuOSSp0sN/cNJ+bO9vEWdQ80KDLABYP0eg075qokoOSb
 igayq159zrOt708trzedcvqb5+168dNv2t4ON/HUsne40i8XRMds++Wd7zeXRTx9qq1igYQA7A
 220MBgSBIweDwxbhjvDygYJIKPZxnBg1LLmSaoMEYmTeLL9kfHOpGsYV5Z49D2ZATvrDkz+YVK
 ZG0NiJ1gfCQ1b1/UHjpoKcrABAAA=
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, Jacek Anaszewski
	<jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Johan Adolfsson <johan.adolfsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A793:EE_|PA4PR02MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d1276e-b9d6-480e-b043-08ddad891396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGs5b1c0Y1ZVYVJsL3VPVFcxSmo4ZTBXc0czTTRoMlIyVXFwV1VZM093dDgy?=
 =?utf-8?B?ZkMyZk5jR04rTXdwWHJBMWJiUENOTVNXK2hyWHdhenBTazRwMXNGNXFXSGVs?=
 =?utf-8?B?UG90NTFlYkl5WHRZQ3RITWFFRnRKRnBhc2d0TS9JSUdxTlZsblRsTUxJV0FU?=
 =?utf-8?B?RHBRY3VRR0xEaGF3TkNTRkZia2lvTmtEblVYMXJuSEZ6RlBtaGtkNzhWWlhz?=
 =?utf-8?B?YzhsREd5U0ZSZGlsUkNqSmU4Q252eEVHNW1rdzdSbXVrN0w3dlFBSnpHeG1q?=
 =?utf-8?B?T05VVTBOb0d5b1JudjkvU0pyQ1VKOGVYSnQxaHoxUTNUZ3pZdFdGRnROcXZ4?=
 =?utf-8?B?UEdpd3RnSzlIalpQV1pVRFR5em9CUVk1VW5BMjh3eHRCMGxPMUlYaDBsN21r?=
 =?utf-8?B?UDcyL201MXovcWc5RUZMN0taNmF0OUY3QURYRWpwUmhHVEI4YkJ4eFpWRkRX?=
 =?utf-8?B?ZmR1RWdGYmVYKzgrRUk1akJpd3lkcjVIYndVQWlOSGFwTzFDYWxCcThYaUc5?=
 =?utf-8?B?QytZMDBWZC9aYkYrTzJralRFWk01ckppd096Z1BTOEErcnppczZnS1pvOHRn?=
 =?utf-8?B?d0NLcWFmRXhPcm1DSm5CN1FBb2ZJQXRGSS81WnJmcjNnOWFHWmpJYTBDZEdy?=
 =?utf-8?B?WE1zamU4QnhLalprczgxVnVYS2hHYitXN005STNaalJLL2hGeDFSblUzRWpK?=
 =?utf-8?B?SDdsdlZ4OE9VSnQxZFp5dzhZcWNSZUFWRjhnNHA1cmZ1ZUxMY052WWxrUWVa?=
 =?utf-8?B?SEhUdXlJSHorOE4xZnV1ekdYL0Z3TWtzeCtUZkJYMjNDb29KcWwvR0lhOUlU?=
 =?utf-8?B?cUwwd3VVS0VrRUJma1BUcUkxNzdtaHJSZ0QyMFZKVlY5WVZDQi9jY01nZEtx?=
 =?utf-8?B?WmFqd1IxVXdLNWJXSTU4aTRBN3Yyc1FmRnFDRFRnUkErZjNsbGtnb1k3cC8r?=
 =?utf-8?B?TFhSQXhkNTBrbXl3VlJXYnhMbURwZ2VOV2ZpQ2tjYlUrQ1NwaTVzeWJ1RUhG?=
 =?utf-8?B?aUFiLy92eVdSOG02M0k3VjR2dnBlZlBXZlEzdmQ1bU1LaVZKSzlFdERGRE8z?=
 =?utf-8?B?VlhtTWJmSlJiQ1VOWGZncEFGLytEdUJTam1yaGxvTzBpQWRObWt3OUxsMk9H?=
 =?utf-8?B?UGVhN24xN0FZUW52bTV2L2dMWHUxbmNVeC9YVmtxUmJiZ2k0RkUwTUl0Nll3?=
 =?utf-8?B?QjR4RDM4SjZiTUU5VGhWV29qTlJqZDNFSzc2WEdyd2g4TzFwY052ZE0wR2w1?=
 =?utf-8?B?RkdvYzllYWlHcFAvSDYxeUNMNXBaR3ZsbmQ3OWt5VFdUTnF5OWZrT3VGWkJz?=
 =?utf-8?B?UnlBYnl2bjdZQ2pCaEtyY0NhQWdEeFRtVW5HRXR1RDN5TkthQWEvRGU3ZW9t?=
 =?utf-8?B?RXg4TXVMQXJuWTNjaHNqeUl5ZmxyNmRhd1hkQUpLRE5OSXNNeEJFNnh6SUVz?=
 =?utf-8?B?eDMzdUcyejJNalBsZE9WaGFZTjRUQmlJYUVMcjdMaTN5bDJ6bm04ckhwL0NW?=
 =?utf-8?B?dStKS25ybnE2cDVTSExhcDNqcjBDcS9Sb0NmRWlTQUZrTXhaZm5JTHVxTVhC?=
 =?utf-8?B?VDJBWWRVRmlJWEJRQmFQcmoxL0xwQnk3MTZrK0ZNcjNUcEtwRk9pajQ5OUNY?=
 =?utf-8?B?UllFeURJTGdMNGNmMUFyWU83SzRLSEZoT3djK3VEUW40WWNybmpESDJDSkt1?=
 =?utf-8?B?OEFjYzN3UGp2cTRvVW5vaGtwRnF2WFVUZ3lNalN6VlBUVFhVR2NNZEhFdnR3?=
 =?utf-8?B?OXRRenR0V0ZqNmRKOWgrc3pIRCtuZmZTYlNHZFNlcEZtR0hzczVKakJCWlQr?=
 =?utf-8?B?VjArVldFRHlwRmF4My9PdHNIaVJTV3JrdmVFSDkyS0JKOXVyZ1hyWk1zeXQ1?=
 =?utf-8?B?cUF4ZERYUDg1aDlJWmd6WXlOTERyY0xQeEQ3bkpDVzVsNHZVUlZpUTNRaHhN?=
 =?utf-8?B?cUhVVEVFZjlCU2RBSStBMU9XaThXQmkyV1cvS2VyN2NtNEo2dm9rcVROOVlO?=
 =?utf-8?B?TWNvU09CYW1oTlVsUjE1UHlyU1VJZ3NsanVrR1NWamYrRDlzaFV3K3dJUWF1?=
 =?utf-8?Q?kTPsdF?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:24:00.6813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d1276e-b9d6-480e-b043-08ddad891396
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8034

Since devicetree nodes are (sometimes?) processed in reverse order,
support reg as the actual multi_index index so yo get well defined
color order presented in the multi_index file.
Not sure if reusing reg for this is the correct way or if another
property such as "multi_index" or similar should be used instead.
Looks like reg is used for similar things at least.
Or should the whole "reverse the devicetree" problem be fixed instead?
Update bindings to match implementation, and add description for the
reg property.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
Changes in v7:
- Skip leftover initialization of multi_index.
- Fix devcietree description and update commit message.
- Link to v6: https://lore.kernel.org/r/20250616-led-fix-v6-0-b9df5b63505d@axis.com

Changes in v6:
- Remove maxItems från devicetree binding
- Link to v5: https://lore.kernel.org/r/20250616-led-fix-v5-0-f59c740831ab@axis.com

Changes in v5:
- Fail if reg is not set.
- Adjust devicetree schema, use items.
- Link to v4: https://lore.kernel.org/r/20250526-led-fix-v4-0-33345f6c4a78@axis.com

Changes in v4:
- Remove maxItems from devicetree schema, not compatible with minimum
  and maximum.
- Link to v3: https://lore.kernel.org/r/20250523-led-fix-v3-0-86d2690d2698@axis.com

Changes in v3:
- Update To and Cc.
- Rephrase bindings descriptions, add constraints.
- Link to v2: https://lore.kernel.org/r/20250522-led-fix-v2-0-652046323ec3@axis.com

Changes in v2:
- Avoid duplicate assignment. dev_err and return -EINVAL on error.
- Update bindings doc.
- Link to v1: https://lore.kernel.org/r/20250506-led-fix-v1-1-56a39b55a7fc@axis.com

---
Johan Adolfsson (2):
      leds: leds-lp50xx: Handle reg to get correct multi_index
      dt-bindings: leds: lp50xx: Document child reg, fix example

 .../devicetree/bindings/leds/leds-lp50xx.yaml         | 19 ++++++++++++-------
 drivers/leds/leds-lp50xx.c                            | 11 ++++++++++-
 2 files changed, 22 insertions(+), 8 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


