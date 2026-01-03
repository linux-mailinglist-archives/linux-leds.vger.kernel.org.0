Return-Path: <linux-leds+bounces-6521-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C37CEFC9F
	for <lists+linux-leds@lfdr.de>; Sat, 03 Jan 2026 09:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E92C300B00D
	for <lists+linux-leds@lfdr.de>; Sat,  3 Jan 2026 08:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B0824503B;
	Sat,  3 Jan 2026 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="HYdaC01d"
X-Original-To: linux-leds@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012018.outbound.protection.outlook.com [52.103.10.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A9D3FC9;
	Sat,  3 Jan 2026 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767428531; cv=fail; b=QRQsvKb7d37CZXJ2HBst/ctuQ4lPEfXpb2qiffI6ufKMoXRA4AoBVQoaRLLLA9M4jMqC/+bcm/nm8OrZuCUF3ZJhL6qA9IdXeOkBS6LoaQD6pLd4GUFJxrzHFoZH/MAO4uBD7Sw0HmDKyg8EpQ2BPfprec1FiO7s8FQ/l1Pqv1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767428531; c=relaxed/simple;
	bh=51B09RM+8fNEB+vaJX8cxFhIpK6WZrn+9bmAYR+vAnw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QgvZtOp1PsM8CKvWJIPLa6YQNJY53nVJox9VHU9bXxXi/qI+gc7FGX6pllcMq5YIc+WwpyRfCJwRIJGMHPOjzyWiqOjb1r9MPjzcPBBpO9G5Tdh4bL3EHHEpwsm3ZB3aLK8hOT0xGVeOFheJuevsh/lc4q58ud5cgIDE4VtTb7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=HYdaC01d; arc=fail smtp.client-ip=52.103.10.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mn9mGg8+r+Kxw+d9KsNSHkyXdXDAE9qKWrO1rsg3SFOQwIR2ISu+1OvweWgsHxetCHr3ZyR9TAuZvWCXQ9Kn6MjAvm0QPIx55e/ILC7DTVeXOEipZRIlByvAWOzKktBD4n2h7ocJpGH9Y7kY4TfrkceFb7CAFD5xzebCJLnMioRxThDvZq37J017Q3nEJ2dPbyZXiwqu8WwAULJt6jonbu4i+I4VyBviouzxVEKQczHiCIm+R207WuuzvAFfHfFeuEdE0TOJIiQS2QBXWTeRs+E3rUiANalGEOBW+nkWhuweZwHyD9yrN/xQ/xEP3NfsL0ZaS+nVLrUWeJ5LG8cdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYwOQLwLilwEIp3+5fpjSEmuPLdXDTbPUCAqLmDOVDI=;
 b=Y+S3V7BBQbkDMQ/W9iWVU27DZQqMclAAP2fp/pnK1//O8MeAWTxMeqeQafsi1DHd/y8Yt8EQeY1Q5Dziy5fIzjhkAJYRamclnzIO8Yw3ufo11SYY8clJcOqG6EJ7DmwGbfZ4n4ZHB8jdpnhrDd4xNVqQyBGZ0fwm6tRrbkDrfs+PFXjjhRNGcizYY6UjqFiF1hCijB1tQ+mfRpcUGlmmI/vedfUTLa3RW5m/E1j3qjQht1VJSj+ThpTx4bewq/lCZpG6vOzcH+bjs73SkipGsuWvDbyvs4e9wRLoZVd+RHfBvB3ffik1ApSb0TeByrNqgiqaGZOLVUwmpyGKoF0wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYwOQLwLilwEIp3+5fpjSEmuPLdXDTbPUCAqLmDOVDI=;
 b=HYdaC01dq4QjDjNjAHfTp8bVtTT5XbW7fS+c6XZTxZDEM9pWh5kDFsrtyahcxvLEbHo8NhFYkQv8l7UmmArDk3FnbLoBUkSEvMHHf5ELGcxT2RonnM03l/UwpmC0e9znYkTUclZKTjBsjxnjWiUp6/W2jMBOdNlNqc6kxPEenMj5yYKtF9XPAuZ1rtzrZhYtNR32ZhC0Z0PCZxFVtK8LdbXe84IvdrDJkalURrTgFZDP6xJNEhWtuivUBfOuhuirGNyFmDIvg7u0ExhJhALqM9IVaJFy6FXROCQvZT4bLlLM6VTvinMI1zowpzhiXEkri+9B5jRF8YLxnlghkbLBMQ==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by DM3PR84MB3428.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:0:46::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Sat, 3 Jan 2026 08:22:08 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%5]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 08:22:07 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Andriy Shevencho <andriy.shevchenko@linux.intel.com>, Jonathan Brophy
	<professorjonny98@gmail.com>
CC: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v5 7/7] leds: Add virtual LED group driver
Thread-Topic: [PATCH v5 7/7] leds: Add virtual LED group driver
Thread-Index: AQHcfIoMoYMxKqwIS0K1NiFRT0MeQQ==
Date: Sat, 3 Jan 2026 08:22:06 +0000
Message-ID:
 <DS0PR84MB3746506E7740C032585F124F9FB8A@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251230082336.3308403-1-professorjonny98@gmail.com>
 <20251230082336.3308403-8-professorjonny98@gmail.com>
 <aVPDUVNX95Hv13VU@smile.fi.intel.com>
In-Reply-To: <aVPDUVNX95Hv13VU@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|DM3PR84MB3428:EE_
x-ms-office365-filtering-correlation-id: 5f379939-4f97-4e59-1edb-08de4aa12ebf
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|19110799012|8060799015|31061999003|15030799006|15080799012|51005399006|461199028|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JLugJriYELWT1JVdN2gc4f/vSMi6Xy3pFH8LD+tzc6lyw1F8ggFRTCT31W?=
 =?iso-8859-1?Q?M7Yjh/R4EQFIhY9KSyti+Sann0pxmH2ZRUoNdbTaRXXU0UFm2wc+vCKPpW?=
 =?iso-8859-1?Q?Mr/b9nu+q+ZKgWLT7oYSi6qdySuebZ97cfOyewE7ZSXwpQXTyaxlJb1BWN?=
 =?iso-8859-1?Q?gNtSD+dgcLotPhcAfCqwEeB5Y8+Nvnt4CjhGGLcQJ/Txt2j1QrGXEwoPbq?=
 =?iso-8859-1?Q?OwbxgbRVXCX9kZkISzVpXrExZkVrLn6aM9gHJ9BSHmR3qru+tShxQwj2Pf?=
 =?iso-8859-1?Q?cgr/8iHdFuZHr+K4N92fxkdJnqqSFtNti9JUho6aTT488gGODYfCGpjxoo?=
 =?iso-8859-1?Q?iN4zKRT7E8fbZRi9bzl8ygWAtmJuyJxUqpnuhfAOcV8vGI8mrhi6eBfKlr?=
 =?iso-8859-1?Q?LDLXWOyoXQFzaamefrMNF6POOLb5S2KucXO826SZxUBYMkxiExa1ACPwDx?=
 =?iso-8859-1?Q?orwKp6d+l0qKBlvZfkq3bScjUp0+OPAx0MfjkLAU57RJ39wEbeIavcoc0g?=
 =?iso-8859-1?Q?rLyEaWyFl/m/Ndl/7syNgeQ99uPcQAh82XggKOnTb2KrflhwtugSJuGmIE?=
 =?iso-8859-1?Q?DxZfeywZbJNT98eYuyrxRYxinqcHhPg3t0I9wuGiIHVe99bVdrZZ8YHiR2?=
 =?iso-8859-1?Q?3Bmr+LzSShQYC7yA5CdMh//xuYQ4wJHuHG+V7kImMx+Zk435ffEwHsOtzd?=
 =?iso-8859-1?Q?FZdXDR9b2tevwDChJ52mX6hKldHEmRxL1vJCDV+HQa0IakigsEALygaPOF?=
 =?iso-8859-1?Q?xViwglv8G4Ka9x9VgAMg4IjNxa4xt6m0uK0wWrvjc6wvVK3fOOHwWaWo6U?=
 =?iso-8859-1?Q?p4NIX2Fdk/mlr73/q1wbHHTkbQ6TJOrYc4uWfzzKMZK8eaElhrsvolpLyn?=
 =?iso-8859-1?Q?fRu9JHdIe5qxgAQszrpqNUkxP5UQP6Dvycczud7NAWRElmlOC6HJhQPo6B?=
 =?iso-8859-1?Q?JSYlf0bOHLo7nQfLrponfmhJpM8+j2JYMIGRmc96yHhfMEGsrpiVT6lDrA?=
 =?iso-8859-1?Q?1AKS6EFxS1Q8bC3mSVvfBASTNLSdT7LllCIaXuIetzE8hLvrh2Dw0MQOxL?=
 =?iso-8859-1?Q?UXEIkoEHAi4V5sN3wCAut1ho9Ec017JWQKVM6Brg8MmcxJtL0XYTWPa1xk?=
 =?iso-8859-1?Q?L4z82BkpZNyQ7WMtkVdv58ln+S3HNd+F7wYe92JiMj6+5FYQX0KQ2bplZ4?=
 =?iso-8859-1?Q?otCTPN+qFtPPWpgLGJAglOO4Y8qLihiC438zLWksm0S/FfcpQUULpvnFsj?=
 =?iso-8859-1?Q?/GUVeHm5oMvCM7Lxb2xw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u+oQcrtj+lOy/SqNr6UmSDbY6lRTTc8g9FIMKo5H61Y7ZH78JKJjSTf+7L?=
 =?iso-8859-1?Q?jdu7CTbIUXhjQH7GMqnta7AQCzv7Ud1McW84p9M7sEG4FkwR9fRZ4Uu9T9?=
 =?iso-8859-1?Q?0Eov6xXyq88IjXpW8OZ54dBwLkxxKtOFqO/tfnjSfZn0jACM9d9PFEgYGp?=
 =?iso-8859-1?Q?FxYA2zyoByWpJ33Wb6Jy8E54+20aVSk6KxVptPbPWLTI9nmwzqJE2dBHUW?=
 =?iso-8859-1?Q?nV7EWzHDYynNvwIqOy8gWsv/PicF5bQ330+aB7iEoT6hTCybk0BbGJ3/JR?=
 =?iso-8859-1?Q?Tqgs1DWEAiaYlJOKk9+gqxvh+yu13CyX/exYgriQUJls+rk8rni4pBtUVC?=
 =?iso-8859-1?Q?0eeAOp3VKoLzA5ICqQoTc2oze1tKGNW5bqmyFO/N7HoLrycUI4qhoHUsW3?=
 =?iso-8859-1?Q?ySouXg45pzK9Q1BfNK8BpciZQDKsY0XRXIEdE+MDeaa0mr0ZKwB4+LF/7T?=
 =?iso-8859-1?Q?rkbhGSYrgMsOfHXHuPyCNxJIFvDpSfaL9EeisAOLMQX1KE1Lw0iG6yjmfO?=
 =?iso-8859-1?Q?9h6Pt5OOIj3L9mrhqlODrccSAjFO5crIZICKYMQgEuWCeqH0NDxOeXJ6gv?=
 =?iso-8859-1?Q?2Bk/M02UStSUXJpSAeotHLBCo1XVlsYqHGOjw76kyFDG+wjwt8J7Fp345n?=
 =?iso-8859-1?Q?EfPE7uCayWcAJ1s9qSA5ncaoTQAGkf02GKpRNbr9lkB76MDsfoDlHYofsB?=
 =?iso-8859-1?Q?MzqxqUocfIV+qQ9fQ95JmlcKVSfxXytJuxu68XyQRWjYZXGnG9pZguIjjj?=
 =?iso-8859-1?Q?Pnx0LlREaREE29G6FyTAINyPtnndfb8Xk1Wk3ddUMd79xW8H2+evbTZB8i?=
 =?iso-8859-1?Q?EZawodOoR1AaviA6HBNqFQJBy648yEwfYFhw+JscAaZ8vwNpmvRwUWQAGd?=
 =?iso-8859-1?Q?2xBNd1kFpuG0dskyIDLA6ljoq0SqPiFmArbh7E6ecDtH44Rxcw+UDro6yH?=
 =?iso-8859-1?Q?IFrIHTK56yDKXJ0ZNkMUhJlBh7pkkH48nIBtLv2wh2f+I7CaDDaSnBQUDv?=
 =?iso-8859-1?Q?di7StAW+8SN5j8imYOa5Yt5/x5ZosMpPCcVVoQsT5g+i3Ea6rFYFcP3DoG?=
 =?iso-8859-1?Q?9DveeOg6n3qqh0Yk/w9t76+a2jdTphc88hcak9XY/0jQajbiDucxPkgbFT?=
 =?iso-8859-1?Q?kLo3+ho6jIQTy1e93DCg1BQWX0WZ1huNo9PHZnC2cWhudui6XoxHzUlPZz?=
 =?iso-8859-1?Q?krzgmUnWFIFKq1ozjsOAiXHViZ0t7HRpib+TVXVezzxZWcQvDuKEyBO9sx?=
 =?iso-8859-1?Q?I2HepYNb1l87XnD8E/nSJuzoCObGwOqz+iZdzcvcG8KsEOAF0soWPlYkV6?=
 =?iso-8859-1?Q?R45hicdVTQSkgAVZJGOQgdBoGMyAI0y1+p3pva2iyLuzKh8+G+khIFwNgz?=
 =?iso-8859-1?Q?TNooAHSV23SvYStjKgtTQr3JELWWgvGN9BsZYqBjhipcGFZ2SnOyKioPw8?=
 =?iso-8859-1?Q?Ai4gff15NSxBArqmi5OJPibQqePbG19SKqFLXbETRe+2zC/DNFIhj6D1Jx?=
 =?iso-8859-1?Q?8FuyAEm9Fk46fjgf6masH3?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f379939-4f97-4e59-1edb-08de4aa12ebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2026 08:22:06.7541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR84MB3428

=0A=
>I stopped with this, this patch is half-baked and unreviewable. Please, sp=
lit=0A=
>it to a few features and add one-by-one, for example:=0A=
=0A=
>- very basic sypport=0A=
>- feature A=0A=
>- ...=0A=
>- debugfs=0A=
=0A=
>So I expect 3+ patches out of this one. And try to keep size of a change l=
ess=0A=
>than 1000 LoCs.=0A=
=0A=
Thanks Andy=0A=
=0A=
You have given me some things to fix and some great advice I'm a very junio=
r dev and=0A=
I know nothing of the led subsystem before this project.=0A=
=0A=
I think it may be best to use a function to generate a gamma table=A0I was =
thinking a=0A=
hard coded table may be a better idea for performance reasons with addressa=
ble rgb=0A=
strips that I plan to implement in the future.=0A=
=0A=
I planned to split the driver into several files is this what you mean?=0A=
it would logically break into  files as part of the driver as follows:=0A=
=0A=
core.c=0A=
arbitration.c=0A=
phys.c=0A=
vled.c=0A=
debugfs.c=0A=
virtualcolor.h=0A=
=0A=
Regards=0A=
Jonathan Brophy=

