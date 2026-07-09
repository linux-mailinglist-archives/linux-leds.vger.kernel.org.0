Return-Path: <linux-leds+bounces-8984-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DLUQE/H0TmrKXgIAu9opvQ
	(envelope-from <linux-leds+bounces-8984-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 03:10:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7D72B99B
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 03:10:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=kpbj8XcH;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8984-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8984-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6CB23008774
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 01:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDAF3859C2;
	Thu,  9 Jul 2026 01:07:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B1379C5D;
	Thu,  9 Jul 2026 01:07:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783559246; cv=fail; b=Q8jV7A1UEuYKEXfgpNv8HYrmvUTdOOz2AB88UCCj7u9ZW3Sk0q8wOhW4Hj19Sm7sIRODF6LrOg1nyHHstzH597kCyVwDPYobdyXL6PjJsNPTSy4te+ba1KaohuOWFArl1W6Y4VA6O5JSjBqlpPxvtpG9wJv7oP+e4Xpnyzmwc6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783559246; c=relaxed/simple;
	bh=PPUhrCcS56d2Sc6fz36vgFkVI7Ozj/uMSu5Y0fQr664=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ssg53+VfYWvaJKzKpzWw1zMpH0FvbA2+K2vR6KXQqFxnA3NtacBpUs3ecLeq538rp4sHWPEFKqm8fZtgmguYVq8lf5Q2iePRxTkII5l6f792LAPqBe+7rEtpTqI8zjbhryibFNxVFUGfugljcRfV/FTNUtsRM+YFxzs6n4CSlN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kpbj8XcH; arc=fail smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N5qpE3575429;
	Wed, 8 Jul 2026 21:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=PPUhr
	CcS56d2Sc6fz36vgFkVI7Ozj/uMSu5Y0fQr664=; b=kpbj8XcHlova+e1z4DtYt
	bgUADRmm9E6I+jgpn3No7lsixj7LHHQ2y0m+/ZpjKDGyLF8NPlm0mQsBAsYPv6m6
	xuNXC0RyeCUXgXMU6PLuf598nmwuj7QGkNyGqnnuJtkzKPY3V8VusD5CXaissMqt
	0QeuJMGNFXuFYm96buwuX6VC0tqbLazgb3B0HpLw+VmEyQ07rRfhbfY9OMLNTehI
	cXSdtP5vxe1AXqdUBTYmqlo3FuHWpDj0tL7n4/VMOQXs6e8meiRCjk6v0Z/sSGHR
	Y1C3PZWs26tGXTerF7wOAz7W0CrPCYxAR+LP3XpeRijki3dvaGVpJN3yT5QJPsnh
	w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f9kfpuhyb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 21:07:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahxJvB8debaMt+vu+y0mu10JSiDp/Q0ovMY2Ze/WrJOnukP3PQc9tde9k0drodPqCqwvPYwUWi4alUxJ7IOK8P5urodO3djKxylCMoLlHL9V2ql1RojbM0io8v7F7738G0muBeioJjAnWJjm4Aao3Wuh0OEHv6WHI3x38rIDBFbnzeCoVTi9Ed1OkMgtPc5aKVPzlTJ3DNvuwRasTEn+xBxT3FGIbHenvDavtbhi5oL57UEjEAea6rPcum6mBHR3Wr0ySSzIqRw1gb0dVM69WUaSR4KVozzzT1qJ2lDdbBA/qAXRJqvd5D/i+8dvhZwiqUEjNL2wLng7BcvQTotwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPUhrCcS56d2Sc6fz36vgFkVI7Ozj/uMSu5Y0fQr664=;
 b=JoD6yb/811EuFyBwLjuD/ZEcciCI+pKjihGTfOlej54iioSILtgDEw3IN+XIJP9q/WNgXQSzofpOEIXouCj5//Bp4aKZSzD+MvCvFHXqbET40+OeTFc4ZwzncFVnX3N9NViIxX5EGyHJfyx5nuSb34XNiKwaZLYvhAbJDITqN93hdu7ZnZcHIXj1NGQC9voBBZ14s9gkAZQQWP6k4lB/nkK0+X5/jv0PBCpLJbGAcx1CQjxKcxAk10gc1hcQbYMSy95qdHg63qDHActTyJ5IMd8EYt41xYhlsAGcEK78zF8yR6Up8am6bXUEkiDlnitF5Gy5OVcEDpmHaZUPBbTWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by SJ2PR03MB7110.namprd03.prod.outlook.com (2603:10b6:a03:4fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 01:07:18 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 01:07:17 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "lee@kernel.org"
	<lee@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v13 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Topic: [PATCH v13 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Thread-Index: AQHdDzvWuEYb2h8BGEeXxUR44nu6FbZkXNEAgAACIsA=
Date: Thu, 9 Jul 2026 01:07:17 +0000
Message-ID:
 <DS0PR03MB7228EFE517CF37673FDE686AEDFE2@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
 <20260709-ltc3220-driver-v13-2-9b53237642eb@analog.com>
 <20260709005533.6680A1F000E9@smtp.kernel.org>
In-Reply-To: <20260709005533.6680A1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|SJ2PR03MB7110:EE_
x-ms-office365-filtering-correlation-id: cc370ab0-87ce-459b-c7cc-08dedd566bcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|11063799006|22082099003|18002099003|56012099006|4133799003|4143699003;
x-microsoft-antispam-message-info:
 HHH0Oo6pp1RdqCcAf5WDxrl4hSlSe+wdKikYktJZcp8kuGrbXEWowRrLH9eeW6eDE4BOQWPzWQAuiEYkSw1KWhoi9t6TFfG3zts4YBk4NHAAYCjBLoHJQ4DYjPiCD7aWMfIJHbmA5Y1oQNw8H+DW4BKoN510rTC2DZDI+UapepN9gMUujzxnJdA+KTytm3LRDlbVgP5F/Uuk9HXcIZ3yHkniMwmSJYRseQ1cop/Z3If4Twsu/TFI4akNQ5RYwtQ5Ta2YfRmi+jexExf5dJTMbE1MQGrr/YDgcgktUBvcX3dS66DMXy302axkNDv3uRrBa93TM9yqWJobSK5Mx9J5Or+EcMlEoTy/BwNJ3TA6EqIXOK1pI33AcujeT09XWEYyJlFFsS5JaKHKSC6uJSfwwh8lK53GrBhUBp6v/tW4OdodsIV2nIRMWTbwTYY6itgzKmHKlt3uzhzNWg3/t0/B4CdqcPiw03IG0A0hE9da9mJkYuSQk7V8gIVOF9HRglYeaSlGGtZ+nFbi/HgftfqIRNXsv4LOyHMQlOj7RANRvuBaUgPaGliQBmNSxhZCdm0OgSbaOqYa9mTMhZJl6EXZpTzvrnhy0Z+iI1rjD70+wHIgMDwLb2vGW+q3RiL00NqmUSbDb2J2XmJuV72LkRTmXFM2eIJ3/WvJ03tRZ1cQRAI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(11063799006)(22082099003)(18002099003)(56012099006)(4133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWJ5OXpZNk0yYVV1ek5OQkJ1d0lXdUFsOHRUOXFZWFhKY3QrM0ZwZFYxemlr?=
 =?utf-8?B?REZmTUd4RVdOSWZKNmJLNFUrMFY0aFBTS3pzZE9WUm1Td3hNVXhFY25ZVVNR?=
 =?utf-8?B?TkxEeW9HU21lWmMwNGtFWjZzV24xc2l2R3c5VTVDcS9FYXRSeHdkaStYeUNG?=
 =?utf-8?B?NEkrYTVBd096Y1A1VGJnS21HOGtOOFJLZWhWSDhzbXY5cUFWYUMyMzJmdDFE?=
 =?utf-8?B?WmdXZ2xveXoxdkltUzd4Y2w1OS9uRkM0Q2JJQU03TkF2Z2l1QjdXL1Y2LzFV?=
 =?utf-8?B?eCtFZURJSlVlQytEa1B3WjVDc3ZNTjIyWVN5cUNXUUhkOTN3cGV3M2U3L2My?=
 =?utf-8?B?cjUycEFWUlRyMkFxTjd4QW5aeXpiU2dFY2hHWDlNNDdqanRkMVJzanlPSHZD?=
 =?utf-8?B?VlNQLzg3U2M5dGE4VVVNQy9kOE5wTXQwNEszRDBuWWZyWHRvQ0RIZktXUVhQ?=
 =?utf-8?B?Q1VGWHVoS1VCL1NDZzN4RWNQRUlUeUFyUzBnNW1ZazlneHRDaGJyZDFMTlE5?=
 =?utf-8?B?bEVScjJFM2FyS1hHSWxPa09lSSt1YTZKQ3liWlNrL3Y5cmVrU2dIODBpejRm?=
 =?utf-8?B?VW5jVlRmdGh5OFBGWStFNXJmbDJid0p2TW5ZT3lCYVBKTDFaWi9MYWRrajhl?=
 =?utf-8?B?bWxLd3ZtMWtZLzVZNUZWQStiM3NJV25VVDV1RCtvbW1zTDBlWEtkbmlsOExG?=
 =?utf-8?B?cWtBdmlVcVR1TWpoUW9LSDN1TTlhTEFSRjJJVUVqekc1QWxoamgxTWNmbGdl?=
 =?utf-8?B?VkM3ZEt1WEc0RjVDM3ZFTVJkRWpxdm1QS0prREUvWkdEbWZKVmM0a095dFpz?=
 =?utf-8?B?UEszS0xiNUlwOGI0c0RNN29XT011NHBxN0hLZXh2eVg2SDEwWWdDamJrVHIx?=
 =?utf-8?B?YU93Y1A2UmJsTGYxN3l4Z3dJd2xYcHNpTmRtODNDMkVyQXY1Y2VVR3Yxbzlr?=
 =?utf-8?B?bVJnK2tmZXFVektFZVhQMWEya25zYkxQbXk1MXFmRStOd0hCN01ZemhoTU4z?=
 =?utf-8?B?U1lTNWFTeTZlRGxtenAyV1BMOXA1TTFkZk43YTYzYUFPbGE3emhvclFFKzZV?=
 =?utf-8?B?ak9INm5rVmR4WHZsNVNYVmgySmhKMmo0SWM4WWRINDZHK0N5SURqWWt2TVYv?=
 =?utf-8?B?RmRNK1FCcW1OV2pwNnR5RU1VeklKVFd3OWJOY1k5VVBWczdLdXB1eFlvNlFr?=
 =?utf-8?B?dGZQWXpLUmJxRGd3dW1SRTFXTTd3ZDBuQng5cjdvRWx4bmROb3Q4cFpGZlRr?=
 =?utf-8?B?bHBwMFVLc1ovaU9nOFpMK0tETXlEVmF2ODA5d0crVjYyd0dCRXMrL3A1cmxU?=
 =?utf-8?B?WVVOU1pLTWtCTGJOdldSTW5qZllEMDVwOGh2VFd3NzRZUzVBRVBObk0yc0hm?=
 =?utf-8?B?L2JoMTVrOWFjTjBkc3dOdlRhNXh0c1paNE9HNFk2a1liYzhxOWhCNi9qNng1?=
 =?utf-8?B?d1Bnci83emNFMDQrK1JzMjRHN2c5M0JBZmhsYm9lTkdrNWx1aFZIM2lPUytv?=
 =?utf-8?B?WFQ4OHFQR1BobFAvUTBHQmF6cGVoSUJmR0YrRVJxMFRaMUVid05kVytLZlMv?=
 =?utf-8?B?MUtMd2cvODVIaXBnUjRsYVR5My9WQnpDTWlrMUtNRDhPb0F6OTdMZU5YZWth?=
 =?utf-8?B?MEl2YzNRUWRENkJaM3RPMDBEVW5YdzVrUy9OVWV5enRuR012MDRUaitaOG4y?=
 =?utf-8?B?UTdnZ3phWlo2a00vdU5WcDNNOU9Hc21td2ZoTEJOZllVSTJGZDA5YlNOd2VT?=
 =?utf-8?B?c2xCUHZEWU1TZVpuRG5CbktDRjIzS2pjWEJ2cFRoQjZXTjNwUE85MU0rckhp?=
 =?utf-8?B?SkJCOHYxSmwydlZNZEJsakdoKzNzSFFWeGx5TGhlSUFLRUh2QnhpbDBXRm1N?=
 =?utf-8?B?Nk02TWx0eDE1Ykdnd1R0K1picUdvVjJOZmVqb0dTMk5RcWxHdXpWR3p4MDFa?=
 =?utf-8?B?TnBUSmliUkpXRkZoVXVsU2c5VDh2Vmt6NUVNYldSMHBmaWl3VURJYkV6b2Qy?=
 =?utf-8?B?U1F0SGkwYzlDS0hvZkEweU1UUE51TVBxc2dIQ05lcmpoQTRjS0VlMEQwRHE4?=
 =?utf-8?B?b21EM1QwSG1WKzBJNTUvZk5oZ3hMNlhVRW5QK2haVVg5OGs5THFKZVloSzRG?=
 =?utf-8?B?UmlldHZyMzJxcitvTGIzekRsejduK2k1aHVrSmlZNzhqQ2l6NmNWaFB5VWcy?=
 =?utf-8?B?NXc0a3NUQ09zdkM3aU5mcmo1MVI5UmRNVUl1cVd2dFhldlcxdGRVTnAyd05n?=
 =?utf-8?B?MkptVWNxdHU1K0phZ1IwOGNtcFliNFV2M2xWVHpuYS8rUFVrNUdzZWVYZzZZ?=
 =?utf-8?B?S0JMMmx6NzRIY0EycENlcHJ3TkQ0dVVGSkRMU2pYK2JXVGxhZ1JkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	c5QJBt2khVG23xO/Z6IPi0oMYbeXrIOzjkhB6UA7uPltL94v+RRnQb4JQXuGqL5SdAOgZSvZ6fAVDtaG6fFoSIdW9K8nyDGIHaDkM+fSi1GcHZDabHLywcym3Kw+MNh7DxCbn40FGDlMrpe6atFM9n21IDhgn8/DBTQy/oLCBf7icHe6c6Hhle1AdKSN3l/2RFHN6QLMe2gZ7rOIXmxD6WljJ4S7niqhw8zKRjltHoXKQvGHXuEc0OtF3p8KCmH4eTxEFJbC32wHBKVuNSvgxhXmqwPoLRtON/GZs5ibNNMQ5W7qXOZPxBrDFYh3eC8s0KNhlKOKYbTpJUsbm04vBQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc370ab0-87ce-459b-c7cc-08dedd566bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 01:07:17.8194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpRLKM1/xqvasi/F9JusjZtttyOh9scab2ADSteIHszOZvZp0JHVWUV6Ba/Jz71n+Zdxtb3qpH8KD+ZSY3ub64kredSgPSKnn+3Ikpg/3E0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwOCBTYWx0ZWRfX2WjCgIdWrYZ0
 2QGXdhHr+6ONnUzLzq572cKXebLpfqt49t/rLhVHnijtnfiLWzpKrpRfwIGFKWGXle4U11Bk2ps
 MlKdDy4Txm7gh5jrzk64tZs3ntpeW+p5mvbsQTKLadZ3U71pIlXgrQQwBnK+X8W1Ror2jI9UEo1
 Vtrr4yhTBR6UbKR31RnxuWbFQl2CuxOcuqv5ewjt0cRX9AWclO7ER5yb6atJpaSbdQqOOT+Jn2P
 cJ/W3sTiZOwagva3lFznwigFbEGvwh4+0mU1NYSgahAP5gxg09D2FmRpcjojJBh3FLuEKxjxFkx
 ZkJCMFl8CFNbq9V/PrlKJLzPIDq26abjAmuHvBtuA11ujPOaKbVtZhfD8x9P50JizNejnF1po7U
 bSNrNfcwHNTbfthaML/SY2eq5/05MXoXuyO4RLvW4ibrLWzUUCTpV7AHlBbGXrg4m1WBI4HWXDS
 P/9aav7VLUE1L+9KJ3w==
X-Proofpoint-ORIG-GUID: 4vttsEfH_kJ77SjinULuxbjAueTn737a
X-Proofpoint-GUID: 4vttsEfH_kJ77SjinULuxbjAueTn737a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwOCBTYWx0ZWRfX9GNzvLyyXOKP
 qeYIHkucExvO8pO839AfEbNzhDVc/HhFLFI1p2O8+kOld+PL5wVpwEMAo1vbyqftJzrcfXRhwA5
 9/opY1RJ7A2VcPFTVk3MILN74FzlhtaMGTaFdqj/zTZWniJqwp0/
X-Authority-Analysis: v=2.4 cv=IKIyzAvG c=1 sm=1 tr=0 ts=6a4ef44a cx=c_pps
 a=0nW3/h2Bs9e5w/EoXaYwaQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8
 a=9w7jyzr_5QN7DQLCY-MA:9 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090008
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8984-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:from_mime,analog.com:email,analog.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93A7D72B99B

PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbSGlnaF0gQWdncmVn
YXRlZCBMRUQgbW9kZSBicmVha3MgYWZ0ZXIgc3VzcGVuZC9yZXN1bWUgYmVjYXVzZQ0KPiByZWdj
YWNoZV9zeW5jKCkgb3ZlcndyaXRlcyBMRURzIDItMTggd2l0aCB6ZXJvcy4NCj4gLSBbTWVkaXVt
XSBNaXNzaW5nIExFRF9DT1JFX1NVU1BFTkRSRVNVTUUgZmxhZyBhbmQgbWlzc2luZyBsb2NraW5n
IGluDQo+IHN1c3BlbmQvcmVzdW1lIGhhbmRsZXJzIGFsbG93IHJhY2UgY29uZGl0aW9ucy4NCj4g
LS0NCj4gDQo+IC0tLSBQYXRjaCBbMl06IFtQQVRDSCB2MTMgMi8yXSBsZWRzOiBsdGMzMjIwOiBB
ZGQgU3VwcG9ydCBmb3IgTFRDMzIyMCAxOCBjaGFubmVsDQo+IExFRCBEcml2ZXIgLS0tIGNvbW1p
dCA1MzAyNDkwMDJjZTE2NGU4MTU2Yzg5ZDRkY2QxOTk0YjM3MTNjMGM4DQo+IEF1dGhvcjogRWRl
bHdlaXNlIEVzY2FsYSA8ZWRlbHdlaXNlLmVzY2FsYUBhbmFsb2cuY29tPg0KPiANCj4gbGVkczog
bHRjMzIyMDogQWRkIFN1cHBvcnQgZm9yIExUQzMyMjAgMTggY2hhbm5lbCBMRUQgRHJpdmVyDQo+
IA0KPiBBZGQgZHJpdmVyIGZvciB0aGUgTFRDMzIyMCAxOC1jaGFubmVsIExFRCBkcml2ZXIgd2l0
aCBJMkMgaW50ZXJmYWNlLCBpbmRpdmlkdWFsDQo+IGJyaWdodG5lc3MgY29udHJvbCwgYW5kIGhh
cmR3YXJlLWFzc2lzdGVkIGJsaW5rL2dyYWRhdGlvbiBmZWF0dXJlcy4NCj4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbGVkcy9sZWRzLWx0YzMyMjAuYyBiL2RyaXZlcnMvbGVkcy9sZWRzLWx0
YzMyMjAuYw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1s
dGMzMjIwLmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTM3MSwyMCArMzcxLDExIEBAIHN0
YXRpYyBpbnQgbHRjMzIyMF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiB7DQo+ID4g
IAlzdHJ1Y3QgbHRjMzIyMCAqbHRjMzIyMCA9IGkyY19nZXRfY2xpZW50ZGF0YSh0b19pMmNfY2xp
ZW50KGRldikpOw0KPiA+ICAJaW50IHJldDsNCj4gPg0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1d
DQo+IFNob3VsZCBsdGMzMjIwLT5sb2NrIGJlIGhlbGQgaGVyZT8NCj4gDQo+IEJlY2F1c2UgTEVE
X0NPUkVfU1VTUEVORFJFU1VNRSBpcyBub3Qgc2V0IG9uIHRoZSBsZWRfY2xhc3NkZXYsIHRyaWdn
ZXJzDQo+IGFuZCBzeXNmcyB3cml0ZXMgY2FuIHN0aWxsIGZpcmUgZHVyaW5nIHN1c3BlbmQsIHBv
dGVudGlhbGx5IHJhY2luZyB3aXRoIHRoZXNlIHN0YXRlDQo+IGNoYW5nZXMgYW5kIGV4ZWN1dGlu
ZyBJMkMgd3JpdGVzIHdoaWxlIHRoZSBkZXZpY2UgaXMgaW4gc2h1dGRvd24uDQo+IA0KPiA+ICAJ
cmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGx0YzMyMjAtPnJlZ21hcCwgTFRDMzIyMF9DT01NQU5E
X1JFRywNCj4gPiAgCQkJCSBMVEMzMjIwX1NIVVRET1dOX01BU0ssDQo+IExUQzMyMjBfU0hVVERP
V05fTUFTSyk7DQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCXJldHVybiByZXQ7DQo+IA0KPiBbIC4u
LiBdDQoNClRoaXMgaXMgYWxyZWFkeSBoYW5kbGVkIGNvcnJlY3RseS4gVGhlIHJlc3VtZSBmdW5j
dGlvbjoNCjEuIFJlYWRzIENPTU1BTkRfUkVHIHRvIGRldGVjdCBpZiBRVUlDS19XUklURSBpcyBl
bmFibGVkDQoyLiBUZW1wb3JhcmlseSBkaXNhYmxlcyBRVUlDS19XUklURSBiZWZvcmUgcmVnY2Fj
aGVfc3luYygpDQozLiBQZXJmb3JtcyByZWdjYWNoZV9zeW5jKCkgd2l0aCBRVUlDS19XUklURSBk
aXNhYmxlZA0KNC4gUmUtZW5hYmxlcyBRVUlDS19XUklURSBhZnRlciBzeW5jIGNvbXBsZXRlcw0K
DQpXaXRoIFFVSUNLX1dSSVRFIGRpc2FibGVkIGR1cmluZyByZWdjYWNoZV9zeW5jKCksIHdyaXRl
cyB0byBMRURzIDItMTggYXBwbHkgDQpvbmx5IHRvIHRob3NlIHNwZWNpZmljIGNoYW5uZWxzLCBu
b3QgYnJvYWRjYXN0IHRvIGFsbC4gVGhlIGNhY2hlZCB6ZXJvcyBjb3JyZWN0bHkgDQpyZXN0b3Jl
IGVhY2ggTEVEJ3MgaW5kaXZpZHVhbCBvZmYgc3RhdGUuIFdoZW4gUVVJQ0tfV1JJVEUgaXMgcmUt
ZW5hYmxlZCBhZnRlcndhcmQsIA0Kc3Vic2VxdWVudCBicmlnaHRuZXNzIHdyaXRlcyB3b3JrIGNv
cnJlY3RseS4NCg0KDQo+IA0KPiA+IEBAIC0zOTEsMjQgKzM4MiwxNSBAQCBzdGF0aWMgaW50IGx0
YzMyMjBfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikgIHsNCj4gPiAgCXN0cnVjdCBsdGMzMjIw
ICpsdGMzMjIwID0gaTJjX2dldF9jbGllbnRkYXRhKHRvX2kyY19jbGllbnQoZGV2KSk7DQo+ID4g
IAlib29sIHF1aWNrX3dyaXRlX2VuYWJsZWQ7DQo+ID4gIAl1bnNpZ25lZCBpbnQgY29tbWFuZF9y
ZWc7DQo+ID4gIAlpbnQgcmV0Ow0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiAgCWlmIChxdWlja193
cml0ZV9lbmFibGVkKSB7DQo+ID4gIAkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGx0YzMyMjAt
PnJlZ21hcCwNCj4gTFRDMzIyMF9DT01NQU5EX1JFRywNCj4gPiAgCQkJCQkgTFRDMzIyMF9RVUlD
S19XUklURV9NQVNLLCAwKTsNCj4gPiAgCQlpZiAocmV0KQ0KPiA+ICAJCQlyZXR1cm4gcmV0Ow0K
PiA+ICAJfQ0KPiA+DQo+ID4gIAlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobHRjMzIyMC0+cmVn
bWFwLCBMVEMzMjIwX0NPTU1BTkRfUkVHLA0KPiA+ICAJCQkJIExUQzMyMjBfU0hVVERPV05fTUFT
SywgMCk7DQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCXJldHVybiByZXQ7DQo+ID4NCj4gPiAgCXVz
bGVlcF9yYW5nZSgxMDAwMCwgMTIwMDApOw0KPiA+DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0N
Cj4gQmVjYXVzZSB0aGUgZHJpdmVyIGRvZXMgbm90IHNldCBMRURfQ09SRV9TVVNQRU5EUkVTVU1F
IG9yIGhvbGQgbHRjMzIyMC0NCj4gPmxvY2sgZHVyaW5nIHJlc3VtZSwgY2FuIGFuIExFRCB0cmln
Z2VyIGZpcmUgZHVyaW5nIHRoaXMgc2xlZXA/DQo+IA0KPiBJZiBhIHRyaWdnZXIgY2FsbHMgbHRj
MzIyMF9zZXRfbGVkX2RhdGEoKSBoZXJlIHdoaWxlIFFVSUNLX1dSSVRFIGlzIHRlbXBvcmFyaWx5
DQo+IGRpc2FibGVkLCB0aGUgd3JpdGUgd291bGQgb25seSBhcHBseSB0byBhIHNpbmdsZSBMRUQg
aW5zdGVhZCBvZiBicm9hZGNhc3RpbmcgdG8gYWxsDQo+IGNoYW5uZWxzLg0KPiANCj4gPiAgCXJl
dCA9IHJlZ2NhY2hlX3N5bmMobHRjMzIyMC0+cmVnbWFwKTsNCj4gDQo+IFtTZXZlcml0eTogSGln
aF0NCj4gRG9lcyB0aGlzIHJlZ2NhY2hlX3N5bmMoKSBicmVhayBhZ2dyZWdhdGVkIExFRCBtb2Rl
Pw0KPiANCj4gU2luY2UgdGhlIGNhY2hlIGZvciBMRURzIDItMTggY29udGFpbnMgemVyb3MgZnJv
bSB0aGVpciBpbml0aWFsIHN0YXRlLCBhbmQNCj4gUVVJQ0tfV1JJVEUgaXMgZGlzYWJsZWQgZHVy
aW5nIHRoZSBzeW5jLCB0aGlzIGxvb2tzIGxpa2UgaXQgd2lsbCBleHBsaWNpdGx5IHdyaXRlDQo+
IHplcm9zIHRvIHRob3NlIGNoYW5uZWxzLCBsZWF2aW5nIG1vc3QgTEVEcyBwZXJtYW5lbnRseSBv
ZmYgYWZ0ZXIgcmVzdW1lLg0KPiANCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJcmV0dXJuIHJldDsN
Cj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gQEAgLTQ5OSwxOSArNDgxLDEwIEBAIHN0YXRpYyBpbnQg
bHRjMzIyMF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiA+ICpjbGllbnQpDQo+IA0KPiBbIC4u
LiBdDQo+IA0KPiA+ICAJLyogU2Vjb25kIHBhc3M6IHJlZ2lzdGVyIExFRHMgYWZ0ZXIgdmFsaWRh
dGlvbiAqLw0KPiA+ICAJZGV2aWNlX2Zvcl9lYWNoX2NoaWxkX25vZGVfc2NvcGVkKCZjbGllbnQt
PmRldiwgY2hpbGQpIHsNCj4gPiAgCQlzdHJ1Y3QgbGVkX2luaXRfZGF0YSBpbml0X2RhdGEgPSB7
fTsNCj4gPiAgCQlzdHJ1Y3QgbHRjMzIyMF91bGVkX2NmZyAqbGVkOw0KPiA+ICAJCXUzMiBzb3Vy
Y2U7DQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+ICAJCWluaXRfZGF0YS5md25vZGUgPSBjaGlsZDsN
Cj4gPiAgCQlpbml0X2RhdGEuZGV2aWNlbmFtZSA9ICJsdGMzMjIwIjsNCj4gPg0KPiA+ICAJCWxl
ZF9pbmRleCA9IHNvdXJjZSAtIDE7DQo+ID4gIAkJbGVkID0gJmx0YzMyMjAtPnVsZWRfY2ZnW2xl
ZF9pbmRleF07DQo+ID4NCj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBEb2VzIHRoaXMgbGVk
X2NkZXYgbmVlZCB0aGUgTEVEX0NPUkVfU1VTUEVORFJFU1VNRSBmbGFnIHNldCBpbiBpdHMgZmxh
Z3MNCj4gZmllbGQgc28gdGhlIExFRCBjb3JlIGtub3dzIHRvIHN1c3BlbmQgdHJpZ2dlcnMgZHVy
aW5nIHN5c3RlbSBzdXNwZW5kPw0KPiANCg0KVGhlIGRyaXZlciBpbnRlbnRpb25hbGx5IG9taXRz
IExFRF9DT1JFX1NVU1BFTkRSRVNVTUUgYmVjYXVzZToNCjEuIEhhcmR3YXJlIHBvd2VyIG1hbmFn
ZW1lbnQgaXMgaGFuZGxlZCB2aWEgdGhlIFNIVVRET1dOIGJpdA0KMi4gVGhlIExFRCBjb3JlJ3Mg
Zm9yY2VkIGJyaWdodG5lc3MtdG8temVybyBvbiBzdXNwZW5kIHdvdWxkIGludGVyZmVyZSB3aXRo
IA0KICAgaGFyZHdhcmUgYmxpbmsvZ3JhZGF0aW9uIHN0YXRlIHJlc3RvcmF0aW9uDQoNCg0KPiA+
ICAJCXJldCA9IGRldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dCgmY2xpZW50LT5kZXYsICZs
ZWQtDQo+ID5sZWRfY2RldiwgJmluaXRfZGF0YSk7DQo+ID4gIAkJaWYgKHJldCkNCj4gPiAgCQkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoJmNsaWVudC0+ZGV2LCByZXQsICJGYWlsZWQgdG8NCj4gcmVn
aXN0ZXIgTEVEIGNsYXNzXG4iKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICAJcmV0dXJuIDA7DQo+ID4g
IH0NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3DQo+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL3Nhc2hpa28uZGV2LyovcGF0Y2hzZXQvMjAyNjA3MDktbHRjMzIy
MC0NCj4gZHJpdmVyLXYxMy0wLQ0KPiA5YjUzMjM3NjQyZWJAYW5hbG9nLmNvbT9wYXJ0PTJfXztJ
dyEhQTNOaThDUzB5MlkhNXNSdU8ya2lkY2tFd1paUG5ucg0KPiBNMmt4RVBqZ0Vsc2JwanFfSllX
S29wYW9CeHN4alNvR040T0JOSmc5QmxQS1FjQktOSHNSRDFMbXotDQo+IDliRzczSHFKWG5hY09F
JA0K

