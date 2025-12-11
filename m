Return-Path: <linux-leds+bounces-6404-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8BBCB45E2
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 01:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 299FA3007971
	for <lists+linux-leds@lfdr.de>; Thu, 11 Dec 2025 00:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064591DFFD;
	Thu, 11 Dec 2025 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=corkillsystems.onmicrosoft.com header.i=@corkillsystems.onmicrosoft.com header.b="x2oK1HLg"
X-Original-To: linux-leds@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022113.outbound.protection.outlook.com [40.107.40.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCC22538F;
	Thu, 11 Dec 2025 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765414160; cv=fail; b=ChSspDhjhB5oejkJ1Rt+kRJk3IpmCQa864tse4HaCmu8Drz6cnOxqY4w8T8u1At5VrQtm2JbAmf88onQ1EX6qellWmfIN3M5kZhVY5HTq2UALw+0chA7lVpDPZ6DWVgzAT2ahS7p1+InKfjPZXdUFRgYZYefR4xXzzf9xvWOBtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765414160; c=relaxed/simple;
	bh=nEZugEd9u3pWPIQsfdMfQF+/GQ+C+0fUd9qtWSn7QQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iSERvinB8eUydvhWely5hrt71s0rGApTheRGSy2EbiWtsNlioTw0UhZQCGiJfaC2eOaysVzMAhj/6p5eUQu63zaSkPCtWUg8U/I69soaKk1VU2uwUv2QzZmH7PxuLl7RKWZo0CH6SjVejD5G8LogZsWeA6U3GtJuTPJUmwxc41A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=corkillsystems.co.nz; spf=pass smtp.mailfrom=corkillsystems.co.nz; dkim=pass (1024-bit key) header.d=corkillsystems.onmicrosoft.com header.i=@corkillsystems.onmicrosoft.com header.b=x2oK1HLg; arc=fail smtp.client-ip=40.107.40.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=corkillsystems.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corkillsystems.co.nz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMhrZBTFWJ9wPjUwjQPA6SivF1QvKE5bOh6icVmVbiwIEI4pZo0k6GwJL6S+zcmh4XlYPlnNCfCdWBOocx1H+gDRwfELNc2nBQ6jDXB+FOKFRljG2tCW7CIGYjueHA7KFGSFXS4Q/uPY7LZzN4+uGnZsUhWD/n5EFiS7hIjZ0QTk7wGdKGdFsVsIAVAxLtRU5aV2Vy3oKRcPBtaf2J1ZurheDyncKQ1Jd2FsEQWga1kbbQ8qN0PWLiAPzt7QkPdzz5SQro/w7MSUMoQAgOuE4A4mvIv9Ee7y09w9iN8n+z7RtK35y0OA/l6Lv6ecmwFU2gAvPNSkUBrBHSzNdGzO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/NkN5bpSuH6+vuYAAr+4sNYWxfNaxqK0KaKRsXvEAA=;
 b=QLBgkr3oy7Zu/E/K2c/WpLSrCHRMfwC4yIZ5kEA9K6lSBV8Nb+Cnk37NeJjzxIsfwA9Mra7wI7U1wsQrS6Nc5YYgsIDuo4Vi0tbLfx3TNSz2SR5hBQWBnOlRD+CBTQtFM7Krnd9DfE+Eqm94vSMPfsrju6yMmP+y6Gs4M5Lm8fDLj9LPKf+PtJONc7rhj1nokZEARv8I6bcSIhe0jy3c4LmP6/R2YQ4iFuQHcMngZZdp2Lm7zEttbKFdIYkTCLkygE9988d1Oly4cZW4zGG3wZT0Epzv7lCOjTtfSgskWF/ZhkWbz/glD7TJi/zyT484Bso4oGxUitLkTKXzowkG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corkillsystems.co.nz; dmarc=pass action=none
 header.from=corkillsystems.co.nz; dkim=pass header.d=corkillsystems.co.nz;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corkillsystems.onmicrosoft.com; s=selector2-corkillsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/NkN5bpSuH6+vuYAAr+4sNYWxfNaxqK0KaKRsXvEAA=;
 b=x2oK1HLgkre5FQlPfn21867dQ5UeCNysLPYoqV4rPXzmYorsDlt5jzaVOiJUjjLwKoS7789OAT1e2FcLo0KVRtVBI2r5HLWd5Hk+eZcbsDIlgDr3f5UqJVN1yOLIj8MyEGLF3s32vy2oJg6YAvTf4xp/0oolMRWyn+jRa2EEtSI=
Received: from SYAPR01MB2863.ausprd01.prod.outlook.com (2603:10c6:1:8::22) by
 MEYPR01MB6168.ausprd01.prod.outlook.com (2603:10c6:220:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Thu, 11 Dec 2025 00:49:13 +0000
Received: from SYAPR01MB2863.ausprd01.prod.outlook.com
 ([fe80::8aca:baef:c648:612]) by SYAPR01MB2863.ausprd01.prod.outlook.com
 ([fe80::8aca:baef:c648:612%7]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 00:49:12 +0000
From: Jonathan Brophy <J.Brophy@corkillsystems.co.nz>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "lee@kernel.org" <lee@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, Pavel Machek <pavel@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/1] leds: Unexport of_led_get()
Thread-Topic: [PATCH v1 1/1] leds: Unexport of_led_get()
Thread-Index: AQHcadE6xxkgQ0DorEKbKZtHICdTB7UbLSMwgAA+TICAAClSsA==
Date: Thu, 11 Dec 2025 00:49:12 +0000
Message-ID:
 <SYAPR01MB2863A415594BCC2FCAD80876B2A1A@SYAPR01MB2863.ausprd01.prod.outlook.com>
References:
 <SYAPR01MB28638039D514AD18AA2B43C3B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTlon6M4Gn0AuXyz@smile.fi.intel.com>
 <SYAPR01MB2863FAF8B39141E2FC402D21B2A0A@SYAPR01MB2863.ausprd01.prod.outlook.com>
 <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
In-Reply-To: <aTnsCw8KGVoEiQ34@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corkillsystems.co.nz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYAPR01MB2863:EE_|MEYPR01MB6168:EE_
x-ms-office365-filtering-correlation-id: 7cb5920d-c7c7-4794-141d-08de384f1a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YtwUdIwPSr0BX10p0gh18jJqL+97lJnfbEsREUHIgk8npvIs9jBqJIuuFODI?=
 =?us-ascii?Q?H+G5dOJeal3KmwwEMA79N7ZHVu1Jp6kin4o8pY9TvXb08igXSvUpk3FOEwEv?=
 =?us-ascii?Q?AqOQgp8HFYwRDX60guD6S3nN7b2joe4j7p2QroX0GKM0pMjCW2wXVw7gE8ED?=
 =?us-ascii?Q?/JG/pe4/1FKlnuoHBGHEq8d6FUlLsXLbAHemM6os9CygRHf039OMroFCKHnU?=
 =?us-ascii?Q?1QnLqoILMsaBrecKaL3Z5mt5KfHv3NHWtc7dQS+44057eFfV5/ZcnMHjm1Py?=
 =?us-ascii?Q?8sQlwmdZGMpbV6JiaFxGukUzImaWeTm7tWFjX3o18XekpfZxI0q8W1aWQjtE?=
 =?us-ascii?Q?H8c+GBBUCh0cHstiPMB90A/gzE94IlG4ulEmL9yxL/CDARjUyVdiBkNhC7oW?=
 =?us-ascii?Q?lLzO0rqM0MXMDOk5QRgCD3Swyku8irkMq4p+yGjmMENRU3PfrwebUIbdGtMt?=
 =?us-ascii?Q?UUD6g/QT55gKttQXQuELvXbl8U4/Gh45AF0EqslrpC74vcqgONNcOz6BGKAY?=
 =?us-ascii?Q?1aGEbeVV0XzbEV8U4B6AgdsbAMJ5QmPSoFyv8CEDZD1l8NY+CZwkYhVbb7wA?=
 =?us-ascii?Q?oNbgFCrJhjs6cXcFs5IjgZ4KFe11QpkuaO/roeaaXvpC4o/MMH4lpWnbkLoA?=
 =?us-ascii?Q?/eVHaA6ADo62Pv4JJs3xLzc12j8S32UsoeSdjRfND3YWFQI0YZWVs60SGehV?=
 =?us-ascii?Q?b3625PDBgpZaoiysZXGruBmNqbrlhklKuv8HkjLUzt7DHrcxLeQ2LtDbabky?=
 =?us-ascii?Q?WAuVJH/73bF46QOmRoG6MsiideYvKYknXa8fu+xqxu0bpgJ2cBGiFidRm2CK?=
 =?us-ascii?Q?SIVps487kzPJob4F7IsLav0S61IfSUygcsk5jIfGZp4ChhS+yqi5xrYjpbUI?=
 =?us-ascii?Q?X/5qQ9OcvJtlfqpO41U/vNgECtw4NoFHm3fI2Qds66NTBl1ihd/NlVhqG2dy?=
 =?us-ascii?Q?DZOxKlAjGfE2DsP14ZDNouEctFcT/RrKnHekvK/xwQ8M0G8mqyssRj9/imfZ?=
 =?us-ascii?Q?G8LQIyICTfM/9HORYytu00Ffb2AEwWNXTvlK22JVmjlhQlOEy6SJhoFrxmxU?=
 =?us-ascii?Q?qom0tUCAkkByTjBBpqXfMcSmYaEs0IvIPehTjof5o95jT8igblNoU69BNC0m?=
 =?us-ascii?Q?5oLomJYr6zvUShjodhagr5qWqTyEBKdCVuZdTGbm9TNHTsIFEg+sWUSp4b/U?=
 =?us-ascii?Q?fPhaiXMeKmSMbN5BuuWOsecqyGlFOP5EKMH3jRHWFi2HC5BD598r0T2+5Xzk?=
 =?us-ascii?Q?b1WisQ9ey3P8HoAPrn4UqshB9ynlXnzTKlhnDl1S5X9f1CufEEjiGSX1JOZr?=
 =?us-ascii?Q?gzyCCh9W+PSRPXTsw7x5x0PivC9z1GfvdDRSvwhnp7lTh+F+81pNYQ/L1DZf?=
 =?us-ascii?Q?r1bFnY5gBmI8eIAnyyL08cKWIY9yqb2lP88jItZPoNptsYSn8lGCQaFVh79W?=
 =?us-ascii?Q?B8tKjm7w0sWzEt5XHcY1T7AywNUyOSxqHBbOV8qi+pjj70AaTKS6sglsiC/S?=
 =?us-ascii?Q?ZdJ1mZa+Z5eXDWOduitgV6ezolr25t1ZDe7x?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYAPR01MB2863.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Nt4UAiPoTXD9tA+QpRwPKU9UI4j17SjxCWIr+d9KWk92E69YfRCxpjcR/HCc?=
 =?us-ascii?Q?i44mBzTOskfFXMxnlpBIuDtK1XrIeBy6LkodapSjLmKGfrfCQXH63zKP5NZT?=
 =?us-ascii?Q?fCjOJ5zB0IN+hkhmvr9Unm3toOvKFRqgMTMdO6EH7xKQcy1BvfmUWE/edpoy?=
 =?us-ascii?Q?oQOE+Oq4CjlJGZBn8Oi0sH5CZlYJH3ZFWmHe8WnMoj+HZlgXnbTv8T97uCoI?=
 =?us-ascii?Q?A0eoCeTbJ7kJsain+Udu3re31iuTyBk+H5Njg0tEIGzcoe4wrw26knRu71i0?=
 =?us-ascii?Q?xpTFWNtBvt+zk7aGBgbpO6QH9zRS4a+nePzxde/tW4dF7DIS3S2t9joZzF55?=
 =?us-ascii?Q?xNLHR8AbD/ll01IRCqs83ZtMR849ouS1jkQN+h8rd01zQnoFQSttPqdUsttd?=
 =?us-ascii?Q?4sut06ohgW0cQMbGoYUM+wJNGLSXPdQeXalraXdwe/BDyLzm5ryUr2By3x8m?=
 =?us-ascii?Q?msyC6JcscS/Tt8JqYXM76iGdg/gNz+j04C62rNefz3dECS2t77wopPo5bPzk?=
 =?us-ascii?Q?+G12zbZ5Q4thc+GOtZlp8koXJAkGltcWTwqDeXlL1sjOkLLQ6c6+B5B0SCAb?=
 =?us-ascii?Q?xj4snc1kX8RPQITXLGWjJgdftXkfTICNi1RtAAMcqHIdfe4ufOQdSO2sO3+0?=
 =?us-ascii?Q?UPB+9otoZ8/3BuPnvfqE2y+LboPOc5ox7S3bIzKws7HBdhXh+t2WWt3o4SOu?=
 =?us-ascii?Q?hD+hypyHuf+KE32+7Jry6DFsGpqZXoDTsN2pgJhMVcAf+GjJ07EcIVS0gIVx?=
 =?us-ascii?Q?l2+jZodJ0uf46Z/NJ3JE4JaSdkmor4UFkrS8GJxg/eYXJkYjMh8LSOy2HZ2p?=
 =?us-ascii?Q?ZRTQJKKmsYmgcX5fljMEwlcN8d87525EGUk/zw1oQ9tv3lAMvYvwLB/6Kkuq?=
 =?us-ascii?Q?TojKwhW3nusmQ32fryhZ80mq6VK5AdkNBsaEahqZbVU48CbgsLisHQVk4oXl?=
 =?us-ascii?Q?DSeC8ZO21G8PO5ir00iyPz0OvuInAqAGU1OubpyecvNUiNdCoZiVcV9YMzTb?=
 =?us-ascii?Q?0n0652jB+q3JWOXgJXWOp7sB8y7hY9dyccOt0o2CN5TWYWmTC1WwL7oBz0oH?=
 =?us-ascii?Q?Qt5CbGFrxP50y9CGEsLLBwHF5Whu6Gpb5ZDKbyX/MBdhZLkyntTnUEDXS31G?=
 =?us-ascii?Q?OvZdi1ghuGz0qivV8EvzMO0D+klIvOmVP65WUiYIMnZjehUfNp4LPJhZpNCN?=
 =?us-ascii?Q?PN4WNiseru+k/yedx5Nic+xtO5GYVYTATx1JlCEuR4Bn9/K1ENU4MlGLYs5I?=
 =?us-ascii?Q?WrtR4eeljJX8qYlNVIDLX76a8E8fmWYPjDgRLQ5N5N0wOr88yNXPpw/nf48N?=
 =?us-ascii?Q?EgVEUo45eHxHQNWUyxWRzWdDI910NcwM/JPCrSRfMoV3ZVYZRELCL3SsS4Xq?=
 =?us-ascii?Q?jksrRTInnxpttVvl6FdkDJnaRFrEyHGr9BgGweM93A66vVWNFpN/iv2GEDSl?=
 =?us-ascii?Q?ll95NgCrLdsIFgA7UwY76e9BQceITLNs9IlxvPYpfIzKOMxIBP5Gg3Nyr8xk?=
 =?us-ascii?Q?PItBco6dwOLwZTBAvztA91z/Rx2opfbsvcLgPzCIaiUljOLwB9OIvYtIC1Sp?=
 =?us-ascii?Q?gGPHnJugH82gTYK0IWMnJL8KlBAdJSQFPy5+5SrT8M39eTLI793CfSCgLVda?=
 =?us-ascii?Q?IA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb5920d-c7c7-4794-141d-08de384f1a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 00:49:12.8347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 29480a39-0abb-4113-b3de-0e01bec9b1e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwHQxedJud/m+Mf2aH6n9+vhIphT4lrjFXquQLLCkETAiJ2zh0zNSd4Y3pObOhIiKYurAI3JrBNLEHULEX6TFvFvb6SWGHAbyMzuSpcqb54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB6168

> Still it's unclear to me what it means and how the code look like.
> Perhaps you need to send some patches for the discussion (maybe as RFC if=
 you think they are not upstream ready).
=20
yes, I think  I will have to do this.=20
I'm developing a virtual LED grouping driver that needs to reference existi=
ng LEDs via Device Tree phandles.
I plan it to expose the group as a singular or multicolor led.

as below I need to resolve the phandles of led_system_red and led_system_bl=
ue but there does not seem to be a way to do it under=20
The current api's:

DTS
	virtual_led_set: virtual-monocromatic-leds {
		compatible =3D "leds-group-virtualcolor";

		led_virtual_violet: virtual-violet {
			color =3D <LED_COLOR_ID_VIOLET>;
			function =3D LED_FUNCTION_STATUS;
			leds =3D <&led_system_red>, <&led_system_blue>;
		=09
		};

> You can introduce it as a precursor to your driver. But OF centric varian=
t gone for good, we use fwnode in a new code.

I think this may be the only way forward.
Removal of this function makes the virtual led driver under the current api=
 impossible.
I have my driver working with a of bridge following V4L2 fwnode helpers.
v4l2_fwnode_endpoint_parse() and v4l2_fwnode_parse_link() has OF bridges wh=
ere only DT bindings exist.
Drivers walk endpoints via struct fwnode_handle, then call helpers that int=
ernally translate to OF nodes when needed.
I have followed the same architecture on my driver on an older kernel succe=
ssfully.

I was thinking a simple replacement for the of_led_get() with a patch somet=
hing like below but I need to formalise and test further:

// In drivers/leds/led-class.c

/**
 * led_get_by_fwnode - Get LED classdev by firmware node reference
 * @fwnode: Firmware node handle pointing to LED
 *
 * Returns LED classdev on success, ERR_PTR on failure.
 * Caller must call led_put() when done.
 */
struct led_classdev *led_get_by_fwnode(struct fwnode_handle *fwnode)
{
    struct device *led_dev;
    struct led_classdev *cdev;
   =20
    led_dev =3D class_find_device(leds_class, NULL, fwnode,=20
                                led_match_fwnode);
    if (!led_dev)
        return ERR_PTR(-EPROBE_DEFER);
   =20
    cdev =3D dev_get_drvdata(led_dev);
    if (!cdev) {
        put_device(led_dev);
        return ERR_PTR(-ENODEV);
    }
   =20
    return cdev;
}
EXPORT_SYMBOL_GPL(led_get_by_fwnode);

void led_put(struct led_classdev *cdev)
{
    if (cdev && cdev->dev)
        put_device(cdev->dev);
}
EXPORT_SYMBOL_GPL(led_put);

With Best Regards,
Jonathan brophy



