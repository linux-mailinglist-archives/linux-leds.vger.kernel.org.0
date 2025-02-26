Return-Path: <linux-leds+bounces-4103-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F290CA4679E
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 18:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361911887896
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 17:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3069D2236F0;
	Wed, 26 Feb 2025 17:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dmVkhnym"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazolkn19010013.outbound.protection.outlook.com [52.103.38.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906421E0AA;
	Wed, 26 Feb 2025 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589743; cv=fail; b=CGJvXzGvIs/PLy7Bb2bY5PEW3Lt8pOjqBly4uoNUXVl5OnQVGTplrIjJk3tIvu6KgjAYHWGHiW1FbEX8mc0SY3HC2oIj1+fIC+vMv+93aunmze40BFvP8yDPcDmXhKqRsPErDDB7qLZMfafHZ2ztX7NyAT1Y7yAkcp5gUu+r9ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589743; c=relaxed/simple;
	bh=ompSN1MlXYWnABZTzxgc0VrCwjewZXLzoHrJJU/hzZA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u9IyvLNA2CntwKbTs7PihqyZApaDdmFNTuusi7e6+tVg/uwVXAz/fne8HajND25RQ9rZ8AYvxgmUtzso/N0YS3NhNzEqXDdOq2pbqdhyeM3mH61AuZ8K7u5e8HrLAzdITzDrAzG8n4ktfu98W1zwIJ/fcfbBoMYrHH6cJDN7I4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dmVkhnym; arc=fail smtp.client-ip=52.103.38.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaGWCFD5qqNuvf4KuI7hFkcjk9SvF5P3RdvnhjwsbE2jqzPtmApaFWlNzpAlbe33BBffFo/zs+J0W+leU/HG8KmACDkT5WpvEzsRJe4wWBkMvHLhLDNDUiDQ2NWFe3OcWkpZFxDudmDtiMyVEXNyegVp74LOvZ1h1pgs7YBeGU1pxROXKBqv44GMv6IQ3MGqgel35GgpnZGkGYmkQSghUwmrkxs39yOrSRhOhL89kWn4k6QNdA2u+aF42X+1Px0f1OR1wIvb07muPLyx89jvXpCktOreRZJXzTdq/htuo4kVxalNq790A+v8edvEFUshoihv95N/thwU0AysjBa9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAjPT8/wnQdTNOkqQToaCVdskFCgj4mtqFEYhvCkUUM=;
 b=r9IqqKmAyyDNOFklp41+h/1mwKZcCnX7BFRK+KmS0n4BG/gEJNGQwX73FGHqeBqV09f+etRh1k4Th2OP1JK5+hugzC1UDx5dJTD9HBNJj0w/nDub+cTiCY1yOtfiLgJkm+el8Lff+WR6iaxUrPJdRPB74fplA9BgsUdCGQEevwMhkAdVQiDyRKw4DPIxdyYHzjir+o7MGo5GaOJ8L1nAoGVpJ1c/HJ1aqc+eMr2QTf/hDLvTbOfbQ7kfVXj5XRccN3Ee4sXADtRQMdGu7T6Iw8ZtyPw8Mxog0ZNQ4wIzfdY1IZjkwEkNJNEa57E/QYBwhCr/+arYfP08T67vnxAzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAjPT8/wnQdTNOkqQToaCVdskFCgj4mtqFEYhvCkUUM=;
 b=dmVkhnymzY1tQjkbiH3whTagSChvRphQLHQOJPD08Wh3aJGRvrEHMepezlqUkRlPoXxXPmhYk7Y5g/bVBiK0nrCz2AMglRH5uNyplwuAKgUwU8udGPDj0wQ9Izvk8kCbgYIhw8s8GkuSWvx+JW4EKgN5xOb7dCZVto5CfGPDI0NSThUXA4jam5Apq+mY8fFfdGO2T01NNt8H8hwHzuYweHXwHM5QQoe1R7l1yyfPzTnTIjTSfGzRjpToEjcV8nz6CbbYczwq0n1jrM1opkz37eTZYID8VezhWZlPcIzyhQKg0JoTt5A84AwtY2MOQ6hlGTyvAkV6yT/T7GGUAvfBXw==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWLP123MB2803.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 17:08:59 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 17:08:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] leds: leds-st1202: spacing and proofreading editing
Date: Wed, 26 Feb 2025 17:08:44 +0000
Message-ID:
 <CWLP123MB547333EFFFBFFA840225BC02C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250226170847.2349486-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWLP123MB2803:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c5feac-7892-4704-4afb-08dd56884267
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|19110799003|5072599009|461199028|15080799006|8060799006|7092599003|41001999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXB4cndrSG9XdjEvQ2I3Z2xRSmVUODVaZnZkSXByaU10RWpvS2o5SnZLR3pj?=
 =?utf-8?B?c3R3RG9LY0JrNEttNjJ6SWEzOHFBMVF6cFBQOTlqcUVDZlRlY2k0V2IxcnBV?=
 =?utf-8?B?aFUwOGpxKzFWcEFMSmFNZEJ3OTJJRWU3bU1Va1VyRS9PR2xxd2l3QUVnRi84?=
 =?utf-8?B?RGtubHB1UjZHRnM4NkxEdE9yUUU4NkZnL3RBeGtDUUtPcTB3N28wcFpTb2R2?=
 =?utf-8?B?eXZvTWZRL2dBNG8yWC9MZWFFSmhLY2lmQlpxamY2ZWVlZnBseForWmJuanNx?=
 =?utf-8?B?eEdGL2d5UmJ2Nm5MSzFtSi9ueXBvdXEyQmErMzdjUUZqNDhvbWs5U21TZnll?=
 =?utf-8?B?OGxaYVc5ZkZwUHhmYXBDN1p2UGpuand4TW90cG1meCticktqWWdwQnRUcGNS?=
 =?utf-8?B?ZEcyVFZlMFlQWEJLOS92eC9OWEljQkNNeE1XSys0UkluWVpNY1EvM091cW55?=
 =?utf-8?B?VzNOTE5RenI4OHlsMmxZTjlFd1gvVFBXNWhPMnB5TVNGWVl1WXF1bHF6NjYz?=
 =?utf-8?B?dit2Y0ZUY2hqaGVwMEtPd3QwUS9PT0lKeE1SUHp5Z0dMeVhrMVllK2o1TUg0?=
 =?utf-8?B?YitaRHNyMmsva3I3dzRCWnRSWmNPMXN0RXF5ZzdkR0ltZHFpbnA4MExVUEFU?=
 =?utf-8?B?UTFpMW1FWGhzR2w5KzF3TFp5anlCanFENCttZ3NzdWN0WGxJbWo0dGJSOGo1?=
 =?utf-8?B?SWkrWjJQUC9Nc3c1SlpEdnhnbHNQTnpOVC8zT3Uxb3J2QmcwYlZTU3dIVXJo?=
 =?utf-8?B?VUxvRkhHTDlUQVJYU1FKU3BrblpOZ3lhQWd5Y2NDamowUWE1SkpLQk0zeTNw?=
 =?utf-8?B?dXJUaTYwVmttWUYrWUJ1OXJLZzVCTVB0RUVSUm1mNzQ0MlhpNmgwVUs5TkZh?=
 =?utf-8?B?R0k0WXUwdXlTakpYYVlucVpLam4xeVoyQ3BPT0d5cTd4Znk2N2k2cHRnSnpL?=
 =?utf-8?B?UFRjaU8vdWFKYTVtWlpDRHZxV09VMXRuMEk1Rzh2UnhBc3JaaGdGczBKbWhL?=
 =?utf-8?B?RERSN3RsMkdVa1ZDOUdrOGt4UHJBTjhlQWloTHZIRnFsajErdHI4b2FTaGsx?=
 =?utf-8?B?RmN2MzE5amhRRlo5dldRd3BlemN2UUt1TFo3NDZacHNZSlNuMTRmcTN6d0dk?=
 =?utf-8?B?d1p0bmlsS1VFc2pXbTlqVFNtVVBueEdnUStxUU9aaTZrMmJSazZuVVJtWWlB?=
 =?utf-8?B?Ti9xSzcyNzVMWXNBV0dkdXBZRHAxRVNSRkZwVHlBeWl3ZlBqOHZBTzRSaGh5?=
 =?utf-8?B?cldrR1BYakpzb2xSdlF3QjZ0Smkva2FMR0RYYWVsazVhR3J1OTdpVk9nZTFL?=
 =?utf-8?B?K3k4akp5bE9CUnBQUWRQL0NFQlBSckNod1dnMXFTNkpNdlY2cUxYR0pid2Fo?=
 =?utf-8?B?UWN2UW9NNG0rY2FuK3prY253ZUw3dUo5MkV0OVBzRFAvMGszK09paXBmempT?=
 =?utf-8?B?Rmx0bmpCUDlpbUdqMkwzenBQNHRyRytmWW92TVNWQ1kxbHZHS2tKczJnSXo1?=
 =?utf-8?B?aUhLSkp4Zk0xcE90VGROWVRuTS9kUTZyUXBxdS9tWjAvQmVvQitGbzBSbmpG?=
 =?utf-8?B?T080Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWRpcDNEZkxZYjV1TTMrS0lLWUZzVVFTY3BKSy9uVWZYMU9hNmdvUExaK0Ft?=
 =?utf-8?B?TWtGZE8yYnZJeTRYQkFVWGlEQitGOUtsLy9IVjMwMFhVVDJ0cDE5bS8xcktN?=
 =?utf-8?B?Sy94MGRwTUVKR0I4LytkVGlRQmtWSDd1UW9GSXVyMjUwTzBMdUxNRXZ6OHlI?=
 =?utf-8?B?K2NuYWZLM0pqdnNTNnZaZThnc0xyUWhNWk1ISFdoWEluSndCWThXSVJsaTNl?=
 =?utf-8?B?L1Y4NlZabU0vdjNDUmZiMTlBaTBJTHFQUnl1bTRubkh6Z2pUV1JLSkU4NnBO?=
 =?utf-8?B?RS9sM0QyQWUya1c2MldTY3c0ek01L25TU2tSd1ZEUGtORitJRk8yRWJ2d1ZY?=
 =?utf-8?B?c01Sa1JUeEZuSDBHSlhWRTY0NGFvL3FJbWpiWWU3THVIdWRKK2h3Q0pHRWFV?=
 =?utf-8?B?VWgra3hMZXVqSHdUeFV1QzVXZ3VrREdHQXRwSkwvVnB2SG5hOXA5TnFIcmtM?=
 =?utf-8?B?VDk5a3hVSXZTWTh6QnBXenJSRFZpalgzUlBQaTJjM29DelVXWGdENjVDeVZo?=
 =?utf-8?B?OHNycXZLaHdSalloZ0I4eXhHa3VXUWtRU1ZnVGx0R0R6L3pzd0VMWkFza2Yz?=
 =?utf-8?B?dGwybFgybDhEcCtSb2YvOWs3TWowR2UvTW9ER2szS0dENVlESVRlS3hEVFA0?=
 =?utf-8?B?L25YZkU3eUVGempnL3pGd0E4T280OUpRZ2JHdHh2cSsyTmduU1NpOUJqaW4x?=
 =?utf-8?B?VDhTNFQzVFV3SXNkZitsNDJhU2UyTGhQUmpQMEVjZlFMNUJTQ1BrZUNrZTha?=
 =?utf-8?B?cTQxS3ltK3NnRFFpamxlenRZRlE3bVBWZ2FyUWxESWhXS0pLaTZkYVhkQjJV?=
 =?utf-8?B?UTNBTWEyaVZjZ21PWk9HL1owek1ZOWxnZTVkK29VSmtvR3JqMkg1MkhBVFdm?=
 =?utf-8?B?Qi8xNCt3by81VC95eGk0ckdjdGJZUHVlNzJZUlZyS2dJQ0tVa1RocmV2c1h2?=
 =?utf-8?B?OHB2VUIzSy9uZVA1Q2IzRUxKREF3VEdGMjRpYWJ4WmhSTEJEMzM1dU55YWYv?=
 =?utf-8?B?UXRXY1ZHN2VoaEFRdEx5RFZVNTJ3b2h5cGg2UVBiQWUzSkJ5RHFIREVtMVBG?=
 =?utf-8?B?dzk2cE4rdzJTQklZNCtRdXp6MGgzcFhoSU9iazB2TGkxcDltVGNuUzhGcFhZ?=
 =?utf-8?B?alRXWFNBaFpVNmZvUjhpT0VHWkU0NHpiVUk4YkdBTW9PUmEyL2VIVU5Vbmpo?=
 =?utf-8?B?dVhPNFQwYyt6Y2tOYXNjTlN6V2o4a1E5SFd5blQzaTJxQWZMQlVsUVZBMmlD?=
 =?utf-8?B?SnBFWm9IbVlwbWVRVEVrQXRIV1FwNGZVU0tTdFdIcG5oejRIZmVHRm1VaGxz?=
 =?utf-8?B?SUJ0M1kwclRkZnBTdWtYNkdoWHBnWDh5OEptcWx6TWtFaGpxdFFKdXlRSDVG?=
 =?utf-8?B?NStEdG1Rb2R1bnhaK1l0eUdRN0hDMStSVGVGMmFQa2Qxc1c1SlA4QTZtMFVI?=
 =?utf-8?B?SGY3cGVhZGttSkVhU3VuZ3pGeXdpdzdGbG1COUZ1TnMxdlAzYUV1SlZoY3Qr?=
 =?utf-8?B?UjRjVDE3UlR6enlTQk5VaGdYY3NZZ3dadjBOZ1BTamxvZFh6R3h1S05lZ2Ry?=
 =?utf-8?B?anlvbnMxNFM3QjF3TEJIZk52Q1g2NUxiQkFzQy9aV25ldGdzWTlrRTZoWjBB?=
 =?utf-8?B?aVRFdUQxVXpZM0JNYndpYjEycWdYY29YdGZhRStvTlVpTVBvdUZvVVBHRWNO?=
 =?utf-8?B?MVhYenVtb2J4MlJJd3JkZlBoWWFvb3lyTzR2aUhMY2JHL2JOSlhsVjZ0Mm5K?=
 =?utf-8?Q?4+fpubi9JWaKZTOArU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c5feac-7892-4704-4afb-08dd56884267
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:08:58.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2803

Minor edits regarding use of spacing and proofreading.

There is a minor inconsistency in the use of spacing as margin in
one of the comments providing details about the datasheet.

There is also a typo that comes from the datasheet itself.

Change spacing on comment and correct typo.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index e7dce8c26bde..4e5dd76d714d 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
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
@@ -287,8 +287,8 @@ static int st1202_setup(struct st1202_chip *chip)
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


