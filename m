Return-Path: <linux-leds+bounces-7620-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IFxGGZjzGnZSgYAu9opvQ
	(envelope-from <linux-leds+bounces-7620-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Apr 2026 02:14:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F387C3730B5
	for <lists+linux-leds@lfdr.de>; Wed, 01 Apr 2026 02:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58BAC3032980
	for <lists+linux-leds@lfdr.de>; Wed,  1 Apr 2026 00:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11031FB1;
	Wed,  1 Apr 2026 00:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Y5+1LJeW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51152219E8;
	Wed,  1 Apr 2026 00:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002466; cv=fail; b=CJInW8ldaQIbJIBVUU77Xb4hFdZdcuq9l9LpeBVQtcxncI0XE8L4v+xRfYgs2AYtzDizJgw1qIzn5ye6YZHK3DD5/tJ7jvDVLgbkIyXLdeMWqEJTk4Cf+FS4NE9J0rvgKZH8fqlTi7U4M1oK2a524H2HcgdQzqrqNN5b5YXjyOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002466; c=relaxed/simple;
	bh=MabbaNkzQ6OCnmslSQGQ/VggjXxqCLmIYiNpPN6cLe4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZEJS7mnkNEUpwqd/P+ReZCjjyZz9yptMaNi6/x0eJ4TaZdhYEwu5hc42Eb7eDWD4IokY+HhdvlIIfBD8A0jaoOTdaLdMnEeX2QUgZtqj1PfSsMNiSjkXIn7Il54fL2fvChJhoWnWXql/NXJcb41HkB91IFHk798PhSV1qjgPuKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Y5+1LJeW; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VNLUjC3219983;
	Tue, 31 Mar 2026 20:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=1cD0R
	iNONDYMGPd9sr24LvZoawbAHJTOOoQZsZVr7So=; b=Y5+1LJeWnx3cXVJDKP+tb
	NY/kA7tvrMU+mDWqmZdYVfvYvKgTEMJCdGXzoJQYBA6A3nhuQWIFZNlos5wg0VAf
	QWqdq2d7GIdlb53avY6YcljY2btcIHWvPREMdFrleKlp30pG1HXenNb+ig0mRzUo
	PB/1dnU+5WQW05dIPrLGnRoe2TA4G9lDrz0i8kD676lLEGJqRygfOeOi3LbBCEvu
	8VMbjk4ZUEny7Qxlf23gNvq7dTsXuTqmpbhu2zATdUAJetS34LHcCp2+UuSanS1/
	3VuRgb2yFp8F6nAXcjlFwdBJqlSCXE400EENSt+QUE7FP1CnscYddMUeBfK9uXoC
	Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4d6wabdf14-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 20:14:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7lTjJYuWl6x3FQe1lyZSE8V1zs9+34OJOEXvKIgKoV//YHNrBCBlPJ5Kh588ttYh7wYEe+DzNfKe/8J7ChiYeggKJ6kvArsE0Q5Jqrt+Usf1dIsg4VMSnc2XDy9mt2+hEc4r6A8Gfu1SF5Du8pcVjJH+gIozRLKb6AoUDQu/Awc1tCl1UH5p+Zuzje90mbGzhI0Co77jpNZokqLQeJNQ39eim5DAoEfngj4rQCjA6FL1+x/XRRR6dmU0oTTS3nGkziJAsVhxhEkR//aDvJB333PUPQFU/2DB2vJknaR5GeU0DXKYoS9kYxXc0qcsDncPRvH9BfWnAMuT94IO1pOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cD0RiNONDYMGPd9sr24LvZoawbAHJTOOoQZsZVr7So=;
 b=mCqufnDPD0T9wccfMjBfIANbDzjc5lMSRCYIjzum+iE7IMYBHDpuKnaGdEAC2eh18I0CnyA7RaCrir0ZoU55Gho5zG0Psdbmfg8G1qnYjANUHTBXTTRv6bmlldyCUVpXvm3cZeDHAwuw4OjfuA4GMrVTOyGG3Xb3lFMQ//M6c5x0tmmhWG5k+8vLbTStvHrgM4zzg2rJhMH4NFB64x0pPTAKPQ1nxPMva1ZwbnX41UIfXm0PgLhBYkgWeZm1ow7piSpt6KcoGQCLqXdCXyIjnk0JdzHCAq9mlTQZXzCLn+nKojXF5oxchSK8T/F/Srd6s7aF6kqWWJnGYEy/6K3QZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by SJ0PR03MB5485.namprd03.prod.outlook.com (2603:10b6:a03:28a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 1 Apr
 2026 00:14:18 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 00:14:18 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] Add Maintainers to LTC3208 LED Driver
Thread-Topic: [PATCH v2 1/3] Add Maintainers to LTC3208 LED Driver
Thread-Index: AQHcvKc9YCseJcSzvka8nze5gvTtgrXAiHiAgAjWi2A=
Date: Wed, 1 Apr 2026 00:14:18 +0000
Message-ID:
 <BN8PR03MB4977EFB1D48E6E441B822B8A9650A@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
 <20260326-upstream-ltc3208-v2-1-3dbc992b6098@analog.com>
 <20260326-analytic-singing-panther-ebffe5@quoll>
In-Reply-To: <20260326-analytic-singing-panther-ebffe5@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|SJ0PR03MB5485:EE_
x-ms-office365-filtering-correlation-id: 3082d0aa-f4aa-463a-afb9-08de8f839ddd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 SE6mR8bQOa6cFbFMrq2Asc+UP/74e1vtKDyJE5+ldiPOEfYBdwhtlp1qa6vDenF5frgdwqf4g0oIbL/cVewJjYfRQpk6n4JjnYCD05dUpgVt1A783hznpxUA0uNdtwx1HAFohgI1L2rOVGIKSjjQHxfQWCu6LrcSiz2lw8jrGsOknTeRuAdCyyht6ISUgYQ9Jt+dPT72dSPcu6fv5bBZIVKedTH9EoHo5DeoD54ltLJoUPTjwNy2bSY79l8uHL1rGOmRZ2uMlcYG8H9oA5Y941c2AEriqPk+6i41cjAC34WoF+HCpMJrqnyXLCPumPcfRq+4T1O/ua9xFzRN4QhQUUsvHGo0vq5PgwkQ5fjoUX+DsoII3b41ANOwEVRHTnEZrs0NER1MD8oHneAQfyiyT6W+8qjekgcNOeVons/g7KyiV5QQ40kzFsTWD3FQygm/ofsGU7yBGtWGznoQxu1Ow+JxYlI7245mW04ERgtq7hfCDISOHluBOwvZfkAuLIlAtDG1DavGTqOA0/7LTlfl9nb2JI3U4T4ZAujr2En++u5nzRQE2Y/cWsHHQCi5whI1MBpL2PfHbhM9BRzz1BXe453cLKdqVkgCg8twxJh7urOU8FDxZwVBq2sHFa/T/Cfn2y71NW5XW98UWD4rsXtGRJ2hmkFIWarnJWv6VFI4Rtxvl60GDNo9i68qZNQ8kMg1sosTDKP9GrSKwsq9rsKROJWWhcG2eCxZr/WQQ9hJk0gjDDIA+OL5LGW4UO5J5Y2GQGANf3Z7cvQFnOdR6j3+uzQuEKftJJKJ7fcEJDiyL3Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u5aF8VlPHf3SJDuMvHg7chTYuQJoTDFdQum5yVhC8xqIcMp5mb1SvOIbGb?=
 =?iso-8859-1?Q?vTsDo4eWH/h8nl8sJRRrXUc8SDiRExXNGJIGAzgT8vxfGUJuvWWL78QKD4?=
 =?iso-8859-1?Q?xTNU97HeZWBeIlNnevWaErTXhHaRNCq4Tbuzo4gXZf8Ne8AKztzM05KXfc?=
 =?iso-8859-1?Q?LaZOknyuHtssZ2NrEC2Hz2Q5ynVYGNoCtjMDEY2WdVnFwK3QO1qcBe5AOo?=
 =?iso-8859-1?Q?QjHyIlyzCW2DdwSM/MB4BruHKD4TFrm0k39mBQyyVmlFRfIxic4IG4JXf7?=
 =?iso-8859-1?Q?hpjQ4R0OT0JBlJVrX6oK4HzJeFFzsL8/mEfYvHA3lRlNwA1uwgAf9kEuzu?=
 =?iso-8859-1?Q?7eKTDlw/txud9V+Y60EtKHxsKOCdISHNIry46De5UcyJxB0Sg/EubgNO6Q?=
 =?iso-8859-1?Q?cZvPQNEt2AiiQpJrZtR8YCaqRFUsi56nVTnMe5istERWSo+3pUdvzqZ+49?=
 =?iso-8859-1?Q?APO4XQ89OJGTIZfyGEmch/QMdxZpTHTk+iIFAJ3bWsvh4afM78AZdCP0ES?=
 =?iso-8859-1?Q?lQCUvp8tYL0EZWxwebcvFSneCkrBP9LMdtZViU8HKdXDkTJhms3ZMsMuK8?=
 =?iso-8859-1?Q?wApHXoIpmKRknQq6DklFYIaSLWQtfZ4rksuogt3Xgp3qrg41MOUS/Hdzx2?=
 =?iso-8859-1?Q?s+iHxn/3hwgWxFukjQz29Y1ksk2oNrfSLOwYJ8sy5Aw4RQkLMmPryWt7OR?=
 =?iso-8859-1?Q?j+uF/rmaGRaE3mshSkdCyuUc52LrujDs871KCQMIkFxaokMc6OBsSfCv06?=
 =?iso-8859-1?Q?PoPj6ldqnY53whjHQKkbDgAlgwZ5nuzysFkJrr799kPe/JZpphhGa+tCkR?=
 =?iso-8859-1?Q?TwH0CegK3PrcPLdwaY8BkW64ga2pG+EBok/yZjdvZadXweeqR5vfX1qa3I?=
 =?iso-8859-1?Q?Fi66n3PY8RVXcbOfYbi2edlmTtt1uxRT95h5gAdH9qWX1a5SfifgrRQgVG?=
 =?iso-8859-1?Q?Mku7IdgZ/58doehrrsAKaui6JXJ8r/ccf5uW1dMe5dnbgMQhrIdT678vpF?=
 =?iso-8859-1?Q?9pKEhU18QVZLUtN5CM7o5pZyuvmntCFY9XaBPA2IxhxIILO/XUVN/htbAZ?=
 =?iso-8859-1?Q?nRdpA7n7GYiD1H1SxZKVQiQrve76V/XFLAu+DjGx78CsE0+lWaCf+3kXJ0?=
 =?iso-8859-1?Q?VFp2FLWKhHBnWKLWYbQ7uY0wsfMn10eVlFANVTP3ZyjXUqE/e8Ujajf3yl?=
 =?iso-8859-1?Q?YfUqeH7OrHAMG0ewJgQncnRanEGkiC8JGWp8qS4vilAqIMeba9gF4cYWai?=
 =?iso-8859-1?Q?/L48B94xretyeDumKLsb9wfn2fYlEqK4xULRFFQnFKCXlvozPQZCFYf9Nq?=
 =?iso-8859-1?Q?oVSU+81KmDQtFDltmBxWatYEQIsQRsx5k6DwQve0uubKvUy/8JZ1GVV5KH?=
 =?iso-8859-1?Q?3FUOwwXFcKyHhQHRjWpBruZqMQPlR+hOh3ujqkjtkL+S3tWeSuGkOZ59SK?=
 =?iso-8859-1?Q?GFPQDEYQa5zDAXw4KBG180fJPtBp4oMwe50R6m4awOj2Sak6RdtwXehWxX?=
 =?iso-8859-1?Q?R1cflbplmuN5ovpoWoqgOXDAxeYrOz/Z2efKeZOIY44RAsiZJmeSCgq8hb?=
 =?iso-8859-1?Q?Vl/7Y1MzmdI1sULvHGmKTFp8ZlXEJUpwDU4Z9c5eSaFh8px78lVRXbJ2DC?=
 =?iso-8859-1?Q?QE3cnqOvfwdcKKnOqxyqqvF/lKwk0NCnQSTi93owQT7swRw4IYa+HueDyi?=
 =?iso-8859-1?Q?ikWv//nLynZPWSTbewBbr2go9dNSYDvALQTerRA216XcnAYb3o+E0pjyCs?=
 =?iso-8859-1?Q?7OLM4xUY2IJPIAkwbXVsRuLdcvyBk9+jqxatqYleYVc3Gtn0Fm6c68ZHlJ?=
 =?iso-8859-1?Q?3w2uFhxbeg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	pwqGtB7FS1QRiXDTWMrbaq98YPvxG7AABA9kXUCXV+4xZGJMsEd6frY7K9LhNMl6dpeio8QabxSrQoauROWvAzzm/vOMt/3R3i+EjeGukGLRvrE/YaVbmENc1zo/36M7bhqs0Gbn2XUvcBjfbBaOg3XDC5TsAXWldSjP5h9fH6l5cjSqhSRDJug/2x0N45x6IKom8y1JR5DyxGu/ekNrSEYUjnmPRWm7PQqigx6F/Oeltzdse5lbfUwoMiCAORudUeFBcF01XCmGjqmyoRtiKMIE1FESK+NZgowb9hq7d+YdrRh2TlJKSyoyORL4SfL28tOGTQITEgpVEJoNbYFrNA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3082d0aa-f4aa-463a-afb9-08de8f839ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 00:14:18.4576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ms5Q1ZYlf0gNtSeC9i5RKr6hErYzA6nB/l6ktTafMtmr3IGNnCIKhxB2/GDumg4HsBMzihg+AhB2dj93K+WvCTNFBAT43UwSSHTv9YhHHj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5485
X-Proofpoint-ORIG-GUID: wjYIK-wk_jIpy-10FHGThikjuzeZdNeT
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=69cc635e cx=c_pps
 a=jknTlamspUmmG4HRyne6iw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=4a6c7mx8rB-IL2oK2gkA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: wjYIK-wk_jIpy-10FHGThikjuzeZdNeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDAwMCBTYWx0ZWRfX/q79kIjPW924
 HuvdvZ9cRpwn0kB4TUaw0yLk+3ofHF2FdWgI/29nY6A6OwkQe9ywFD7UQy7Jk1VLdvRmiCCWqFt
 XJOHmEfsdgxA9GktOnUKNuWCocOdQB9Pc9Mr/UiyMCU5lU8qrgELHeY5jSMC+s5ivUC+XIXTkmI
 6pFTE9ls8Ym9yTT1b7Vy0tYL714icokwVOnIg5si8S2wOIjhj9iAh/9NkB7j8GfODZOhpIzn2YJ
 yWld6xSsS8mIP0Hh8D1xNn3GcphIzrRvWRwpj3CCrj+mZu309y2XCSzd5sRWw9WuZI/paCMEaJs
 ROw6BKTmcn09DYYnuaSZEhh5LDBU7yGG81tv2zKbj4SVS2NVgfSAXG1m0QYr4RUiN2Vv1rRBHAF
 TktV9sOF2xH59EokAeIr5m/HO5AOem2hHzExRilmUHpQCrOUDREqi6YqYWtM4J9bJhuH7yOxH+Z
 Z+uBL64ZA0GV/llbGNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_05,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010000
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7620-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,analog.com:dkim,analog.com:email,analog.com:url,BN8PR03MB4977.namprd03.prod.outlook.com:mid];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F387C3730B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

Thank you for the review.
  =A0=A0  =A0=A0 =20
> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, March 26, 2026 5:14 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] Add Maintainers to LTC3208 LED Driver
>=20
> [External]
>=20
> On Thu, Mar 26, 2026 at 06:30:10AM +0800, Jan Carlo Roleda wrote:
> > Adds maintainer reference for the LTC3208 LED Driver.
> >
> > Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 55af015174a5..3f3331d7272a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15126,6 +15126,12 @@ W:	https://ez.analog.com/linux-
> software-drivers
> >  F:
> 	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.ya
> ml
> >  F:	drivers/iio/temperature/ltc2983.c
> >
> > +LTC3208 LED DRIVER
> > +M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > +L:	linux-leds@vger.kernel.org
> > +S:	Maintained
> > +W:	https://ez.analog.com/linux-software-drivers
>=20
> This is pointless change. You do not maintain here anything. Apply this p=
atch
> alone and see - does it have any effect?
>=20
> Squash it with the next patch.
>=20
> Best regards,
> Krzysztof

Noted. I will squash it into the driver commit for the next patch.

Regards,
Carlo


