Return-Path: <linux-leds+bounces-4635-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB65AB6E45
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8CC1B6665C
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 14:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1924019ABAC;
	Wed, 14 May 2025 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="XCJcE13f"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2086.outbound.protection.outlook.com [40.107.249.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547699478;
	Wed, 14 May 2025 14:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233720; cv=fail; b=IOY8Z1soXlg2Ep/96thrMSMvGjTjHurzEt5vLbdj+fP4BRQx7avezNh/VI5QUYB+qdWNSLtAvgT6M9myke7Z9mTGETjJdd+ePeZzoNU9T8k6LE/QnGuBMlGcbwo9AqtsGSgssyqxHfhgHOoFyvrnwr9ggzGXO6UEFuJY7sPP6vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233720; c=relaxed/simple;
	bh=P92Pw7I5Z1Z8Cd7m6Ha2JSQcsTV5Y7MBnP/z4myUgFA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KzCHhRn6TRipvnQuNLLvmZVLdR4WSRim3x9bvJ5Umo9DG+OolVRbHGwIYjbCDHbjPqNnuNBxK7U8cbTMuzishLXQHsZHuuMeRYkJWAgUutGhA0E4U+k8N2fIOstoXpFvMgGu5Nc0tpsIz8SVe71KLOlXhRig0QvF/+mpLJjJVXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=XCJcE13f; arc=fail smtp.client-ip=40.107.249.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1ICEoqPXqCqVyKw+ljAG98hGySVYqXB2fjpJbXpZsIo8edRH0RYl/QjlSX1LXsQ20YmZa3yVfJcPZJkaRfhUg7+HgWELBUL2665dVy0PynbsG1bhOFr68kxpehbuoJ+fmGJwvTi273AT2h5rYq/7PPDko3avIElkYk/1g9o70o57r+sa9oAZHuY689aDs9Q6j0h/zMvDg4evkcH2MCPiBld+JMdABQr5+KeeyRB23r7+ykm1278UFB9zd7MMayyrzG3EJ6DE8D2vEQLDoSYatu9AR6jpIN8hM3GPYyxOklmXjmImFqftFwVniVIW1m6CnlIwfJzBNRdnMByD8LFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0JR2aPw+Qc484Gcp/+/tfkspAxD9MlLqLMiMiaHVD8=;
 b=gzmHksfjx2Z8M1KX0vz877Jfs1Lo34XwcTFncxUw6gaM0LvDjOfniKTyWoiSvEfb4/NQqsZcKIVyonF0d+y7r70vHyAeGcOgzAGAaSIE/U0/9exjk2S5fycKjvXVQ/reByhcWRNfjdK8teLEXPqKc8A37fPSZFCY1g+DCPmTN73oIzyF1NBHRKlGyBmO/ut1M6VuW7RgGCh97QE+rEiqQGYvR0bRvMWjaHRYSZMhfolUqQBJihnz3rKDot27VfOzYbig4wqOYFztKC1uzGw6vWTVEUWxJn9WnnUhlnIKMe0ztae671dOFu4pmkvfo6QPWyrc1AncAGJJu0M4R1jxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0JR2aPw+Qc484Gcp/+/tfkspAxD9MlLqLMiMiaHVD8=;
 b=XCJcE13ft5XPonPu3u4+bDONgXGON7xa9P9k4JxHV2bI7exf1Rd0NKO4Ssth4Ft2XvIgZRa+MiKALB5imYotoq0SxJFgid3QDrcfwwqYvwrRbRvjKnUxgIn+bvUMKQ+OabneqCmc1egR36tKuHExCUMOjimvMUow/nbJT3dQdAc=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by AS8PR02MB9885.eurprd02.prod.outlook.com (2603:10a6:20b:61b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 14:41:36 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 14:41:36 +0000
From: Johan Adolfsson <Johan.Adolfsson@axis.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel
	<Kernel@axis.com>, Johan Adolfsson <Johan.Adolfsson@axis.com>
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Topic: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct
 multi_index
Thread-Index:
 AQHbvnMzuEeJRwGRtkiTeZxACDeeErPMBIqAgAKi8eOAAK3JAIABOlYjgABz8ACAATqsng==
Date: Wed, 14 May 2025 14:41:36 +0000
Message-ID:
 <PAWPR02MB9281EDE0658B51FBE86D8A089B91A@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <62a74e0e-f5a1-40b5-a855-6e9bd620cbd5@gmail.com>
 <PAWPR02MB92814A311B18A6FD8A448D249B97A@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <0bf10848-0fa2-438a-92dc-6d3b29760b64@gmail.com>
 <PAWPR02MB9281789F85D773CEC278688F9B96A@PAWPR02MB9281.eurprd02.prod.outlook.com>
 <a7988a35-9dad-4771-afb3-b2fb8c543fbe@gmail.com>
In-Reply-To: <a7988a35-9dad-4771-afb3-b2fb8c543fbe@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|AS8PR02MB9885:EE_
x-ms-office365-filtering-correlation-id: bef213cc-c25c-4bbc-c821-08dd92f56dff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d7gBUnh9ZTa7+C77LB6QZXejqFq3AICDgXvwPcafW3PCp8NR95iNovV0dw?=
 =?iso-8859-1?Q?FEDTzRmgZvwRICoR7sGbxsplOWnzZxHdCK2ZMwdBUYYQZC1OtYxBSwZ11n?=
 =?iso-8859-1?Q?sDkXmQPIxfJZqKVRGHlc8kL5vy4RuVa0wG2y4gv4t/7/rpp0fWAy/8kPyP?=
 =?iso-8859-1?Q?jfAwTzr/A9EdDpM8i9VSYGFU4FvP0AN+35bMRusJh31kTR0FjHEBx1ao8m?=
 =?iso-8859-1?Q?qfWDpOdDdZcsuZrH6Bnak/hwFBlhmuENlkd022yZ36v1Qc559gvlhJjqDT?=
 =?iso-8859-1?Q?7wYgyKWrak849jpQm3lJ/xOn2uqXZZw8Kpzm1d+e9kIDaXLbCYhYHq1tj7?=
 =?iso-8859-1?Q?BanmsXgBIv32hM/mg/en5koF321DpFh6lO9mmQIAw6N1QpW92Maq5XFg0o?=
 =?iso-8859-1?Q?lxYvadqHotYkJvavSoqf13VSE/qr+Eq+dES5QQtstsEtciSccqi/KQcMGt?=
 =?iso-8859-1?Q?6xYXbsCi79JZ0IGwn7UDqkY6lNuya6worGwIIp7t/oeLwIC0eLJ3Wx5OBN?=
 =?iso-8859-1?Q?YCZlHnyVUIlnkceZeta+JkZy2RUNP6NCBxO14fuwTfz9iZNx5HgUQNT4uz?=
 =?iso-8859-1?Q?NBdW/RE5B3ex0I/JiTe643ekiUWbDMayepNpQvqezpSFYaC57Z3Khfa3cj?=
 =?iso-8859-1?Q?X+D3oQOGjeEUa6pJTBTWhdFhJHLpKSnJdCFR2e3DFcJLJa+16e7/dk0+a/?=
 =?iso-8859-1?Q?KeQa+YUBIIv2ecl8qBTySlQt+1y0JOJFfGGXmUuN3dRorZCewkugmAvXXh?=
 =?iso-8859-1?Q?HRp2NfWTfIEaAFJEichXL/FX+inXc9f+xIduTtHh0ERG+Y5MJP+6nnv4YQ?=
 =?iso-8859-1?Q?lwEGk4yUvua8ZrT58zOlsRFAbsn46E515EgZgGPz0g8I0DbfQFY/o9nEH/?=
 =?iso-8859-1?Q?s4flZDLlGZ9Wbm+bINSp/U4nFe8fhmJWWTA9VajA9NQT375AFgWzEBA4RF?=
 =?iso-8859-1?Q?xPNOVthyN+jJxYVSptCPI+/hXYqt84k1143FAtAbEss7xeW4tq4rFTa2bM?=
 =?iso-8859-1?Q?JxrKMeTojVJoj/K0bLwhuz90/50olo09jfnQKwy2blXNBVBjG4YBOPqhCH?=
 =?iso-8859-1?Q?bqNT3R7qWIfW51aGVhUP9zwuasr9BhTZPDBjma+u91j2YmBK7Rn8JL2jhL?=
 =?iso-8859-1?Q?oUMHw69TmTqR0EWQfQFYIZ5C7NcEmE/bAboJR70UcGfwCbeEdS9t6y+MEm?=
 =?iso-8859-1?Q?QPFmQJgpnTTlPPUEWfYZrEPVAOqH/ksyx35KWUF6/y7ePUOD8fq8iFabp8?=
 =?iso-8859-1?Q?ulN3x7b372oDXLU2dbXgjNAjAmUjY5pUv9W0rbCneenL9GzJlwjKP0/Aho?=
 =?iso-8859-1?Q?6fle3+zUY3iSDUb2ClX4trXPDHuLVixo91GLgAHph8rAw5u+E79H5lfm00?=
 =?iso-8859-1?Q?YYRYlk4qSb7pHfjk6AGO3J7K5VXQunOYJ+OX8cfIu7g2S0pOKlCw/UrDYR?=
 =?iso-8859-1?Q?2Wn5RKChWoZ6pTvcdJGRNhAfDDAxEJrnvAXfnLvYFd3GfluzoFYq/efqxq?=
 =?iso-8859-1?Q?Hro6it/5U1yuz8YJq60aqGGSOrSlmEWORUgaEYamKl0Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR02MB9281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rb4i0NArcmv0OsoZP3zSFTqQiR9PUppKDHxuQEMBPK/ThRmy/sV6k7+fyB?=
 =?iso-8859-1?Q?kZ0lB/JWXX4j+Ege2bBeNwfZGzUYaH6zHlbWyhtw9q1jhGqqqxhKbxsm2f?=
 =?iso-8859-1?Q?ZQgfnJyLu9sRfShTKPfcQwHGilfz0b1ErbmV79GD5jDI3OA6I14HEQA8Iy?=
 =?iso-8859-1?Q?6QbDCJAFhwsXJERl6XoZ4vZN7qWerFrKDuxb1grW8Jnu4r4VKgfcF39aAJ?=
 =?iso-8859-1?Q?U+790Jiq3fxt9500PQ3OoFl4bnZK67uTl7ZXs0+/E5MQNJGjjPz8dEo4DI?=
 =?iso-8859-1?Q?A8Hd12NnqHfhYchDllnmSUpUpIHnHypUuqZpX7u37sbewOlYSvhOB0V6OC?=
 =?iso-8859-1?Q?3Vlnyvq+OS9zBR7JFeC+NLE7/dj0LRq97AbL/qk9VGipXADI0OZRBOPLmR?=
 =?iso-8859-1?Q?C5NghQiMYz6nnpm6uZiCkjULQKb/8nsXoluO8d29SOf+SNf+v4v6sK3QVe?=
 =?iso-8859-1?Q?OBIC0XDyFeQc8iCR80FtZSb1EjGAa37RknDpcNpxDVZnWQzL7c6Gsfcy9F?=
 =?iso-8859-1?Q?rgOxZRPMyE0lrmHbYLbqjtcdZ7SOXaHbJzoDmLSHSwfg/OBJnCkhPTmC4W?=
 =?iso-8859-1?Q?sjmYim23sunt5hhtVj8UAUF2qjmu/NzGJs6hmTZg4XF2hZy5zRKmLQZHP0?=
 =?iso-8859-1?Q?NQ0LEVQH97k/TjgNf0ZqVnVkdeVZpBqD9MZ/VJzwBPh1YILD5osVfgfOhT?=
 =?iso-8859-1?Q?uCWcck9b33s4grl0FAC66owAYU+luJRVJCqd7qI0GPBjcj/y12z0m1AERf?=
 =?iso-8859-1?Q?eQIKRAKRF03ymicKMbCVf8ekHjwbz0YrMuo7zO4G/4GJlJevSXjcXIyQUI?=
 =?iso-8859-1?Q?5Axe8PHEn9LnR7yY/ht7tBjuEyVC+FEsuGoH2tKoG1GwXaVBkoP3A+crBF?=
 =?iso-8859-1?Q?WcWhiz+k5H6XGJ/Atfwo9BrB6d2JIGtCl+I3ie1mtDMDM9kcFY7hX2U2uO?=
 =?iso-8859-1?Q?u2Jx8mcAXynyBAr4zvs38N6W7QJmQdKly702SIj/FSRMK/AdTdArYgfm4m?=
 =?iso-8859-1?Q?y8PlQzdWko5Mdq+33W6ctrb7zF2BnCFyA8KWWaOuV0Vmh81K/COs3JMlF0?=
 =?iso-8859-1?Q?MSAWTL7f6HrRCNhk+iDOmlimXU27ZXaihsq16QON/rG4D8tWFkJ6H5SNN4?=
 =?iso-8859-1?Q?e9JPJMOZ0m5QXv55cuh9VXR9910CVEtkT+Qx9pNKRni/GZNIVav9NJfYAF?=
 =?iso-8859-1?Q?k689RYJi++R4sHPWdZIYRb/RIrgMFcjbsnz3iWwUFuGAkmv5DsMOhNIfVG?=
 =?iso-8859-1?Q?QOcKe+T1kWCSoKMo9KRp+FOAyUSGZyYKHt2jUt0RL49cwAnMPYUZq0WcP3?=
 =?iso-8859-1?Q?Xny461FvFzi2Ch/Z5iRpLGVhTWa4JNZkORgbUsEiIFnUhTcAyXM609F4fs?=
 =?iso-8859-1?Q?yLEoCuDwkVxq9ge7OytFeCx/m4gBpvrpnsQFAt4W4pTqH7LtNH16Wr096H?=
 =?iso-8859-1?Q?UaGOYBSSD1OI4emsAAO4Wrgc9NLPnUn70ArtwErEaOH6LM2lY1RH/YnzKn?=
 =?iso-8859-1?Q?pz+E94/ygUChAAv33O22jNY9leWK1mhLQsoAXrVj+LtykHRK5Z5n3qTf4G?=
 =?iso-8859-1?Q?/em3o0MmPtaLGb6Ig0U5MooUNeOGWWobwVeOf2cU5VMN4HlC+qqlObclQh?=
 =?iso-8859-1?Q?lpg+F7g5Ka5GY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9281.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef213cc-c25c-4bbc-c821-08dd92f56dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 14:41:36.6370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Q/mKFE4WeszDkX1WantlO9+9iJrrgm9OYCtL6giOqF6oWSHAgMndighWj9vH5fc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9885

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
Sent: Tuesday, May 13, 2025 21:50=0A=
To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi=
_index=0A=
=0A=
...=0A=
>> Maybe I'm missing something here - but how do i specify that a certain p=
in on the driver IC is connected to a certain color of the LED.=0A=
>> The devicetree looks like this:=0A=
>> It seems the first number in multi_intensity seem to go to pin regardles=
s of what multi_index says.=0A=
=0A=
>OK, indeed there is a problem. Let's continue in your patch thread.=0A=
=0A=
>>=0A=
>>                       multi-led@0 {=0A=
>>                               reg =3D <0x0>;=0A=
>>                               color =3D <LED_COLOR_ID_RGB>;=0A=
>>                               label =3D "led:rgb";=0A=
>>                               function =3D "led";=0A=
>>                               linux,default-trigger =3D "default-on";=0A=
>>                               max-brightness =3D <255>;=0A=
>>                               #address-cells =3D <1>;=0A=
>>                               #size-cells =3D <0>;=0A=
>>=0A=
>>                               /* Need BLUE GREEN RED here or reg to give=
 red green blue in multi_index! */=0A=
>>                               led-0@0 {=0A=
>>                                       color =3D <LED_COLOR_ID_RED>;=0A=
>>                                       reg =3D <0>;=0A=
>>                               };=0A=
>>=0A=
>>                               led-1@1 {=0A=
>>                                       color =3D <LED_COLOR_ID_GREEN>;=0A=
>>                                       reg =3D <1>;=0A=
>>                               };=0A=
>>=0A=
>>                               led-2@2 {=0A=
>>                                       color =3D <LED_COLOR_ID_BLUE>;=0A=
>>                                       reg =3D <4>;=0A=
>=0A=
>This needs to match node-name[@unit-address], i.e. here 2.=0A=
=0A=
Sorry, my bad.=0A=
I copied the version where I wanted to test my changes to address the comme=
nt from Lee Jones and do error out instead of warn if the reg is out of ran=
ge .=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
Best regards=0A=
/Johan=0A=
=0A=
=0A=

