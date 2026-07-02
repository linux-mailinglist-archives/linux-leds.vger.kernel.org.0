Return-Path: <linux-leds+bounces-8857-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XCT7NsOtRmrebQsAu9opvQ
	(envelope-from <linux-leds+bounces-8857-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:28:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C846FC085
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=jP5ck5LW;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8857-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8857-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2286300623D
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A471433D6FC;
	Thu,  2 Jul 2026 17:34:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013083.outbound.protection.outlook.com [52.103.35.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1333AD9C;
	Thu,  2 Jul 2026 17:34:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013643; cv=fail; b=KSZ/YcbQqZCtabEaJTl6cL/yB1w0fNoxqMJiYl4Iv6kyYZQ7a8sGMVP48xffsUEYYjkdPQMPrqW2Yqln/+2qO+yNnPdiMParcztEe4ZLo50DShcmNkgA/VWWv8iPrgEvy+/si3kSdHJ5Rs51spF+btO2To4RXZpToHIvQFRuskA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013643; c=relaxed/simple;
	bh=GedpyYv5aeY+rqLn3m2X3zcAUUP1L/IYqt/BA2qbr3s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DyEbf9q8ZqeRp5VT9qv/0XuAiYyerxaXPm/Uh2HBtanMqHaTHY+ujpe5srODkBT2HXVEjjsCo3uTWSra7+MuQAi54SPm+4ql4PiCKsNSJO0uzg4nZbtqnjN2qfvOhNf6AXZtxZ52PSSzASSSFW79qWI+zcgCA2D2zEdvnwv8Epw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jP5ck5LW; arc=fail smtp.client-ip=52.103.35.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QggPE9aHmBgyi+Pwoy16SkinFxW+5IDVC2gd4tWaob0RWqIInKZqNBoJcUZ6vsYO4munOjIxD+X237fZzjcD4GEEg0/uHq/SiPHzkKZoP+Y6pj03uX2y8dk0z+b6lgp2b4SF/sLfiTOiFdfUGHt7DavN4gcPAiQHjNC7+9UviYKYHKoIyonj8v1IjU9vJIh5ejzDOtWQAHy5+mr6Fn6Vd+M4thovkKu2YgouQG+AbGmeE3WtEqaLr+d/P02LyR1wSB1eAbx3Sk+wjleozulsZ5UAAfi/SVF47rHVe+JbNcJXUiOYYH1Mb5xFZHJGAtmqB8OjP66UtmunydY0WRMFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejgNBu0jHl0R7mF9RgTkmxb9iodItRJrZ2qtYavnKxk=;
 b=np5dSaB4RhR5UcSUDfROpz7qvnnpjSXXEs9g5TS30ntWNTBAA2BDYpDOxXIUQPzuLg0dsl8hWsq5CulVcitGj7HRbJOFBYCbN+4Fkni4WOKsDtFPS0hIliM8vXIun/JjbqVRVzwOB5IDbHhJyAOrBmEKHWB9BsNkfbTm86bQrlDolnhkXwRa4coyRinphjkf9oqCq1iVlSAkhzVrNKg2kI6rfmQ45GHETzxiO/GTvV/xXN3LTk1O0zQDLlkZJbjQMzEygniuT99hKMp+AU9JLiDr7I8D9TsAQwfUKkK091M/WwGwVeaMrW+NNEHtUcxDcczOZQYT51ghh8wUlriv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejgNBu0jHl0R7mF9RgTkmxb9iodItRJrZ2qtYavnKxk=;
 b=jP5ck5LWhoNnQUz8+k5YYRz6F3QdFG+p4+Xb0wdY42D9DTA5krIy+3rkPPMUKJnYeyMnV5l58itH1SqcLSwzPuD8mDFdosDFQIVMAFTT+4M2RnBdaYNPR5Tn7Y8OCyy6Saze5HBVZsUbq3GcBkTLdhJxNL2hkXpa8sat5PZLV7/VFGOiK33lEvyI/2OHRk/JT2+yXldFYwYE6iMaLM5QDiMqaoNv30KXuEe7ctKhuh4gN7X10VM7hrR4WKSu5u9inx5nFQOqcPmKy7Rsv5udfDIATfd/nvcdetGUYYpXF+fOmZNhMvH23in8v+K9satkuyAJqAB1EFggwkpsrrZfAA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 17:33:58 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:33:58 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/9] leds: st1202: fix multiple bugs in pattern engine and brightness handling
Date: Thu,  2 Jul 2026 18:33:45 +0100
Message-ID:
 <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702173345.2598844-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PR3PR08MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c26699-5417-43b0-1823-08ded86018df
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|51005399006|5062599005|19110799012|8060799015|12121999013|37011999003|25010399006|15080799012|24021099003|5072599009|23021999003|10035399007|40105399003|1602099012|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0hGSy9HMTA4dDJzMlNIcEw4Y2lDRmtqclVUWGNvTGhSL1l1U0MrT0U0ZnR1?=
 =?utf-8?B?d21kWWt5dm9CamN4bi9Xd0cyMm9Ea1d2NVk2bUJualF3alVoWVM1U2RhcVI5?=
 =?utf-8?B?RTBaQlRRQnAza3hCRUNSUm1BNEFPQTZvL1NKdlh6NUwzUlZSSFNBMmd1c3Av?=
 =?utf-8?B?bm16dTU1UWJTejZQRXBhRFJtbDd2b1RTbkpJa08xYnNBRFIrQVdnd09mSEVo?=
 =?utf-8?B?SjhmNlBUcW4wQmxmenhnbmpOZm13VkpyeERYcWZxRWVzaWVMUjhHVVRnb1Za?=
 =?utf-8?B?S2VidjZzSGlGWFZZMm5mbExkWVJhWGZ2OHFmYVN4V2RBZXJCTmQ5QzN1Uzd2?=
 =?utf-8?B?NENhV0kxaE9VeTdMcTBVZktXUVNBUUIrM3kzcW1ZWW93eUNIbE8xdEtFZHNR?=
 =?utf-8?B?VmNtOUs4eEk0VDRQNkJCUFMvdk1NWnhqZ2NRdnkvOG5tTTJDZVgrRXI2RGsw?=
 =?utf-8?B?a1pHczExUisyMXgvMEFlNUxMRFVvN2lQbTJGd1pUTHRZcXdFbUZSVzRJdStK?=
 =?utf-8?B?enhqVVpQS1dhcy83UTlCYXBycU43Z1M4c3Zlc0laVitJakt2SS9aNHd2UEJU?=
 =?utf-8?B?TDhPUlJjdUx4aEtvbVIzYVE0OXBsU1ozOGJrYWxoU0tmeDVvZWlQNEVPZGpm?=
 =?utf-8?B?QUpWQzM0UEFXWGdob2lwVmkxTGlibnlad2NHNkFOaG5MYytYSHRDRmZvbW1W?=
 =?utf-8?B?WDFJKzNUUDV3bDBNWTQ1U2YxMnVpdUZhZHJOREh0SE1PLzRKdTh5VThubjhO?=
 =?utf-8?B?YWVZUTdGbUN4VHR5SWk2cGpBTU5UYWNNK2VVNDkxcjZjdUhkcTNWd1Vua3Vu?=
 =?utf-8?B?cnVmNXA2NkczdVAxQlNka0dDTzBiVXpTUkNPZ01Qam9VVTIzcDFGVkY3UFha?=
 =?utf-8?B?Y1hyTGx2dkpPQldES3I4OHBWZkZaMlpJQU1mZlVtL1JjZlQ0eW9yZkNhbUxI?=
 =?utf-8?B?VVVCaXQ3V0dFUFFFN2pJM2RmUXZUVHpUSDdFUVBBWTBTQklCcjBVL1AyNnlp?=
 =?utf-8?B?REJXRktoOWYrYnQra1FUT0h5S1grZUd1bHdkMlJxbWxhaWlPRVNYQWZWdHBP?=
 =?utf-8?B?bzA2Qk5Ldk04cS9rMVMyanYzZmJZWThSQ3FZT3NjMXBpdEFWL1BZM0djNFl6?=
 =?utf-8?B?ejVaK0tHeEV1eFJua3Vmbk5ROHVaTGFlRENuaEpFZzZabzRQRTd6dnlBMHF0?=
 =?utf-8?B?ZmRwWURqamRYeVJZMkVGTXkxeGVwLzQ2OGJ0MlBrVHBsR3pIRzkvU1pkVDlN?=
 =?utf-8?B?WER5c1FGTW5VTWNsVDdwWUR0QUpuMnV5MFVXOUFUdG9IQk53QTRHRmljYWJv?=
 =?utf-8?B?emF2NEY1YW0zWklMaVNqREh4OVRndjI3K29YbHQ1Nnl1a3lmK2ZKRDQxMW93?=
 =?utf-8?B?bExsMlZjeEhRSXdKdmp6Nk52VEZtblhpMTRDUTJBNDlsaXNmZTFUTjFWN0Zl?=
 =?utf-8?B?YWpxdjhKNmpkdmxpN1dVRnN6UVVWbEo4NXNWbHJVUFRrRllqaWFValljUld0?=
 =?utf-8?B?MjRqaFJRcVhVMDVTVTZPdytmNjRWSy83UUlwYjM5c0lWanJwV2MzM2Nkb0dN?=
 =?utf-8?B?WWdaUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTkzbkJyaHh6QkNDdlJVS2k2YkVYMWEvTUlNaWcrRjFlV1BOekJoN3Z6K2dj?=
 =?utf-8?B?TWFOTU5hL0JCT0t6QVVPb08wNTVHc3BwalROdndyWGo4dHlZd2pOaDMzSjRN?=
 =?utf-8?B?d2tURWNkd3Z2STlKNnI0SGMyVFd1d1VtZnNjRVBRU2ZQOUxtTlhNaHM4Z1ox?=
 =?utf-8?B?RXVzOVRWbVB5a2N6NjZsREtjV29JaVpXTTRhSHVocVRJaGo3ZExJWnBqaEpj?=
 =?utf-8?B?YlRmMHVzSGYwRVVub3FmUlBja1lrUzBPbmtFVE5kcTdpOHhPeDV6VnI0K1BM?=
 =?utf-8?B?MnBUSHZDT1RiZUR0ZWxnc29pTXBHcEpwV2RuMnJ6UzQ2U1U0VjJUYXVSaXlZ?=
 =?utf-8?B?cG1TUVBZOTJES21IcEZEUmxGL1h0Y2pNS3dTMm1ZYnBMaHBjdGNoOXdQVW5O?=
 =?utf-8?B?RkJ3SGNYMHVCeDFoTlJFZzFzazJHaG5aMFZncENPQmdaTno1dUdnOXFQM3dy?=
 =?utf-8?B?SnJyN0lESzJkUVdmYW5YSkRWUmlvS0V3TG5iZnkyakJ2VGZJbVl4YW16RkhZ?=
 =?utf-8?B?aGIyZDRBMFJYWWZnbDlXaXh0ay9pSVppQTBzaDgxWXVUTzRSRUJ6cnlLbG1Y?=
 =?utf-8?B?NnV3bkNIUHZrR01lUnlEZUlXUE5ieU1oWGVDRlhmTlZIaWVkbzNkYUl2YlNY?=
 =?utf-8?B?R1pvRWppc3RveHJ3MTNKT2prT0tyUFowalBjanlCaEd4bzN6ZFQrdmlydlhN?=
 =?utf-8?B?R3lpU3BlZkVIWEhxZzh0SHArZmtHVDIyZjZ6dlI0QjVQaGpXd2lvS0pBZ1FD?=
 =?utf-8?B?bENrTzlWMk1nTmRvMnhVM1hkV3FZbjhlOFI1UXcwSzhGUVl4dXhWZ1lJb3F5?=
 =?utf-8?B?V2tLQmFlYldUcTZFSUpZaXNjRGhWRy8wa3lTanU3ZXF6Q0xpY2h0dUNnQmp3?=
 =?utf-8?B?Y1RPUkZ1ODBndCs2aXVqaXBDeElSa3A0WGhCaE9NN1BDNTB2ZzVOWFYwWkhq?=
 =?utf-8?B?ZEhKN2VDSUI3ckwwSW9STUNCM1JNcVN6K09iemZvTTYzZ2NKTXU5eVFHd2Fp?=
 =?utf-8?B?TTgwVTRaTUZOV2JWTXE5ZjF5NDZKeHZrMVVjK01uVjlma3JNY0hsVFhGQ25o?=
 =?utf-8?B?RWJHZ0NHR3RqK3RMbmRyS043d0d1MUtueTBIaFJEKzFyUHlkQ3ZEN2lxS1ZN?=
 =?utf-8?B?aFlqd1hNWnFwb0dHbDZGY0YxSDRLa05sdHFXYkJ2NFIrSWxSeERsNUY1dmdF?=
 =?utf-8?B?QkJKQWlEQ1l2OUdMVkZ6aW4yNFpYZ1NZZURsWDdZZXR2RC82MHBmZnZqekJa?=
 =?utf-8?B?UlNVUm9GcmdsSXdNbDZPb2p5V25kRmNaZXhlcG9vZmZiOUUxQ0U3VGtuTm1t?=
 =?utf-8?B?SFhjeisxSWNXL01PUVdTelAyZjlxUlpSSTRSakNaSnlaQ1ZLeTFiR21ydmJk?=
 =?utf-8?B?UnEvK3NCOVI4YmdmQ0VZN0hCdjQ1RHU1ZDBoZmtMY09XMkt3d2dPTndscEgx?=
 =?utf-8?B?QkZwT0NNb2JCby8ra2orTjYrV2dPZE9GcVR3U2NZQmZjY0g0a0oxRE9IRTVR?=
 =?utf-8?B?QnhqNzBBVEtZemNTUFhtNWdhVnUyWFZXWHV5Nlg3d1IrZTArZ3pTMVZmVDBV?=
 =?utf-8?B?cUVkVzNHM1hIYllSa1VlaGVOTVlVTmh5QmNFcHVIb2xCTVZOQmJHUGJjTFN1?=
 =?utf-8?B?SWc3T0pwM0lXME8xbjE3cVhLSEtXeDcvZC9QZEx2eDBvMzYzVTVuZnU5SFZ3?=
 =?utf-8?B?VEJqQ2ZOQXhJaXJ1YkcxOTYrM2tUaFdJcnI0MjJnS1lIZVZNcEUrZGpNS1Bs?=
 =?utf-8?B?dmk2TEdJN3daUlFuQ25tRlExaEUxUUJINGp5RGx5ZjVEWUhwamVxSkNZNXpv?=
 =?utf-8?B?R3o5ZGVHYjA5NkpDSU9sRHIyQnZhRHc4cksxcmFDbVpDNWx6bmYyRWp3a25s?=
 =?utf-8?B?a2k3NTltRTM0ZW9ENlVJOVRXdTFUdVhXQlpkS09oRFRMUUlMYTZweGtFUTJH?=
 =?utf-8?Q?MRj4+CJuC20bzY7QALiT24TO4j2Z5ubX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c26699-5417-43b0-1823-08ded86018df
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:33:58.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8857-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0C846FC085

This series fixes several bugs in the LED1202 driver related to hardware
pattern programming and brightness control. The issues were found during
testing on a Linksys MX4200v2 router running OpenWrt.

--- Pattern sequence not stopped before reprogramming ---

The LED1202 datasheet (section 4.8) states that writes to PAT_REP and
pattern duration registers are only applied after the sequence completes
or is stopped. When running in infinite loop mode the sequence never
completes on its own, so these writes are silently ignored by the
hardware.

  Patch 1: Stop the running sequence by clearing PATS in the
  configuration register at the start of both pattern_clear() and
  pattern_set(), ensuring the hardware accepts new values immediately.

  Patch 2: Validate pattern input before stopping the sequence. An
  out-of-range duration value should be rejected without disrupting a
  running pattern, so input validation is moved ahead of the sequence
  stop.

--- pattern_clear() leaving hardware in inconsistent state ---

Several independent bugs in pattern_clear() left the hardware in a state
that affected subsequent pattern or brightness operations.

  Patch 3: Fix the duration prescaler formula and the skip marker written
  by pattern_clear(). The original formula (value / ST1202_MILLIS_PATTERN_DUR_MIN
  - 1) was off by one, producing durations ~22ms too short. Additionally,
  pattern_clear() relied on the broken formula to produce register value 0
  (the pattern skip marker) by passing the minimum duration. With the formula
  corrected, pattern_clear() now writes 0 directly to unused duration
  registers instead of going through the conversion function.

  Patch 4: Set all 8 pattern PWM slots to full after clearing. When only
  Pattern0 is restored and patterns 1-7 are left at zero, the cleared
  channel blinks if the global sequencer is subsequently started by
  another channel. Setting all 8 slots to ST1202_PATTERN_PWM_FULL ensures
  the channel outputs a steady ILED value regardless of which sequencer
  step is active.

--- Spurious pattern sequence start during setup ---

  Patch 5: Remove the write of PATS|PATSR to the configuration register
  in st1202_setup(). This accidentally started a pattern sequence before
  any pattern data was programmed, producing undefined output on startup.

--- Brightness control broken while pattern mode is active ---

  Patch 6: Fix brightness having no effect while pattern mode is active.
  When PATS=1, the LED output is ILED x Pattern_PWM / 4095, so writing
  only the ILED register has little visible effect. Rather than stopping
  the global sequencer (which would halt patterns on all other channels),
  set all 8 PWM slots for the channel to ST1202_PATTERN_PWM_FULL before
  writing ILED. With every step at full duty cycle the output is ILED
  regardless of sequencer state.

  Patch 7: Disable the hardware channel in brightness_set() when value
  is zero. Previously only the ILED DAC was zeroed while the channel
  remained enabled, causing residual current through the enabled channel
  and a visible dim glow on the LED.

--- Input validation ---

  Patch 8: Validate the reg property read from the device tree before
  using it as an array index into chip->leds[]. A value >= ST1202_MAX_LEDS
  would cause an out-of-bounds write during probe.

--- Documentation ---

  Patch 9: Correct and extend the hw_pattern documentation. The maximum
  pattern duration was stated as 5660ms but the correct value derived
  from the prescaler formula is 5610ms. The repeat field documentation
  is also corrected and the brightness range is made explicit.

--- Testing ---

Tested on LED1202 hardware via I2C. Register state verified with i2cget
at each step. Correct LED behaviour confirmed across pattern cycling,
infinite repeat, pattern_clear, and direct brightness control with
trigger=none.

--- Changes in v6 ---

  In response to automated review feedback (Sashiko) on v5:

  Patch 4: pattern_clear() restored only Pattern0 PWM to full, leaving
  patterns 1-7 at zero. If another channel subsequently starts the global
  sequencer, the cleared channel cycles through its PWM steps and blinks.
  All 8 slots are now set to ST1202_PATTERN_PWM_FULL, unifying the loop
  to a single pass from 0.

  Patch 6: brightness_set() stopped the global sequencer via a write to
  CONFIG_REG, disrupting patterns running on other channels. The sequencer
  stop is replaced by setting all 8 PWM slots for the channel to
  ST1202_PATTERN_PWM_FULL, so the channel outputs steady ILED regardless
  of sequencer state without affecting other channels.

  Other pre-existing issues identified by the automated review are
  outside the scope of this fix series and will be addressed in a
  follow-up submission.

--- Changes in v5 ---

  Patch 7: Restore Pattern0 PWM to full duty cycle in brightness_set()
  before writing ILED. When PATS is cleared the LED output is
  ILED × Pattern0_PWM / 4095. A prior zero-brightness hardware pattern
  leaves Pattern0 PWM at zero, causing brightness_set() to have no
  visible effect despite ILED being set correctly. Found through further
  hardware testing.

--- Changes in v4 ---

  In response to automated review feedback (Sashiko) on v3:

  Patch 7: pattern_set() did not re-enable the hardware channel before
  starting the sequencer. If brightness had previously been set to zero
  (disabling the channel), the pattern would run but produce no light.

  Patch 8: reg was declared as signed int but populated via
  of_property_read_u32(). A device tree value >= 0x80000000 would be
  interpreted as negative and silently bypass the bounds check. reg is
  now declared as u32.

  Other pre-existing issues identified by the automated review are
  outside the scope of this fix series and will be addressed in a
  follow-up submission.

--- Changes in v3 ---

  In response to automated review feedback (Sashiko) on v2:

  Patch 1: Extend commit message to clarify that the LED1202 has a single
  global pattern sequencer shared across all channels, and that stopping
  it in pattern_clear() is therefore an inherent hardware constraint rather
  than a deliberate design choice.

  Patches 3+4: Squashed into a single patch. The prescaler fix and the
  skip marker fix are tightly coupled — the skip marker bug was a direct
  consequence of the broken formula — and are clearer as one change.

  Patch 5 (v2): Dropped. Resetting PAT_REP in pattern_clear() is
  unnecessary because pattern_set() always stops the sequencer and writes
  its own PAT_REP value before restarting. The reset introduced a spurious
  failure point without fixing a real bug.

  Patch 4 (was 6): Start the clearing loop at Pattern1 to avoid writing
  Pattern0 twice (the loop previously zeroed it before the explicit full
  restore).

  Patch 5 (was 7): Simplify commit message — remove inaccurate claim that
  the SHFT bit is never re-enabled after probe; pattern_clear() restores
  it during probe.

  New patch 8: Validate the reg device tree property against ST1202_MAX_LEDS
  before using it as an array index.

--- Changes in v2 ---

  Patch 3: Fix commit message wording — programmed durations were ~22ms
  too short, not too long.
  Patch 7: Fix Signed-off-by typo.
  Patch 10: Add missing quotes around commit subject in Fixes: tag.

v1: https://lore.kernel.org/all/WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v2: https://lore.kernel.org/all/WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM/
v3: https://lore.kernel.org/all/GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com/
v4: https://lore.kernel.org/all/GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com/
v5: https://lore.kernel.org/all/GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (9):
  leds: st1202: stop pattern sequence before reprogramming
  leds: st1202: validate pattern input before stopping the sequence
  leds: st1202: fix pattern duration prescaler and pattern_clear skip
    marker
  leds: st1202: set all pattern PWM slots to full after clearing pattern
  leds: st1202: fix spurious pattern sequence start in setup
  leds: st1202: fix brightness having no effect while pattern mode is
    active
  leds: st1202: disable channel when brightness is set to zero
  leds: st1202: validate LED reg property against channel count
  leds: st1202: correct and extend hw_pattern documentation

 Documentation/leds/leds-st1202.rst |   9 ++-
 drivers/leds/leds-st1202.c         | 102 ++++++++++++++++++-----------
 2 files changed, 67 insertions(+), 44 deletions(-)

-- 
2.55.0


