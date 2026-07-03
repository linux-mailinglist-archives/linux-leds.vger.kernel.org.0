Return-Path: <linux-leds+bounces-8919-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +N5sBCmZR2qWbwAAu9opvQ
	(envelope-from <linux-leds+bounces-8919-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:12:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF3C701ADB
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:12:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Py4XeGM7;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8919-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8919-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64DA3306537B
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 10:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9105337A855;
	Fri,  3 Jul 2026 10:58:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013083.outbound.protection.outlook.com [52.103.46.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103633BB112
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 10:58:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076290; cv=fail; b=IzXRtDs7yOKBZO5yTpQUaF9vk9YuEWlqJ3AenEO2sVEnyBvN6xAJEPnvLGeSXN1yX0DfQsWJnbMIpsCt1FvbVLDjw9/E4DPD8mwrfmxdYv+eXywAIl5m6aT3dsyIjh7CucWLSe2CedOJRdZ91Aol4G3yGOlFfdHDFG7ynbLXHwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076290; c=relaxed/simple;
	bh=DWLh+3tmgw6elS+8tNGiHSqWe2L8fMP0i1gujH+ZffQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=SEQn9xXSOHJbW7cYFtT7UOvZUPC+zAQo12PkWurWsy4IadjICZPSkSkdqa/nWQDnCuNJoASv/UbxsGdi4ZnllyBWoDLE1FXqGSoiLHZBSP5NteR1ybjjiHAIDBPH/yi6YAmF8ne9kdmQp3nc5gydEFW/+CIwx+l7tP4B58gK+PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Py4XeGM7; arc=fail smtp.client-ip=52.103.46.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7NxHd02htdMqlDHt5ut4dbonryzLB1UJGkgPyPj0DjP3IBU43sQNVCNEC2VUBPZDyyFn8GDCm6hZ/923iUM0vf5VKvZnd7p3MHtngXuEybQahWdsyliEcNLw0a0C7fqt10NztGo9Kz/MvcOIN5WzIhehlVZiztQqUXN3WyIy1CSbZDJUG7s4/N8E8d4N5ACXu/yl478D5Rom1/thCmKWLTIZCsxz3clUCGtTfDg5a/PlL3ka5EBlMcmZZKvoQ/7xYel0kLtUPM63Y5Jvj5BlG7Qu4oLmCsmyWWYLV3kPP2X4N5QiBj1D51pzHFT65gDKpsq58E1XDgJGTE2SXmQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWLh+3tmgw6elS+8tNGiHSqWe2L8fMP0i1gujH+ZffQ=;
 b=XsY4O33KJuaE3MUgqvAEftVj/e6zxAh8YUcYwclVW3odo30esHH50CYIOVgWWbRVoH84axjgZw0cs3kqsMVazLMQYMeIePEUqOXYxmeW+q34n1HL7NEGEFllCGR38X24wzgzYm+e6mVvHVc2ot/1BW+VrPhkGy5Bi+2SZH9q/bPNd3h3hr4/ATSxo8Dt/iUO1tWSwJImfou0BS0z9K2jQXsd2YGFALhLe2gl6UmZr5yajew0OLFdeysPUnAFOzrgOl+aa4UlBDYoNNxhRtdkEnriJ6zaK4BKhzjiwgtj03uTiSC43/Ks7MpRXO2FMjmOSghCnPAICefpV7C3Mlhw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWLh+3tmgw6elS+8tNGiHSqWe2L8fMP0i1gujH+ZffQ=;
 b=Py4XeGM7qUlu0d+rno0GvmnqJXxAOY40enXFtarLbIOUzCbjGKrm85wbSxv+1mOZ16kEE2sD8tpbc9CHFixDrEu70EYclaBi4MPT1ni86oc69NtfO9r/3mLNt2WARE5YbRIiR52WPnpVWYVNKRZ6SBtvAR2cVEguRbGbf06q1daIVYXq6AJZTzABHGCX/+9ki3a2dEZAiT1efiLwE5N5RendPjrJouRbJu1kARw/1HGDJTz30p6yjdKP5KcFPY1d42RBms5mqgMFk6oBh25BirR1qYKtg+RcVBiG84gD+OIugJlCu8lR7ThCDcd6EBog8KUYxtc8WB751vxdygUAOQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7463.eurprd08.prod.outlook.com (2603:10a6:10:356::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:58:06 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:58:05 +0000
Date: Fri, 3 Jul 2026 11:57:57 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v7 5/9] leds: st1202: fix spurious pattern sequence start
 in setup
In-Reply-To: <20260702225050.A27C71F00A3A@smtp.kernel.org>
Message-ID:
 <GV1PR08MB8497E7329DDF76EF826320FFC5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB849724B0FF00255F4760FAE0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702225050.A27C71F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <5b46ca37-3fc1-28ed-662f-33f33acd9571@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb9a160-fed2-403e-e1e4-08ded8f1f55a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|15080799012|25010399006|5072599009|37011999003|2604032031799003|24021099003|6090799003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HJitTyTVB+wEk3WqI7o96hbJgIOSZ6UXusJLpg8nx7YaAO2/yj3YqSjUDPTK?=
 =?us-ascii?Q?0H0DTxTcXunN1pDMij8rJTuqf2lx+O1akwoSchXIUxd9vppeGMO8yp8mgxxq?=
 =?us-ascii?Q?ZiOZ9Tiln6zpvwT7mFyYAHrDdxSvyUhRvV4QicsAVED1WRBAeNzAWYlSRUcH?=
 =?us-ascii?Q?wZye+TnD1ICbfhPNKQrceTLsCSKXFC+CPzenFA7CK4aLePVxOQq5pLETYCby?=
 =?us-ascii?Q?Mj6ojvyDqhzZgoPKoVOXxS8f9yKXPeExIwitvm8bUbpsvgUJSmel1zPK3Tqk?=
 =?us-ascii?Q?klCcSlagbM4UqQzqMWkosZEKT0k5PwTb1nzt+fqQxyVFut4Tr7YhblpzfUqW?=
 =?us-ascii?Q?zC5SdAJ4jJVPVZrlH5ZXXjH6imhcGGzMwsT7XRHmsOjSau+e67YR4MGrkaWY?=
 =?us-ascii?Q?oZm55Vdv6WXq5x70n9JB1SmeWYkSC+5Q+ISpKaXZgO3rWWStWi35l7xKeR6K?=
 =?us-ascii?Q?pehSutU31hKF88YpIVFAlPdIvtaMqupIAqu/PpGSGeFmhZDiaq2Ree+NiPP/?=
 =?us-ascii?Q?tB+ZA4Qy30K8WttPw5D6Bq5CNEe9CkX5FAOhF9FHqUEU4l+n7+5szVldimUl?=
 =?us-ascii?Q?k3sGDevPfNdSmq0ZPBZ5+VaqJD+xNNWwhbmjEoQV/tavDD9AXlpy5ujnyFpM?=
 =?us-ascii?Q?peIDltXMxZdui9m20UaOVmjr5PrE/zSzbiroWXBR1xnq9FQMt1Ew1zT8qme6?=
 =?us-ascii?Q?RNiRtQd7xJTJT34psIb85if6KWmiyfhyCRTnMzQA1qZ1zIHh3B4Nyj1L8xRl?=
 =?us-ascii?Q?9Tudw/+TYiM3N8kiEeNdKeMWwRowZLIbIW8IfjKYzgS6zjrDcaRGFRjkX7DV?=
 =?us-ascii?Q?CVgERBmHw8/wdxy9ed3iQYdofAPaM3oShLEDfdITJuNRR51nDw0T69AkK/Tq?=
 =?us-ascii?Q?nTjWwuDOjEBUFeekyETN8KblXMez5EDE65qwc1kFQXkkifFK9e6iDTPXGV4b?=
 =?us-ascii?Q?FIw7myAfQLzqxVCXdhf3M7OAeL0Nhg+Sqqgz2LUG/SJTJz6WaRr+r+cEQlH4?=
 =?us-ascii?Q?qgxBS2XJxrDfAx6rjbX9PVKeaP+I8SKBTxkdQ3WAq0hfOpk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XdxSDkhTZ4/44WgwC7kwszs9hW9wQZn6UVmfNRoFtgJ4ERTmZqeYxWFZO5XO?=
 =?us-ascii?Q?bVyxL7O4NxqZWR3G/WVHY0zAkwuKNrw5IMdiepPA20gblbUfAOioaq/kpSko?=
 =?us-ascii?Q?OrUdmUsd5qTRqPxdqRxgojouM6saDeEWaYezWIUPCGFjqG5WOVCbbjCxlEwS?=
 =?us-ascii?Q?laCZSz1ZXrAGPzsxSpEDXicUwm6oha5PkrjFSuNbgia1Y67FPOaLroha7Fmu?=
 =?us-ascii?Q?G0pI0Z4clWXnNLJ6HG/uLFyoNVH6FTnmiV0iLFBjons/HbY+7eHEv6ZREMSH?=
 =?us-ascii?Q?xXUwsg1iGKJnc3HUcnyI76LlFQiJo6IyBM3AghyVnXOZ8nwRniA/kah7TANx?=
 =?us-ascii?Q?8AC+tswr5/jI6JP5WrgOZO4X9fm4Kx7GlGo3o8YBCC8d+WWpn10WYWJOTrLh?=
 =?us-ascii?Q?aHVC1Z/hQQ4abeoYr9JHSJLoM0dgp3FWV8yMaaUq0YwapS/KWYCVbC4nMyrH?=
 =?us-ascii?Q?VhIZXPaalOY1cz2A6/dGREKxJznXYRt/TAJQpMLGnrFWhjOkGqGrJzru2Bae?=
 =?us-ascii?Q?6qvxdLEXdD8m80BT+h6aqiJzcyjGmMMThRzr1ekfVKh4zVSTeoZPL25Rrwgl?=
 =?us-ascii?Q?qACPzouf5KmvkD5fcaSfj/WweC9fPqhcdyAwRphl+xYdLGX38KOARrPzg0+J?=
 =?us-ascii?Q?/G8TjjB6cMgy795Jc1EU9f7TdRP9kyyZgZwf6r0RfmpJtiGLXyfwXyNUMNBd?=
 =?us-ascii?Q?Hcbou7Uu4wlEaGDgjwDOGiUADhCrAnrCXhcDimjGy4Mg4oVeOTphhlKtcP5P?=
 =?us-ascii?Q?7/GRS22kE4YVuGblGdS3HPjmeRyuEpeVQuQk/zFDSifnWRqb2qCiQG2Mffsr?=
 =?us-ascii?Q?zKQ5Gk7bYQgLWNxd94f1druGY8976urmD8luGqWCdqNF7mGy+DglwhTsUCH/?=
 =?us-ascii?Q?HpUf0yE2HJWZFbIkQczSyCdZ5AErcTNvzpOfACgT9InZIDW8szIiQBtQR25v?=
 =?us-ascii?Q?36FT2gljpCZBqvArhUrQi9g67MPg81IBNZXgYM9n6P/0lCuZ9doRFzVVdW/G?=
 =?us-ascii?Q?vH0l9trwDgQbrIKayHPWeuXyce8YyfGH+afQf/YWNZdj7YefzMG9qQ8DF6Mo?=
 =?us-ascii?Q?5QskqcIxyIYpi/yzgdSJbJNjxa39ql/Fh1yHBoqBtScuK6ObdFKSqcEK2NPC?=
 =?us-ascii?Q?58rzDY7MZAyjBQf+Xmsb/qw3IV4w9kesgJ+z6JQuVLe6BArfdVc7NNzgnu+l?=
 =?us-ascii?Q?7X75UPlWKGVoetMV4Bv/f072bNSmTmrHmu+CXn8AC9zWzLfFH6W3Idk5jJEZ?=
 =?us-ascii?Q?NtvZHfgu55gWQ6o6u3L8NzeeXmBVKubLWFfq8lFfajBXeuiIPYhB0aOEcC7f?=
 =?us-ascii?Q?wO5BG/a20G+QEuWUt/d78A2T6i6/Tjqm/FI6iuQTI7oSrN+RN7/X2s01n3jL?=
 =?us-ascii?Q?xxoIfKEEpDrMSxzLBmNAzv6VO76apLc8CkSCxFY1A6CGxdJy2e2ryQ5DGFgZ?=
 =?us-ascii?Q?ZwsrE9zewxYLN6zxVROk8s11iCikpDFh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb9a160-fed2-403e-e1e4-08ded8f1f55a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:58:05.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7463
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8919-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DF3C701ADB

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] The driver assigns a sleeping I2C function to the non-blocking `brightness_set` callback, and the blocking callback ignores brightness scaling.
> - [Medium] `st1202_led_pattern_set` fails to truncate patterns, leaving trailing sequence steps active.
> - [Medium] Per-LED pattern configuration in `st1202_led_pattern_clear` destructively overwrites shared global sequencer registers, breaking patterns running on other channels.
> - [Medium] The driver leaves the hardware powered on upon probe failure or device unbind.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

