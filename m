Return-Path: <linux-leds+bounces-6402-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76955CB3C35
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 19:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CF8E300D484
	for <lists+linux-leds@lfdr.de>; Wed, 10 Dec 2025 18:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBF4283FC3;
	Wed, 10 Dec 2025 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=corkillsystems.onmicrosoft.com header.i=@corkillsystems.onmicrosoft.com header.b="dSxwqmPx"
X-Original-To: linux-leds@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022135.outbound.protection.outlook.com [40.107.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0771E5B9A;
	Wed, 10 Dec 2025 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765391415; cv=fail; b=N9AKXomw06V+JVpboP6mS84qE/TQJnLUVxMpPaDvLsg5577uv2buXIvFjFffWraBGIyqUwMKiI7JZrvhJRmZACH0wiJ9K/Eq4lJvceT3thUZ/lnymQQjrRaj7k1rg8mVnn+5Diw/xtt9i8+ZOYUAQ2GYESVBL5bRKdSNSuP/w/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765391415; c=relaxed/simple;
	bh=v8OP7QMnKm8Yt6WeqbvN7ycRsMZ0bGDmeztHJfUHP4M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hzIf6CthzEYxXvPPXqqterqp8NwZmYQnrXNa8NjA2KTnTU9pNl5xXwYd+Z+d+HYVBQSgVvMLhiwufC2IQA+x2HbY3gzXxL4B3G6HppnSzEAcConrgJ7fBwWztro9pSosop8vX3yxdcR7EkjMtlLJ95f0OGsP2IAqb1zCuBi4b1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=corkillsystems.co.nz; spf=pass smtp.mailfrom=corkillsystems.co.nz; dkim=pass (1024-bit key) header.d=corkillsystems.onmicrosoft.com header.i=@corkillsystems.onmicrosoft.com header.b=dSxwqmPx; arc=fail smtp.client-ip=40.107.40.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=corkillsystems.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corkillsystems.co.nz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrT8Upy/Kv4xxzs6XxPiA0A6GM4UxsSo1pxC6z1nlN6u9wYvgzLqoihAp7oGQhdgAhWgs6igaMpBTbWhd4l28xeXVLW4nuKht82JhZmYf632BoldwVsyZe35G42z92EuluoziE/2waxbWKGeAHZSX/s7XU9f6u1p5L0p5tzkFq4SG85EYc4D+EQAEa5Xx7jnfpMRX//dY6Odf4SKXJmRSvQBb8JElYJVOMm52VXR1wPpOMcDxrUuR+u4kypIW2yhEzFZaF0k/E/qbDx1dmyglA1Opm7OL2+znkI6mAT+HN4F35tPkuzMsftvXUe65Km6HLdJnmRblgjYuGVvqrtxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8OP7QMnKm8Yt6WeqbvN7ycRsMZ0bGDmeztHJfUHP4M=;
 b=eCZCwmwqWKT2ZXG/iAP9wY0wjWl+tVJtMSX6ldZBgFmLdGEwsXzITt6LKcpENr/FCBXjsKP2B0MUbC6QFaGERxKA+T1btOZwtt9diLqVPojCUNkxt/5asQnhpWGD2wLzNEtsL+te1GM94aslLrSIoyWu/0AT9HMoyHhYt/I0z998PIiBmyAG1it7zd4EtxQhVzkQm3w4UoYnhJgozuk8bxnOaDLTAROZUOfmPdFOa3Hm/phGTS+fztWBoaQSxBJ0jo2vcb4p3gOC8jA4w8TqO9ngcPzwxa26QxMQtIHS4jiTiEGBxETQPC78bxMaqqgL6an0Ts77KU7+Wum+/W4Blg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corkillsystems.co.nz; dmarc=pass action=none
 header.from=corkillsystems.co.nz; dkim=pass header.d=corkillsystems.co.nz;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corkillsystems.onmicrosoft.com; s=selector2-corkillsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8OP7QMnKm8Yt6WeqbvN7ycRsMZ0bGDmeztHJfUHP4M=;
 b=dSxwqmPxzkwTOLAIQN3vxdop7siWw63fJPUM95WoTrqJBv+9wVlILtNhWLR8oWBG22rT+UfFD8nvHUOuJvxKgVLzdhYgRBpWfZnCvJSm+Rx6Eg6s2yjBapSNe05AfTMAjkefmoMPX+2Vfco4EzZUoPEgRNGjMlnsmhIyQG+XMXA=
Received: from SYAPR01MB2863.ausprd01.prod.outlook.com (2603:10c6:1:8::22) by
 SY7PR01MB8462.ausprd01.prod.outlook.com (2603:10c6:10:1f1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Wed, 10 Dec 2025 18:30:06 +0000
Received: from SYAPR01MB2863.ausprd01.prod.outlook.com
 ([fe80::8aca:baef:c648:612]) by SYAPR01MB2863.ausprd01.prod.outlook.com
 ([fe80::8aca:baef:c648:612%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 18:30:06 +0000
From: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "lee@kernel.org" <lee@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/1] leds: Unexport of_led_get()
Thread-Topic: [PATCH v1 1/1] leds: Unexport of_led_get()
Thread-Index: AQHcadE6xxkgQ0DorEKbKZtHICdTB7UbLSMw
Date: Wed, 10 Dec 2025 18:30:06 +0000
Message-ID:
 <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
References:
 <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
In-Reply-To: <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corkillsystems.co.nz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYAPR01MB2863:EE_|SY7PR01MB8462:EE_
x-ms-office365-filtering-correlation-id: 0a740bbd-140c-407b-42f9-08de381a24a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HMi4i73jpLrJqGfY0b6LbpzXQCdAEhndoefmfjNCzSKS3Z2cAhIfFK3CDcZy?=
 =?us-ascii?Q?6CgKijEK34LC6YS6/RwV91VZ/2/ba6h15G2DOm135h4NcQRFV8y4Pl1EgWI5?=
 =?us-ascii?Q?qdvBaIxiSQScx73onnOQvxwl/edTR576awlB8zX/8EtOUj4H5umdwl27AKFc?=
 =?us-ascii?Q?uH46ZeFIgvN12oC1ImJ8rP+ZkDjVbzXja4/gAMjDLAxSiNG3Hzo4RfAB15t7?=
 =?us-ascii?Q?YHOfttepcZKgmkRdq29psGwACrjPMbxAkUbB6hOhMdqk/BMMW6VYe6OvG3J+?=
 =?us-ascii?Q?doLsnMAlYldPpOo9lR0fB0qDDV+W6KzHL54d0B5QsifiaStMp/u8UD+bOykg?=
 =?us-ascii?Q?MH2RCPl91VbWsrTqBwloaQbkonHArUKqRr5k6SQ2xCLAZwFLVtp61Pv4cmC0?=
 =?us-ascii?Q?bMkvA4qPf3Z8gKKsWaAzFQ9exkeHAqzTO2msLWQXb+hXAdBzLMsOT1H0teLw?=
 =?us-ascii?Q?Y3PP2tC5bjj+Wo+yZ6JqmC8ihiouOIK5C1j/Fd2bkHRsGunqrFJ0Rc9udjoz?=
 =?us-ascii?Q?SGspmmenW6FOl6mISKYKxUFKrEM0/i023dyo9pgyWA5rWKu12JqfJFwAGfYb?=
 =?us-ascii?Q?k6ySQJLUdKC/ZaSjh99KZ+o6jEpnpOgZX6YW1jg5Qj0nylxKcxrd8GkobWXA?=
 =?us-ascii?Q?TTBMvqrRU3JsuEYyGQmwGYB0WxUPECL9oK27DsCga22cskWb6nRrXmItjCEY?=
 =?us-ascii?Q?eH9jtrzCkQ3YDD3wGjMzFTYb4vMFXiNxEoUyAom4MKaOrRix4ZG34Lz2yCQF?=
 =?us-ascii?Q?tihbKrRUraMpmeCbZYeFlCdA+M5id7XNa1zx+2pvRTAkeaQIrbjV1n3pEV9Q?=
 =?us-ascii?Q?BowxlIxza3gxMoLaEzRZuVipvKZ0GWdAHbbfRbSQzV6THB7pbIwIPAN93Gpx?=
 =?us-ascii?Q?b4mYyuhzqLYaj5GPdISY5dCP2TsZ11icoRGuJMpCo+DYP9JU2kfzONHvNbWT?=
 =?us-ascii?Q?h+TLbl402bzfPxRefu+h+9QP3h0p341lHUckRNL4s4lKzYpuh7upcNOTpysh?=
 =?us-ascii?Q?QVwNjyZgxoOQIgxD9f4hcGvhdZjASd2A1puuPGy8cPk9axenZtlgCPPq1AuH?=
 =?us-ascii?Q?tmOhX5wTAeTHYqVXCnih+GubOPdpeH/9MquGXVJAQ04Nb00KpeumhMUouB0t?=
 =?us-ascii?Q?CMilwTsvyZDNYVNkqyNMh2t44tNJRJwDnt1IMLmnHp27hbZk2AbdKjep7flB?=
 =?us-ascii?Q?eK1xahNhmxtIsIyJ+ePkezjTdBvfzpVBq1mNO/uJAZ9RbK8lCwYu/lauP0f/?=
 =?us-ascii?Q?elsLr7yY4/kBfpYAbG6PlOt78I9S6BXieESKYI6U7b8quDm6cKm3nMziTCaF?=
 =?us-ascii?Q?R9Gs0EJ4befsyliZqYUw5HRJMkGj3hWZeZ3OdHFxtNAi7c8MhiscgsvVvbd0?=
 =?us-ascii?Q?wbjX+qY6FBUEq5wL/IYB2b69SPa7HQOdWHGShI4yOOClu4bS/G/3ZjPaBd2j?=
 =?us-ascii?Q?gdFl2bNICNOHKDNbgmt7Eo6vYEHVYEoKDAxCabaDXF2nOUysgj8qdhleUzKI?=
 =?us-ascii?Q?YoPfJHe5lZfLtExQ9pfwlL8FiNUKWldppaUL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYAPR01MB2863.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XI5tDOX3YCuimju17/OGTjXzTljQgv9GJ8F9hlumSABgQu01UNoiMHr27kkx?=
 =?us-ascii?Q?+9QIRLxvg6wl9Muz2nCIk6IfN7JjCx7Ml/CfpPNC1tS9o8mycbcZJnPPgdKk?=
 =?us-ascii?Q?NuD8xDE0dZJtyxxZATJ6p+p8FaFZT8y0BY4SdV0JdShiOCKfnzingkIx1FMN?=
 =?us-ascii?Q?BUXmGmY6Qb1mJTbTLnxwpGTbNL1ZacYkX9qABKAXEiljlPt/rNcnZlJZD3vq?=
 =?us-ascii?Q?VExBUCZMgisYQwlBSPCCo0f0yodoEr+O2LoR43O6w5o+MS/X43EkKgNwgoMD?=
 =?us-ascii?Q?6nhw52ir7pozfhX30EvLCCtWrFZzZWdxH7mX8tyVqo9k5FSisepIeNe/WAou?=
 =?us-ascii?Q?HidMxfQ2S1dL0HHx1PSpsOgvNC7CrZ4fzeEYMyev4RIaQ8yZLY3kXR/ekuAi?=
 =?us-ascii?Q?YtlDxxXkT4kRipskHQ8IGyVRg6UtIf1YzYWtSw2U0/2P8yivO2fdSczuzNz/?=
 =?us-ascii?Q?dlwIj6T3bY4eg7VI/3jlzqXA14r5HUjgEJe87eqwesayYVQfbJnVavxvKDSg?=
 =?us-ascii?Q?R6KOYgl1RMzl/6OSQWtrQjJtckSICZatgYntK0kJN6zSsT1gPpqikSHjT4ik?=
 =?us-ascii?Q?NxHa65fPO/oWhLC/v2oNj1qHsSzZ/OZjsK7ZlaAZ0SsfsQeNjtF0aj0gcS32?=
 =?us-ascii?Q?6nUBEssdKHMOHPhMa2U0h8FIMFlW8nfDp4OnOYyZQJZaS9OAbMJuedjlRg3Q?=
 =?us-ascii?Q?9Ow60qRdDjpMK/Dl/QFzI3qFWJj3CT/wp0m9qruLZoazKkFBtt9q53phGiEE?=
 =?us-ascii?Q?ixvx/FeehtArtDD6TpAhbyHyqbgaovAPZd/3uKHmFqh5X3an8qXwZ/SuXjRW?=
 =?us-ascii?Q?uWcO2TndJxyoucAKSG6Ljm92P3zVW+RxPcFm/udGMkD4BDDvzRTKKeUG03ZO?=
 =?us-ascii?Q?igE5ySr2igeGjFdgVF8P2MRs6NOXRSqfQf6rUZJlUnGjAN0m8SBFiriTG/aV?=
 =?us-ascii?Q?oIns/JAymBiUAVrwmJOsgwIqzEXAw75Mg1Sv93Jf92l1iz7IHZmpZTTspbKg?=
 =?us-ascii?Q?gzXaRf2HkKKsgFyZQhKaqeuzNdV8fTIt8twlxykhLOwS5fLgeUOe1VWF/XGQ?=
 =?us-ascii?Q?jq7v+Q5P/azaChsheCdNgZfGFmwcHWoQjDWrh3jKxIT9tfDM/03qGgf1qlIM?=
 =?us-ascii?Q?wTY088ZCCK+RctApfxFnoYoeD7RIObw24pFSRXDUvsi9Yfkf7VA1vZNaH31O?=
 =?us-ascii?Q?HX8gj96oO+/n45Tuq4vbWuVXS/ynD7yTgeSuDiqd5FGFrb7Pb5r2ddBqWyPm?=
 =?us-ascii?Q?p3Jxq5b0Vq5Uds/+2r9i3K3c0/5Sq4/lpZLr6MidRVh5P1F/6azkqD7JwlIz?=
 =?us-ascii?Q?EokJ7IxhZmN5sWWcJRkhiTYJb5s+dk9Ti8s/JfrZJBSnvPKrMZGYse1TRNgE?=
 =?us-ascii?Q?q/BDNSSRtCVx1QseceECGirOcFaTYRkpVqOunzKGUVyQ7i0iFQCbk9/Yf6+6?=
 =?us-ascii?Q?WW5mjf2MA5JJmK3s/7DX3ZDKS0QLZiKKNTNmZpkNkKi5yzdf4RACafGRcNZS?=
 =?us-ascii?Q?simCzAETMDzFTAWL2pHqZ6Yj4EpoRcl4Rov4+anlgujmsU4CMjH6yW2mFk1r?=
 =?us-ascii?Q?97ecou2L+hLKiB/YLu35wfaK3vqEeFQb8EgCLg1X3IOUwIVtKHHrlg8KVUlq?=
 =?us-ascii?Q?RQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: corkillsystems.co.nz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYAPR01MB2863.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a740bbd-140c-407b-42f9-08de381a24a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 18:30:06.7447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 29480a39-0abb-4113-b3de-0e01bec9b1e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVgMAGGnl4tKx4VUIEbXQSU5nRZlARVzWbDi+WT3m3CqjN0F9b2oNrO7nVIqO3AsYlQBjfd8i2359rn0MsJ/+LL+jRZ4AzJlADBPwsW4xRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7PR01MB8462

> Can you elaborate? I think your downstream code (I have no other ideas wh=
ere you Q came from)
> uses some outdated approaches. Try to look at the problem from the level =
of the existing APIs and=20
> frameworks. We shouldn't really have such an issue (but it might be some =
special use case, I admit).

I'm trying to create a virtual led driver but with the removal of of_led_ge=
t() im struggling to find a way to make it work.

I investigated alternative approaches to avoid of_led_get() dependency, inc=
luding:

Direct class_find_device(led_class, ...) calls - Failed because led_class i=
s not exported (static in led-class.c)
bus_find_device_by_fwnode() - Failed because LED devices are class devices,=
 not bus devices
Manual iteration via class_dev_iter_init() - Failed because I cannot obtain=
 the led_class pointer

of_led_get() appears to be the only viable solution because:

It's the only exported function with access to the non-exported leds_class
It handles GPIO LED matching quirks (parent node vs child node)
It provides proper reference counting via led_put()

Should led_class be exported, or is there a planned fwnode-based alternativ=
e to of_led_get?



With Best Regards,
Jonathan brophy



