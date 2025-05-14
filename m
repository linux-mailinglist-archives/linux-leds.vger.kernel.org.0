Return-Path: <linux-leds+bounces-4634-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5835DAB6E35
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8272D863CE4
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 14:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9E61A3056;
	Wed, 14 May 2025 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="FLhtZjpA"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1E1624E9;
	Wed, 14 May 2025 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233258; cv=fail; b=tMMfvET/TgUgCwUwePhfcdoTar5rj3V5JGrYwX3vfAIrxGcaAskPGdbi1YsPuFhQ7KI5TtzfRs2wI67QPadCmfLMct1rIXdqG7uW8fQoIUTUoGc9sqj1PFf44cljXEA13qkvaw1UHbqpjazu4WAelmmrMDayhUmv8nQ8KpEHreU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233258; c=relaxed/simple;
	bh=xOtOzx9drddWtcI61ZcDKaFf+cOrHss0tZAfVTBCKqw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HKTzfz69jba29my5r62kLOqG+F0+5zIR005Wlchas0HvS/C8sBy7Y3+OIL9o/Zk1lEo5iVueJyzzxqXzS7LrvHYJUjJes5/zQaA3p+enLglGQcTE3pS5hhp9KinlW7yqRXbnktXONfm4qy0FOuc8P3JcTtVVKXpzYMEumffKK5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=FLhtZjpA; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw1wdPVOEtkuV2YUaE0PCABkP4aIvIE18ntUFVZyks1wF4nLg5BCivjOkysZdp3JpVMEUuOsLvRtQkx03JldD8eCh2epQpV0CzJD9dpdV+r4fHTFEWoeKp+2qVz5KNA6RHjRkJiRgrjx1j+V98+arqCX6SGZtUJgZ1KsRrK+kIpqs+e+ALrYwesYLLhEDeOLsoj8tKUgvz1o/oEAqu5DA1qiICc/WQ4ODRd6O1OOIzQ4me/LTAdIvE2i1zWe81XpDPpgQnFCFmpKml6O3svQeZGVd/X1bHOAwZmgF5mH/+50DoNSNN1lE5YXX4D5OhInrC+e9NFkO5XTb7h+UvM51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPUmQjyTn2KA61q3g9NZxNqGV72K6w6bxsRlq34RQxc=;
 b=j9xLBVSHQBuIWK3dqmdcMIOCjCJdrcalGHwb2VElhEid8uNQTGOCXirbtH39Nw0pyGr6YbP5LnLGPPJfEIICBeLULMJn0M7if8H4qqEtbiTjVki0LF9jEodUoGl8rpvJWbSjoO34Pknzn1etAru3KlPm6dZReFe5qH2YzbLY9PMrzkDFELMZ9q1Nbg14GNzAzXXTuAS0riu/mAQh3Dwp55RBk4S8MeDjlotpAOeaRo62EEmspn0ZCPql+hDvm852cAb2eOLvtuPVuAudF3xjnTGuxlYqYzNc4lLPCYjkeQj4B3Ii0dnIYU37dr+Tdh8K7s1b72Mu9iCQEoz6a6x3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPUmQjyTn2KA61q3g9NZxNqGV72K6w6bxsRlq34RQxc=;
 b=FLhtZjpAxr0QW3B1onlXLUFd1aqSNVZ94d5FG4+Jc2Wkwzjsxo4iGdMMn8JMwmAqpldS6Q4iEExj7LctF+c5DAMxG1x+UC+eNJOL91QSj7IN4bcBdeW7eEFuR3RvknRWRx5jC4xL8/SaW++a/JNsH2am/ji8Kf1cTRe2EqFaIb0=
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com (2603:10a6:102:330::10)
 by DB4PR02MB9360.eurprd02.prod.outlook.com (2603:10a6:10:3fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Wed, 14 May
 2025 14:34:12 +0000
Received: from PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050]) by PAWPR02MB9281.eurprd02.prod.outlook.com
 ([fe80::87f6:1bcb:22bd:b050%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 14:34:12 +0000
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
Thread-Index: AQHbvnMzuEeJRwGRtkiTeZxACDeeErPRBBWAgAE4NHk=
Date: Wed, 14 May 2025 14:34:12 +0000
Message-ID:
 <PAWPR02MB92815DC59F65E90956269EEC9B91A@PAWPR02MB9281.eurprd02.prod.outlook.com>
References: <20250506-led-fix-v1-1-56a39b55a7fc@axis.com>
 <5d34aec7-5027-4575-b860-afdf7b2c0757@gmail.com>
In-Reply-To: <5d34aec7-5027-4575-b860-afdf7b2c0757@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9281:EE_|DB4PR02MB9360:EE_
x-ms-office365-filtering-correlation-id: 5b311952-986b-4eb3-10b1-08dd92f4653b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?77hYRYya2L7xm0nwPfDhy6td4UC09v/fhMas9blXSDBSqQIRF2ZiiM2cfX?=
 =?iso-8859-1?Q?ogsYID+WwgTHfi9Z845/VOtrf4t3byg7CH2zXWZXf8WpNO/2d0YOix0+my?=
 =?iso-8859-1?Q?tUGefB7Szi22KD6t9cYhZyr21WZspnhpKy7dNPwv3OVdJuLDW5oqBt+HLS?=
 =?iso-8859-1?Q?Nx8gkliH4uoxwn5rZoeRTEWEtkeWhFy5cAMQtJtYknbGqDMC728wXlAG9o?=
 =?iso-8859-1?Q?9OLwgUTsKi8U/Izs6QjQu/klnHjm99FmJ4ZD/uDaAT9VZ1cuNmlkf2IQaS?=
 =?iso-8859-1?Q?6NHToIKX4+V4TMrGTknRHoQGAEnpgfZG7JckDiLW66HVmYqpGhMoEmozdv?=
 =?iso-8859-1?Q?unLZ++xpC0C33PqvJH7T4p35PBGp58311KgJerap2pR2KtaYLeLSVVxt8W?=
 =?iso-8859-1?Q?dQHAudjOpI8GU+TMJelNfCSLByoHd+qG72H5jTHFEKe3uwbr8dC48gmK/M?=
 =?iso-8859-1?Q?19VuHK42irpSWdqcO8/p00TbhkOCzxSicFqWWrsBajSqhrVkuaYobm82JV?=
 =?iso-8859-1?Q?FggcnPWXYBmM8h0Oz0aw87GchJYr4WcRw+XqhITPGd970RAsq6fPK2cc8M?=
 =?iso-8859-1?Q?Op4BseqG6Abi1D3m+LCDtrah02TChl4PHM6oayemfaFH9ig89Y1UISxyHe?=
 =?iso-8859-1?Q?x364xii06ln5rJP5rByb22otd4fp+CJGnRW7VKaRdUydLtdDK8lGLYRQSn?=
 =?iso-8859-1?Q?w6xeMAlwJgFaQosgZpwu50fv0HXtpq9ORwgckANuKKwHT1FoAyzPxKzj+G?=
 =?iso-8859-1?Q?DKKtiqXjQEvZkKZube7tnIz5hEErGbdwfsB7hkjvAtWBecbc6HeLkKtPWG?=
 =?iso-8859-1?Q?2r7xF2dj0iyhjxpJeTI5vYarTmvatm14aAibWyLuIvbq+oDianKd187nMj?=
 =?iso-8859-1?Q?4yNyX/WMIRDM/LAXyTj94w8pl+uVNDIb9FABuga1TCfV+5L7PUkEpcCJWU?=
 =?iso-8859-1?Q?p+IWEUeFb7xCt/Zofpg60HprbsWin/kdf3X6n/Dmi80aQ4H/rp2x/rZoMH?=
 =?iso-8859-1?Q?Epeq0V54wieGRpjoa4t//GUKa+Dr+mRT3ovDN9hMzCmPgauY5gIng55DHo?=
 =?iso-8859-1?Q?uPKWvPasJkyS7nS9HR0mnAlTf+Bn1H3NesD27M2lqeYp/kOCWp/W47Qlt0?=
 =?iso-8859-1?Q?/44yMFviY0SWiGnKWQS12+r4XDRJBAfRDIn7Vc96Maqjx3PKBv7YwVSxSO?=
 =?iso-8859-1?Q?HUL9iUhBRdBrkiLhS+MffkPJdmDnv+33yYfEP9+Q7/nVgTC1xVNNKr5ApY?=
 =?iso-8859-1?Q?xvwsEeuOfGgemFnemBhtP5IKvmyJ0b15u2zAdqcq1DXO9lL4q6v6i38oGs?=
 =?iso-8859-1?Q?DWJUj45dM73LpmFq8IFZEeQHaooRBGJ07DQan8LFaBfe1e46EWV0tAfl5K?=
 =?iso-8859-1?Q?1NhWFGkBUJFluRgNtJvD3YoS7yiTBqjhfrpbJ6uJeankD3gKx2ZkPruD+j?=
 =?iso-8859-1?Q?/kH4uBEY/Ux/52G2DW71l9Ck4Ms3HHHEmVv8ufvgHIu+XsUzAUN9CXGmT7?=
 =?iso-8859-1?Q?2HonYNc8J0gvoHwtwuQGWHyl3Uk+k/uSOQysSGNbtMl9l37c7lAC9K1luZ?=
 =?iso-8859-1?Q?e3sB3Lk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR02MB9281.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YHdnfixC6M3NZcsaA+1Y8eF9b1WmD+wDh6t9ku+ecRWIHqs0qNuWIaEq0r?=
 =?iso-8859-1?Q?JkuhlRboM9p50tNEKAikcSjIpFxdkFyQza6ffFJ5NUPyjIsv1EzhWjqu9y?=
 =?iso-8859-1?Q?lteQ9vk038v7NdPeY0lvxrjygVc5qX9FuVewwQjmGp9yo0Lbjb4BcFH47n?=
 =?iso-8859-1?Q?TXEkc7kgsWxUEnHrxviUu+k6F/HR6gNEcZ01HZH4fpMOOWB61tFQRNCFMF?=
 =?iso-8859-1?Q?WdZSUPiwSG7LBGXHIydb2isx8NgwuPJluE7yvJOXmzoM/42vQbt6h/f+R6?=
 =?iso-8859-1?Q?cn0bv1jByFiUp2lepq0liNrMNGTFp6NVFqA8IWp/mnGxHnwUdEXUVbhvMC?=
 =?iso-8859-1?Q?Pd52RDtd8cvuZJK3r/Ca+zJpDAuKvspTIHKqXBFDIwcxcqOUPYwQW7X3vw?=
 =?iso-8859-1?Q?/4FsFS43Mty70V5byMvD5oGHhaH7zkir0mm1tsE7iAzEytDiJ90vjNCWEt?=
 =?iso-8859-1?Q?9RbBl2Rbymn4jZhbkprOIsE56P/8kwWdpiRDYU0wJTVCgle/eV7VjCIJWk?=
 =?iso-8859-1?Q?AKdw+OfX4CVUePP1wzQc9c9UR/NscfmmIjOHLeDATbexHoKHXE6L7XXyDK?=
 =?iso-8859-1?Q?qk07lAlDW63krDpzjvpTk6/BeBCCLSJC1EtJAMQQe2LnnN84OpfAII9leT?=
 =?iso-8859-1?Q?UKU1VppYMTGWZ70dT9eyCPxnYQAsGM0JWWCuRc0lGxuU8YLMzpoJ0U3kcj?=
 =?iso-8859-1?Q?aXcCaR9hO2n1orG+2vM1R68q0Ady/Zn4obMtjDunNlIeBFWQO7EeQqPlpf?=
 =?iso-8859-1?Q?OyyiC7uHKPG1rqoaUv9Z1A44fWHNrNWOIlvQkPR71ooFFtqPqinJq3tq1k?=
 =?iso-8859-1?Q?Olg02bf9BDdkQA4eAUMedU0j8BEVAGB8A9LngcHXKFJb1jOjywpztotjrl?=
 =?iso-8859-1?Q?jNZotcKa4JeTZTweDvlwZktmDqKYsIK0DpC2SfyAMEYs8j4Y4RteKUy+Kc?=
 =?iso-8859-1?Q?vyy8rj+xM1WR44KzkIcnqkqmB+v0ANWbo94tTT/o571SIosG54fWDCsMQw?=
 =?iso-8859-1?Q?9uur1/Thq5hdJEjD2miJVtMTDgNZUjtk8KxJb+Gtx6SI4IlzaQydLapqJJ?=
 =?iso-8859-1?Q?m4WTLr9lQ7Yd9XWNO5Kq4pPzQk8gI4H18M0FlYon47TmrshLipddhC0tnc?=
 =?iso-8859-1?Q?1a+NuwjsK8whvJqFQh0bDEynnqt7vIx7jLT1arNGiBFQ5uYHCfpaZfRQ26?=
 =?iso-8859-1?Q?KYWDmxqdN5dlF+WZnbjy1NGAmrkp6svhLVmtKqOyiwrDBUhPPgQSc8HfC4?=
 =?iso-8859-1?Q?H6cnWkto9loTWPzxxYdJR/j8dDSqI4vn75LgoN/VbBu66nXmYb4E9MyE7U?=
 =?iso-8859-1?Q?P70G+NoJPuPzOPYyNGqtFsh3iJGn21iHnRQgFm+UB3Y+JJ/AesBW/rc98D?=
 =?iso-8859-1?Q?QCgoyPCx54KmAgT4IhgW3obSj896irbvpgL9xmBegwPpcrCmY8PYCvJl05?=
 =?iso-8859-1?Q?11L1Wp/ftdzlxqRoI867wrP08P8VU6xjHUK2d9O/htNOMB8aM0FkIzc2OO?=
 =?iso-8859-1?Q?FWqXKDTbSCaE2IJecaLTb2rqWvBn7J+Wfr7tv/ZpQSIoJEbxNIIRhu5li7?=
 =?iso-8859-1?Q?VeZ7eijGRDmXhGegvf9/uUqTtm/i3gdDg0ByaH5/C/cE3trwQ1M38nsJRu?=
 =?iso-8859-1?Q?XHbheg+PYDne0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b311952-986b-4eb3-10b1-08dd92f4653b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 14:34:12.4168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPh5R05ADhczD0fguhyjPhPH4B8Mcz+wSTQmR8J5nTm0/G+GFi5J1FCxp2J3H+eU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9360

From: Jacek Anaszewski <jacek.anaszewski@gmail.com>=0A=
Sent: Tuesday, May 13, 2025 21:52=0A=
To: Johan Adolfsson; Lee Jones; Pavel Machek=0A=
Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; Kernel=0A=
Subject: Re: [PATCH RFC] leds: leds-lp50xx: Handle reg to get correct multi=
_index=0A=
..=0A=
>>                       }=0A=
>> +                     ret =3D fwnode_property_read_u32(led_node, "reg", =
&multi_index);=0A=
>> +                     if (ret) {=0A=
>> +                             multi_index =3D num_colors;=0A=
>=0A=
>Why not to fail if 'reg' parsing fails?=0A=
>It is marked required in DT bindings [0].=0A=
=0A=
I didn't want to start failing if reg is missing since it has never been ha=
ndled until now, despite what the doc says since 2022...=0A=
...=0A=
=0A=
>[0] Documentation/devicetree/bindings/leds/leds-lp50xx.yaml=0A=
>=0A=
>--=0A=
>Best regards,=0A=
>Jacek Anaszewski=0A=
=0A=
Best regards=0A=
/Johan=0A=
=0A=
=0A=

