Return-Path: <linux-leds+bounces-8080-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM21NZPJAmrmwgEAu9opvQ
	(envelope-from <linux-leds+bounces-8080-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 08:32:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00951B123
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 08:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44734301A509
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2026 06:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E42347537;
	Tue, 12 May 2026 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Vs/CSx4b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C19367295;
	Tue, 12 May 2026 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567489; cv=fail; b=kCtu+mi5SeZK+LQVV0hU6fBN5Bv6upOO4H9sbGgY3BRYBfcf4TIkUBmrBYHTwwjE0A63YdCyJn3/SNmCAr9kFcmVCiDjjq1W7rhwOZUYd3R2p86FOrP0XGfSn5ERa8brP5fNoDH9tCVeSTjuPRbXc63xwaGhfsU81B5xL2XROdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567489; c=relaxed/simple;
	bh=R45crCcbkA7I8UW9cMecEYcaBWjCS8i4t0lVln48Cv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n/7a5EjpnjGEpJg/mnYp9ObeCGeZDqc9neIYtzd9PhWvmGipYTZWaKOGCu8CgbvZ1Nry9veG0ZhKlkZgkTlQ4HjLReAiG2k4wgrm9bzlBx1tO+5ze81utK+8azBw1SjGwAN8R2RPZKjVRwokksUMEBgZ2fEvNge3EZM7lXxXJ7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Vs/CSx4b; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C3E7Ea3495287;
	Tue, 12 May 2026 02:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=v3+lL
	/ai5bzLptKz60BY3hg0r/M4sBtYJ6KS1PseyH8=; b=Vs/CSx4bisMmAuxKXgnO/
	fhmNg95yrgIWTRXX4TrpnlKe+bDt75+IINvHCEv0gvUL/AF9JkAy2pahXxB2WRmw
	TGX81ExNbgZhTOXjXAS3U461dknvuPCwNVPepkBnx/3v6hlZX1iT4Dk3qbt5AszP
	+L0aekAADEl6cCOH8NeXEnEJ6ZamBHAN1RH0bcTbWPDW9bcvPGWSlY5YiMv2yP28
	kYNvJN9sIEt9PRaZWCzN14RzaBLtK4iVgqCl2amSbjYym+pT/sHdTefazdYYyPgn
	J7r51Isn01lzAANRaNwrX2lIh8WTeKNQ0tZVSvg5SKP2vGYfvGvNt/3hKjLukbUf
	g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4e3nwahrav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 02:30:59 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNfrCM7uUPX4EvvUZts+Vu/M+av2GfGHZTmdcxXhc6Ryd75wkB5jKhrZvPFf1Aain1TmxbgAdY8vxaud9uQ4x61zl2EoyMMb0l+LjXhvpL4sVgiDH4JYirvlYRw3gbakvWrWd/BbXbaqB6wuUsakpDQ2/qNCLLrhQFERfyHColuYBUCILt5KLRY4qcK3AeB8Kv0+mxIRoiEPhJmpWjYt9IK5k98i4QQkYoXuLIhJ42Q0Z/d13AfjR3XV0Noey1TiNAYqv5/or6Cc+/b7XMndIs07sisofVqMTx78nd3FyFBI7DsbHZfLEQWcFbJI3ke/nXFKL1sHi1IN0fLl9RGfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3+lL/ai5bzLptKz60BY3hg0r/M4sBtYJ6KS1PseyH8=;
 b=d2E1kt1hQ5Il/th5ukXjz1whXFOrK2ZGco+A9/r1g6RaqwsckftufnKXxSpgD3TIi2hlHfRkGAs3rX8RdnIQt/Nd4o35ypLA6YaXcS3ncoy/fTUQddW+uffNzCt30qQHIW9nXa/GLHEFK5THoXy3I3R1s1TjRpoBuSWDv00Nwt06Qspm9GZAbhnJ0AhBTY4eDaUJLIqwTdWytmHKJLjDUHT7LPvJICU/A+F/t+J0FmKQ6dO7wBl2cxE7kDpMUeaC4L4k0p0Fe8Wtj728zBcnm5LolbYnBwparKs5cIDXou4ay2kB0VqYFRVVYltRSy8hUA8bxr3Lb8iV9i8q5BlwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by MN2PR03MB5152.namprd03.prod.outlook.com (2603:10b6:208:1ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 06:30:56 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%5]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:30:55 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: Lee Jones <lee@kernel.org>
CC: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v4 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHczUpGN0bAVVc/BEGJmUb7+iefgLX3yuIAgBIf6VA=
Date: Tue, 12 May 2026 06:30:55 +0000
Message-ID:
 <BN8PR03MB4977BF7FB9689E22620A51FB96392@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com>
 <20260416-upstream-ltc3208-v4-2-3884ed3e49f5@analog.com>
 <20260430150508.GK1806155@google.com>
In-Reply-To: <20260430150508.GK1806155@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|MN2PR03MB5152:EE_
x-ms-office365-filtering-correlation-id: b3785a53-2630-4e8e-c235-08deaff005c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|3023799003|11063799003|38070700021;
x-microsoft-antispam-message-info:
 ExgcZb/Yu19c8Grrv62ojGL/9hM1SauiTtHk2gC2K+k41eiAe2NCsMQtHibsQwCa1BjKQuqRATlzaIAQZvwPNFCHbM2VT77Dcj8o2h7tTLavPnZf45SjcUovF2n+MxFIYTMmPlNSrLUbk6xCZMJQUTqz9zM48lX5mbmNtHvEYZqMbJbBrSaglxpwwYC8acpLTPmLC5VNli19oQ4kjRu8KFNRrfrLOWHohfqnzyMgZ5C20LoATzyBKLLaHURyxzJWK7Wy0mSZWnEF6b6AM9g6qUmQ3pRj9RopMzAEjPHGxTk6kp3bv0X4rlLAe5upfnVOonZ++Q31wzdYUTH39RjHLQKFX1kB9irxgP35BX+rqhUjR6hb6iFnJu7cwYJ8vuVSqZuTFTI6tYGvNnb40zVkRa6HkYj4X7A7nc/Gic2zDk0gQSLQ4XzVapivAqcwBwtJjlKIgwPRFfVaIulOVaPcyTyBgLduyt60QxYF605wVsdrDC+w4B8L2tm5C0mDNYn/UNEky9SZjePK7aRJWOYXq2NDwonszIJNboeFaucq1vRTAd2MWqAk+GByzSQBCLDUkBS7S1YnFWtA9jRXGJJP+zNeh1gEPBz/276pYkp+nX1UPDZgMn1MrtUH3BQLjzePCKxol0h3IAZUTtprMTnyAPZAVuuFV695ts6qFtBpnOwHV6Cuz338Jpivcb5wvn5oQs48ANihDzzQsYPyqPbV4I1L1y1hPzmoCzqE+5COtj4sOTSilCJYIhmC49gk1U5k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WtZJhZtf84+omonWBrnWJwygJ6BU3FR9z7NxNP/cntyNpU5bHZfDBSrPZ3zi?=
 =?us-ascii?Q?4+Lat6WVENWeZnSIIBCAMQBrFwIke8Xbt5Xh4zS8v+O/YfHAqBotsfpBMaIr?=
 =?us-ascii?Q?iP4tmZAf+1BLW7IUnHRsTRQRPXUTT0E9n6TuGn1GuQ1U4bZtHaxSGeFURNWS?=
 =?us-ascii?Q?qsgHL5TO7hz1jSEqXyXtoE/IkC5yQEI62jL40ukRmORf84qdkCYSPgiN7Ibu?=
 =?us-ascii?Q?tThqqRPaQfXAVuJEQ9aPMim/5KKqyzJinjjUgDKi/Ef1ttfoBQUUscPxuLp3?=
 =?us-ascii?Q?bZRAkZMjyCTGAbxqTczx6lLTolXGRoRc0/68CjUTKx4hz/6uLuUERwOi+TYZ?=
 =?us-ascii?Q?wC137X1ib2i6kkWYSkT2CQUOSdg8mHxVNVU2DNw0HJ/M6g8zRISWh42qCSgp?=
 =?us-ascii?Q?a9i0SP4HYtB3MCPCig5+aYM3o/Fu8zh61WrJFgKxNNFXuJivhCwiW9EvUYyB?=
 =?us-ascii?Q?aIEx3QEi3+yJSD2cqusE2XFWvooB9cmMpMi0BY9K/sgx2InsrVu8c9w00jSI?=
 =?us-ascii?Q?L5KOGGcf9eVXvv+1MaPQa8S9LdG6IJMMBuU5VZGoL+sBYe15GNsYly1abhIx?=
 =?us-ascii?Q?3CxUC95LqHro9GLCI9DPh0mNFFA2VxafeBUhGUZIsyGNxqmE4u/aq/kgbBJT?=
 =?us-ascii?Q?SM3E/PsNludv24Rcl3KKz7DIpCbGuCDa2UZ+Is03Yz+fMPlM5j0slDunpaxf?=
 =?us-ascii?Q?wMGAK4d+7zKTOhViGIDG2QLP38hzP83Fbn4sm4HVXaV7EG/7q7V/SOlBsEJ2?=
 =?us-ascii?Q?eB02xD0Ogv9zUCnsp74m+G88vuSZQklR7l91vWIO4EtW1aEb2SoAm4fKfk0G?=
 =?us-ascii?Q?qVTgzurFU+lx8BxBgwsNglgU2XdOd7wbqQ1CUcb4+8+L8N8Vt3OdV98YU1Py?=
 =?us-ascii?Q?GGqxZM7STQ0DI0tuEa9sWx44jTimLjxCruxFSuTbX1Nl6bFoPQdH8+midxoi?=
 =?us-ascii?Q?7Im451FMg6FwzqhudaC/RarTn//IrMsTu3Uc2WPpPN1NeH1lfwLqpmqaS2/R?=
 =?us-ascii?Q?Hz14q0S2+f5VD15B5QgjMM3urPG7+XLM7L9BEYA12kigccNm3xnWvuOKt1u9?=
 =?us-ascii?Q?UG+wyt8dPiBeyF/+UQ0eq3oxQXPvhhMLAhstr07Wy08hcQCzKVjKHpWJcpPo?=
 =?us-ascii?Q?lKra+a5z0NxOYduewI4UIriya41xTet4Y8dlyppOdYNWmyc8pC91Yt2XIt3V?=
 =?us-ascii?Q?GkbFrpnGeGspBeT9FGBpL3nqrFd7CRrZIfAtvh+xREPrTyCOfgdoH5bnVd9o?=
 =?us-ascii?Q?6+jyImyUqcx/dE9/2kVdHTyDZC3Ro2TdTjIyZm5YO11UXZS7qQbD1bec4F7/?=
 =?us-ascii?Q?k/8TaTrxUvWBUy3p0QJNCvq4FRiS/wtHUlg4lqhOcaCTGQTW6c17wrvLEo9O?=
 =?us-ascii?Q?j/6Y0jxrr00lr9oWjXto2GOHPAzf/79zawaeVF5ActensCY+zTDjUyMgnU5Q?=
 =?us-ascii?Q?GhrJycVveVpduksv1qMiJO71IdSGIg4tH05MmGHXX/bKR+Jc6Zs0EjYOzsbf?=
 =?us-ascii?Q?2g34c03zBipO2Gg9TSGeKiM77598FLQCdj0U5yvFKLuwApha/fQmuEi8OjtR?=
 =?us-ascii?Q?kH0M8gNoMvWcaSOzQWsMI5WzR4RwE9YtGlMY2QT4DWmb5X+DsOqPoyw6tILY?=
 =?us-ascii?Q?wXdcYfqoHbXHaU2YU/xsp5mKPR2/+NMnwPG0uiTWU9FHTyQuwGSNOP6pDBeM?=
 =?us-ascii?Q?flEAjJu4t7/pu38V8bVrxLCO+EyZNSDfHMWb1qqXcM3gdGkzLmYHSMsXoQQv?=
 =?us-ascii?Q?xwVFYHu6QA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	f5QsKetKbV0UdN1WHx6riMrl7+iIMiT+xBufE8NSQVs7NzWb0CSEiYGoF+oEBLzeBevyDsYAvoi1deENvEgkoV1YOQl2SZuyBtun3IcoVzenhTg9CXvdx0AdkwyBlKOTb5CtRjMeWJ4oWzwyDP7QgpaUcqdwGwRgmaEfLCzeG2lmCOXx/jfTs+vVSbRX9mQz7JHii0CWtFWrlI0opshWCs2Ca5k4+cJbwX2CLiDkkFtp7JMOFHEuZyx3FCxSCVmZF6uutWPUovDzi2c03Y3CESSFyONkNNg5/j8BwJ0EQhTkMCpukoTQwrzhDh6OwIqfE1GszbUja1vZUAFOfvBXIQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3785a53-2630-4e8e-c235-08deaff005c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 06:30:55.7115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQhUEtoVXZSSMmTF4jTAu/cWO48W4IHJ2fZsICQ8H4wyXbYRzqT3WqsBpMYZ+Bu7W1YepMXwmJW2FvnL9fNtRIVWel7RXUr7wDwE986Qe+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5152
X-Proofpoint-GUID: f4TZ0_PmOJL1CMJlWvSPdi4Q8KVqVTMj
X-Authority-Analysis: v=2.4 cv=FLkrAeos c=1 sm=1 tr=0 ts=6a02c923 cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=CK_iCYVJYQXE4avpmTYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2MSBTYWx0ZWRfX/aF6EaWhjCti
 RWWUtQs/3p74DvJflODnmQBqNSKNXX2IOkOji4QDGrV8ZmIm+CnBtJ6EysSOGm+GRIMKBlFCBno
 NU69SbKlU5O3KUZz+nWImSnnlyakVRTwSi2/+C3d6VjUbGTF0o3i9f2rkFhsqm+sdHyA6epL+qH
 5pkJvys1e6pX5OF4NGEDrmoeJKQa4oielcj1N74+bZ6kDb2+zkPw5blChWtUmi7g9j5vMJbTdn7
 dSTxn002gjzYvMBb8kmAFII9rpRI3rUPP15TVk40AeWHv9XHXxMpH8+uh8OUrQ7zg2OsA8TQhRI
 vMd6Oyatf9r8zsc7eslAGowX3mbSBrSljmVWgwsvkpGi7/fxbEkCEfaNjBDIQFzsVNfGUadZi9H
 HEYG5qtlNfO5dCcvoyrqUJMe1eiPeddUpwWbqCUqFavI52hm9OWZ6k3aSKdIB9+niWwQk/5TaL3
 +8MvbTrBKMD2ZUrJrrA==
X-Proofpoint-ORIG-GUID: f4TZ0_PmOJL1CMJlWvSPdi4Q8KVqVTMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120061
X-Rspamd-Queue-Id: DE00951B123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8080-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,BN8PR03MB4977.namprd03.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jancarlo.Roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hello Jones,

Thank you again for the review.

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, April 30, 2026 11:05 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Pavel Machek <pavel@kernel.org>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v4 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay
> LED Driver
>=20
> [External]
>=20
> On Thu, 16 Apr 2026, Jan Carlo Roleda wrote:
>=20
> > Kernel driver implementation for LTC3208 Multidisplay LED Driver.
> >
> > The LTC3208 is a Multi-display LED driver, designed to control up to
> > 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN,
> > BLUE), each configurable with its own current level that is equally
> > set to its respective output current source pins for external LEDs.
> >
> > It is programmed via the I2C serial interface.
> > MAIN and SUB support 8-bit current level resolution, while AUX,
> > CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
> >
> > The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> > channel current levels, or as its own independent AUX channel.
> >
> > The CAM LED channel is configured as 2 separate CAMHI and CAMLO
> > register sub-channels, which currnet is selected via the CAMHL pin, or
> > set to CAMHI register only via setting the S_CAMHILO bit high in regist=
er G
> (0x7).
> >
> > Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > ---
> >  MAINTAINERS                 |   2 +-
> >  drivers/leds/Kconfig        |  12 ++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-ltc3208.c | 278
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 292 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 19b0b84e934d..48bae02057d5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15131,7 +15131,7 @@ M:	Jan Carlo Roleda
> <jancarlo.roleda@analog.com>
> >  L:	linux-leds@vger.kernel.org
> >  S:	Maintained
> >  W:	https://ez.analog.com/linux-software-drivers
> > -F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
>=20
> Is this related to this change?  Was it intentional?
>=20

Sorry about that.
It appears I didn't update the MAINTAINERS file when I reordered the commit=
s.
I'll add this back in the next patch.

> > +F:	drivers/leds/leds-ltc3208.c
> >
> >  LTC4282 HARDWARE MONITOR DRIVER
> >  M:	Nuno Sa <nuno.sa@analog.com>
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > 597d7a79c988..d13bbec73f06 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -1029,6 +1029,18 @@ config LEDS_ACER_A500
> >  	  This option enables support for the Power Button LED of
> >  	  Acer Iconia Tab A500.
> >
> > +config LEDS_LTC3208
> > +	tristate "LED Driver for Analog Devices LTC3208"
> > +	depends on LEDS_CLASS && I2C
> > +	select REGMAP_I2C
> > +	help
> > +	  Say Y to enable the LTC3208 LED driver.
> > +	  This enables the LED device LTC3208, a 7-channel, 17-current source
> > +	  multidisplay high-current LED driver, configured via I2C.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called ltc3208.
> > +
> >  source "drivers/leds/blink/Kconfig"
> >
> >  comment "Flash and Torch LED drivers"
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile index
> > 8fdb45d5b439..b08b539112b6 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+=3D leds-
> lp8788.o
> >  obj-$(CONFIG_LEDS_LP8860)		+=3D leds-lp8860.o
> >  obj-$(CONFIG_LEDS_LP8864)		+=3D leds-lp8864.o
> >  obj-$(CONFIG_LEDS_LT3593)		+=3D leds-lt3593.o
> > +obj-$(CONFIG_LEDS_LTC3208)		+=3D leds-ltc3208.o
> >  obj-$(CONFIG_LEDS_MAX5970)		+=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)		+=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)		+=3D leds-max77705.o
> > diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> > new file mode 100644 index 000000000000..9da8f4b359e3
> > --- /dev/null
> > +++ b/drivers/leds/leds-ltc3208.c
> > @@ -0,0 +1,278 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LED driver for Analog Devices LTC3208 Multi-Display Driver
> > + *
> > + * Copyright 2026 Analog Devices Inc.
> > + *
> > + * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>  */ #include
> > +<linux/bitfield.h> #include <linux/errno.h> #include <linux/i2c.h>
> > +#include <linux/leds.h> #include <linux/mod_devicetable.h> #include
> > +<linux/module.h> #include <linux/property.h> #include
> > +<linux/regmap.h> #include <linux/types.h>
> > +
> > +#define LTC3208_LED_SET_HIGH_BYTE_DATA	GENMASK(7, 4)
> > +#define LTC3208_LED_SET_LOW_BYTE_DATA	GENMASK(3, 0)
> > +
> > +/* Registers */
> > +#define LTC3208_REG_A_GRNRED		0x1 /* Green (High half-byte)
> */
> > +					/* and Red (Low half-byte) current
> DAC*/
> > +#define LTC3208_REG_B_AUXBLU		0x2 /* AUX (High half-byte) */
> > +					/* and Blue (Low half-byte) current
> DAC*/
> > +#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */
> > +#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
> > +#define LTC3208_REG_E_AUX_SELECT	0x5 /* AUX DAC Select */
> > +#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
> > +#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
> > +#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
> > +#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
> > +#define LTC3208_REG_F_CAM		0x6 /* CAM (High half-byte
> and Low half-byte) current DAC*/
> > +#define LTC3208_REG_G_OPT		0x7 /* Device Options */
> > +#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
> > +#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
> > +#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
> > +#define  LTC3208_OPT_EN_RGBS		BIT(1)
> > +
> > +#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
> > +#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
> > +
> > +#define LTC3208_NUM_LED_GRPS		8
> > +#define LTC3208_NUM_AUX_LEDS		4
> > +
> > +#define LTC3208_NUM_AUX_OPT		4
> > +#define LTC3208_MAX_CPO_OPT		3
> > +
> > +enum ltc3208_aux_channel {
> > +	LTC3208_AUX_CHAN_AUX =3D 0,
> > +	LTC3208_AUX_CHAN_MAIN,
> > +	LTC3208_AUX_CHAN_SUB,
> > +	LTC3208_AUX_CHAN_CAM
> > +};
> > +
> > +enum ltc3208_channel {
> > +	LTC3208_CHAN_MAIN =3D 0,
> > +	LTC3208_CHAN_SUB,
> > +	LTC3208_CHAN_AUX,
> > +	LTC3208_CHAN_CAML,
> > +	LTC3208_CHAN_CAMH,
> > +	LTC3208_CHAN_RED,
> > +	LTC3208_CHAN_BLUE,
> > +	LTC3208_CHAN_GREEN
> > +};
> > +
> > +static const char * const ltc3208_dt_aux_channels[] =3D {
> > +	"adi,aux1-channel", "adi,aux2-channel",
> > +	"adi,aux3-channel", "adi,aux4-channel"
> > +};
> > +
> > +static const char * const ltc3208_aux_opt[] =3D {
> > +	"aux", "main", "sub", "cam"
> > +};
> > +
> > +struct ltc3208_led {
> > +	struct led_classdev cdev;
> > +	struct i2c_client *client;
> > +	enum ltc3208_channel channel;
> > +};
> > +
> > +struct ltc3208_dev {
> > +	struct i2c_client *client;
>=20
> We don't need 2 of these.
>=20

Will remove this attribute.

> > +	struct regmap *map;
>=20
> 'regmap' throughout.
>=20

Will replace the naming as such.

> > +	struct ltc3208_led *leds;
>=20
> __counted_by?
>=20

Since the number of LEDs are constant throughout,
I think I can replace this with an array declaration instead of a pointer t=
o allocated memory.

struct ltc3208_led leds[LTC3208_NUM_LED_GRPS];

I'll update the probe function to follow this array instead.

> > +};
> > +
> > +static const struct regmap_config ltc3208_regmap_cfg =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +};
>=20
> '.cache_type'?
>=20

Will add a cache_type as 'REGCACHE_FLAT_S`.

> > +
> > +static int ltc3208_led_set_current_low(struct regmap *regmap, u8 reg,
> > +u8 level) {
> > +	return regmap_update_bits(regmap, reg,
> > +LTC3208_LED_SET_LOW_BYTE_DATA, level); }
> > +
> > +static int ltc3208_led_set_current_high(struct regmap *regmap, u8
> > +reg, u8 level) {
> > +	return regmap_update_bits(regmap, reg,
> > +LTC3208_LED_SET_HIGH_BYTE_DATA, level); }
>=20
> No abstraction for the sake of it.  Use regmap_update_bits() in place ins=
tead.
>=20
> It looks like 'level' is not shifted here, which means 'level & mask' ins=
ide
> 'regmap_update_bits' will evaluate to 0.  Could we use 'regmap_field' for=
 these
> bit-level accesses instead, as it handles the shifting automatically?
>=20

Noted. Will implement your suggestion.

> > +
> > +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
> > +enum led_brightness brightness) {
> > +	struct ltc3208_led *led =3D container_of(led_cdev, struct ltc3208_led=
,
> cdev);
> > +	struct i2c_client *client =3D led->client;
> > +	struct ltc3208_dev *dev =3D i2c_get_clientdata(client);
>=20
> This confused me for a moment.
>=20
> Drop the '_dev" part and call the variable 'ddata'.
>=20

Noted. Will replace this to your suggestion.

> > +	struct regmap *regmap =3D dev->map;
>=20
> 'regmap' throughout.
>=20
> > +	u8 current_level =3D brightness;
> > +
> > +	switch (led->channel) {
> > +	case LTC3208_CHAN_MAIN:
> > +		return regmap_write(regmap, LTC3208_REG_C_MAIN,
> current_level);
> > +	case LTC3208_CHAN_SUB:
> > +		return regmap_write(regmap, LTC3208_REG_D_SUB,
> current_level);
> > +	case LTC3208_CHAN_AUX:
> > +		return ltc3208_led_set_current_high(regmap,
> LTC3208_REG_B_AUXBLU, current_level);
> > +	case LTC3208_CHAN_BLUE:
> > +		return ltc3208_led_set_current_low(regmap,
> LTC3208_REG_B_AUXBLU, current_level);
> > +	case LTC3208_CHAN_CAMH:
> > +		return ltc3208_led_set_current_high(regmap,
> LTC3208_REG_F_CAM, current_level);
> > +	case LTC3208_CHAN_CAML:
> > +		return ltc3208_led_set_current_low(regmap,
> LTC3208_REG_F_CAM, current_level);
> > +	case LTC3208_CHAN_GREEN:
> > +		return ltc3208_led_set_current_high(regmap,
> LTC3208_REG_A_GRNRED, current_level);
> > +	case LTC3208_CHAN_RED:
> > +		return ltc3208_led_set_current_low(regmap,
> LTC3208_REG_A_GRNRED, current_level);
> > +	default:
> > +		dev_err(&client->dev, "Invalid LED Channel\n");
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int ltc3208_update_options(struct ltc3208_dev *dev,
> > +				  bool is_sub, bool is_cam_hi, bool
> is_rgb_drop) {
>=20
> Since this helper function only has one call site, should we inline its l=
ogic
> directly into the probe function to reduce superfluous abstractions?
>=20

Noted. I will make this and succeeding mentioned functions into inlines.

> > +	struct regmap *map =3D dev->map;
> > +	u8 val;
> > +
> > +	val =3D	FIELD_PREP(LTC3208_OPT_EN_RGBS, is_sub) |
> > +		FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, is_cam_hi) |
> > +		FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, is_rgb_drop);
> > +
> > +	return regmap_write(map, LTC3208_REG_G_OPT, val); }
> > +
> > +static int ltc3208_update_aux_dac(struct ltc3208_dev *dev, enum
> > +ltc3208_aux_channel *aux_chan) {
>=20
> Similarly, as this function is only called once, could we inline its logi=
c into the
> probe function?
>=20
> > +	struct regmap *map =3D dev->map;
> > +	u8 val;
> > +
> > +	val =3D	FIELD_PREP(LTC3208_AUX1_MASK, aux_chan[0]) |
> > +		FIELD_PREP(LTC3208_AUX2_MASK, aux_chan[1]) |
> > +		FIELD_PREP(LTC3208_AUX3_MASK, aux_chan[2]) |
> > +		FIELD_PREP(LTC3208_AUX4_MASK, aux_chan[3]);
> > +
> > +	return regmap_write(map, LTC3208_REG_E_AUX_SELECT, val); }
> > +
> > +static int ltc3208_probe(struct i2c_client *client) {
> > +	enum ltc3208_aux_channel
> aux_channels[LTC3208_NUM_AUX_LEDS];
> > +	struct ltc3208_dev *dev_data;
>=20
> Consistency.
>=20
> > +	struct ltc3208_led *leds;
> > +	struct regmap *regmap;
> > +	int ret;
> > +	u32 val;
>=20
> 'val' is a weak variable name.  How about 'chan'?
>=20
> > +	bool dropdis_rgb_aux4;
> > +	bool dis_camhl;
> > +	bool en_rgbs;
>=20
> All of these variable names are non-forthcoming.
>=20
> Please improve the nomenclature of each of them.
>=20

Will change the mentioned variable names to the following:

struct ltc3208 ddata;
u32 chan;
bool enable_rgb_aux4_dropout_signal;
bool enable_camhl_pin;
bool set_rgb_control_pin;

> > +	regmap =3D devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> > +				     "Failed to initialize regmap\n");
> > +
> > +	dev_data =3D devm_kzalloc(&client->dev, sizeof(*dev_data),
> GFP_KERNEL);
> > +	if (!dev_data)
> > +		return -ENOMEM;
> > +
> > +	leds =3D devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
> > +			    sizeof(struct ltc3208_led), GFP_KERNEL)u
> > +	if (!leds)
> > +		return -ENOMEM;
> > +
> > +	dev_data->client =3D client;
> > +	dev_data->map =3D regmap;
> > +
> > +	dis_camhl =3D device_property_read_bool(&client->dev, "adi,disable-
> camhl-pin");
> > +	en_rgbs =3D device_property_read_bool(&client->dev, "adi,cfg-enrgbs-
> pin");
> > +	dropdis_rgb_aux4 =3D device_property_read_bool(&client->dev,
> > +"adi,disable-rgb-aux4-dropout");
> > +
> > +	ret =3D ltc3208_update_options(dev_data, en_rgbs, dis_camhl,
> > +				     dropdis_rgb_aux4);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "error writing to
> options
> > +register\n");
> > +
> > +	/* Initialize aux channel configurations from devicetree */
>=20
> No need to shorten words in comments and drop the "from devicetree"
> part.  It doesn't really add anything.
>=20

Noted. Will update these comments.

> > +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> > +		ret =3D device_property_match_property_string(&client->dev,
> > +
> ltc3208_dt_aux_channels[i],
> > +							    ltc3208_aux_opt,
> > +
> LTC3208_NUM_AUX_OPT);
> > +		/* Use default value if absent in devicetree */
>=20
> "Fall-back to default value if not found"
>=20
> > +		if (ret =3D=3D -EINVAL)
> > +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> > +		else if (ret >=3D 0)
> > +			aux_channels[i] =3D ret;
> > +		else
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Failed getting aux-channel %d\n",
> i);
>=20
> "Failed to set the auxiliary channel"
>=20
> But when would this happen?
>=20
> If we have an acceptable default value, why not use it?
>=20

Will drop this error case and update the comment.

> > +	}
> > +
> > +	ret =3D ltc3208_update_aux_dac(dev_data, aux_channels);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "error writing to aux
> > +channel register.\n");
> > +
> > +	i2c_set_clientdata(client, dev_data);
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct ltc3208_led *led;
> > +		struct led_init_data init_data =3D {};
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &val);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "Failed to get reg value of LED.\n");
>=20
> Could we propagate the original error code returned by
> 'fwnode_property_read_u32' instead of hard-coding '-EINVAL' here?
>=20

Will pass in ret instead.

> > +		else if (val >=3D LTC3208_NUM_LED_GRPS)
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "LED reg value not supported.\n");
>=20
> "LED channel out of range" ?
>=20

Will update the error messages to this.

> > +
> > +		led =3D &leds[val];
> > +		led->client =3D client;
> > +		led->channel =3D val;
> > +		led->cdev.brightness_set_blocking =3D
> ltc3208_led_set_brightness;
> > +		led->cdev.max_brightness =3D
> LTC3208_MAX_BRIGHTNESS_4BIT;
>=20
> Nit: '\n' here.
>=20

Noted.

> > +		if (val =3D=3D LTC3208_CHAN_MAIN || val =3D=3D
> LTC3208_CHAN_SUB)
> > +			led->cdev.max_brightness =3D
> LTC3208_MAX_BRIGHTNESS_8BIT;
> > +
> > +		init_data.fwnode =3D child;
> > +
> > +		ret =3D devm_led_classdev_register_ext(&client->dev, &led-
> >cdev,
> > +			&init_data);
>=20
> Surely this is shorter than the one 2 lines down?  Use 100-chars througho=
ut.
>=20

Will re-evaluate my formatting again.

> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret, "Failed to
> register LED %u\n", val);
> > +	}
> > +
> > +	dev_data->leds =3D leds;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc3208_match_table[] =3D {
> > +	{.compatible =3D "adi,ltc3208"},
>=20
> Spaces between the '{' and '}'.

Noted. Will remove these spaces.

> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> > +
> > +static const struct i2c_device_id ltc3208_idtable[] =3D {
> > +	{ "ltc3208" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);
> > +
> > +static struct i2c_driver ltc3208_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc3208",
> > +		.of_match_table =3D ltc3208_match_table,
> > +	},
> > +	.id_table =3D ltc3208_idtable,
> > +	.probe =3D ltc3208_probe,
> > +};
> > +module_i2c_driver(ltc3208_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
> > +MODULE_DESCRIPTION("LTC3208 LED Driver");
>=20
> --
> Lee Jones

