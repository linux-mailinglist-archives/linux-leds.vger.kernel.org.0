Return-Path: <linux-leds+bounces-2797-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDE97E9EA
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2024 12:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE6A281722
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2024 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32308194AEC;
	Mon, 23 Sep 2024 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Vm71/fgY"
X-Original-To: linux-leds@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2103.outbound.protection.outlook.com [40.92.40.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BAEEADA
	for <linux-leds@vger.kernel.org>; Mon, 23 Sep 2024 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727087357; cv=fail; b=evG4+IJSFTjdll+1M5ZWlA5bemcU0wlWd4RbcyuMzXPiz42ueZf99oU9gb7e8kE9mmHBLmYEZxlXm9MJPdyIJrnftip3/ISPYzx31of255opb1tLXfxmifyifZC2QYfHfLg+08dk2D84wPIxrctiScY2iw1n8t6AW937VjUD7Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727087357; c=relaxed/simple;
	bh=deRDU1WW6rC0nhVcQsMgKxjLaDTEmSpSpRZfVPKQCFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=caYYi+wfihSRx8mYqdVOMi/QEbJ70zKyKBUGLjc99kFrvpDO4qIRl2mMA0tbQIf5CdHx7CpVA90gGF7LWh2doXmWAeu3+qg0p1dCV8DgWM4waQuSb/UKkMnAZ1G+1g7uxeefANml4YEdTIF3XDnmzK4ss+P+Q/zl8oCgNYA2RXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Vm71/fgY; arc=fail smtp.client-ip=40.92.40.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NimzewguL6mtzqdT//2yAXKNvgBD0iswxr2WEFzbrC+7vexXUkABlzNORoeg2diztkVp9gcqtXEJuN/uLQ0t2lfU0lLSDNzLINQV6pRubvsQLVOcCm4YgGvXotTxfhTtIbTfzg8T4SnkEnnPnnNuHQbVHJmr+Q1ckYvQFUe8PXX2311kYZr0VJDt3u2nRfGBli7gFVRrjRlAHKKBwgfQEk49HZOPBgtr1zJwRxx43+nS/sUaHCi28TgpYQjiL9EUXMzP6bdBbYWfHpJezp1vlNF4iLbUf+QDg0gyvzUZSa/zq17nXOYoQEvnIf39SSOQXgLeYOxJIkQCQQBZN67v/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deRDU1WW6rC0nhVcQsMgKxjLaDTEmSpSpRZfVPKQCFo=;
 b=gj60rrsp+ps2joq8gcWSbXz1WiImzLs4NRQpdzwXXGcinAovF2GxM4LaI+NMJfKNKUMhYGkhbCq3lMJbbj7ME6clII79PBiYNSxEKdNkV/J8YWFhc5mEkb16SPC+BQUgqB6pAimoAWcV7z1hPCBqvK17NLCQ8Oo3Ktpvu9bXtGHMpNFif3qxjEuy0fzEqYmSfZyxAvP3jYjHMkvRiqXTgCUhokjt3KYLlhF9G/bg5mP0RUIeP/EqLvBUQHlKAN7glrG5N6FEMIYtlBxRV5lyJKUCh3YIZ0ZbUz/2pxP5gIqCN8Do/bV/SQifnfE7thWtNislp0XFcTX1b7zBFqDG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deRDU1WW6rC0nhVcQsMgKxjLaDTEmSpSpRZfVPKQCFo=;
 b=Vm71/fgYmEmB5OLhUg3ylRdK0o0TDynJJj6MppP0kkI1/c4DG7fc8FL1G2Kg857rTZEAtwypYN3Mzh9wlyzfePDCbq7cvaU8bca4L/jMzApQCgiDoK+64KYHZkcJnCuOlWcEzCFHdzXTmyzKkU+MlXemclTSyT5k5iBjPM91+oBOTPtFLsag43xJe57VRNaFpePH/NSxIwO6j2vPfPbOntiKwNwrEagVWF1e7H/oJGmutUV+mlmYOrlcLUaJBQROd0hYjORxHdDZZ9SQw76kWrqAFwAoXoaaQRnstd4j6KAxNIAFSBiIJpa1rLyF8cMs3IRDNk6CTzvU5dPE9ldPlA==
Received: from SN7PR10MB6473.namprd10.prod.outlook.com (2603:10b6:806:2a0::18)
 by MN6PR10MB7443.namprd10.prod.outlook.com (2603:10b6:208:46f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.11; Mon, 23 Sep
 2024 10:29:13 +0000
Received: from SN7PR10MB6473.namprd10.prod.outlook.com
 ([fe80::8094:a407:5894:ee32]) by SN7PR10MB6473.namprd10.prod.outlook.com
 ([fe80::8094:a407:5894:ee32%5]) with mapi id 15.20.7982.018; Mon, 23 Sep 2024
 10:29:13 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Pavel Machek <pavel@ucw.cz>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: multicolor virtual color LED driver.
Thread-Topic: multicolor virtual color LED driver.
Thread-Index: AdsKJNy1xjTgMBvgSDuXnNhjoeFx4gAAsW0gAFLrHYAAi/TWAA==
Date: Mon, 23 Sep 2024 10:29:13 +0000
Message-ID:
 <SN7PR10MB64738EBBCDFE67320BF1EF9B9F6F2@SN7PR10MB6473.namprd10.prod.outlook.com>
References:
 <SN7PR10MB64734F72DBF7CD8374A89EB19F632@SN7PR10MB6473.namprd10.prod.outlook.com>
 <SN7PR10MB647363E3B7F21CB35ECBE6669F632@SN7PR10MB6473.namprd10.prod.outlook.com>
 <Zu2XPSeAURvXWPbi@duo.ucw.cz>
In-Reply-To: <Zu2XPSeAURvXWPbi@duo.ucw.cz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR10MB6473:EE_|MN6PR10MB7443:EE_
x-ms-office365-filtering-correlation-id: 0d9799ab-46e3-48d5-a849-08dcdbba9186
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|19110799003|8062599003|8060799006|15080799006|7092599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 0dE/IKWrgI3vVrsAzmn5e5hJDQt6ZfmGBCrcEYeGdkL/a8ycvmJBf6lqIKmAxE5Aq1l8ZusnkhmKplGaimRmUfFRE1PlZ9B2QmA4Eca9aq+EsioTsbI/SifnWJdgTrxgAOBGE/mZ8ZPv4uHZO5enBEU+JgpsrCiyzJVqj705hamR/2k/nZpV3YpGqHA3AxvH4CGxBLrBNtJORvUJYZJgZXIsUBzb7tVB1BanEeI7BQDk0nFaeRIT3C0ggYO06ASidk0d8OOnHJs8flJupTY7aQF6ve+y7ZFud/kSonZBWJmyfV95plch3kLLG178IOfGqwXHqmWKs7uNBCaVrZyIowPJ84E5IvuUKm4C4+b5XfGCfUt3vWVdrh+ddLU1Akv7LcJvARztrxMlUTHxipmnuxk16EWbUtNIWv7za7zS1KKaZ+pSZopygPsjVxW8yqVZhxEV+DL2fw9ItNcERZndH2RsxC5odDAEHQKSFnX5zJRyHGMZAZGGUBQiMcAdPDd9GFSAjVk9alO5r4drSyOxHTlPwLPkmJzQCOAlnhhDqZtE/jOT0kwU2Af1BF9Z0/cq37t42DkrYLXGZaXEChy+fE7q7tVE5trcOML6h9GKSBO2op4+HvHPG1p5vV4Ghvwpm41EnVbHGhGS0AphDdV/CpYZgEwpDfxvri7aTSvVwBHM78hU5NG+IPVtFg1ab9l0tUHJ/OSlEqqMMzqKkcUbVthW9kw/7yM5LwZUIayvzCc=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kXprWFqVyAuWn9YAxrKei/MXWJm7vUcheguaWO6lWxHICefrJuX1jn4+LEBq?=
 =?us-ascii?Q?9Er1ZzqX63j7E4pzD/7Bv3UyQ8/X3OewWapXT/FQ/pRMXlLaeneO90HL3VQM?=
 =?us-ascii?Q?duwgFfo37cVL8qC/mBjYv6EGHXwhdGnXODoJfwy+uR+pDpZLskFHIzSvfklm?=
 =?us-ascii?Q?HYGuHM0O2EcxDysLWcT23Uc4qra2PSmzr0lYJ6jdGqF7u7PHCP5+fsaRxDxX?=
 =?us-ascii?Q?AfpWxdWHw7A2U26US+005pffS1VsQT2KCim9pHoJOky2FgGlADlomjXnZsx+?=
 =?us-ascii?Q?StTL1lpF7zpFOD+v1sKdvana9sQ4j2OrQl6lGY6VGXURqPkOgWykO+EyusRx?=
 =?us-ascii?Q?deDJcqLGF9OXqXe5UKIQSDEVubPIIH0UgDDasYUCud7p82fwfBw7xrfp5Io8?=
 =?us-ascii?Q?84TXyNt3VcGu63TzpQLEvHQ7+AshKLtsZjc7Gxo35ejItNDqcFXBPVhh0TFA?=
 =?us-ascii?Q?SMZkxTfuaLdS2q0EG6He1JVp2G6m89cBj9CjZhDateX+yo/U3LkaKHaYtKK2?=
 =?us-ascii?Q?irQ3m7/19sdtXWyxPMuML0zy8du440gSpV6ltMe3Pwjdh3M4GzIPMixsrG2Q?=
 =?us-ascii?Q?FbRI9fsjuBMb7BnRSTFgx5brymeSJgldvqXgO6OACcnDEEiQfiyXaVv/2w5T?=
 =?us-ascii?Q?eor71z7j4kT4At+Qfcs8e8J87TDFI1ZFv6hKFdSA2VvDLs3zM0JJDXJJ79BJ?=
 =?us-ascii?Q?BfktdULklhEWJalPX6faDCjDOr0P/fc+UtDWOT9ykyQHTFJWw3R7Evn4sCuW?=
 =?us-ascii?Q?PVzdmSUKY6r9YW+cIxc4UORZKR9SMgwE7Sp4bxNCtDKnsw8tmmfbTO1XqCpE?=
 =?us-ascii?Q?bbG0rNzNaAv8p7LCyKn7c15Jwh1IlrSnhvoQ33PVRApIqxML4jk3pbdTPTn4?=
 =?us-ascii?Q?6nD3EoR0oz6lxWwexWy9FjhDy46n9IEBW5/SPW9qe8fzzRlx0SVxRtYIqIai?=
 =?us-ascii?Q?dJxlJ7SxGiO0xsoveypaiiw2Qd59b568sWxpMja5mtKPgIUbSnu8nPWGV4Mn?=
 =?us-ascii?Q?s8G49dykF5Lax9ZeDjvtpQrkUFdeJOxvijNZJxg4GeUtq+lXOsXDyD5aPcy0?=
 =?us-ascii?Q?iyVSR7LtVmPHAX6Pvd1YTzoxfivsxlEd3zMwfJfCVdTc3YBYMAdiWQMAGTUK?=
 =?us-ascii?Q?4SzX+RyPaa1DEfe0XJAtsmZfofpXDGnhcej4JVd90S6yb4tsIjqJgFjUyTjC?=
 =?us-ascii?Q?lh2W+p79VsEBvTugLH6TGFUlP76/fHUkQSwlRb8n3esnQwHZSjzMDe7oA2Q?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-926a2.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6473.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9799ab-46e3-48d5-a849-08dcdbba9186
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 10:29:13.1642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7443

>I don't believe adding virtual LEDs for this is a good idea.
>
>What about:
>
>1) introduce infrastructure for triggers to work with color, too.
>
>2) introduce "colorful" trigger that accepts three monochromatic triggers =
and combines them in a way you desire?
>
So you mean say 8 independent triggers for a single multiclor LED?=20
E.g: R,G,B,Yel,CY,MA under the same RGB element?.

I guess that would work but we still have the priority/ logic issue it woul=
d get confusing to implement that way.

I was planning to add a priority via the device tree but thinking about mor=
e exporting it via sysfs might be more appropriate, one could implement deb=
ug level to hide trivial led triggers this way too.
E.g:

"echo 1 sys/class/leds/system_led:yellow/priority".
"echo 2 sys/class/leds/system_led:cyan/priority".
"echo 2 sys/class/leds/system_led:cyan/debug_level".

>> Also, of note On color wheels of the RGB (additive) and CMY (subtractive=
) color model's magenta is a standard reference color but is not an >>avail=
able color ID in leds/common.h not so much an issue just a note and I don't=
 know if such an addition of this color would be a good idea?

>That would be "violet". Feel free to add a comment that it is magenta or s=
omething.

Violet and Magenta are different colors, Magenta would be a new color to ad=
d it is one of the primary and secondary colours depending on the color mod=
el one uses, in this context it does not really matter so much but adding i=
t in would comply with standards of definitions of color.

