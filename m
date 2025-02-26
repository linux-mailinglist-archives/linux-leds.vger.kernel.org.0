Return-Path: <linux-leds+bounces-4101-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6391A4675F
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 18:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B64427A2E2D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 17:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1C22222CF;
	Wed, 26 Feb 2025 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cVAOrcdv"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazolkn19010014.outbound.protection.outlook.com [52.103.37.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC75B258CC0;
	Wed, 26 Feb 2025 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589496; cv=fail; b=LjedYyTtdxMBbk/KMKUgzi2z9/z6ia3GCpBFp+/BeVepk6lCsiPoAbHaWB7f2b8lJJ+iEp644q9MnvAHQlDoXvgd8Udz69UTnLFbn8QuNxyi5pF7MCiao7knGUlj3tq9Vpl5WIbu9mOeiQ8V1i9Uv/F5aS26D9BRd/WKOQU0iHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589496; c=relaxed/simple;
	bh=p0aacvA5ygU9bDOuASHjcy0NHMjifSJprsW0aSzaoxo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M8Jc1iLx7t4unPn/kwafzwi8t4774oyyr67iziG0LfBXDN8jVLVAdRXtfrARYl7oBgG58s1NV/PUunuYGE5Q/lIJpuH/zvJbJp+3/9PMFYlXeD/N2PxOQedhf62xveSceSI0a1hPYEtKXv1W3qzDJC4mgqjgzzG5Ds9uyHzu2PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cVAOrcdv; arc=fail smtp.client-ip=52.103.37.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGmVZ8fNpbxzdxK6ShTHQd0Ytu/DQDueDfgv7lrUouIwgVkpOYrF2n1M6/j6McTTnYVohR9DlKk0eaQyY1E6W/cVdDHwWFSIYnOh/Yt/tujhDqipsYxOeoKWR7hwckaoWCxsTceJcEkdiewwVOJzxsJXL3mxUoxbHgXayY3XfPQndc/uKQVgzVK5zG9lckCcVHgQ428hIkCP/8SY7wP+6m2kz9SeG+H+wpobN34bYreJof8zGzMY2KRwxOG44EJRNBQBSH9DqCnClguQUICYJZJGHGKhXFbZMtrWnyUau/DzwHDr9O3AZLySr2BImQqiqH3MhJNQbtFaQ/RITZ2CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIoZUrz/GOM9lrAk9LJoPWZUPtxnSRMqeFfM/mjeHPs=;
 b=IIa+WcChn1OsON3krSYPi98g84Y7g9bhkOLk69GjNAy9wuAcegqI0UPh7+LE8sqYI86qQ/un2ki1k5gewucbC2+Ld6mpyoHb+7tL0M/jBDU3ncpRwrWI2Sgd5PDNYiOj6RaijMdSGHjeGHltnwycw19pe4uKmZ3tVGcoohGoIQNKw3wQYy534RpH4D3l0h1/ucEO4sd4+N1DboIUfeqlbPlm50bAOyDqQL55Gac86us7kGcDCYfy6w/e912CkJBbsjhekJONtMrQa/8/lJTlu4sissLr8zALgQ0SW8jlEUVmKuCBbj4HOeRMzO8iydRAw/tO9EzODasl5B8xDYDjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIoZUrz/GOM9lrAk9LJoPWZUPtxnSRMqeFfM/mjeHPs=;
 b=cVAOrcdv6aH80yn4ms7PxxChVrh43TCDLnp1OWwBuss7HL70hYbuDX8tn6t98tHPC8T0yoZU74gZM+/2oE8FRCF3QBH0zPEiJEcHJJMjjuHaEwW+UPTmzk97kOWYAfG7GjvsOb8N3CU/3Mm2Kpgquw+j08uDfDUiXNV/8fXHObZgla8UP5tfCcTEapjLmFcesdGx2zk/RimVzKl45bszyS1a3wVGKZscMvopf/8Ndc65yJjsNB7i6dJ3kGPInhSTx5XXzcgXkV1Ym3PHTvtfmU/aIBqpL6uv21Cu3CH7lGispzUBj9M2sf8AzScpOYvy8VjSrm4wQetGLRbhPM5YcQ==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO2P123MB4239.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:165::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Wed, 26 Feb
 2025 17:04:52 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 17:04:52 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] leds-st1202 improvements
Date: Wed, 26 Feb 2025 17:04:40 +0000
Message-ID:
 <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250226170440.2327838-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO2P123MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: cb51598e-4110-440c-bc5a-08dd5687af6b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5062599005|19110799003|5072599009|15080799006|8060799006|7092599003|4302099013|440099028|10035399004|3412199025|41001999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6J7uNt3ouhvVstuuA5OdLvqFdQkaWsva+4tVew1ynruPhmi0cCrHT98Vy/Ud?=
 =?us-ascii?Q?nznxRYZDt7wc66rekn+9xC/Tv5cdrMh415hlBOtuLXv1EfjIJ29Rk/EHDZ4c?=
 =?us-ascii?Q?uleKJcUbrugNrCRajtbIqhT0v/i+exDCp+/5SymsToTEzyrL3DBj1HphfMP1?=
 =?us-ascii?Q?voezZN9EAg26EzbEBoGJLKV1neN1jd61jubRVUgP3JZ3LpEc12VxEsvN8+1b?=
 =?us-ascii?Q?U1tclp3FhxAvy5oLVI3vS0s79I573ywEySP64S8Qh2lCcLBFl1Gs9fOJP8l4?=
 =?us-ascii?Q?7y0HEhl8WRAUgx0heBAR299U4+bAbQPCq0lqvIto8cVjX1G+Tl8Ue+ryoN+Z?=
 =?us-ascii?Q?mawSsEu+L06yXLJVvNPkwcbEFDz03sMlJSv+OypOjREM4mQFQnUJTz9S3fzV?=
 =?us-ascii?Q?sTnCmyYtSAvl9VtHI7EAjy7B5Tp0CiUZbEt0SGgIt2Rcxav4QwBoo5yYg/if?=
 =?us-ascii?Q?IRucezlAppwyu8YifnH4MBluuMrnORj0gu/qU9JBeji/KMk8GIHj/OhFjPDb?=
 =?us-ascii?Q?A3qCji23M8F22hsKTiFYuK3nv+EdnHN8hQ0J7USxVZb38tz4oumTqPmfLf9+?=
 =?us-ascii?Q?TnBmn4zKiG4mB62rq27nWVEDiKjP9d4TLOC1XsafYYuOAN/6AST8iPSl0GqJ?=
 =?us-ascii?Q?0wrynzKcD4SVVewypM29+BxvwAsYAkzy6a5JQtVO/L4ddQbVZhEmKOenLdw2?=
 =?us-ascii?Q?I+Su4eOocD8VOsWEKbfgNAMg5KLHYbS7RBFzjPE8560V+HjGmz26nV5K5c0Y?=
 =?us-ascii?Q?rqTDExUwQKHsF7V4VMkFzHfvsPawOe9ehUnFWGIxkMwW5CY4NQISVbqh0Qoj?=
 =?us-ascii?Q?+iRYevJ9BEv5/WqbkWe6lHZZPkrgA3CsI9ufh9qvYHkIw9XFDCU421ToPBaW?=
 =?us-ascii?Q?njVYiSyCj5hE1uPt4VN6ZKorBROysxfrTtkEAd+Ej53Sx077RaKmzbfhgzQe?=
 =?us-ascii?Q?j7+NjcQImRVMPh5fCUCzgYQFixxVBxG5ZHNBlM9zsdZylr4zZpygIOCtOLrv?=
 =?us-ascii?Q?0LdxMxYAi20/XC6IogNforACcdE3MtPSMeFPIjV91w/VrkDxAoMPYU53pFCp?=
 =?us-ascii?Q?PHVWDL2hROp/eZiV4/TBb/d9T8HWC9FgO8mc6LbOVcXayBq2WSxcfQgheHZP?=
 =?us-ascii?Q?dAuiOtIn6jfV8pT7OmANlxhSWobd9ltMlp7kUWDxWVB+5lKNdUXHX4hQuufS?=
 =?us-ascii?Q?f36E08h9RxuZdVQT4YxTlJFlCl47s7deqYcnqsDIuDVmlfTePILmoDwilp1S?=
 =?us-ascii?Q?V1P/7u1yzNVVLRgKLFUcJ9fzvMoftNlODDlsjAZ3jWUjmyFIo0NQISNy7X0E?=
 =?us-ascii?Q?xZDvKixtmSloR/btUjLy8o2s?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uJB7MBNWyC9e13ncfN6dVt0bMMppi6SlVukuT+f6fPzY3bWKSYrs8pcBw8PM?=
 =?us-ascii?Q?R0IhOxdgpc5HpgtFxJ8LLHu75BE/WJUXfn3IIfow6rYoglUDEfM9Ox+lREgr?=
 =?us-ascii?Q?jSgnGFfey4I1yDhmdwzkb+Yrjek67TULqEqYmQspvtoDtXrkK6ckjY1s+/d2?=
 =?us-ascii?Q?On7baVWoAhXkCI0E9Cn9DI4WzOLJJ5rmyOwcql0ujveFvM3KqEI6iZUMA2wY?=
 =?us-ascii?Q?eQ11ZINbQXK7EiHM5KGHvN+029AqtneiwRsvDtfwL/r5g4azdvXaIJEKOUmX?=
 =?us-ascii?Q?13CqB6hwo6KBcqbViXV1fKA9iXH/IApBxfKQHXMWWL25vWZekw5kHnxR1lT4?=
 =?us-ascii?Q?b1HY93Y+/Q/M9Lox1Il2GVEXI8sxfCcX14q0DOnMIDLN3Qre4B7nCVQO+dK/?=
 =?us-ascii?Q?yHpGmvinsGooD538iZODHvKAJ5Yo8XtiJ6qW7Pf3XQ3JSSPjo0dOpliNd2s+?=
 =?us-ascii?Q?0eOGVB2NKaPO1Ic/tP17CwGWb/F0dlyaJINi4/gfu7wBzixCwo54DT7nnjed?=
 =?us-ascii?Q?XG6KeG5bJUkbQDZd64/Gfm84VYq1+zuijIk7vI7AKJ/75PI0TOBISze2bYyW?=
 =?us-ascii?Q?rEfUN+SRSgF/4Q90EcP8Jn6D+LP2bKKQ6XWtE3ghmZn3ff03dv+2qtsqQX7a?=
 =?us-ascii?Q?wcW5wwxTm2deSz08Idg/4ZJ5BmZHx32IuJzOOZZfbpCo8p3rtHa34sbQ0rRm?=
 =?us-ascii?Q?jp4skF0ABJaUIg/El1z62dVhLJdj64PNdjD/OTI3dMTTFlsOKaSBbkr50Jgy?=
 =?us-ascii?Q?+M4dT668viXwJab6ZbvwULyNrONaPjCZMBW/NGplCnJqFpn/2P626/Kco1Wc?=
 =?us-ascii?Q?+zXBm60cWKWSArPEkU8YBZ+uCX3hU05eJW95zCW6h2nQEYrDTrlN4zVseHz6?=
 =?us-ascii?Q?mn6qbH0dl7FNd8lB8XliaqT5vFCcFooxZoPWJ4Iud48CYSgVxVQFvR/APpry?=
 =?us-ascii?Q?Kt4bPoEEhISSe6IOgFR5PrrcOEphaFlmdPW4p+GYjuhPmn/QGKkYf2DmakwM?=
 =?us-ascii?Q?985wfuw+bMSyk5T1c8GFtcI+6vKAQBoxa4HmDbStW376YHARTy1ABORSnB9m?=
 =?us-ascii?Q?fEQ5XU+h6UrvKX+Mpom2E2sIqCrPUiXZJWSYIs8jrPw8r3pEBNwLbICyK36G?=
 =?us-ascii?Q?XEKWXV7xg+xqoPWIoLp3NE3qW7jGBkddNwnXmQpvgdqsOhVLP9qWE+911jEp?=
 =?us-ascii?Q?KixZ8rjGEx8q+RTsNjHkWvd45ZIE3UT59M1kZTNkOkTpk23Wl04zY858sdKq?=
 =?us-ascii?Q?LSE0hyrNyEnlwrNLHt+4ZWuhugCa6NGjCtudceJojANVW7Z+nb2s2u8/iy3u?=
 =?us-ascii?Q?neg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb51598e-4110-440c-bc5a-08dd5687af6b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:04:52.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB4239

Following the feedback received on the set of patches for leds-st1202 that
I sent previously, I am sending separately for your consideration those
that are not fixes with an improved cover letter that hopefully is more
aligned with the guidelines.

[PATCH 1/3] leds: leds-st1202: initialize hardware before DT node

The purpose of this change is to make leds-st1202 initialization more
robust. The underlying idea is that a hardware initialization
failure is somewhat more likely to happen than merely filling a
led_classdev struct.

Currently, st1202_dt_init() is called first to fill the led_classdev
struct. Afterwards, st1202_setup() is called to initialize the hardware,
but it doesn't require any return from st1202_dt_init() or depends on
anything done by it to do that. This has been inferred reviewing the code
and corroborated with testing on an actual device switching the order
of the calls.

The present calling order can lead to a situation in which the hardware
fails to initialize while the led_classdev struct has been filled.

It is important to note that this situation would be more severe if a
patch that I submitted previously [1] was not applied, as in that case
devm_led_classdev_register_ext would be in st1202_dt_init and a later
failure on st1202_setup would mean that the kobjects are available in user
space but the hardware is in failed state.

While I think this change makes an improvement and I can't foresee any
issue, not applying the patch would have no consequences under normal
circumstances.

[1] https://lore.kernel.org/all/CWLP123MB54732771AC0CE5491B3C84DCC5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM/

[PATCH 2/3] leds: leds-st1202: spacing and proofreading editing

These are minor changes to polish the format of a comment for consistency,
correct a typo that comes straight from the datasheet, and add punctuation
for readability.

There would be no consequences if the patch was not applied.

[PATCH 3/3] leds: Kconfig: leds-st1202: add select for required
LEDS_TRIGGER_PATTERN

leds-st1202 requires the LED pattern trigger to work. Without it, there
would be no /sys/class/leds/<led>/hw_pattern to write the patterns to and
no way to interact with the LEDs.

With such requirement, it doesn't feel prudent to leave the selection
of LEDS_TRIGGER_PATTERN effectively on it being already selected,
since nothing on leds-st1202's Kconfig does it.

To reproduce the potential issue that I am trying to explain:

- make menuconfig KCONFIG_CONFIG=
- select LEDS_ST1202 dependencies OF, I2C and LEDS_CLASS.
- select LEDS_ST1202.
- LEDS_TRIGGERS is selected but LEDS_TRIGGER_PATTERN isn't.

Without this requirement explicitly selected, the resulting kernel won't
include the LED pattern trigger so the consequence of not applying
this patch would be that downstream projects and users would need to
figure the requirement out, if their starting base .config file doesn't
have LEDS_TRIGGER_PATTERN already selected.

Manuel Fombuena (3):
  leds: leds-st1202: initialize hardware before DT node child operations
  leds: leds-st1202: spacing and proofreading editing
  leds: Kconfig: leds-st1202: add select for required
    LEDS_TRIGGER_PATTERN

 drivers/leds/Kconfig       |  1 +
 drivers/leds/leds-st1202.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.48.1


