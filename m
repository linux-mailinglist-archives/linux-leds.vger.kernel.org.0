Return-Path: <linux-leds+bounces-4713-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C379AC41DF
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 16:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE161172975
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 14:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9DE213235;
	Mon, 26 May 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="chFauspk"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF620FA9C;
	Mon, 26 May 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271253; cv=fail; b=jv+mid8j8ei3AgbdTqIdeIiRzv7Jum2stBvcnNu5zTuRqBvthQTCiJtGKNUkCKRIrLrUt1Wc1MLF9DTRzhv4iCuj1El/RR9CPlK4Mh0IutVayhpRTdDgH5BFeJC1n6ueMOFSEj9RECehQcRmo9kSQjLhbWRgQ1lIh9z/98gQwc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271253; c=relaxed/simple;
	bh=OTea6E0SvOLQ/AqhFHKeB0WBhJH21N0/ya13dfiEJAo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=g5AwWPnvcTQbALJHs79z28GHP+YY8lxs+eqVJS7QCX37SRRbKl456rXKNTO8QOa++6OL2BtS54jBp9k9LLcrUrFK1OJOyq8sFs8gQKzxJicerRDnl6R7pvbkPKP+Zot+1zIxjLESo9KrM3b5uCmUxmmwPOBNnAQPijAuuB8QAkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=chFauspk; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhhpG8R7V6Cr4U+3ybT6JrdCFCtl+hamn5z4E7wRfvhNaZtpV5Xb1ariuZZQjg+pj3hlaRomZ/tjoRFnqmCTazA1SL21ovyIKePYN9ipuK5cu/CdgBy/3zfZNf0Dd9lKNFFAckjThf99v0+M9mofrxyqpdEPNPYuPmW3rpu0nL91denON2DB94HzZ1ePH0pruNVLHC/VDSIYTfRpb+Kuwxa2LSzlUm+ZXvcdLafHLT6rL2U0GvNtWk/r34XESI/e1wa1zU0wYRcN78zF36dM16FdHyccyrXAY0BT7lEXHu34byhss5PjWLI9mG7NflvtisjMK12rJDV/QCA50JltYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDT0cTJ+x1jLtnhYsEGwg1GZc8rENGK0waIQCZ6vkAY=;
 b=EnBY4tdkSAWEdp4H6UgAsq4zYQ6aUFIAooh4dhqKtO9kG9IX7iyEFXer5DmG+R8bB8npCV4VipKImeTfoGcinDckBsKeAfXwaMkDQiZTCJTLZ8N6Hs5qtNIfjgR04h66T3g1w2qBr5/qYlEoJS1SdLHbqEexLruGyfAFhJhxuRC9odbwpJNJbAxijCxEkWXifFduVyQ11YAWCFLtBafjSJ2Twyo4wIF1oDDKjLh3wvwAgyFFTRGLjnFyBrqm+v1Piv2mvyfsZJSgjsNSpbY1PDFczE3pkEqoOUIwOLLNJRFkvVrtvu8ziEFsfZp1ncv5mAcA26NAxs/zJOVOoIzDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDT0cTJ+x1jLtnhYsEGwg1GZc8rENGK0waIQCZ6vkAY=;
 b=chFauspkBq3GzH/V2HHeK53ui8FaVYNy5rkt5N1n/eiEx/K53W5cya26jfkdsbThj0i79vsIWkS1lML/sjNlpNbxL0aoAXU7X15BrFw2rGSamHhhTnEHm5c74xh0kgeEi65dUXbIePhAq9ZbCX3ZUe+PoIStUxV6ay6IYtL9R6Q=
Received: from DU2PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:3b::13)
 by DU0PR02MB9612.eurprd02.prod.outlook.com (2603:10a6:10:423::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 14:54:05 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::da) by DU2PR04CA0008.outlook.office365.com
 (2603:10a6:10:3b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 14:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 14:54:05 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 26 May
 2025 16:54:04 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 26 May
 2025 16:54:04 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 26 May 2025 16:54:04 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 23DC82CC7;
	Mon, 26 May 2025 16:54:04 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 1E0BB40364CE; Mon, 26 May 2025 16:54:04 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH RFC v4 0/2] leds-lp50xx: Support reg to set multi_index.
Date: Mon, 26 May 2025 16:53:59 +0200
Message-ID: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIeANGgC/12MQQ6CMBBFr0K6dkyZzlRw5T2MiwJFmqiY1jQYw
 t0tmAhxM8n7mfdGEax3NohjNgpvowuufySgXSbqzjyuFlyTWKBElogMN9tA6wYgorZiIi7IiPT
 99DbNS+l8Sdy58Or9ewnHfF6/DZb614g55MDaqLJiNoe2PpnBhX3d38WciLjREFcNQYJmlKQVK
 lurP01tNbVqKmmFblCXcj7FRpum6QN2ehcvCwEAAA==
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|DU0PR02MB9612:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6b3fe4-b770-4bbd-fd16-08dd9c652987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUxqWjQ2RmFEZVdPYnFwYmduTGtxN0RKdnl1NzF0bHJVa1dDa2xMeWpuVjdM?=
 =?utf-8?B?V2JEVkEwS1hxK3BDT3ZuVjdxVEhhTTRZc0ZZaEJ3aWlVa1Ura2VvWVNrNmU5?=
 =?utf-8?B?RE5yaFZYTkNiVEhla3VUZ2twN2hIWU5CNDlGc1UvMXBiR25FbnkrcXlKc2ZM?=
 =?utf-8?B?RTJZZncxMFZCL3ZYMDEyUXFFRWFDVVNMdmJGdDU5NFNYOURKb2owbHIxbDlW?=
 =?utf-8?B?L2tvZnlEL0c5aWFhOFZyZ2lxZTBFT2IyUGMvWmVXOEM5R2ZGNnlQTUdvV3pj?=
 =?utf-8?B?NjZPa3RTdG10Z2xPS3RKdnlTQXFuM0dnK0UyMU9RbU1VOFdCMFhrOE5GMldm?=
 =?utf-8?B?dDlkNElMRWxZaC9YQlJDMXRIRDVSVDRiODZrcFlnWVZoY3E0MVBUUWtHdTNa?=
 =?utf-8?B?VUM1amw0bEJyNVFDT1lFUUhKOG14SE1UNnB1SlRXb0dCTzgxd0c5NGgzclRr?=
 =?utf-8?B?OWlydVY5V1E5dU5FL2xzSVQybTMvaExSUXFINnFkOTVDaFFXLzU2eUtrTWxu?=
 =?utf-8?B?RVVlMnNyWk9ZV0lSZW04L0k4UytzSlJBdG9xM1habkw0cXF6STNmRXFUZ1pY?=
 =?utf-8?B?SFRTZzhJSFN0MjFHc3RITDZhTjd1SW1IUWtsVGE5SHRuRi96dWFTbmJmOUgr?=
 =?utf-8?B?THR4czBoOU45a2tLbzk2bmtOMUc4OEZ5ekwzU09odU02MHo1VFh5STB0bW9y?=
 =?utf-8?B?S00xMVI3NjVRUkViK2UwWHJRZTU2c2NnV0dlM0VQMGdtYzdnVXJ3d0xERXhY?=
 =?utf-8?B?V3ZaRndGQ3lmTzdZRXNGcldJbGtTdm1xdTk5NW1MYjVCcE9XSmZyYXc2RThQ?=
 =?utf-8?B?WDlCRHRvRDRnMjY5UGZBKzBKNVovdFRBTk5wU0JRNGsxNlVFd05OV1RHdCty?=
 =?utf-8?B?ZlNlR0FWZjZscldwUUYyekxZV2d5U1VUQkZPOHF6b00xUExmQTFqWmtxVlhG?=
 =?utf-8?B?VUZYanRQVFhzL29xVStodTArNUJJT1k1bFFpWk9RSzlZWkJxWm9GZk9aeDhH?=
 =?utf-8?B?Z3l0UU0vMUozaFVHR0tjYmF6RFpjcy8wdCtVRVYzWnNJbEQrUlMyUW5iKzBY?=
 =?utf-8?B?cFNlLzVJR1pKTmRvK3NteWtpQURZRHN0UXhXK3pMKzZ6U3pJdHpOQ2VUanBk?=
 =?utf-8?B?M0dTdEVvVTBZekhSd1l4S0JZZXBGVDNnUkk0QW5mc1RsY2IrRXV0bmNzZ3lj?=
 =?utf-8?B?SE5TVkpKUFZMMU0zNmFKNGVWeGlhY0QrTFdzZ3o2T2pTd2U1WWd3WEpGeGhO?=
 =?utf-8?B?L29kS2ZiSTNSTDZmMDR6NEE4WmJvLytBMm5tV0I2VGpkYVN5UG1xUGNidXFZ?=
 =?utf-8?B?eGFNNjg4V1k3UFMyMkVRNmhFYTBySXFteW42cE41WW1sNXJRUVJKRkg1dGwz?=
 =?utf-8?B?b0txKzNONTFKdUp2WlhndXhkdDIrNWRkaC95dkc4Y3dnMUdOMHBWM1ZqNE0z?=
 =?utf-8?B?NlU5ZWhUSGJCc3ZhTzFzV0NhQ2tReWUxQ3FBQnZ0TWtHMmsvLzVCZTZpaUpZ?=
 =?utf-8?B?aE1KV3R6S3lnTU50UGExWVFxdEtrZEEzdmtsNjhFWVhVQkZmN1g2NVczT0hw?=
 =?utf-8?B?eTZGSkFBOW5FdHU2L0djNHNmcFV0OHhmTkxmcStuZE9aYnlQUlA3N1MxYVRQ?=
 =?utf-8?B?ZUVmNjRMK29hNUJhY1pEaW84Y2t2bkE3N05jNkxhQ1JDTlRoVkNIYlFnUVR6?=
 =?utf-8?B?bEkwSnpCV0ltbE5QQW80eW00cUZMN0xaQ2pIQjNGNzRURnZVcUlmZVlyQzFF?=
 =?utf-8?B?Y1ZpTTVuckk1VStOU1c4ck9VQXpMNVBiR2xIS3JBdUJpamcwZk5SUDNETDND?=
 =?utf-8?B?TERBejdVNzl4bVBidVFiNVd4QlRmTFJxRldUNDZDeDN4U29NV0FqYWhLeU0r?=
 =?utf-8?B?QUN1ZXRzWkhGOVcrVGJNRm5oU1dYajkwSnN6YU84NmFkbEpCNk1ycWttckhQ?=
 =?utf-8?B?MVJwVURPb05CKzZyenp5ZHpWMTdDaFlHMTlreVJBdTYwOEpuUGp3NVRuSEdl?=
 =?utf-8?B?eEJmTnpKckVlSzArMnpSVDRKV1NJNnNWNTJMQVFIUmVjVVJkTGtFRXZHMUc4?=
 =?utf-8?Q?CgNi4S?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:54:05.8360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6b3fe4-b770-4bbd-fd16-08dd9c652987
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9612

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
 drivers/leds/leds-lp50xx.c                            |  8 +++++++-
 2 files changed, 19 insertions(+), 8 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


