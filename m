Return-Path: <linux-leds+bounces-8590-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g/NOGjSTL2oDCwUAu9opvQ
	(envelope-from <linux-leds+bounces-8590-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 07:52:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3E68397C
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 07:52:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=m+rxVCl0;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8590-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8590-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D42E3009996
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 05:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D2E3AEF53;
	Mon, 15 Jun 2026 05:52:48 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56D30C160;
	Mon, 15 Jun 2026 05:52:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502768; cv=fail; b=bAcbIJNGZMRrHGc5VSamU9mAbh2wHcMxdL6A6VJfOGH1KdRwZbKQdLieBV7wDejg7s3KX5TPFPw0W6B/QfqWRL9zSjA4CDii7AojLe5mKCioXe1lSIrdiurUffrsyomcuhJwIjlB8K70Udg7tSVJfeMikBtgtHYind9QM7vs8M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502768; c=relaxed/simple;
	bh=5chdskZyJ2VkzjR23i2Y6yTzo97VYxCCxZYljo7DKb8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uKdH4/VyHh/WfG9g7YGBOK+ZqjTdb/9F8zvRUeqEeQLJpRKQRDsMdLyOcpy79mQy/aK+8gSa7NQk/fSfFP0J7wxMtpcOTXBnQ5sugxYzL1DJ/Ci+ndKJmJ+J1680FqGPBBNme/iQXyELu8tdc7QVdRJG+XDmUt3LOEkdlkN6vso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=m+rxVCl0; arc=fail smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1mtWN4115779;
	Mon, 15 Jun 2026 01:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5chds
	kZyJ2VkzjR23i2Y6yTzo97VYxCCxZYljo7DKb8=; b=m+rxVCl04Ld3ydDoXc25L
	Pi4YC4u5C/MCBcRRbQC2XTUsLSQME/9tw4/oN6zDe1nFc0L6SGshHOg9doWnY2FI
	XKfZgJbkv/gXmdV2MFarmFKwIznJSQN3YRm9Z7LWQYZiGmt3/8HOILw4u2cRz2b4
	c6UmaLR++j+e6Ie1vf8fbYkyamXdHcv4mJcc4U6hfFs7ktRkVfJHmYGTOpTr2kK6
	Ik412goxOZ/lyMnslYugDL+XJ+SjswqBHsrDug86ltQ9npwB169m1Lg6zywrDOMf
	lUuHXBEM43QJiA0JVYmi46bnGFmfm+0l3olB7q33mjK+8sS5vdjA3AfPe0p/tzF6
	w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4esrhfageu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 01:52:44 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/oQmDXGezF/yrq9Fd7UgPYmTNGHoX2kmR2K8M2ffjdPMfwi5Jmel1EU5aszY6U9h8uMyyBMaR/OFPAKtxgHwPIvTepjTqd34M/PGm2PzbxjipwDPHuFEdD6V/HQR8i1aPb3y56JEg8v4Ht5u1tjmudKwSCVMPVD4LlYEzXEbkD/VNjAjqGDeFOj2Ozv7n3XyYXZkzPZYIRZvP7f/E8V5Nh0ZZ4FJLf4ieJcdMKrZSFLPXbLhfUUUOlG+V2KhVjYl3SlvZSIuAReyQVCRIZSuc9tu9q1/RA2r+UE3H+hL5Q+f6pJS3cCIAIBMvOxj03DCb6rR4CZ4uMSyl2imfSuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5chdskZyJ2VkzjR23i2Y6yTzo97VYxCCxZYljo7DKb8=;
 b=FAKNzNlwj9b8bTKTg4nDabMsHSO326/w9AC/nobK30hhTDkrI4ykNUYy4TjA37ZFzteaeUKbzczTb8CIxHNlgzT4eTLlquw48evzTMcXL+2MmcXa0wUyGkd/9TrqdyIzJWK2txCpL6qoCiVthXCq0pfbNv3+AazC6b/D6NLfOD7IUGPm9FJEAa8fsQRJciVju/k7uFsSnwUBNsHO8yVvQ5aZhcAxT5Ewilo4wTlz2eRGWSLZXjBTajsf28BBADN1zytFPKuIADsaoV9s3/ObC7XKmTzZxxv7y3ZrXu+Eczh/DnUEyfltfeqbXhCmad+Mhj5hyQz0kUK8CDtSIVnERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by SN7PR03MB7153.namprd03.prod.outlook.com (2603:10b6:806:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 05:52:42 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 05:52:42 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
        Lee
 Jones <lee@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Thread-Topic: [PATCH v10 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Thread-Index: AQHc/IeVKFNbOUxDEUCCUwOcNcJrSrY/GTWAgAABAGA=
Date: Mon, 15 Jun 2026 05:52:42 +0000
Message-ID:
 <DS0PR03MB72280DB2F899FAE43091ECC0EDE62@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260615-ltc3220-driver-v10-2-916562c88598@analog.com>
 <20260615053804.0B02E1F000E9@smtp.kernel.org>
In-Reply-To: <20260615053804.0B02E1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|SN7PR03MB7153:EE_
x-ms-office365-filtering-correlation-id: dd6c393f-408b-4dc2-334d-08decaa25114
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|22082099003|18002099003|11063799006|4133799003|4143699003|6133799003|56012099006;
x-microsoft-antispam-message-info:
 5iejsDLETdgsc6f7szJ5O+DqJWWXOUD+TzTIlDXqeRKTxRA2IRgSOHr9q3saGjPEg66qT7veDvfHx4fe+G7E7+EhxAe09kgjlmooIIQX1WAhxdwB9VYTqTzHq34mYhtq9Sge8EetfGxfGg+sQcqGthrxJ9mF0HqQZZOhSueqE/r0dXNy5DVml4BlT52W699xDYxwndZRXGpUkRMLkEEjwIwCXJiHKO/9Q1D2VHvUc6lvttuOkHHHMA8Vz3W/Naun/iO7QVPGDihEbb0GpFWbrpgV7XJALccIO+xux/OLuSnUBRcoKvMm3xKnFJ+plXwafesyC84zqi8QZAjHoUvByOtBKlb73TjwB/gzqcuXvq0pjb0BY7oy72NgCHWNaAnc6layBY6DI3gfAL84auohuEKoQhn001N9aNSn8nVmDdSjT9a9wYYgkYDFuO+R+p82218DCUV5hKjaK64bQpDd9+GHf/7lbwNUuA+KF0b/6GaEAKnYUbynKEMcoDlPTCfsgPR2QfY6hGIEYihnkoWr6MgsFgxFio7ztxOsnUtubQoLsrQIiuA21yrX3X+aEgrvFYdtaqn3BallE0cYuZw8jC5fGTUUjSBIaTxP2zA7WsgFR+GtXn/EwxRkxds2ugCfOUZaQT9iBlmeUGDmK8XQ95/segkThmXQX9+a8ybTh4jE9ZJ0Fdnik3akQlcG9WUV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(11063799006)(4133799003)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXg3SVdwRnpvbnludDZIdDNDdTRTd1Z0VGpic1VtNDRqZk1IeUdSbnBJeFor?=
 =?utf-8?B?QjZYUWxNRU1WSDFDeUQ3L2NtZlFiaS9sU0YxaU5zV1Ivb1dNQ1pGdGNINUNL?=
 =?utf-8?B?ME8rZ0FGZ1VBem83SGJsTDBhbTBIMG5XU2kyWEs1NmhBak9WUFlKMGtsdkhL?=
 =?utf-8?B?Mkt2U29PY3kvOW5BemFJRWlqVkFpZ2c2dmVjS2I4TjNjSVVzajgwVVJpU2Yv?=
 =?utf-8?B?M2c3bG1KaDZiVXVzcEFBK1lnUHJ2Q1dmNVVtam9UMGpIVmhLSmo3Tm1SVng1?=
 =?utf-8?B?L25JNTJCNVdGOEppMThCdmh2REVrNlJQcENmNlNpNHFrMU00RlFCaFNIcEpR?=
 =?utf-8?B?cHBUZitvcUFtRHVNb0xDZGRGd2ZnRzgyUHZmQXlyMU1Ja0dodGY1bVRiRnVX?=
 =?utf-8?B?SW9ndG13aENzdStvVUY2K3hDZEJnTTZwTVNHZjdPN1Y2S2puWUV6YmxncFo4?=
 =?utf-8?B?eXNmbEEvbWMyY1hnSTdHUUwveWNKRDhEbm9qL3Z6cDBWT3BTWFBVU3QwUkJI?=
 =?utf-8?B?K1Z1bXV6c1lwUTJmc1lyVUFvOEFlVFA3TTlweEFacWl6RDAycjQyZTlnSEJn?=
 =?utf-8?B?eTNFSUNUZlEvUmFCZmoxcFdBYjVMZ2E2YmJpM1BtUlFRcjhua3hNNy9mSlVY?=
 =?utf-8?B?ZVlWdUQ3MlpHMWx2MUFQNUtHMFBKM00wWEozNTdZU2ZrOTJZRUs0REsyczJ4?=
 =?utf-8?B?TkZwR0I3SUIwbGtoanBFM0huVURFQlNlcjZrVHRvUXVlVy9qMFpQbktINitw?=
 =?utf-8?B?b2xjdzZtUkJqV2hWeTcrQzk5T1JxUjZ6Q041NzRPWkVPck1ML3dLYVFOdFg4?=
 =?utf-8?B?anh1eHBUeGwvS3o4WENxa243UGozMitMNEN0cXZTZmdkek1TRHpnOFpBdGI2?=
 =?utf-8?B?WEUzMitkSlZYOUcyZTJ1M2w4VFM1cGhXZTAybE01YSt0TWxWNUYyN0xKNHZa?=
 =?utf-8?B?WVhrRGZjWXdOZDU1YllWOWNQNGRBSmw3azZza05qdDJ2Q1BCc3dIS3dPaTMx?=
 =?utf-8?B?dkNlVS96VmV5T0lBOWxPd3ZmNUpqSFpzYzV4K0ZxdmRwZitnTE0yM2dqVjlk?=
 =?utf-8?B?blh4cUxUc2FVRTBwZmRrV0piOFVlNHI2OXhSUlB6dG56Q0IvVUo3Wm1FNHpZ?=
 =?utf-8?B?ZlRXSEZrUmwxcXZlTXBqdnhmVHRyVUJsQWJhVTIvZWZ0Z3ZIOWlCYWR6eHdG?=
 =?utf-8?B?MnBIbEY4V0lmQ1FzUE9YYzl3NC84Wkx1Tk16ZTZ3WFNQWWtJZTF2aXNaKzRn?=
 =?utf-8?B?a2ZOMThFa3hhazZCcnc1eUgxTGRHb2JIdEM5VDlHZU54amorbXZkcm91OG1W?=
 =?utf-8?B?MTZpWVNra092b3dzRGF6amhSb1hnbXZCWGhNaFJINWRkNktJdVh5c09CNzNB?=
 =?utf-8?B?cUdhSCtHWEVtemN5MUhhUHkxV3UvclgyckNNcW9jV3hhYmw5VlE0Y3FqT3c4?=
 =?utf-8?B?UU5VQlpCT3NXM1JQN203a1hna1JUdGVTVkpmMnZ5OCtubjRVbUNnTWV0Y05V?=
 =?utf-8?B?UUpVN3RQSGp1TWVkbk1MY0lsWHFYcFpraVFBUWJHREYxVE1UMm4zTXhERVp4?=
 =?utf-8?B?TEUrY0N5UldpUG12eHBueVV4UUU3VTZscnMvYm9QeCtDb2VTSnlIa1NHWmF5?=
 =?utf-8?B?VFRSYmFKVXdjZFQyazNVekNKNlBXSXVpRWtVUi9uUzJMaTdjWjBGVTk3MWE5?=
 =?utf-8?B?NDMvdXVzaTlkNU5rdWpoamtZcEFxWXp6c2ZrSlY1Z1FvN1FDckJ4VkFNc3dF?=
 =?utf-8?B?Y0FTK0owdzhzRTR1cjlpUktRcXVIU3J2cm0xdHo2Zk9tRXdqNEdOUkZDY2NW?=
 =?utf-8?B?UWNrTmpUNlBLZW1rRjBrSzFXK2VnZU5XRjdsaDh4UFNQUDFWR3A0WVZud3hi?=
 =?utf-8?B?ZkRoSStqcDlJdGVvUDJvb2h5VXNzOHlic1ZvL0xKUkt2cnJ4OTI1eUNDWUh0?=
 =?utf-8?B?MFZSM1Znb2pLNTN2MEtnaG1aZFFPOEViTDRZSmpDVVI4NXRFZHROM0EvTG9x?=
 =?utf-8?B?MTJmU044cmZEZW9JdGJzbTVRZHR2dnRyeVROa2cxTkpnSEx5MFdCaEUyQXpZ?=
 =?utf-8?B?dFdHY29jQ2dxL0o3WnlwNVk4SzJOWnlhNFp3d1l0cDJTOVpISmluMlJNYlZX?=
 =?utf-8?B?ODgyR3FZenR6Z3QxdXkvdU5QSmhRcVozTDM0Nmg5aXJITU9sYmQwRUx2Umtu?=
 =?utf-8?B?cEM0Rll5ajhDeG8zYm9xL0ZiYitUdlhQdi9pYzRQNGQvWjZ5MnJUdVA5VUtL?=
 =?utf-8?B?UE5RdjVOMkI2TXRMS09YSy9hNVhCYlZtRlR0Y0YzUnl5WXU1aEtSbkFMbUlT?=
 =?utf-8?B?T3ZiYUxaUXRGaC9qVDR5dW91dGZ5dkVGV3dRV0RzTWJWcVY0cmozQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	qil+roBa6jai7Osyd3TmodQgRJVIkZsiOjSmdHvafq4SRb4EMGhctPriI94xCqbPfkIfEyM8pGPRmYur5u4m8b1YrQtFd338KZKHRi/3tLDa5VYqnWAAJYErIpVwkFVyB7Y23IGmKrz1JH0k0k3XCyS9Mm+eIpryqN/MQIXUaPc7d8/Rn+s6JWrDETew+LZqk4XWLX+R6ESoMjalNiXbTx1AWW+niWYza3LUtXUDS6e0oY2/o3zc4YMsfx5qgEymICOBHqxCV/D+73cZvN1l2lbJVxNdV7dD0l8gk6Slifr2vP1oFkS+VBaWhcWLhqsOJODbozdeT4aj5x9+S890Cw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c393f-408b-4dc2-334d-08decaa25114
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 05:52:42.6936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9kNzeUipEdFWBZoa6jRVeYsX/Ix0lY8nj5e5xnilLPlSXXsruIJBTwDFCK9tQ/wr0fjZ+hXIelLarXjHRlXeurm/w6f4DEfkY9/7fnTFMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7153
X-Proofpoint-GUID: YX7TpmopJRvaURNU359Ti6lW9PtTOzNu
X-Proofpoint-ORIG-GUID: YX7TpmopJRvaURNU359Ti6lW9PtTOzNu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfX8Pc1/rgTbUUK
 qnPcOUosMTH0OdVqN8tDpFDNFz953D3cAfgHhEDFRKddAYA9SovSOGTF3g8e8mZBpejHCBr1lKg
 WeYJ1bpfXnww343CMiNeahdiLk71BVPROuraMk/Gk0gZQ+wYAQVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfXyi7GPz/UqxwH
 4zGKv7tCAnWsim1UvFzoycw8b63CPYRUPGU9HWpFfMry7xH/nU92hVCQz9tbqM4ku2o3j29Vwfy
 VEGdBvCfCmwr9VtcJG7s6ZaalZkXPyJlTP40xpHaz00z/oF7JpaK6+dQMiuFnFKuzAEeAEzIV3r
 2pqm0V7WbqWIeJvFlDyk0h1XLnp5Kf5N4B4UbgtCIe8gdnQizzHjFE8UW8/TQ9hBUzY0hYfErpp
 cq3D67/GnKt4dIanPrnAeBfyHR7O2YhyJwy1xijwVgO3VztC4XS2jUYQ8oF8kb7YsakvNX27D0J
 mXrxPuN2sk4Zux4J0RB3k0jOP8w+AA3297cRXbr/1QokZFG7csqE/coqEPLkzGHaleP7CL2Rs+A
 OzWHfc23oGe79sxDo6TSgC6GE15zibr6hB9EoWeQBC1sjdF3rNWN9RTW32vTvGvd8Bzj/afxAF5
 tZcJN78JgXm8m5WS+3Q==
X-Authority-Analysis: v=2.4 cv=H7HrBeYi c=1 sm=1 tr=0 ts=6a2f932c cx=c_pps
 a=DvLgf67dpzRpeCMgcWG2JQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=BeC0Lz80CGp_rxE3j28A:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8590-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:pavel@kernel.org,m:krzk+dt@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:email,analog.com:from_mime,urldefense.com:url,vger.kernel.org:from_smtp,DS0PR03MB7228.namprd03.prod.outlook.com:mid,led_cdev.dev:url];
	FORGED_SENDER(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBE3E68397C

QWZ0ZXIgdGhlIG5ldyB2ZXJzaW9uIGFub3RoZXIgc2V0IG9mIHNhc2hpa28gcmV2aWV3LiBXaWxs
IGFsc28gaGFuZGxlIGZpeGluZyB0aGVzZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IHNhc2hpa28tYm90QGtlcm5lbC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+
DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAxNSwgMjAyNiAxOjM4IFBNDQo+IFRvOiBFc2NhbGEsIEVk
ZWx3ZWlzZSA8RWRlbHdlaXNlLkVzY2FsYUBhbmFsb2cuY29tPg0KPiBDYzogcm9iaEBrZXJuZWwu
b3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYxMCAyLzJdIGxlZHM6IGx0YzMyMjA6IEFkZCBTdXBwb3J0IGZv
ciBMVEMzMjIwIDE4IGNoYW5uZWwNCj4gTEVEIERyaXZlcg0KPiANCj4gW0V4dGVybmFsXQ0KPiAN
Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91
bmQgNCBwb3RlbnRpYWwgaXNzdWUocykgdG8NCj4gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIER1cGxp
Y2F0ZSBMRUQgYHJlZ2AgdmFsdWVzIGJ5cGFzcyB0aGUgdmFsaWRhdGlvbiBjaGVjaywgbGVhZGlu
ZyB0byBhDQo+IGRvdWJseS1saW5rZWQgbGlzdCBjb3JydXB0aW9uIGluIHRoZSBMRUQgY29yZS4N
Cj4gLSBbTWVkaXVtXSBNaXNzaW5nIExFRCBjbGFzcyBzdXNwZW5kL3Jlc3VtZSBjYWxscyBpbiBz
eXN0ZW0gUE0gY2FsbGJhY2tzLg0KPiAtIFtNZWRpdW1dIFRoZSBgcGF0dGVybl9zZXRgIGNhbGxi
YWNrIHNpbGVudGx5IGlnbm9yZXMgdGhlIGByZXBlYXRgIHBhcmFtZXRlciwNCj4gYnJlYWtpbmcg
Y29udGludW91cyBwYXR0ZXJucy4NCj4gLSBbTG93XSBTZXR0aW5nIGJsaW5rIG1vZGUgb24gYSBk
ZWFjdGl2YXRlZCBMRUQgY2F1c2VzIGFuIHVubmVjZXNzYXJ5IEkyQyByZWFkDQo+IGFuZCBoYXJk
d2FyZSBnbGl0Y2guDQo+IC0tDQo+IA0KPiBjb21taXQgZmY5MzZiOTUyYTZhNDI3ZTAyMzIyMjk1
MzdhMTA0MzhlNGYzNGExMQ0KPiBBdXRob3I6IEVkZWx3ZWlzZSBFc2NhbGEgPGVkZWx3ZWlzZS5l
c2NhbGFAYW5hbG9nLmNvbT4NCj4gU3ViamVjdDogbGVkczogbHRjMzIyMDogQWRkIFN1cHBvcnQg
Zm9yIExUQzMyMjAgMTggY2hhbm5lbCBMRUQgRHJpdmVyDQo+IA0KPiBBZGQgZHJpdmVyIGZvciB0
aGUgTFRDMzIyMCAxOC1jaGFubmVsIExFRCBkcml2ZXIgd2l0aCBJMkMgaW50ZXJmYWNlLCBpbmRp
dmlkdWFsDQo+IGJyaWdodG5lc3MgY29udHJvbCwgYW5kIGhhcmR3YXJlLWFzc2lzdGVkIGJsaW5r
L2dyYWRhdGlvbiBmZWF0dXJlcy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9s
ZWRzLWx0YzMyMjAuYyBiL2RyaXZlcnMvbGVkcy9sZWRzLWx0YzMyMjAuYw0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMDAuLmY5NTE3NGFlNDUxYmENCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9sZWRzL2xlZHMtbHRjMzIyMC5jDQo+IFsgLi4u
IF0NCj4gPiArc3RhdGljIGludCBsdGMzMjIwX3BhdHRlcm5fc2V0KHN0cnVjdCBsZWRfY2xhc3Nk
ZXYgKmxlZF9jZGV2LA0KPiA+ICsJCQkgICAgICAgc3RydWN0IGxlZF9wYXR0ZXJuICpwYXR0ZXJu
LA0KPiA+ICsJCQkgICAgICAgdTMyIGxlbiwgaW50IHJlcGVhdCkNCj4gPiArew0KPiANCj4gW1Nl
dmVyaXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyBjYWxsYmFjayBzaWxlbnRseSBpZ25vcmUgdGhl
IHJlcGVhdCBwYXJhbWV0ZXI/DQo+IA0KPiBJZiB0aGUgdXNlciByZXF1ZXN0cyBpbmZpbml0ZSBy
ZXBldGl0aW9uIChmb3IgZXhhbXBsZSwgcmVwZWF0IGlzIC0xKSwgdGhlIGRyaXZlcg0KPiByZXR1
cm5zIDAgd2l0aG91dCBwcm9ncmFtbWluZyBjb250aW51b3VzIGJyZWF0aGluZy4gU2hvdWxkIHRo
aXMgcmV0dXJuIC0NCj4gRU9QTk9UU1VQUCB3aGVuIHJlcGV0aXRpb24gaXMgcmVxdWVzdGVkLCBz
byB0aGUgTEVEIGNvcmUgY2FuIGZhbGwgYmFjayB0bw0KPiBzb2Z0d2FyZS1kcml2ZW4gcmVwZXRp
dGlvbiBpbnN0ZWFkIG9mIGhhbHRpbmcgYWZ0ZXIgYSBzaW5nbGUgcmFtcD8NCj4gDQo+ID4gKwlz
dHJ1Y3QgbHRjMzIyMF91bGVkX2NmZyAqdWxlZF9jZmcgPSBjb250YWluZXJfb2YobGVkX2NkZXYs
IHN0cnVjdA0KPiBsdGMzMjIwX3VsZWRfY2ZnLA0KPiA+ICsJCQkJCQkJIGxlZF9jZGV2KTsNCj4g
WyAuLi4gXQ0KPiA+ICtzdGF0aWMgaW50IGx0YzMyMjBfYmxpbmtfc2V0KHN0cnVjdCBsZWRfY2xh
c3NkZXYgKmxlZF9jZGV2LA0KPiA+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgKmRlbGF5X29uLA0K
PiA+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgKmRlbGF5X29mZikNCj4gPiArew0KPiBbIC4uLiBd
DQo+ID4gKwkvKiBFbnN1cmUgTEVEIGhhcyBub24temVybyBicmlnaHRuZXNzIGJlZm9yZSBlbmFi
bGluZyBibGluayBtb2RlICovDQo+ID4gKwlpZiAodWxlZF9jZmctPnJlZ192YWx1ZSA9PSAwKSB7
DQo+ID4gKwkJcmV0ID0gcmVnbWFwX3dyaXRlKGx0YzMyMjAtPnJlZ21hcCwNCj4gTFRDMzIyMF9V
TEVEX1JFRyh1bGVkX2NmZy0+bGVkX2luZGV4KSwNCj4gPiArCQkJCSAgIGxlZF9jZGV2LT5tYXhf
YnJpZ2h0bmVzcyk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJcmV0dXJuIHJldDsNCj4gPiAr
DQo+ID4gKwkJdWxlZF9jZmctPnJlZ192YWx1ZSA9IGxlZF9jZGV2LT5tYXhfYnJpZ2h0bmVzczsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGx0YzMyMjAt
PnJlZ21hcCwNCj4gTFRDMzIyMF9VTEVEX1JFRyh1bGVkX2NmZy0+bGVkX2luZGV4KSwNCj4gPiAr
CQkJCSAgTFRDMzIyMF9MRURfTU9ERV9NQVNLLA0KPiA+ICsJCQkJICBGSUVMRF9QUkVQKExUQzMy
MjBfTEVEX01PREVfTUFTSywNCj4gTFRDMzIyMF9CTElOS19NT0RFKSk7IH0NCj4gDQo+IFtTZXZl
cml0eTogTG93XQ0KPiBXaGVuIGx0YzMyMjBfYmxpbmtfc2V0KCkgaXMgY2FsbGVkIG9uIGFuIExF
RCB3aXRoIHplcm8gYnJpZ2h0bmVzcywgZG9lcyB0aGlzDQo+IHNlcXVlbmNlIGNhdXNlIGEgdmlz
dWFsIGdsaXRjaCBhbmQgYW4gdW5uZWNlc3NhcnkgSTJDIHJlYWQ/DQo+IA0KPiBUaGUgZmlyc3Qg
cmVnbWFwX3dyaXRlKCkgdHVybnMgdGhlIExFRCBvbiBzb2xpZCBpbiBub3JtYWwgbW9kZSwgYW5k
IHRoZW4NCj4gcmVnbWFwX3VwZGF0ZV9iaXRzKCkgaW5jdXJzIGFuIEkyQyByZWFkIHRvIHN3aXRj
aCBpdCB0byBibGluayBtb2RlLiBDb3VsZCB0aGUNCj4gZHJpdmVyIGNvbnN0cnVjdCB0aGUgZmlu
YWwgOC1iaXQgdmFsdWUgZnJvbSB0aGUgY2FjaGVkIGJyaWdodG5lc3MgYW5kIHdyaXRlIGl0DQo+
IGRpcmVjdGx5IHVzaW5nIGEgc2luZ2xlIHJlZ21hcF93cml0ZSgpPw0KPiANCj4gWyAuLi4gXQ0K
PiA+ICtzdGF0aWMgaW50IGx0YzMyMjBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4g
PiArCXN0cnVjdCBsdGMzMjIwICpsdGMzMjIwID0gaTJjX2dldF9jbGllbnRkYXRhKHRvX2kyY19j
bGllbnQoZGV2KSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhsdGMz
MjIwLT5yZWdtYXAsDQo+IExUQzMyMjBfQ09NTUFORF9SRUcsDQo+ID4gKwkJCQkgIExUQzMyMjBf
U0hVVERPV05fTUFTSywNCj4gTFRDMzIyMF9TSFVURE9XTl9NQVNLKTsgfQ0KPiANCj4gW1NldmVy
aXR5OiBNZWRpdW1dDQo+IERvZXMgdGhpcyBzdXNwZW5kIGNhbGxiYWNrIG1pc3Mgbm90aWZ5aW5n
IHRoZSBMRUQgY29yZSBhYm91dCB0aGUgc3VzcGVuc2lvbj8NCj4gDQo+IEJ5IG5vdCBpdGVyYXRp
bmcgb3ZlciB0aGUgcmVnaXN0ZXJlZCBMRURzIGFuZCBjYWxsaW5nIGxlZF9jbGFzc2Rldl9zdXNw
ZW5kKCksIHRoZQ0KPiBMRUQgY29yZSByZW1haW5zIHVuYXdhcmUgdGhlIGRldmljZSBpcyBzdXNw
ZW5kZWQgYW5kIHdpbGwgbm90IHBhdXNlIHRyaWdnZXJzLg0KPiBDb3VsZCBhbiBhY3RpdmUgc29m
dHdhcmUgdHJpZ2dlciBhdHRlbXB0IGFuIEkyQyB0cmFuc2FjdGlvbiB3aGlsZSB0aGUgc3lzdGVt
IGlzDQo+IHN1c3BlbmRpbmcsIHBvdGVudGlhbGx5IGNhdXNpbmcgYnVzIHRpbWVvdXRzPw0KPiAN
Cj4gWyAuLi4gXQ0KPiA+ICtzdGF0aWMgaW50IGx0YzMyMjBfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkgew0KPiBbIC4uLiBdDQo+ID4gKwkvKiBGaXJzdCBwYXNzOiB2YWxpZGF0ZSBj
b25maWd1cmF0aW9uIGFuZCBzZXQgdXAgTEVEIHN0cnVjdHVyZXMgKi8NCj4gPiArCWRldmljZV9m
b3JfZWFjaF9jaGlsZF9ub2RlX3Njb3BlZCgmY2xpZW50LT5kZXYsIGNoaWxkKSB7DQo+ID4gKwkJ
c3RydWN0IGx0YzMyMjBfdWxlZF9jZmcgKmxlZDsNCj4gPiArCQl1MzIgc291cmNlOw0KPiBbIC4u
LiBdDQo+ID4gKwkJLyogTEVEIG5vZGUgcmVnL2luZGV4L2FkZHJlc3MgZ29lcyBmcm9tIDEgdG8g
MTggKi8NCj4gPiArCQlsZWRfaW5kZXggPSBzb3VyY2UgLSAxOw0KPiA+ICsJCWxlZCA9ICZsdGMz
MjIwLT51bGVkX2NmZ1tsZWRfaW5kZXhdOw0KPiA+ICsNCj4gPiArCQlpZiAobGVkLT5sZWRfY2Rl
di5kZXYpDQo+ID4gKwkJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZjbGllbnQtPmRldiwgLUVJTlZB
TCwNCj4gPiArCQkJCQkgICAgICJEdXBsaWNhdGUgTEVEIHJlZyAldSBmb3VuZCIsDQo+IHNvdXJj
ZSk7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IElzIGxlZF9jZGV2LmRldiBhbHdheXMgbnVs
bCBkdXJpbmcgdGhlIGZpcnN0IHBhc3Mgb2YgbHRjMzIyMF9wcm9iZSgpPw0KPiANCj4gU2luY2Ug
bHRjMzIyMCBpcyBhbGxvY2F0ZWQgd2l0aCBkZXZtX2t6YWxsb2MoKSwgbGVkX2NkZXYuZGV2IHdp
bGwgYmUgemVyby4gSXQgaXMgb25seQ0KPiBhc3NpZ25lZCBkdXJpbmcgZGV2bV9sZWRfY2xhc3Nk
ZXZfcmVnaXN0ZXJfZXh0KCkgaW4gdGhlIHNlY29uZCBwYXNzLCBzbyB0aGlzDQo+IGR1cGxpY2F0
ZSBjaGVja2luZyBsb2dpYyBhcHBlYXJzIHRvIGJlIGJ5cGFzc2VkLg0KPiANCj4gSWYgYSBkZXZp
Y2UgdHJlZSBjb250YWlucyBkdXBsaWNhdGUgcmVnIHZhbHVlcywgd2lsbCBpdCBzaWxlbnRseSBv
dmVyd3JpdGUgdGhlIHNhbWUNCj4gdWxlZF9jZmcgc3RydWN0dXJlIGR1cmluZyB0aGlzIGZpcnN0
IHBhc3M/DQo+IA0KPiBbIC4uLiBdDQo+ID4gKwkvKiBTZWNvbmQgcGFzczogcmVnaXN0ZXIgTEVE
cyBhZnRlciB2YWxpZGF0aW9uICovDQo+ID4gKwlkZXZpY2VfZm9yX2VhY2hfY2hpbGRfbm9kZV9z
Y29wZWQoJmNsaWVudC0+ZGV2LCBjaGlsZCkgew0KPiA+ICsJCXN0cnVjdCBsZWRfaW5pdF9kYXRh
IGluaXRfZGF0YSA9IHt9Ow0KPiA+ICsJCXN0cnVjdCBsdGMzMjIwX3VsZWRfY2ZnICpsZWQ7DQo+
ID4gKwkJdTMyIHNvdXJjZTsNCj4gPiArDQo+ID4gKwkJcmV0ID0gZndub2RlX3Byb3BlcnR5X3Jl
YWRfdTMyKGNoaWxkLCAicmVnIiwgJnNvdXJjZSk7DQo+ID4gKwkJaWYgKHJldCkNCj4gPiArCQkJ
cmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwkJaW5pdF9kYXRhLmZ3bm9kZSA9IGNoaWxkOw0KPiA+
ICsJCWluaXRfZGF0YS5kZXZpY2VuYW1lID0gImx0YzMyMjAiOw0KPiA+ICsNCj4gPiArCQlsZWRf
aW5kZXggPSBzb3VyY2UgLSAxOw0KPiA+ICsJCWxlZCA9ICZsdGMzMjIwLT51bGVkX2NmZ1tsZWRf
aW5kZXhdOw0KPiA+ICsNCj4gPiArCQlyZXQgPSBkZXZtX2xlZF9jbGFzc2Rldl9yZWdpc3Rlcl9l
eHQoJmNsaWVudC0+ZGV2LCAmbGVkLQ0KPiA+bGVkX2NkZXYsDQo+ID4gKyZpbml0X2RhdGEpOw0K
PiANCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBGb2xsb3dpbmcgZnJvbSB0aGUgZHVwbGljYXRlIGNo
ZWNrIGJ5cGFzcyBhYm92ZSwgaWYgYSBkdXBsaWNhdGUgcmVnIHZhbHVlIGlzDQo+IHByZXNlbnQs
IHdpbGwgZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXJfZXh0KCkgY2FsbCBsaXN0X2FkZF90YWls
KCkgdHdpY2Ugb24gdGhlDQo+IGV4YWN0IHNhbWUgbm9kZSBhZGRyZXNzPyBUaGlzIHdvdWxkIGNv
cnJ1cHQgdGhlIExFRCBjb3JlJ3MgZG91Ymx5LWxpbmtlZCBsaXN0DQo+IGFuZCByZWxpYWJseSBj
YXVzZSBhIGtlcm5lbCBwYW5pYyB1cG9uIGl0ZXJhdGlvbiBvciByZW1vdmFsLg0KPiANCj4gLS0N
Cj4gU2FzaGlrbyBBSSByZXZpZXcgwrcNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vc2FzaGlrby5kZXYvKi9wYXRjaHNldC8yMDI2MDYxNS1sdGMzMjIwLQ0KPiBkcml2ZXIt
djEwLTAtDQo+IDkxNjU2MmM4ODU5OEBhbmFsb2cuY29tP3BhcnQ9Ml9fO0l3ISFBM05pOENTMHky
WSE0WkMxbGpmcDE5ZGdUejF0S0lvb3INCj4gUlhZNjVhX3EyNFV6OU53ZEwyMm5UVThWclBLamY5
N25rQldZOFRaQmJrOE5KN3VRbGF1a3hZcHRxT1VDV3hBDQo+IFZ0TkkwOEEkDQo=

