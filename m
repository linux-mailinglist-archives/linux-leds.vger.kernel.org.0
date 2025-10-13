Return-Path: <linux-leds+bounces-5743-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFDBD0FCD
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 02:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF9114E1315
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 00:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D863C19D071;
	Mon, 13 Oct 2025 00:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Rsy6Yc68"
X-Original-To: linux-leds@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011000.outbound.protection.outlook.com [52.103.1.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D91519B4;
	Mon, 13 Oct 2025 00:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760315054; cv=fail; b=F4/rRNdogMLjKFt0ASSK7tG4oDj8sfkcB53D8ZwcPDzaVcUVPV0QIhHLclYpo+WauZLwWcJ4RjZ4oIrsO3cblO3ChM1y1/D2SN2h7pzjngDJT4V7xaRR/yugjvqddCoWhXZjrSUWqbTsJybwgnwYzu82yw4d/4p5+bqNoE4gBIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760315054; c=relaxed/simple;
	bh=0kxpq+OHholQwtyVP62L9PCGb7MUP9NJq+gGijCt2vk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OIWKwBFCn48Y4lZcNf9n0fD9gqY3fYKCFnkRzWSSB87kCDaFRm5hOHMIESQDkZ8ZXMsbTfBA1jrJtNT4FeNjDxFBe+14kmHnzAfJofOFkMQaCrcG/Z9ihYDBcQDPMEIctMvRBDHI1mdRWaGKZcNGs7xpjK0U7/BT+z7rj6xyK1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Rsy6Yc68; arc=fail smtp.client-ip=52.103.1.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+0dUAgybyXzMV31Tpv4PSfxox/FY/VqCHwAVEf9lHnZbIkA3DY92kvEiCYI4wZPuLSh4gcBZu55wp6A5fWNyEh2VDQWnksNCY6u5mTsjv5u5zGz/a4kk4sUDhbRw11rG6c18BKmX+WFD9QSw40gLURfwPrp1PR6lqQEpv4S+DDVqsM4Gq9Ma58blzTCEzxi5sxtB2Cz4iEkHbgAk7h2eFwKxn36VdmbfEpvb6+LCsDPdbvBYdOutlwhojUCSFcVnMJkZ+YI0ibgm6Q1zlS+N6l6dtcLBcuLGxhWIcb7owu5Y3En9iAC2SPGaKs+56DvwSiu6xxow8ZR986TMXKRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u+D7ynm6ZJztL5Z+DpoX5zKDKSrLEVnV3xvm7rXgik=;
 b=oEzRyXv63aAb3hra+kUZscxbdQY4NKWXGAPYhNxVwZnUAxGZJigwB/FdrNNETvEGW3WQk3Lt/f8ee2bZAQekhu+bQ4TVFyPWiiApSqIvmbeNGInW/ku/7wLWKvDyVPzOXx8D4/U/cOECHTVAGAC38VQPQwAJlcymHfQB1kX3PAOfgcnX9GUEp1BpYOJLC4KtDhJddNCBmX20j+DoKt5PrPkclduBPYz14fXUeu4cDhQLPa0j4hMyPQb+Uxh/kDnObmNgdOpNeClwvverR+dUFbBSgJ4E98STBnNeEgQBe8r+qTOEtZPr1b52CJT/C9++FUIIOAlAS8jjpuU3oYvEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u+D7ynm6ZJztL5Z+DpoX5zKDKSrLEVnV3xvm7rXgik=;
 b=Rsy6Yc68y0k00Mu1TBhcxekBZVxEArBM96Hy9odLr6JzJMVipZ0aQ7T9x/Q0nBrTeiBIRw11mk07/8neR63WkYBqvAIhycDn3PLrQ0cf+HozsKT1wd/lSpKqI1Tlu4tat+08gKdUSNWiayMiugiqfj0HKxWctYpdhVo3fM0n1FdwoMfIk8nPduJ58CcRBfBecCHmX7Vpu8TBH/QKGZUroxkeXS4FU7q9PO0UAVZhD4W57ouKdUJSKy8zpZml7c0v/JR02lJFXckAE/HGs58bfzyKqPbkjd5mzpvjG1+lYe9nSmTWFrbY05Bxn+lfOLAe2HCakUxNBSBJjwhOrhN+Yg==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by DM4PR84MB1973.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Mon, 13 Oct
 2025 00:24:09 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 00:24:09 +0000
From: Jonathan Brophy <professor_jonny@hotmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Brophy
	<professorjonny98@gmail.com>, lee Jones <lee@kernel.org>, Pavel Machek
	<pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Radoslav Tsvetkov
	<rtsvetkov@gradotech.eu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH 1/4] leds: Add Virtual Color LED Group driver
Thread-Topic: [PATCH 1/4] leds: Add Virtual Color LED Group driver
Thread-Index: AQHcOPjeZbpHjj7zckCnYSQlC0YSorS53xiAgAVVVYA=
Date: Mon, 13 Oct 2025 00:24:08 +0000
Message-ID:
 <DS0PR84MB374668EBA934375770E4A6CA9FEAA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
 <c1d2b2f5-1755-48f3-ac02-952bda718193@kernel.org>
In-Reply-To: <c1d2b2f5-1755-48f3-ac02-952bda718193@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|DM4PR84MB1973:EE_
x-ms-office365-filtering-correlation-id: d7f5aae5-747e-4c1c-35b1-08de09eed39a
x-ms-exchange-slblob-mailprops:
 EgT5Wr3QDKxJXwPqhMYR24O0rVJ87o22mUNqzcDh27FURNGvD27/mELNcCJa/NKnHH9v0xKvbzJoWWntDuvYny0+YkyUQ0Ve9ZmMgv2PixaB2Uqd40yC/viSM1Btm9WKcFEf0E01agaZ6MoLp7iI5y+/gkWWB9RQxnJ2ta2DOpEwqBHXsAiHl4fnHD3ce78uxrlu9/odwytUiDbh3tABULWlBp5g/qnUBTOygnPPZmzqe3VANKFjcUFWKtU4s8M56UR38bnHPwf3b7xxkV75ZbbM9BmXPmSNP+JY4gy9xKC8zttH8TnwbQgj7apX4/MhsXEXLhIxW5BaJ2vZKO4dl4Ql4oR+XObWr0im/zHYSDneHUbiGchnZDxIXM2olxfY778RGTBzfcZXoymAZ17iTkquUyVub0PkWGqebDpYQrpcysHREaBplsHfruh+ujxsgz2xl5UKayMj/qXHErigqdyd/HVBIDY0eshfA0UeFbPcaIxDzqrRuu49nAsXfEptlou1DFR/vpPY+hnF5K+SwASMCGcQk4U+dSquKynakdAyKPHstSPYjwNoxI/nzsSE6c7HyAiYfsJQpBTrdZRS1B8+9GnsOdfi9ipm4/q7u/6ZFnIumZAqA+T4xzyY4s4wDY5/HzL0v/t9kGfuxLTN0T5LIOWEOOqiN1GF49iJNqX6gf98Jtg2DNHrjpET5I3hFFy+6JqkiAPMozHxJKPDQ4DitoOqt2y4CMj5n0XRU/U=
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|31061999003|13091999003|19110799012|461199028|15080799012|40105399003|440099028|3412199025|12091999003|102099032|56899033;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lB6iwFcaKlJqCBBhT39cXn+i1WdcHQR+o1LFzzNcfBVn9BCcbz3ngCeBFkq2?=
 =?us-ascii?Q?4JrNKw0ArYWfHPNveVM3dgA+YWGwDrBcwpXKCR9MMKDz4KRP9dQUE1MzLOA2?=
 =?us-ascii?Q?tb8OOygKcXcgwH5s84f33Pn0POZGb8fmGzkgrsLLdsDj63exExZQL7A+n/mG?=
 =?us-ascii?Q?NkLkSJNFdTByLiOKrhWDuv80fq3AcqWEEYaE1LWnku52PhWRWVry5EYXl0SA?=
 =?us-ascii?Q?xVWzALWgN2LvLW8wPqlNbYmNHLDLzVMjz47TGHhsBDGQO++r4MFHYB3bF2Wb?=
 =?us-ascii?Q?2vz6dKOlc6fyeMcltcfEmP2W/ooJFmhn+4GH2qQcope6XEw2BIWtZ+5xMXnM?=
 =?us-ascii?Q?0zFdsHAUJ/ky28eGzzpenUYnl8iPOgCDIEDo1Zn31pOqArZ1MDiFZD3FzJ6L?=
 =?us-ascii?Q?Ah6QLU/8fDG/TD4iunbDqs/0jTRGdXt0gFfx/u7MQfpUu3bbpFCxMyc8+Zaq?=
 =?us-ascii?Q?SWjeGIE2rL95aFHgyZGSxtt1XmKuPx3IZrejjoWk0WjlIAFEfXKCE3013/A3?=
 =?us-ascii?Q?Z/uHfPfdqEvw3Sfe/hprxZmvQ+A8Y9x/0lNvJVQBLWCoWoUu/I23InxpmGHL?=
 =?us-ascii?Q?p9n0tpIq9e/dFmaLWqq2bBG1NPb9LNn+FLDMLFs5zkFB3cnBBiRBZWgVo4Em?=
 =?us-ascii?Q?QpOJOzwZ+LxqZnSo5igFFZtmqOW8lJqNroE+2PK7l/iDMF+beXKDayTu6sph?=
 =?us-ascii?Q?xwldhhfacTGE0lD85szvaiRXm2iTbdgH0w8vN0+g6SsaAry7fbn75lHaKb+j?=
 =?us-ascii?Q?bHRS3JevIdJqWyiQJTjFFpmc46srW+NtCo1MUhRItgzmaSeWD9Cvb+IW39Ie?=
 =?us-ascii?Q?ubVdu1KzbmJMUOsol0MzaHElUsDnwixPPno+4qvDvh+eaOB36qs4EYAMdiQQ?=
 =?us-ascii?Q?teKAuNQSZly4T94rGI/qhHgFpbLqGgNrA2WUc06te7KRaY9vqFU6e95TIMlc?=
 =?us-ascii?Q?+M7c66BT8x0Ld6C9xD9rZBSQlADkKjCU7m1zSpRDZv5GMYP9OnbQZKZyDBC6?=
 =?us-ascii?Q?btJSb9iTlh8e46ahCUEn9sHyNb1if+LR/PCfzOAL/Za/xS/KyMJrkRwp/rWV?=
 =?us-ascii?Q?rEFyofzmfiShKMvZuasXz6/x7h+4e7ASBPm5tS3EGD7ko2x/HMZifHVp1UF7?=
 =?us-ascii?Q?U0C+SRWI+IG/O+fSd2uKL8JjYlmPlLT4LZq8nFKiGWr6BqijOJu6jmU+O3m2?=
 =?us-ascii?Q?v8VXjjQ1yu46pbYUvBYivgfLeuapNGPi3KoEng=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gyzZ/oXmW0SDZOZo74ldzHuIBjBDOUYZ23GXT/CfoOEWp3YYArLQ5MgcLjfR?=
 =?us-ascii?Q?F/bNvXv52ebtNlV/tKWiBmj06ExIWftjMawctbrdBJvAdxKnH3pe97vdgLGi?=
 =?us-ascii?Q?0h2Do6lfrXHMSOXTow/Kuieh3lrQdAAs9v/SDPKOxWzVE3qNJEJSZQX/LVln?=
 =?us-ascii?Q?yaj8qgpxr+ituiv+vJkSJaWBRGOnRYNaHSHnCWS2z3j3llbkcCfkjF1tLFgn?=
 =?us-ascii?Q?aC+EdxReuh58Dlb91IY+7hTeB9V0XH5r2Bo4Qt0OB9zPrZTLZk+mn15X3pVW?=
 =?us-ascii?Q?ho+9AB8arINm5KrdkeyD4jxxX4JI1JzLB5bNPgFGjL9+w4g0w06UhphHT9YN?=
 =?us-ascii?Q?mTmtBpJCTd6qA64R+2jXQPKlS7+Pz6EgIgGrsRdkZ1EFtYCZnZnt74o/4H7w?=
 =?us-ascii?Q?Jz90ZAh4Q7rjOsXTputU3DOHZNKbvKS0xQmREDMeOcC+EHUZun30eD66LWh7?=
 =?us-ascii?Q?9tTSISfDtzDDHQJ5ep2bLwZOL8pr5WVGO4tBsLuAs4qGhayJJEO85vflN3H5?=
 =?us-ascii?Q?phi+OXi9KhGUvcXWEExqIxTatLPu9pHmZwFo30IUyYAry5VCFjQZxnSiUag+?=
 =?us-ascii?Q?mrUxiM8KkN3XC3cyyTy6CUPVeEYlpzo2RQIF7RD9/3q7qk1F5nMw4dE5Ipcd?=
 =?us-ascii?Q?TgVBbmJQFS+qft09Btfk2o4OemhVPwg2OWWod4AnuN8URah2JFWGZP0Ho1q2?=
 =?us-ascii?Q?VTZitJ2iMU7/HRE7K/DnvDeXz0/xC4Xvre3ktbLxa92T4aUdYK0WmB0OyzPl?=
 =?us-ascii?Q?u/GvkfH5VWa08EtgwgrEcGttwzXVW5+3CwaDhQdHsD/zIZEPYTMnlr5kiMem?=
 =?us-ascii?Q?UrKlRzE4UvWjpp/pyO10Z2Ac9mnXbfRMmYUjZDAXl5iOxuD7TO5r2t7rItY9?=
 =?us-ascii?Q?gauN3gGHIJyrB939NAKp3Bl93cg71wtg3eLrsnSVLEDn3DdfBV/Gd4r7uxNQ?=
 =?us-ascii?Q?LtJI1wyz4zwr0sR4R88V4dgR3x54CeGsYnC+sf2j5s/Htr8Wzbsorf95rEoV?=
 =?us-ascii?Q?t/X1r2osYJaiF5IG9bOMV0VA81iOcaNpVpw4dPXNjdgKt9Lwgi15om/kS/s8?=
 =?us-ascii?Q?ZacBJdiKe9zgl8c7HDkasGcmuM1Z8Qn3kH+cJURmlSkiCyqQOSusT16a2UQb?=
 =?us-ascii?Q?v8ZhlN4Rv2e7PY6iRMHmyLgWAfXpvad2RnLlZiD5G1yxGcC+cO1Pwutg5Jiz?=
 =?us-ascii?Q?UDWA/objfCK2I8MUbDPn3EV+Ht4bTTtr9jkeFK38hVMM10jcKYskNszaPYc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f5aae5-747e-4c1c-35b1-08de09eed39a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 00:24:09.0132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1973

On FRI, 10 October 2025, Krzysztof Kozlowski wrote:


>> +	if (!ret) {
>> +		vled->blink_delay_on =3D blink_interval;
>> +		vled->blink_delay_off =3D blink_interval;
>> +	}
>> +
>> +	phandle_count =3D fwnode_property_count_u32(child_fwnode, "leds");
>
>
>No, don't mix OF and fwnode.

Thanks for the guidance I am working my way through the List if fixes and w=
ill offer a new patch set when complete.

Just one question is there a preference to use Device Tree (OF) functions o=
r FWnode functions?
It is my under standing FWnode is newer and  more universal.

 Eg:
 phandle_count =3D of_property_count_elems_of_size(child, "leds", sizeof(u3=
2));

Regards
Jonathan Brophy




