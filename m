Return-Path: <linux-leds+bounces-6357-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9FC9558B
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 23:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D0223416EC
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 22:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F7223645D;
	Sun, 30 Nov 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="KZ3czxe7"
X-Original-To: linux-leds@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012052.outbound.protection.outlook.com [52.103.2.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D17B137750;
	Sun, 30 Nov 2025 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764542799; cv=fail; b=abDq3m0l21lf+ol2P0TDzGY5LkRkRPnNzJbDAmdx6SP1Xn7KZ/9MzNy8lDyGK+zadAlZoLcaPynomXKvspU5LdJiyi6RH/X02+K5OfBOD+8+XCt8ILI8rjB0QYWYEgWH0u/hMft103NPrClRuUKezfrqKI9bcZVjCM83BxXQ1tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764542799; c=relaxed/simple;
	bh=gmm3WjQYbsQZwnWRqYkCQk9q7ahs0Jf7xEL8x50az8E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZZFXG1QkR7J6MqOaa3cyR/5MY+ttL64s3eHC5xeTsjpyQkbyjb9wmgHXSKCpEiFqrhQzk+U+ThHld0ffCm7twc6Lc3iSotkN/Z7eJWPA8bCHeykpOP+c3C8M7RH+e38/Yfm8IL7zPdJ+sEVf5rJH+MxMju23gXxnBTgEhdAoKlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=KZ3czxe7; arc=fail smtp.client-ip=52.103.2.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbvdMS6XTmjS/P2ZXqQIwbFiQnQKHT1OO88IP85SgZ9hauz1PIitFKrvina2PLaDr7YVDXQ480FhT5bczNuq/UrZbH7zDQfdBVuWlx2B8zBcXhRE4LpoBYMiWA008w+vhF1A+0x0LkBhHmZrWb0IBeeYjdQhMDtxTlyrlIwX/ma0hUVno5tFG0jmAry6ysRt3D6l3bJRjOtR6mYciBCuyK/3b0cIA5oIOCCKKZIS0VtI1HK2iSjEudtKCo7bocDc12TD8MsDH3S7sM0mV3o4Gm9z3gUWpAtIMyms6QXFj4CZw/HrEpOEt9/1/Uorh637vyK2E7xlBAD/M9+2LbCM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg7uSemT+wzBW75Yz8+TObizg66y4omNRDV1AClisao=;
 b=suQkEaLj1a6w84BLhcMbleo4P325PVZ4oYFDqk0DVGLDPPSEdOcz5oLum60gi0NvwadT/Uph+jJCeNYuRxtCxVNHgwO+K5AG+Cn7F6hzhs4x+9eXWltQN9BDh3hoUm16VIW8SKwxRIf4RBnQS5mvORX5J5F5whyZDDlW2lgQiJbFteVJDDPKmG9+BmV3oZwQV2MrBM0NuIl4EZSyZkHzvjdLdUTB7eG3VFyF16EDhj0MfD0CHRAdolBI3rFalyYcwFbJEU2Y8aOuF1SKnN0wzIn8zw8J8NGhNdBkGvmtHzBmH8F7oTrKrXKy3ue7uOAl7bFOWwGnrOsno5aFzoXlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg7uSemT+wzBW75Yz8+TObizg66y4omNRDV1AClisao=;
 b=KZ3czxe7R9mjaLWzf0YSFXkQuBprrAnPPMhDWTFhEdpjUNI8J4HzVIyiOemTwCt2hkPhferGrYGV+60DcKJSR9aWB7sMsQDKtTmr00TGBGGRPhCyLV9sGPfhi9hkkkMy5/3atC0CoV/soVklUcaVRY7z/dOu5SFThVSybtjAayDqAfriir73MOtb46m2TDPp47FEv+jI0omtj0pfLjdBD/Baa9kN89/7D/SDHlOcSEWHWzTmAH2lcXJricIxFKi8Mm50fNJ3Ip4UMBFG3PRijqcV8Dy/sNVUUNeN9TOQ7m8K74KcKCkoGh4c8BUy4FF0l3PzwXKBY6RPTXGUks3d/A==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by SJ0PR84MB1722.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:431::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 22:46:35 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 22:46:34 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: Jonathan Brophy <professorjonny98@gmail.com>, lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Radoslav
 Tsvetkov <rtsvetkov@gradotech.eu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Thread-Topic: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Thread-Index: AQHcQNopJuD6pqltWEyBJIQ4E9N9H7UMDKpg
Date: Sun, 30 Nov 2025 22:46:34 +0000
Message-ID:
 <DS0PR84MB3746D474DCC43EC8A73F930E9FDAA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251019092331.49531-1-professorjonny98@gmail.com>
 <20251019092331.49531-5-professorjonny98@gmail.com>
In-Reply-To: <20251019092331.49531-5-professorjonny98@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|SJ0PR84MB1722:EE_
x-ms-office365-filtering-correlation-id: ecfdf80f-874b-4526-8ae6-08de30625054
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|51005399006|31061999003|461199028|15080799012|19110799012|13091999003|3412199025|440099028|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5BSu6sGlGLC8GUJXLN4oGX3W1qDORaRYEOk5G7nUUADAJHklK7hKmqqHv2eg?=
 =?us-ascii?Q?u156OhMMNmoIrS+kWcuHqQIEjBhZaRFbbUQzuZaZkC7nJSL0rtFChFAFXs0V?=
 =?us-ascii?Q?82Ovov55W/cqkBabNZ26Dw0DEVpruZqawtruj510R77Gac8UFhmPOKxBx6ZW?=
 =?us-ascii?Q?X5tQ1MzM1jc+YO2ihxpAwvbgK7ygNMBUeLN93duuzHv82J6TUmutbPzgzn6k?=
 =?us-ascii?Q?uXuEtyGvQQsmjEEfUCZkUMEl3BO/Qsef9EgRXbBLO4hcJzn6UnfSi4x9KwO6?=
 =?us-ascii?Q?CxLaOVjtpHJP43/O1Q/oR4ingEWTBnfHZCL9h+6ieQE5KaCo5gyx9jE1rwh1?=
 =?us-ascii?Q?8DP8gSlYSoDAwdNcuhnMOT0+6y6EWiy+jGdeZccONDRx6q985dzzlzgQvVa2?=
 =?us-ascii?Q?XYnz569tZyBsS5asT9be5KFCxcGY/R3K98/mjpCUsf4M8+qCMJw+JCIM0Ey8?=
 =?us-ascii?Q?W4u9XywoXQ5Co0JTX9+PC0hzB/u2kg+AFKhG03BxODD06Xrkrc8cP1SxWgpP?=
 =?us-ascii?Q?/Diij2LHXuW9v6rhW1xpUXdey/IbrBIl6Ra5MZ4pC/kUBJiQ8YLI+Jm6s3EP?=
 =?us-ascii?Q?Tm4nDekgm0eTULvMj4T+gVzI7eJdhhlv+u3+BniNRR1YuvZDzjBWg7Z2QbCP?=
 =?us-ascii?Q?OkBK7TJ6UwuLjYdq/r3a/HLOkYHNOMgSDqKn1JcClS++lwaY8Yfk2CoqCCP9?=
 =?us-ascii?Q?MI1YpvsDzY/0M39xBvJq4GONMR4xB4Or3J6XBRnxOPozfGeCfShX8vFqile+?=
 =?us-ascii?Q?WUQ82E30kkrNx39RGFVvjk4AcPn/HnMqIpzNDhnzHy5dRHzJVM4cgzcjBkmz?=
 =?us-ascii?Q?2XEOfcLVcspB9hj6BH+WdAayXlUQREn91+qWNuOA9uO/SHHZUgf33OfWZsS7?=
 =?us-ascii?Q?v4MtPBPDO5cffYLSDk//cMmopZz/zb7wjLL3SUe2W/ORoeTiNhpwgBmT2GpA?=
 =?us-ascii?Q?v2cpRlSe056EcoKtnBKMPGR/yANTZYYPbE6gX/D1v/gSnNM1UC49PqTSHJNc?=
 =?us-ascii?Q?fCw7e1Hd5wcKYaL8l97GgMj8eiC11LOotq9w57YHko9CERsFxX+pS3xehFYb?=
 =?us-ascii?Q?fBGP2a5E5hHg6+rnUueaCqFA2d/Q8buD/v+Clp3sTTGlOUdT+vkEgh30RpYZ?=
 =?us-ascii?Q?DzUMVinmUHD9iWfmS723iRK90kkCCtKoWNhF7I12CX9/M7WDkkW91doQ9c9f?=
 =?us-ascii?Q?Je8S2F9jPPeycRDw8UAtN35rniecnyNiAs/qOQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tetuliOerBxoS5gz5rgRXR7SRjoBEKeTQIroSO60qFHfTnH2ArSsMT76RrEi?=
 =?us-ascii?Q?5GoU6Ikq3VyyLns2BZGqjZaJ14y/edFGZYPKPg2dXNqVs835mGjCB91zKZlu?=
 =?us-ascii?Q?0mzelRTTBd+6WF/Zv38KslVbNQvV7J85kryXOHbvwyWH8XI/iJn6kOpeB0EY?=
 =?us-ascii?Q?/KdU+xDJPIqI+E7nCfs7KJvAuniR2ViS+VhizTpLnEprCwyIFuXUYyrKb/8j?=
 =?us-ascii?Q?TiacoVoMaAuf372u425kjwQM2RVLkL8bXLsWNEKr68++a1H17V5g0V1O032h?=
 =?us-ascii?Q?AC4VaSih5T5T0r64MpnjBPhox6no6UmHSNSKrGM5p9cyAF7gQPIiYdlKmzDY?=
 =?us-ascii?Q?NLKbWR++xZuTOqKjkTcYePoyFRoLO1vDey2Ar0OYLe4fu1lXlvm33GYiFEMn?=
 =?us-ascii?Q?EvK42AVGpFPGwcY7U9Pp2zpslMBtNrXyH9ZvBV+OTbxgrbXvTvLRf+pPIQPM?=
 =?us-ascii?Q?MnODJZWjZMbubT1KZhabACdvJwaA95l08is0wguiVi+8gBn4r9wyawYbXlbX?=
 =?us-ascii?Q?KZTBjM2JtVo8PnxlPG2C3rwJpnDx+/1WfenToduEUbdASxq7+raXWl0W70Wx?=
 =?us-ascii?Q?GBYXS+FYU5hrBWZ476dAxdaNo4rrE4r2cmvfp5LM2BbQyal/nM5axWH2cKsb?=
 =?us-ascii?Q?Jf9C6C5Me2QpFEoMFPvo7jdSfD1irVsPR5afdP4agxEX9Zpx1kuHGZIGR9u8?=
 =?us-ascii?Q?nSKWZ1Z1OA1oMkno6py0r6XZDKgu7RxZs6DedoxK7gSbyj0l31mvNa/ENd9V?=
 =?us-ascii?Q?GHi+aNUG6/9BaHY9EMHGePEclDj2GLAHtpk500Jq8SmbIZal0g8iRNzJrfBD?=
 =?us-ascii?Q?SA5uJ9LFo21d/iS6N81UswErwzt5S4BeJvvlcVYNGMK5CBwZ/x6N+dFoV5Xc?=
 =?us-ascii?Q?jxQ1sSA051mhuDFaBO63yb/Itp7whQh8FMvnWrAb+hoswXJ/e9YH9+WwQz2o?=
 =?us-ascii?Q?HiktI0x+j14sUk6dFCDinbwnT83FQH/+RBcURmxYtPtmJ1TiNdsoqfLJOqbG?=
 =?us-ascii?Q?OvX03Pizw3PVc3o6BJ8i4Vt5HvB9xrtMfvmFbrEBMNSMjZbHlMyvAKqbL2ks?=
 =?us-ascii?Q?Rltmy3pzMoW0sTPkr4xb2bHlDj/JVlkRZxqwkOzHzTsOD7H1/XRnmJpBI8VB?=
 =?us-ascii?Q?xM9PfP74EvCSge7AbV7tlgPPi82uO9BpDGboQiFxIgd97AQ6/hnkgt1h4gts?=
 =?us-ascii?Q?JcT8M/AOCheG7eJXfz+VEsxVC9cawJtnKSd9/x0xTc2PRzoAd01dbdY2800?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-774d9.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfdf80f-874b-4526-8ae6-08de30625054
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2025 22:46:34.5695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1722

I have been refactoring this driver for a v4 release, but I have come up wi=
th a problem in testing with a new driver.

I have converted my driver to a complete FW node implementation, but it won=
't work with LEDs provided by the GPIO LEDs driver as it does not work like=
 other LED drivers.

GPIO LEDs register using devm_led_classdev_register_ext() but thet don't cr=
eate a separate device structure.
so there is no symbolic links or FW structures to read with the modern FW n=
ode functions.

The FWnode-based bus search (bus_find_device()) requires a device with dev_=
fwnode(), which GPIO LEDs don't have
of_led_get() and devm_of_led_get() have special handling in the LED core to=
 work around this but then I'll be mixing FW node and OF functions in my cu=
rrent driver approach.

Do I keep with OF format or is it ok to mix and match as it has been done i=
n LEDS GROUP multicolor and other drivers? As it was already pointed out in=
 a past review and was not acceptable but there Is no real way around his p=
roblem otherwise I see.

my alternative option is to patch the led core to add fwnode_led_get()  to =
Get LED classdev by FW node?

I'm wondering on the best approach here as every option has a drawback, or =
review problems.=20



