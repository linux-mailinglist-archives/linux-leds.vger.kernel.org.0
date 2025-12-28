Return-Path: <linux-leds+bounces-6474-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E65CE5633
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 20:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77857300751E
	for <lists+linux-leds@lfdr.de>; Sun, 28 Dec 2025 19:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB3225782D;
	Sun, 28 Dec 2025 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="WezUDsoQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012049.outbound.protection.outlook.com [52.103.10.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A32571DD;
	Sun, 28 Dec 2025 19:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766949257; cv=fail; b=NzdAIb9U2BJlLtcgWzcuISMXc2OABoLIxP8/m7voOeKQ7jJ2xpvIEe8yp4ffjesOXNXWjYRgRKu493U5DnIjVir7xp8FQPo65SQ/HMA3PgZWd32El+0EfSPRrgu8hIRzP2xgTKkmfRziCdBOkVAjrPfPot/lovG/s4jiRgkAVHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766949257; c=relaxed/simple;
	bh=YfNAbcPtJCZmoNzKjspHKTC24QX8poon0rP8SeXrWvs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VQFvk2+iEzgx/C95i/FKrt2tPw5ZHTkVIMYntfhgY8hJwsebImrqceIhQRL59mrTDnLudVemW/1KEgxf59ppaMg+K9R4P8ZJauLz4lh32wP3XLg2rhWQkEVeslFpCV0Q7DgQmbEwN+IFk2l7QUFBDk70tPF9MnFSL95UCQ7YgDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=WezUDsoQ; arc=fail smtp.client-ip=52.103.10.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad2CUXyjn/TmUJ8QNMqs34NZXUKzkJXS15szF67ikUuEAxxPw8QA4wb9lMiTJqhB8XvbZ+p7eINyJ85No5Ylnl3dpKlItkbMbTHkXzHInfYSwfpBZ5ydQj0hOqm/Tm2nyNQHgozyC7GHnF+c48hS66chT3SX7EP1VU2QyWsZZ4upn6qs0d3CCBwedCy+gLKUQI7bCdHSERr6E0kVzPZrRA/9rYE/4JdHp2WRhZEoS6PN3XpwY5xV+aDkdYGq4qW47Plqty+xyRLaU51nWPwg24u4qnVlMwqAyavb7hJ/YEwrVSH2OOR70I0Dhviorq6v9UDNf9vbGvnQXyNAdoCQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfNAbcPtJCZmoNzKjspHKTC24QX8poon0rP8SeXrWvs=;
 b=uhm4pdm8iMS8LNPcOFDivN8LnfSsXrAJmtHDD+NMjLYOqpjiu9w2hXhTN/1+vsUfwmRIabAjbGkKBC8UE3fgFXakKaYZ989C6QTKWLtbOVkAJebekAB8K/X6kN2d5/+WIxpdN4mbdqzfZSP0Er63IfSgtI9k/IuFPY0f7a9atK7PQU3wQFSs+AZ59GGEW8+iwM0TxjogLiFMp/3xPmqi2rXkQRrAnXonZlJTNcqhIlDhOYhnMxIMG62cyx5lU9wAOmKkRMVksBtdatbhz5cCfbDNEndWmw3CTLRutH7QfvtpZI3HZcgap5lwzkFtDPgKkJZlTLkvCmtJjUYvM5ZvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfNAbcPtJCZmoNzKjspHKTC24QX8poon0rP8SeXrWvs=;
 b=WezUDsoQEdSfwISHnFUGGp3mRVX9rhSIuHOJacerBu1V06EStiPx7tYyJJ0nkFzX0s1R1mkfr9jt+kxQo+XRMXOf9az52klXvR2jmLxx0WAPpFEGyDNwrwSQR9YgdQy3lLHGzknwTraTzXexgErGyVAKWuQo5uyp52F9fKWwnATOkfppaZcxxl8orEF+phgxpp/yuCXCqqt5F43oQKgoI24Kv2rngsyhwr/mwbELYwbDj7kK6wD4sZtbLBE89VpPGE3dMYCExXB91bFZ8fTRyFZ36egmEUrXOxHMkQRBAxVMhf6zKtLPlrPkh0tfaHl0bHfGBOeznL6FEvOxQVVncA==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by LV3PR84MB3700.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:218::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 19:14:10 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%5]) with mapi id 15.20.9456.008; Sun, 28 Dec 2025
 19:14:09 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Andriy Shevencho <andriy.shevchenko@linux.intel.com>, Jonathan Brophy
	<professorjonny98@gmail.com>
CC: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Thread-Topic: [RFC PATCH 0/2] leds: Add optional instance identifier for
 deterministic naming
Thread-Index: AQHceCcOjAMDwlV3/EG/31Vvyxsr6LU3X+2AgAABOdI=
Date: Sun, 28 Dec 2025 19:14:09 +0000
Message-ID:
 <DS0PR84MB3746809655135654882AF9D39FBEA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251228182252.1550173-1-professorjonny98@gmail.com>
 <aVF3ZTxqSXWVcCVN@smile.fi.intel.com>
In-Reply-To: <aVF3ZTxqSXWVcCVN@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|LV3PR84MB3700:EE_
x-ms-office365-filtering-correlation-id: fdf87113-5af3-4e13-cbf8-08de46454717
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|31061999003|8062599012|8060799015|51005399006|19110799012|15080799012|15030799006|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?koi8-r?Q?QTVKPpP5FSt+QyM382BEZMhDL8zthBehqUg9fE7BmetWHz085UYD/OSdBx2Qq/?=
 =?koi8-r?Q?2hqzTGs8Obm3L1ClN3cDBlTF9XrcVq+YCtIqRY1YGOzfjq8BmWrSHuupwW1IGN?=
 =?koi8-r?Q?SaRV+jK7PIT95b5lbcLalQglOnkJu3uN/kyPLr1ksL66UFKJuEx2+n+8qMUnGv?=
 =?koi8-r?Q?XuKaL/9lfYC4B8c4D+k/NgHgn9OFf+8hVpKifzmOPXPYFRbQw5CnubQgjXPVpD?=
 =?koi8-r?Q?jAROdlGJUNzRlUpbNsAzwzPrfLE2Nu95bSRa0olPoGDJf4/8AyorrK5c/p72EJ?=
 =?koi8-r?Q?sla+h9igXWOg7bKp6llwiKTkpFysr+grgpNak0GKHcj3f7YIZvC/hBk+DuwPJ5?=
 =?koi8-r?Q?7dTuJwnpfRUpratEevJMQgSTIiUlrTHHnJWs5DJOj+aS/2r+aNiPC3H51RlxVr?=
 =?koi8-r?Q?ZFm1JkcC33K8T28If2xZC+VZjIgj+TlbZ6AlI/FOl4+zN7X/SVuZowWrzuBxbl?=
 =?koi8-r?Q?U/SLC4g3DRmkE5z3aJKvCSUbbHYOJAWjv6gQxpjW6+Vdsd/c261e2foaL6JFjR?=
 =?koi8-r?Q?7PGcCy7k1PX7YZcWap4MtN/yPFdomIwS7FDG89xDizB2DAKfBe+n7vLIrjL/Pa?=
 =?koi8-r?Q?XAlWPQoEcuw+m+Cn88Gv8ZhyPpkE6SNkRHMUOf4uWjRsZs37KFkrGPZlMfI7O0?=
 =?koi8-r?Q?mnF1irKC2qTb7FxSxpbZKQQSSo5KLmUEgyRtreZNHlHhQZaIQtd1XL5ndk/+/d?=
 =?koi8-r?Q?ZrGKVlYIegKLVxuVA9fJeg8ZZ+gDOF14EbEntACRTA4XlpCGgYvCJOUS2zJk9G?=
 =?koi8-r?Q?XshCLb0vcrojgT6sM/lLo1gR4RuEBkSkRv70M0i0Fj0xRBd0pXfAayAzuV3v67?=
 =?koi8-r?Q?kiARcjyU9Tkbs8Owc5teBQpnsRT6LWoI04lXbVyxRPrMjPyoqzn49uH00srVaX?=
 =?koi8-r?Q?AZt6sNKYvFEBUj2b06Px1uEgfobaefmzRo8pLY7F1ywagnzUlSzZS9Hq5hXT2/?=
 =?koi8-r?Q?qgtvmf0KFaZz90Jutt+YEDYkoZFxikjakWAxZDFWDuIT6jH8raoM3g9wnMeQtZ?=
 =?koi8-r?Q?I37FGZ+iPovwqq4RnyavhlGW37JgbixtZvB9NfVgjDeEonApr9MKZBcJhGSFEO?=
 =?koi8-r?Q?cm9cFZVbiy0ukLu/DJ5SwBiQk8EBB/z+om1wSc0m7oG8Rzyj1WjGlGnAYdxoO4?=
 =?koi8-r?Q?XA17N5QACEVDPT7/GgSSaiSQTqjyyjtUxx6cFkFQDERyY+t+L0zUpbwQ63Dw?=
 =?koi8-r?Q?=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?AW5Y7gFu9jRKxn5V2R73RqbCK0mqDRh5RkpZUfg5rEOIspQ+81oTSlb9gnJR++?=
 =?koi8-r?Q?wEkEbEwJyrESfdKMaCHUUqSLQvw6ecjMM6k3CPkABLtFjCjCmplSsPsFXyb5DF?=
 =?koi8-r?Q?hcZq66ZiwA8IiJEk1vOk8hex6C4VzwCJZjVTxr1U6dGk7v09iAf080NOguzZrm?=
 =?koi8-r?Q?8kdwReJZZX1azFR1IbAw40cEwDZ6lfuyXfwvEOHUnNPo2FdKw9CvnvwZB/hgTU?=
 =?koi8-r?Q?nxDXzF/MfOmgMmd6fMhugJFxY75FGNbb6Rg4ZzZCHznRKFkY9vhuLxoQaRo85p?=
 =?koi8-r?Q?A5ANRFoIGzPSjMi1+2ZnH6TrZZaZFuLJMjnHXNHReiZh8GZg6NruEsdyXej9HQ?=
 =?koi8-r?Q?E5w6ZIIZavwbJ6rzUYCDqNIj17DRZj1kTyOHzffNKRcC/K7VqJf15y+UZ14TBq?=
 =?koi8-r?Q?jPE0cYVmcWjVfwjGB1nGBZFPYOzG96fAT3sFjXxijIDrfmNCvCUlTtJmy5t0dK?=
 =?koi8-r?Q?5hFtLvajivry+vFetLC5iRQ914Sl/vfVJ7UuacLdslVU3QdtPXto7BgsxmK7mG?=
 =?koi8-r?Q?EftEMxSHvVgNZBCpyFoL5n5lebKhBKzYdjEU7gqpUwxTwsUGJ3xG0m0Ll3nXnv?=
 =?koi8-r?Q?6v8vdvpScNdoxjOlad31MF7XdDebqEZb1LdfhKbh6pWDNbFEOf4l4xTuQian8k?=
 =?koi8-r?Q?HRHFWhPJrSt7VB9vCYJRgv8ftdFGFyixjKB3hg4Jpj/Edy+tbPjskGuYppYKeq?=
 =?koi8-r?Q?eqy8bCwcW297mfbwlDfXtA3bzR/PUmMcb3gAuPGAa/WO726UW6lP1SpNX9Y25n?=
 =?koi8-r?Q?iMB21ktF6U8ZTKlYlHOLZlBJX3wI+up48vTf08HJGZYLSQyBiYOGmS70VhW9lq?=
 =?koi8-r?Q?I7DJRduQwqHhYfFQrkmfMuPtPtk2huorqrEtJMDAPgPnI77uxV1+4hP0OtM0Tu?=
 =?koi8-r?Q?pOAm+BItvsQ4I7aSV2yw3qeQzp7kJ95q1Uky/sU6gFeEEhTJ1jxVQDkXwq1GPZ?=
 =?koi8-r?Q?1oAC36FGoU4d8gE1a/oOvclaI5s4vnazrQb50JBeXizJEjZgbSFoFox5k3SUOn?=
 =?koi8-r?Q?DyP71czrnC22356OH1o5sNjtFx4RVHX6E/qkDpEnYeTrkIoCw1IOivHVXla5/s?=
 =?koi8-r?Q?4rWSVKHxytQfkjrLdnRINF4wYseBlJ7cCK6CUAKJugtGYf+kKxymqal6A+1Lb3?=
 =?koi8-r?Q?h/tffplIDmQw6aE357qXr9rRZy726sJFc1AmOVw+50Gp+DDOdnxsb3C0CTf7J1?=
 =?koi8-r?Q?m9SStaBLiC8HcdNSsoIbdPnQ5SGwIljfiV1XyhfkwD7nDuvGuJ+Gl1CUPv2XRJ?=
 =?koi8-r?Q?7jCfLRzgFSbe6gxbKJsjJj/UGiqAvEZAGlu4BQXGgCjOmIt6nzCIlOXaD8VWW5?=
 =?koi8-r?Q?xoFDqq60vVOLQpH2TEocq/1d6XXpREtqHfWrtsU0e5u7?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a21eb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf87113-5af3-4e13-cbf8-08de46454717
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2025 19:14:09.2414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3700

>Hmm... I think the research missed the udev + sysfs approach as done for t=
he=0A=
=0A=
>networking devices. Hence the question: do we have enough data in sysfs fo=
r=0A=
=0A=
>leds to understand their HW connections / semantics?=0A=
=0A=
=0A=
=0A=
>--=0A=
=0A=
>With Best Regards,=0A=
=0A=
>Andy Shevchenko=0A=
=0A=
=0A=
I looked at that also but I don't see a way of it working with the current =
led attributes:=0A=
=0A=
**Current LED sysfs attributes:**=0A=
=0A=
For a typical LED, we have:=0A=
=9A /sys/class/leds/lan:green/=0A=
=9A =9A =86=80=80 brightness=0A=
=9A =9A =86=80=80 max_brightness=0A=
=9A =9A =86=80=80 trigger=0A=
=9A =9A =84=80=80 device -> ../../../gpio-leds =9A(generic, not port-specif=
ic)=0A=
=0A=
The problem is that **there's no stable identifier** that maps to the hardw=
are:=0A=
- The device symlink points to the LED controller (e.g., gpio-leds), not th=
e=0A=
=9A specific port/function=0A=
- There's no DT path or hardware identifier exposed=0A=
- Multiple identical LEDs (lan:green, lan:green_1, lan:green_2) all have=0A=
=9A identical sysfs attributes except their names=0A=
=0A=
I don't think udev can't help here either:=0A=
=0A=
Network devices work because they have unique identifiers:=0A=
=9A - MAC addresses (globally unique)=0A=
=9A - PCI bus addresses (stable per-slot)=0A=
=9A - Device tree paths (but not exposed for LEDs)=0A=
=0A=
LEDs in a run of the mill 48-port switch generally have:=0A=
=9A - Same GPIO controller=0A=
=9A - Same function (LED_FUNCTION_LAN)=0A=
=9A - Same color (LED_COLOR_ID_GREEN)=0A=
=9A - Same trigger options=0A=
=9A - **Nothing unique** except the name=0A=
=0A=
**What we'd need for udev to work:**=0A=
=0A=
We'd need to expose something like:=0A=
=9A /sys/class/leds/lan:green_23/dt_path -> /leds/led-port23=0A=
=9A /sys/class/leds/lan:green_23/hardware_id=0A=
=0A=
But this has problems:=0A=
1. Not all platforms use DT (ACPI systems)=0A=
2. Adds complexity to LED core for every driver=0A=
3. Requires userspace policy to parse and create symlinks=0A=
4. Still depends on non-deterministic suffix=0A=
=0A=
The instance identifier solves this with much less effort.=0A=
=0A=
Instead of:=0A=
=9A 1. Kernel creates "lan:green_23" (non-deterministic)=0A=
=9A 2. Kernel exposes DT path in sysfs=0A=
=9A 3. Udev reads DT path=0A=
=9A 4. Udev creates symlink "lan-port23" -> "lan:green_23"=0A=
=9A 5. Userspace uses symlink=0A=
=0A=
We get:=0A=
=9A 1. Kernel creates "lan:green:port23" (deterministic, from DT)=0A=
=9A 2. Userspace uses it directly=0A=
=0A=
This is simpler, works on non-DT platforms, and follows the existing=0A=
function:color naming convention by extending it rather than working around=
 it.=0A=
=0A=
**Precedent:**=0A=
=0A=
The networking subsystem itself had to solve this with predictable interfac=
e=0A=
names (enp3s0) because MAC addresses aren't in DT and PCI enumeration order=
=0A=
can change.=0A=
With this patch we're solving the same problem, but for LEDs the solution i=
s=0A=
simpler: put the identifier in the name from the start.=0A=
=0A=
I don't know of another suitable way to make it work without much change=0A=
and from my research it really does not bring much to the table and adds a =
lot=0A=
of complexity when there is a simple solution.=0A=
=0A=
Regards=0A=
Jonathan Brophy=0A=
=0A=

