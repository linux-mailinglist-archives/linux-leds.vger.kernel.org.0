Return-Path: <linux-leds+bounces-3865-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E97A24941
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 14:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 129777A2400
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 13:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2BF1494A5;
	Sat,  1 Feb 2025 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nLf8FkVP"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012054.outbound.protection.outlook.com [52.103.37.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CD2C9A;
	Sat,  1 Feb 2025 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738415111; cv=fail; b=jYW0Pp+4SKXzsTiUVgeLenfxoZJzZ09g6JOIVsNZcRU2MkkwctttQ9dHJyuSm+HzQ7OjMQ17WgDsDC8Yu6woBdbFil0rnp8lwzI5XYro62BJ7ihI41rgmtCJFPeMypfDpJ8B28avXnuS3r1y2aG6DQ+lO6a4KHHqaFuDI/fsB04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738415111; c=relaxed/simple;
	bh=D4K9r6e8+Sk1BS+2VGhIrg5v2AEBsDv5XXQuSlnTfiY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J7OtR43PsEJ33o53/idDU4HYnlLweQXdoqQ+Dy0Wu12UyNOE9jPwjrxAKopMw9SMt0UPTdXIVSpeWqFmIWMi2UFiei8a9VoNN3P6ewfgV0kH9VHmLf3iaMabPuzEIEfsvc43DJjocJNaEwe7QeScF0+66Oye+fJDi4V2tbqtrlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nLf8FkVP; arc=fail smtp.client-ip=52.103.37.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0cEhe9mBJX2EaI7O9oppt01c3Sq3DZWbZ3zkVVBk5LGxZrfwYZeqmxKdWNxTmIS12pRWoDGy/t6GxO+Z6EQoNvD6gdHqBZn0JRhugPe+IrliKe78MfB4SfcogzmsT8h0OrCNcXOMkvSRZHBQOcJ/v3mtuj47t94GyP2S+OXXlVU0jP3pqqJh6TB8gC8kjBAY+HSe3anXWS6UJBdXtetbvsbHoerwfDKQaoKtb0mawtoGHaqA9PNjZ9A3wwHCaobDKnJ00JGVm3Gy7bZwCkXviNRQjGQD1c61n+CgqgCKEc2D5RfbiMTWwRf0KDcQYgw/U5XqA1WQSqEfVX7laFOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogS6YfdqA8BdxG9LAhhchBsCc1A0frBaELQUTCigOQE=;
 b=fGeTx+WJtXjL0MhhWs+IBKzp49kAWcMjwAW3XH2WKKUNNaN0E2+EA0/21lHnx+oqfWLGFL2VglScIguJiyg37r8wEAIRISeYoPBDzCe8RA7Ch8dlqYzBAFOnlNQSb7YlMOoc0mG1jjyvbLh0PWBlNF0rrm/FMNplvXnk4Yq6ioB4JU0kSvBQ88ojzUS9QScvWFgZYWBgub5aFFEyM3yS7CaPZlGWHbKXqHSPeslfRNjNXxJh7AjwSpm8uqXC97k/Niu7Bi3I65BCh6jMtEtxFT2LomqqG/myofIRZ74RV2ZVByWOJyKDv8W7Dl1h38n7rPhR5Hm03dhkJPC7dzpYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogS6YfdqA8BdxG9LAhhchBsCc1A0frBaELQUTCigOQE=;
 b=nLf8FkVP6Oe8ME6RkzlukfND4IluADBsQL9qVPY2q+wuCEvzKfB0Axpbk9jHmiKdIUXUpca58Q+g0kFpY3zyL//s+Q0lAAJWl0wlH0SvsbErXKbwjLEQ4MTVj5CRgY/UMRVD+G6uUahv8NK4j/hQbaWUZ1DQdjs1j60Y7styc1IEokJSE5LurhIzCYnooDTiMvs9xiOu6uJNm+T/EYbWJRTLxcLi2y5nT55yRFpvTGHaOp9aumqSiWFNecJoTbZFP6dKMITHqFbJkA9D3WnoM8yOSDJ0ytnACWE2vHw5NJS5RbpqdjXEiDg0Gkb4r/46CWAZ+ebvRr4rRgZcC4/2mQ==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO4P123MB6306.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Sat, 1 Feb
 2025 13:05:06 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%4]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 13:05:06 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/5] leds: leds-st1202: spacing and proofreading editing
Date: Sat,  1 Feb 2025 13:04:59 +0000
Message-ID:
 <CWLP123MB5473057725D7E085EF6091C2C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::13) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250201130505.1693063-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO4P123MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c811b1-e068-4ad9-aa43-08dd42c10c4d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799006|19110799003|6090799003|7092599003|15080799006|461199028|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2xSWXJGMW1BS1h2QmlzVncyVnNPdEZSSkkxYmpOUDY5V2NKd2g0OHlXS0NM?=
 =?utf-8?B?WGNTd2JQbDI3cEttZStwbVZ0QUFHc2kyVG83NlhRVGM0RzYrelc3SDcxc3JZ?=
 =?utf-8?B?Rk1OZUFRR0JxNWNDcHlEL3NSY2VtdEIxZ0FrT2FVMjJvVmQvR01jR1lEa0V6?=
 =?utf-8?B?WnZ5U3BRN0x1RHQySGVzQlBNVlB3YVBCcjJVcEdUMy9GSmVjaDJqU1dDWXNB?=
 =?utf-8?B?eHJGVFVUb3BBUnNvSjVJdS8xcU5qRFZoQkF4YjM5d2NTMk1KSWk2YU9CV0Rk?=
 =?utf-8?B?WEc0WkJRSkoycFFnZE5UNHBEemdjQ0d5aDJtazh6cGtYNkp3V0FjcWw3Z2NP?=
 =?utf-8?B?ZW0wNUpoQTV2Vm16QnFZdmxnU0xKdWx2NzM1Wkg5QXB6Q25FUC9ZSnI5OFFG?=
 =?utf-8?B?M2FpUXR2L0w1U3VSdDdka3o3SE1qdVJkamxUdGhXUnFhZmVqMnM1S09DMlpw?=
 =?utf-8?B?S3ErcjJrbGVTT3liRDVESWd2ZTN1OTZMeFZCa3dUdFY4dkNzZ1VFNituaG9C?=
 =?utf-8?B?RnhtZisraXczTjg2UEpwckNIMnN5d1FJbEdKRENaa2JHcTNBYkhLc0xNSzJZ?=
 =?utf-8?B?eDJzcTJRTkU3azNRQldXV3hGNFo0OXdsQWJ5SGUzQ0NaKzdvUngzVjJZK3R3?=
 =?utf-8?B?clM5L3QrVTZsR25tVjZockdYMm55M0tuM0VtU2ZISTRVbXNtWmlsVnVtTjZM?=
 =?utf-8?B?Z3VPbHRDbThYclBMOVpZS0tldUtvRlpzd2VXQmJaUmFPZExjL2QxMTd6Sktv?=
 =?utf-8?B?ZjFnZjFVQVM5M2RKQml5ZStNMEFMZmlUNm01L3o1dnZhWTFnMjIyaXlJeXpQ?=
 =?utf-8?B?b1Nxb0dOeThycFMzMW1vd3dOcVluWE8xNHJnZVAvYVNMbCtEZUd0MlJFekVY?=
 =?utf-8?B?UWFZdnlNZy82RmE2QmNiL1ExZFVDb0MzbEtUeWVYdnA2QWxZMldCVlMyODl1?=
 =?utf-8?B?RHM1dXp5WjRaZXprcGt5L2FHM2thSVBIbkRDcW5IaGVsaHBwTWxGUnpWM01Z?=
 =?utf-8?B?RHpUUHkvVWYvanE0dDZCeWRvUzU2enRSd3FMaUNsOGJkcHNxelVqTXFHM1NI?=
 =?utf-8?B?VzV4c0N6WTB1Q2xINUIvUmxtK3F3TU9xWFlCMWRtVCs3WEh3RUlTNk05Y0hi?=
 =?utf-8?B?U295dEhERXAraGxwZ28xOUt6ek9vQ0V5WlFDSll6YXpaR1c3OUY5d0hlRmV5?=
 =?utf-8?B?R2RxdVhvcnNRMkZ0azNyazNXRmZyMVRRbTV5U05Ta3k4Q29FOGx1NVYrTWFQ?=
 =?utf-8?B?bkZUczlQZlhFZ25JcjZSeW5UdmJnYzdsUmpTSGZUVEFjYWljVlEwbFdXVTIz?=
 =?utf-8?B?eEZPR1V4eURKMy96Ny90QmNROWxtbzNscFRqU2VjQ1ZuUWZiaEMwT2I5aFkv?=
 =?utf-8?B?dy92VU91VlNRME1LSHFUcHR1Z1J2SFJmd0F2UXhTeWFiVkdEVVZZQWFmQlI3?=
 =?utf-8?B?dFFVTi9xM1ZNeDZzcWROcGNWRkpVTjQzTUF6RUF3NCtRNGp6TGhnVkUzU21V?=
 =?utf-8?B?aFd4aWRzVE9xZkFJYzR6MmMxeDBqdHB3d1cwU3FrQU1mdTRTeVpvSU52UUk1?=
 =?utf-8?B?VWxoZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEZvanRsbWIza28yYmZPcDN1U2VPTUJuZEhEaDEwT2t0UnNPZVVjK0luRlFI?=
 =?utf-8?B?OGZNeng3R2NWQXkyWDA4RHZRSFRrdStvc0ZVWGptNjRSekxsZWxid0FheEdt?=
 =?utf-8?B?ZFRadXhMWFI1R3NZcmxmQUk0VEV0U2lBSFN4bEVsNEhHdmpNUnc3WW9UNFh6?=
 =?utf-8?B?RXhzWjZnU2VyVEh0ZkFpbm5vaWI4dW5oRktpWjJ6KzI1WXJtWVQzMWZHa2V0?=
 =?utf-8?B?b2FsYW4rR2x6QVkxOFlIQ0o3VmY0ZTBsYVFwRXN0QytvV1o0SldPU0NnTEdP?=
 =?utf-8?B?b0FzRXdWMVpHbUwzRlc3NlQxQWt1NnlveWVjK1FBSFVXeEx4TWZrL0tMKzJa?=
 =?utf-8?B?SytxOGZ5NFUrdUFVREY2d0dybi9GOGJqaDVORHhEbXhGZXo1NmVqKzVhS2lX?=
 =?utf-8?B?UXdLdHQzRWtqaFphTjZMaTBEcnh0amlhT2E2ZmpLTEhXNGpER1kydUUwcnBy?=
 =?utf-8?B?U3N4MzV6b1B1cS9MazRXYkcwUU9lWGNEUlEzOHZxUXhIQmt0V3lCMFI1YmNS?=
 =?utf-8?B?azRhRE9mRFBkWXk4ckM2MGJLMFQyY0NHbEtGVnZJbTZGOUlZZ0pIYVZ5TWtJ?=
 =?utf-8?B?YTlFT2ZCRTlUOTU5WkQzb0lMN3F1SU9EZGlYTXRSWmk3RC9nKzdQSXh1ZENp?=
 =?utf-8?B?SW9VTVpVdFh2OGxUeS93ejNDd2VuVFNMemgrS3ZJQ1lEeitMeE5IU3JXN2dE?=
 =?utf-8?B?Z01OWjZXYVQ2dXk0QVVVcktpRVdDc0Vlc0hweVR4Z3V0cVNoRkJCT1RpZW81?=
 =?utf-8?B?VVRpZHVUZ3d3Tlc4UktUTTJGNVk2T0J6ZlBoeHMrejJrWWNRTHJ4bU1KaVU3?=
 =?utf-8?B?SG1EUnpkWjNoaldic2xJbjhGUlNZUkRsQ3NLZlpCYjRLM0EwSHlCK0k5bEcw?=
 =?utf-8?B?aysvRlNYVC92cDJBSGNGZG1zV095U1l5S2h4ZVpYTVAzME1UejEwVEg4ZDk3?=
 =?utf-8?B?SFBGQm9Ra0UwNER3NEVlZnBITWhzWFNsTEhvNlhIRGYyek1tczhic3Bud1JN?=
 =?utf-8?B?V1hqN1R6TDIzUUdpWVNVOEVVRThLRldVelhIb2FFdkRuN1JnSVdDY253cFh6?=
 =?utf-8?B?ZGRYYU5JUldWNitVZWZTWkh0T1VqdGlCQlphb0JvRHlCRUJlQW1YVzh3cVAr?=
 =?utf-8?B?Z1FJYVBIYUpPZDAzRlNXbUxKYkFIVk1zcVh6SVMwNFFXRWl0MHE2d3F5bjhv?=
 =?utf-8?B?ZEVTT3RZdlVrbm10em83cXdjd2ZtVTc1Uk51eElENytTMnZ6RzVvZVJSN2pj?=
 =?utf-8?B?bmZwMENqRFhkTTlNY1dtcmlnd2xUbXRXNEpZdno3QnhaM3N0ZDM0c3hpMkdQ?=
 =?utf-8?B?UVRFMHVZKzJJWlpoaTc1SXA3bG9iMVJOZTZKbzg2cnBEelQyL0FiV2hRY1pj?=
 =?utf-8?B?WWxvVWtnRkZWWlFsRGowUmZEZkl2RUtiUkNTQ3kvczJ2bGtwcVR2S1VtdmtR?=
 =?utf-8?B?NTZ5ZHJiNEdJWmxPcWluV3FqU2w5MU1Gc1NSSlMxdG5Nb1JvdGFmMEZGMXc4?=
 =?utf-8?B?bkZPZEFkWXZmd2t5U3hoaDVOWUhOK2w0THRvMW9WL3hIaGZadUZwdW81eWQr?=
 =?utf-8?B?TEZITzhHUVlSb2pGbEhHamd6aXFkRUdJV2VldGtLazZsbTN0bUhySmJ0TXRT?=
 =?utf-8?B?VU4xODBJbGYzbW8yeVFEQVdZVUtZTVhLK0V4bm1GWWNlZTZiNENmOWxqTW5u?=
 =?utf-8?B?ZExTckh5aWc4NmgwS0lybElvZ0dCWnRQNkdHNnh5K01tVDl6L3NRb1RFNW1E?=
 =?utf-8?Q?9zzmiMuWVq61NNJkcA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c811b1-e068-4ad9-aa43-08dd42c10c4d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 13:05:06.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6306

Minor edits regarding use of spacing and proofreading.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 48 +++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 927874f20839..cb4797ea8f3a 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -16,27 +16,27 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
-#define ST1202_CHAN_DISABLE_ALL            0x00
-#define ST1202_CHAN_ENABLE_HIGH            0x03
-#define ST1202_CHAN_ENABLE_LOW             0x02
-#define ST1202_CONFIG_REG                  0x04
+#define ST1202_CHAN_DISABLE_ALL				0x00
+#define ST1202_CHAN_ENABLE_HIGH				0x03
+#define ST1202_CHAN_ENABLE_LOW				0x02
+#define ST1202_CONFIG_REG					0x04
 /* PATS: Pattern sequence feature enable */
-#define ST1202_CONFIG_REG_PATS             BIT(7)
+#define ST1202_CONFIG_REG_PATS				BIT(7)
 /* PATSR: Pattern sequence runs (self-clear when sequence is finished) */
-#define ST1202_CONFIG_REG_PATSR            BIT(6)
-#define ST1202_CONFIG_REG_SHFT             BIT(3)
-#define ST1202_DEV_ENABLE                  0x01
-#define ST1202_DEV_ENABLE_ON               BIT(0)
-#define ST1202_DEV_ENABLE_RESET            BIT(7)
-#define ST1202_DEVICE_ID                   0x00
-#define ST1202_ILED_REG0                   0x09
-#define ST1202_MAX_LEDS                    12
-#define ST1202_MAX_PATTERNS                8
-#define ST1202_MILLIS_PATTERN_DUR_MAX      5660
-#define ST1202_MILLIS_PATTERN_DUR_MIN      22
-#define ST1202_PATTERN_DUR                 0x16
-#define ST1202_PATTERN_PWM                 0x1E
-#define ST1202_PATTERN_REP                 0x15
+#define ST1202_CONFIG_REG_PATSR				BIT(6)
+#define ST1202_CONFIG_REG_SHFT				BIT(3)
+#define ST1202_DEV_ENABLE					0x01
+#define ST1202_DEV_ENABLE_ON				BIT(0)
+#define ST1202_DEV_ENABLE_RESET				BIT(7)
+#define ST1202_DEVICE_ID					0x00
+#define ST1202_ILED_REG0					0x09
+#define ST1202_MAX_LEDS						12
+#define ST1202_MAX_PATTERNS					8
+#define ST1202_MILLIS_PATTERN_DUR_MAX		5660
+#define ST1202_MILLIS_PATTERN_DUR_MIN		22
+#define ST1202_PATTERN_DUR					0x16
+#define ST1202_PATTERN_PWM					0x1E
+#define ST1202_PATTERN_REP					0x15
 
 struct st1202_led {
 	struct fwnode_handle *fwnode;
@@ -99,9 +99,9 @@ static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
 	value_h = (u8)(value >> 8);
 
 	/*
-	 *  Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
-	 *  where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
-	 *  and y is the pattern number in hexadecimal (y = 00h .. 07h)
+	 * Datasheet: Register address low = 1Eh + 2*(xh) + 18h*(yh),
+	 * where x is the channel number (led number) in hexadecimal (x = 00h .. 0Bh)
+	 * and y is the pattern number in hexadecimal (y = 00h .. 07h)
 	 */
 	ret = st1202_write_reg(chip, (ST1202_PATTERN_PWM + (led_num * 2) + 0x18 * pattern),
 				value_l);
@@ -288,8 +288,8 @@ static int st1202_setup(struct st1202_chip *chip)
 	guard(mutex)(&chip->lock);
 
 	/*
-	 * Once the supply voltage is applied, the LED1202 executes some internal checks,
-	 * afterwords it stops the oscillator and puts the internal LDO in quiescent mode.
+	 * Once the supply voltage is applied, the LED1202 executes some internal checks.
+	 * Afterwards, it stops the oscillator and puts the internal LDO in quiescent mode.
 	 * To start the device, EN bit must be set inside the “Device Enable” register at
 	 * address 01h. As soon as EN is set, the LED1202 loads the adjustment parameters
 	 * from the internal non-volatile memory and performs an auto-calibration procedure
-- 
2.48.1


