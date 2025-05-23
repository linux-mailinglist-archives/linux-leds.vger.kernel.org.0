Return-Path: <linux-leds+bounces-4708-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712FAAC2666
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 17:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E92954240D
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9297D293B67;
	Fri, 23 May 2025 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="eH/sINgn"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2089.outbound.protection.outlook.com [40.107.241.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32AC21FF3F;
	Fri, 23 May 2025 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014003; cv=fail; b=BNfpyhFUp0e+HsS/dsH2R/jvFpjRhQjaNQiZfO9EQja+rYhIjbIbR3ihy7Yc6i3eCecECSFrgIdJMRuZH3I78m4fFa/OAFIrTvorT+vQ3KLwLnz0Ikkdw1/KlgLqNFqUbXPUcMWh4YvwSXszNCkOQ+McKmo02J5axmuwDqWL4Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014003; c=relaxed/simple;
	bh=f+o7xRF3I/4Byc98HA1DZRbcYSRl2+w5OqxA90U57dI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XBZK2wz5P9+nVRPCYIeWa7W6GRjE8V4xZXL0FBQaB8xzWftE4maMGpFbF4AqFsb1YJYPDaqW+q9VrkkFT6YdodJIejaZsqfDmTvtudy67m46zTHYbenc9KsI/y25Mhi+ZkzPP2tC664QTSnn46pGNiBSxfcWihV6+pjvVCEMl1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=eH/sINgn; arc=fail smtp.client-ip=40.107.241.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFWwVZ4dNvykP2o6K9A9NNvho5226mF1QYRVvkzXUcP+UkfEPas03CNHciKGC2QBRLf1YpytGQKLPXu41bymyWeaCAXbJwVPATplPYom3YKuBimq3dsG/HZEi/0YD0bGmxaybyr3v6qCPOddx+0t7gKaV/6wSszg7cCoD8QbR/HFRlEHe0rEwsbbu0sMAyGXcRK9KaUtpzcx6rZ7I2lBspcAemIL3SYvmgWwORZBMvTO+rPw7bOA4BhasfTYBAWNE3dp/+sc4pZ3dsK0aO+nnN5wTIC3TERxUzznHY1jMPzkTcAptrAEQSvxnjFDxwX8JHoVFfFEWqSFK0bmvqXgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaMgALehgOdTniwpF82LlcsHjv+Sy6WrGAZx0BkHG84=;
 b=hTkpyQ/waQmVLJfotA2yYCQVNl03ha0yfb6gpj0xKIlO/k/2Ijv/7VFGu5/o90OKNm7qSjrLAbyFslYS98NzxdUwmzAkam2F4Ld+EkGj3UGVykskDf2g6YfriMlvwaMOZ7WB2xXFqf7xWiKvhd/Asji4ALLPdRWoH2JJEG7cfn+Hc+OFcP/eN06GDgbZTxBjYb+uzlKRN9hNZkd/bRp2kBFAq6Dqu+sFPVwEgSujvPkvutnj/RmP3Dm6aH99lxdU/cbJbVaB7asMqDeiN+Kr5unlK1TOQF87gWOQZJdhmDxxZ7jIFQJj9mYrrsSnaCoswzyjcBeSkrEwzWnd3BXLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaMgALehgOdTniwpF82LlcsHjv+Sy6WrGAZx0BkHG84=;
 b=eH/sINgnxcdsJbjwf2KVSmJZ+IaYDcqlSp7OlQGwPD/66oid0uQ85kv+H/aKXZK9SkP8lIIeuP2Z1WewYjH4/Kdohl2DV4vb8asqxdLK2ugBFU0DsfP3ih8vspMHjEkYPzujxvkRc3AQTvJc+eqrwbrM8baNPuXEU16sdNvuSXg=
Received: from DU7PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::25) by PAWPR02MB10185.eurprd02.prod.outlook.com
 (2603:10a6:102:361::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 15:26:36 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::e3) by DU7PR01CA0020.outlook.office365.com
 (2603:10a6:10:50f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Fri,
 23 May 2025 15:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 23 May 2025 15:26:36 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 23 May
 2025 17:26:35 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 23 May 2025 17:26:35 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6D548209B;
	Fri, 23 May 2025 17:26:35 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 59DB040364C8; Fri, 23 May 2025 17:26:35 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH RFC v3 0/2] leds-lp50xx: Support reg to set multi_index.
Date: Fri, 23 May 2025 17:26:26 +0200
Message-ID: <20250523-led-fix-v3-0-86d2690d2698@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKTMGgC/02Myw6CMBBFf4V07Zgy7dTHyv8wLkoZpIkCaU2DI
 fy7BRNleW7uOZOIHDxHcS4mETj56Psug9oVwrW2uzP4OrNAiSQRCR5cQ+NH0Fo3FWlNR21Ffg+
 B87yWrrfMrY+vPrzXcCqX9dsgaX6NVEIJZKw6VUT20LiLHX3cu/4plkTCjYb41xAkGEKpjULFT
 m20eZ4/XmMIktQAAAA=
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|PAWPR02MB10185:EE_
X-MS-Office365-Filtering-Correlation-Id: cb84d727-72f3-4a5e-bf0d-08dd9a0e34c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVZOTmJ2TzZCL2krNm10TWMvWEF5OXBpN0U5Zm9uN1NIbEJudGRXZU1VSEp0?=
 =?utf-8?B?Sy9BSklxbnhuZXRSZ213Q3BsTDd6ekdzRE1DMGRNcUpqRVc3OW1IM2poeE53?=
 =?utf-8?B?THloay9FT1MreEhWZmJwMkxKaU94VGNvWWVpLzFZMXduZ3BQSEpQZThLYzhk?=
 =?utf-8?B?SEVlMHpYSXl5QnhIU0RrMm4yRXdhSzB2NWpyU1hXYW5uMUw3ckhFRlRUR2hU?=
 =?utf-8?B?VGZsNS9xcllob3E2M2Zyd1dpNXpzNUc0QnIrS20wRkJ3UGxoLzU4ckJqWmwr?=
 =?utf-8?B?VUc2K2JwYS9ac0NNV0szeHhuM0dCMkFCZVpBenRkSW5pUDVwK1ZyWkZlTGkz?=
 =?utf-8?B?Q0M0cytMRWQvcFM1eUhVa2VCYlBjWkRiOUNlYmpFRFc2SWhEYjVyNGloYTRn?=
 =?utf-8?B?QVhtK1VqcnUyUHlKbzl0eWh3Yy8wMjZkaDE3NjF5L2FyZlhRRGNpd2ZER21T?=
 =?utf-8?B?dFF5TDJRZEZCT3pNamtTanpGRE53Rmp6UkhrSHdURnpEL01IdE1ybXZtWmVa?=
 =?utf-8?B?Tjg2OWFaa0hSL1NZaWVZTWpOb1BRcWdDVkxVemdBbDZwNXVjaHBUTXdmeUUx?=
 =?utf-8?B?OHArNklHMXFmZjJpNVJ0NlVENDQxWHdFbnhsejhXNGxkVzZkd3VrVlJrTzBL?=
 =?utf-8?B?eThFaFAzZWM1a3VIWTNDdFBCbmlQWnFLY0dkUXl5VGg3RUNIczdod05WMG5O?=
 =?utf-8?B?R2VRVWhsemZJUHBPWE5VczJUNHRlQ1FkbFJxQUE3UnpFeWxSYkUvbWFESFFP?=
 =?utf-8?B?aWN2dU5EUUdLcDBTcERxTGRlY1JFVHlqdXlDc2RJYnVCMVFEd0dURHNoYkx4?=
 =?utf-8?B?VHhQTk5SZ0tydE5WYzFkVXFKWXdWRzRCOGRubkdvam02Y1Jxa0VRZDgvbm0x?=
 =?utf-8?B?K01vd1BXTmZEa0grQ25yS2tBVnNUVXFCQXFwSmRTNmZhc3d0Y1ZrNnlnVGtv?=
 =?utf-8?B?UDl6UlNORHBHUVZ3Z3ZjdDMxeGFTNDdEWmljb1VwaHNxTC9TMEY5WXdYR0Y5?=
 =?utf-8?B?cEs5TDloTFdZeEx2ZExNNjB5M2VXeUozMG9oeDgzWUZnb2czS0p0am81eDdm?=
 =?utf-8?B?UDNlVzllckV5QWVpRGNBRE1xOGRQSVdYbWZJMWxHYjlqdWM5WHVEeTViK1k3?=
 =?utf-8?B?aUFGRXhoaHVOU2tSbjU3R2o2R3ZEVFJXYWlpdjJjQUduRXB4OU1DeDBQM1JW?=
 =?utf-8?B?ZEhFZDYyUGU3RmpkQkFzb1NVNEkwdUQ5eFVLWDNnbXF6Qzcyd3luS1hsbXI2?=
 =?utf-8?B?Um5ManZrOVhSMlZwS2ZEdzZlQkxzUTVIck1uZ3ZQQjU0c1BrMmo3OFJwbkNY?=
 =?utf-8?B?L0ZGK2NDa2hSUU9Rdm81ZGttNW1OUXVrYmJLTU9VWi9KR0Z6bVhacjZnb1hv?=
 =?utf-8?B?akwvRkgydHlLeWZ4T0NvNTJydFN1dE8yYlZYSnhBakRJN1BERGJvRTBUSlF5?=
 =?utf-8?B?RGdvRlFjQXZ2L25xMWp2cUYvci9ONGRqUzcvM1pnMnRlK1VyRkFnb0xHSnd2?=
 =?utf-8?B?SzJReUdLaG9EL1ZxMXpLdFBZeURjSjI4U2Y2MEhpN1VacWMzUHEydnRSdDVn?=
 =?utf-8?B?cjE5VmVPVHQyV3htdzg1REdoR2h1UTRqNFFFcTUvTzlBVWtjb0JmdVV4Q0Fi?=
 =?utf-8?B?SkVia3Rtd21HYURZME9ucjA1M21aN3d3eTQza1NyRE9PRzlkYkpUVkx4Q0JY?=
 =?utf-8?B?cmVTUGRPMHNSaEd6WmNlV0YrQnFnTkY5dHFoNkh3Umg4VGx6NkJnU1NoQ2tU?=
 =?utf-8?B?ejJyMC92ZXg1UkJCbzFrakh4Mmt2NzFROURXUVNUb0kzcTU2WEVjNHZlcVJt?=
 =?utf-8?B?RnBqVW16dTU1Y3pwWThxVzhOaTg0bms0OTBxWVduT0Zaa0JxcXdNY2IzOTl3?=
 =?utf-8?B?OU1VeFVnZFdwTytMRlZxYU9NZ2xxVmlyV2ROZGk0NlErczdETDRuSUlzMjlT?=
 =?utf-8?B?Z2dJZm9YdDdXbnVZQUd2TnA2NTFHWTNmcXB6alh2cnZmbHhqaFJQMVpDMEky?=
 =?utf-8?B?aFAvVzBoQzZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 15:26:36.1573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb84d727-72f3-4a5e-bf0d-08dd9a0e34c5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10185

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

 .../devicetree/bindings/leds/leds-lp50xx.yaml          | 18 ++++++++++++------
 drivers/leds/leds-lp50xx.c                             |  8 +++++++-
 2 files changed, 19 insertions(+), 7 deletions(-)
---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


