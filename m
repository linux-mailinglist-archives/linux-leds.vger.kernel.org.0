Return-Path: <linux-leds+bounces-8927-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1IcpGaWbR2qFcAAAu9opvQ
	(envelope-from <linux-leds+bounces-8927-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:23:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C7701CC1
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:23:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=d4XwEznh;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8927-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8927-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9AFAB3012552
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 11:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114DB3C4175;
	Fri,  3 Jul 2026 11:21:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011034.outbound.protection.outlook.com [52.103.33.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720BD3C37A5;
	Fri,  3 Jul 2026 11:21:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077701; cv=fail; b=Lew8ztMGZsl9DjuXMnXIahaB4NBLHlQA4SX8kY2c0EOx6yY69oErW5MpX0gj+LapgenCITGw/CuUlfnGUbXUG7GCW1poWMXkz3+vCagoAgueMiXfzfzxH5qxKm/taRo9qZ+HTMAXKB/H8MsY4klL1/JTY2xZOTNB3deWwyjO5+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077701; c=relaxed/simple;
	bh=S21QlN/zFk2ysdJ5J6hWdsJrgqeopsmPxKIvibIo8Uo=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=hipycxGKu2O0Qx3C5OP51M/uHSAPOjg20F94yjFgC5PYjRVu8q1jiHv3axbKInY0EvPkdb5QoKb9QEr3krsHi9IcLzuFTurqVcPcqd/Fwn19vclDW/ZN2Adxt2t/XzHHj+GoAN0RT6cbuH5MjGJ7Mn8IuIBReGVclmGDS0UcJKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=d4XwEznh; arc=fail smtp.client-ip=52.103.33.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9HBCILv9q/ydbUh6Mx+9b1+72eqn1aDACYE5KoP2GlsULT0FDNHjn18UEzDlRuUXH6peImwZwQ/vSYRMcEQMwAoLMVBdRs80C1rBkznGDbBrH9q2tKQmG1oqyjE7RJIY5C3JeaebkC4uYf38rGN1lgmyyPnabFAOmLv0XPg/GzG8RDQ1v9TDfWGKM3KFZ1rjQhTP1zdfbgttJUf/Xhk2YWAGZH0fQ9nED5AaMIFc5QLjz4FTKVNZWlm6e+qVjJtOTLPNaurWPqL9OH5qQqlUc2TYK8UpkVSkiFjUmoVwNAqWl5rzyrOAykiXFnONmPmKUww0mJle5LtHmE7lU/yMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp3mAo/yZgZ3jXZf7iMkga+VZNMciinDjkdwDmkGwL0=;
 b=c0jayeEKaaa7NqeBF2GMm+jJJJCKaIXUZtCaoEpgJU3tDqFw89KVRJEOtdsRcaUmHhdOF7hwzDAYWEniHZlfeq0yGkkO8jQnn+QpEg5voJmdsc/3/IU2FNQP2JOnT3rwoa4rb+IqB/QyrnMo4uNCEAKflXIt8RaHv4hGA+xO2m8175i7c0Rza/u87JjbPMqPEL4ciWt4q4j0rJNUd+iWrO8t5LCsh6nlFbxjN6Zu/UT/G9XJe+DCiHg94Z0Oz9v3ikomAaCg+x58Ta7ieY2NAzzr+3pviCL/8S2SGTTs0Yx2QXRFOaMoqs5thYRx/OctDE8xMHvXD/raDdE0EjQU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kp3mAo/yZgZ3jXZf7iMkga+VZNMciinDjkdwDmkGwL0=;
 b=d4XwEznhbAsQ0Utb37RvJkp83ybNrz3VlS8tp9/LuVjHF+jsx/1L98Zf1kblJ6DWYdEhrctTZK/n1Sl9kXxdhDR90Igb7/awPzsqnowwl1qjClaUKR44vkwMgNfIHpsyAf06XjySg44jeoOo990klvAUJYBfl1zxhvuhDFASbg72UH0PTcYNuYaN8gOkLfF35Qq0OXMdDZjjLZcouw9YZE4XETARr0R/In+4vhfheg80XqF+Wj8u5M+ow6QcTjYJFNDWCpJK3Gs7+Dc1P9zBJ6Rtu9DA3tC7lT6ySMbLEGPkwV/ZV6/jx/kgj35g/HnNWVDx6FleCOufkJgVhBPbUg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AM7PR08MB5463.eurprd08.prod.outlook.com (2603:10a6:20b:106::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 11:21:26 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 11:21:26 +0000
Date: Fri, 3 Jul 2026 12:21:18 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org, pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
    linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/9] leds: st1202: fix multiple bugs in pattern engine
 and brightness handling
In-Reply-To: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Message-ID:
 <GV1PR08MB8497CC42E6B4C8F7A5545209C5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P265CA0313.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <970a5894-77c1-2dee-029f-11fc10aa48c3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AM7PR08MB5463:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d6dfa8-62a8-490e-dbcd-08ded8f53868
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|6090799003|51005399006|19110799012|41001999006|23021999003|37011999003|15080799012|24021099003|5072599009|25010399006|2604032031799003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SGXTUdVkYOa9GFwbHfSjiMyScfUKItr1lxFTXzgk5ItAGBkciiBLKGrzYoIp?=
 =?us-ascii?Q?JwOAVZKx5WEGB+jDvWQKidkPhE5VL7jQ3jn1AHnJM7Tt3dOPV/AQ6y/U62G9?=
 =?us-ascii?Q?xgwxsFZ33TL6vq//fqYF/3m0Qb6en0lGG2g/a6U8yCdKUmRhois2o6m8uo30?=
 =?us-ascii?Q?t28an61ibPsygQiC82A4kKbg3VonEwojcED1hQeDn4wQToCo2zLjYz7IKu+9?=
 =?us-ascii?Q?T/u+zcIKjsal2Ofhc9/c3MzxvxHkG9IkSJQVC+kgsEP5wgUvZYcTP8jbGVfy?=
 =?us-ascii?Q?nidl9a/MHEpAtqbPz7k4/iOguI3zQ+b5RbdFWNO0AH2+Spel56rl8eSeAqIa?=
 =?us-ascii?Q?MGnq+y6yIEQ75EE4gLaWA5qQlCDGmNWEYSDHVdjPDkYh3Ha45TU9LQfX6J0S?=
 =?us-ascii?Q?6VFkffGv1IM737bP/wDiNME+5BKQYhSxyyDAqGiIl+qFi1HOBK7BsJjr2Fho?=
 =?us-ascii?Q?mK6PmjwuopuoBIb+LMB+jP6pwj8Ltw6PF/3EIBm9Kd7P14ywzpM2en5m/BzS?=
 =?us-ascii?Q?686YLEuYNj0sdWJIEEfjcCHyfEqX6TptR/6OyzczPUC28Nv9XKp1TJXJYFtw?=
 =?us-ascii?Q?ULsT7jsXLqPt+mMnRzekpxkNhx1yqIMMFo6fO+6jxsYa4qhr7ggDRpoLcMa7?=
 =?us-ascii?Q?LfJ/ALIyXptCZOlmyAkE1yJG7i4Xsgjkxu7yfFv9osfgnPU4IEPLbrnZDOpw?=
 =?us-ascii?Q?1htTWahNyJAwyzZKlsqspBpd2C7CjWqxpzaFiWRx5PKb2NYL9MdqXtagib69?=
 =?us-ascii?Q?S79rv3RGh9qe3Qv/K0V4Y/PVqR8OgEA4Fg1wB8q8EFnmQ7G5X4n54OoRQ/yH?=
 =?us-ascii?Q?R8HHhJIuKJ4MYIJT76wti5DW4CTTmVym0EAUa2FiAIKvZNhat8QKXc3bf8HP?=
 =?us-ascii?Q?uQuIyqPgrJ/2/Pvf7bl5iguPL/mwYtSeP4nDLwR54bt4N/lN9V6d7K8IHHlX?=
 =?us-ascii?Q?b4WfbAkWDwB9stbEEWU9wIbuyDwxLl13VWYRr3ZnOLJiiJsWif65eo5Si5N7?=
 =?us-ascii?Q?9VTbMdKDbPrrsNs/Uhfllzq5IPVbVpAdQfQ2Eu1jplbdlPWMnS1qqNQ3NAZy?=
 =?us-ascii?Q?o/bzQolHcXLqQOeTjZWqXxb3tPHglw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iMORVjrvMHGjr/0ge7ttvBTY+rC4BdbcVR27gevGnH9h2JwVNuj6eUm+x7of?=
 =?us-ascii?Q?oqELiPafxkF8Y2tH5kXaCjQDArslD6PBipiNAFCiNOjSbio71beoBvSBKhqF?=
 =?us-ascii?Q?A5WKx5vuosS/yJ0oTwMeAP9rFPwnEYDV3YYDtHSnlNiCHNDEMkAQ88EV0jMW?=
 =?us-ascii?Q?v8r0Dmp4o0NI/axqaT2EvMklDQiVRmu0l3vaHup2l+R/2dJfdXLSwTbcJiFO?=
 =?us-ascii?Q?FQgLDJEKdohM60UDdCQNT+dsIoSCM46Y0YyAsMQHxY3X5jNwvNI46aKUAsK7?=
 =?us-ascii?Q?ICEaNViSULWHlbxdC8DJorkAmGiSZxW2HnwurTi9I7ecFqqmREL3Hf6agy78?=
 =?us-ascii?Q?zVplw3a7Mj7Mu3DbQyHqSsf7DMZ5sBTiHPbuUY97Wf/Wt4NgH/yzUOdhBY5v?=
 =?us-ascii?Q?xSn8oPkEbCV+2mdtX9y26bQnwawTBKerY8m/UFwZ7ZICWg8cTNN2W3Bi4cIy?=
 =?us-ascii?Q?nVpSNmD7V3cIBR1jCYDN9wVkM7Lb7jjx2V08kzbGvU71WeixEELYZLYRrelb?=
 =?us-ascii?Q?UAXhL+tHsdUdqJb16ZyOo15QnqJba4lgetPM/gzY1zM+MbbOZQqiVC8w46ZF?=
 =?us-ascii?Q?I7pgCRRZBAtj9xcV2RVpG/7Dw8wj/0CrWeMmTOJ3KOfL0BQ05qYzK6fU64Gr?=
 =?us-ascii?Q?4vuoQB3F1IeZScNl6Gvix6nSRq23x4pEpd/LBfCWkWF6mMzOQPRRoivQIWop?=
 =?us-ascii?Q?lr3MINQXi3WVJc5fW99xmyhIm8tryGXOv5bdgTN6ems+xc6IxOtDwyYXHY6k?=
 =?us-ascii?Q?O5RXQljAzEIesI8GrfGAEHCPm+ejB+nZw+9F0v4narsQYaLJ/AxXWhORJnME?=
 =?us-ascii?Q?HeX6HEabIwWWp0VUzKXvXZT+pG5zvhh6/LGeGQOUxmQm+OVSZZuZ7YqP8Jmy?=
 =?us-ascii?Q?oibOjo9W5JI/Tmh/q0axojTquyi79GhJnoFytl3VsB6iUHTWgFZuyiiYnJvz?=
 =?us-ascii?Q?v8Lew63hDVFoW2oZlfodYNqroNxZxODuu4nt4gaImdldzlj3D+Sp3+6uHAkk?=
 =?us-ascii?Q?78hFKLKIMGvoS73ZswSR/DiPfGqNH1Qt4syjWcKqFVWajLyW1f0WXBSwLadW?=
 =?us-ascii?Q?tFCbMEEfrtv3VJ2TCon9Wzh8HoWda+hTok8PU/UCuqiB+arZzTn7wtmwOfCY?=
 =?us-ascii?Q?DIHyKf23wfUHN6y3AtDzrp6hBj5GkYj6NtespktnRNw3b+Or10QOTi1Mk3o4?=
 =?us-ascii?Q?hVNVD/creBzr7/1w0pwm9jTUDBOAazXXAK3CvH/smjX/ULxlUJjgC8jbUTcP?=
 =?us-ascii?Q?GLbqB/FWlbvekmv4qbkP1kbuboAnqTGuWNVAapPMS4xfFuf6RgJS916gaeku?=
 =?us-ascii?Q?zpQ35uRBwTxyr4oFw6TJ2NgiKBJpya2SVy19xFZlBMrITmr+SdxV8BycmNeV?=
 =?us-ascii?Q?NVSZQ5Ykl5LJLiJBsBKjTHweSZYWqQpa0396H1Bf9hOgl76r1rzXZymIi1/W?=
 =?us-ascii?Q?iYGELGtlKpLjqZjMy9ZdkRHKG7/yMYky?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d6dfa8-62a8-490e-dbcd-08ded8f53868
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:21:26.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5463
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8927-lists,linux-leds=lfdr.de];
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
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:from_mime,outlook.com:dkim,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F17C7701CC1


All Sashiko's comments on v7 are pre-existing issues outside the scope of 
this series, with the exception of one comment each on Patch 4 and Patch 
6. Unless there are any other reviewer comments, there will not be a v8.
The pre-existing issues will be addressed in a follow-up submission.

For the sake of clarity, these are the responses to the non-pre-existing
issues.

Patch 4 comment: after pattern_clear() sets all 8 PWM slots to FULL, a
shorter pattern programmed with len < 8 leaves the trailing slots at
100% duty cycle. If another channel runs an 8-step sequence, the
cleared channel flashes at maximum brightness during its unused steps.

Response: this is a consequence of the pre-existing issue where
st1202_led_pattern_set() does not zero trailing slots when
len < ST1202_MAX_PATTERNS. The root fix is outside the scope of this
series and will be addressed in a follow-up submission.

Patch 6 comment: the loop in st1202_brightness_set() ignores the
return value of st1202_pwm_pattern_write(), potentially continuing
writes after a bus failure.

Response: as noted in the response to the v6 review, this is
intentional. A transient I2C error on one slot does not guarantee
subsequent writes will also fail. Breaking early would leave remaining
PWM slots unwritten unnecessarily, putting the channel in a partially
updated state. brightness_set() is a void callback and cannot propagate
errors regardless, and st1202_write_reg() already logs each individual
failure via dev_err().

--
Manuel Fombuena

