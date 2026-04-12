Return-Path: <linux-leds+bounces-7701-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id R60sJBou3Gl0NgkAu9opvQ
	(envelope-from <linux-leds+bounces-7701-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Apr 2026 01:43:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D83E66B0
	for <lists+linux-leds@lfdr.de>; Mon, 13 Apr 2026 01:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19CB73008749
	for <lists+linux-leds@lfdr.de>; Sun, 12 Apr 2026 23:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FA630CD85;
	Sun, 12 Apr 2026 23:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="His8VThZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F481624C5;
	Sun, 12 Apr 2026 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776037062; cv=fail; b=D4kpsdZqiiboidlDj3SWYqSufdxOXuZWXJEeBoE9s2BKi3OyIowFdTQrhlqLS9/IKlj0ZjxegYsLQi8+aXH8xyKYrZH9rmtmxNjtxNluwJTKjh3Oy03xC+QwoFlmUk78rpsMtjGCsQrBJJNHz++0Xpq6U9NALcv7zrRZOxcXuKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776037062; c=relaxed/simple;
	bh=B4CLCN/52EenmYjNw7NJ4R44DuLLBxm9b/odINpnEog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qST/fKX20LMBjQ6iOJfebEKibOWFo/ikoqij5LexS+04SV3HGjA02mCRe+4J4Gnc295s2CQGl3SaREaVA16Lr8fuJPILY4BVuYuZ1XCfz0ipGHpLzbHLObzojYui30mHzuaVKditb9/V9xYC+N3TDG6XGBPTI1Jm+hQwor3Xv74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=His8VThZ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CL5X4x2940150;
	Sun, 12 Apr 2026 19:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=xm9T8
	yYDg6SiFhwsFA2JUyJohaAY+c9iuLBdP4/u+zg=; b=His8VThZ5ioYs3pz83p1A
	4yAQagsrzsoAQX49wzbAvIgd9cZeRQYQS0hx1glIvEuMF78uhxZXKDdPvNUZoknz
	5Xo7KPCWwqBq1D53vz/OfDFQ11nrZRCkgve4HLglYfndeS3SOi6mzgtwxd8R/3rB
	lKbqjXZWI/2uLxgwBTNf7IYy3ecLYTV+1HkIYDwOkHLezTJpcdznDyGuLpy/ocWk
	wDihsO/JbmG5N1OaEbfPbuDHBeFdJPrbLTW/MLDZzv+A5692FC6TZtAibViEhUJS
	6aAeshjl1jKaM/SjSJjdoDBLaA23SnT/w3hesAfipCtz9OdU1Bxl78vC+F2vdkZQ
	w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4dg4mejhwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 12 Apr 2026 19:37:38 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDt4jMayGhbaTo3qJAALHdwyuLi9kmW3flsHi2wAvbcwdLSlQ85bQqwYDjKo3v35uB56D5TLtROVi+s/H57tl83COCjtHQKN0fmaCrJN7UchbgP28AsncrEdcMtECqALG6ZsRXX2h61A2eeMhP4cFMx+lE+3wLsrJ3pPI/+SIpcxsfZiiVyKOoWsvYUZt2U1qkqF8mmIIYAEJPnraDtO4gjBYALU5d+5jSpaCc1Dstgd4OFmF/wajlfHFovyQ41jslalnI5p+fqsWiRPj1ENdpmU1MjIkNl7dl7yTfnZgjCGWPuQgUgewTnNF+K+y9o/1QWIWVwZG1gJTbijjZb3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm9T8yYDg6SiFhwsFA2JUyJohaAY+c9iuLBdP4/u+zg=;
 b=hF4VSiETsuGg8ue0WBS7zIfe9ttuaj82gWnhFiSuK2g5oBtsyLCS6aWpmaznihJRZraB04b2ouwS5tT6xijm/NpXhBCk/+xnB0kRE7CX014fFoR3rMvwsig23eIQTmQll+lGm9krKZGqUzBv+HBKkuKFVeW+A/LKYKXPTlM48GIoXLxdHWlfsE+0c0LeKpqe/mFvb+9chWb/ZUYo1Wz1uMzY7ASOiCnAPeu+jO6WiL8cKN7sJhtKBnf8xcCnjV3zP+5FoJBR+ln9LQ8PaeYmI0McC/t6qZhYpc2MB1rqLhfllwN2Cma+lW/j6giE9W/LPagOMHB7O75v8oju4BjwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by CH4PR03MB8019.namprd03.prod.outlook.com (2603:10b6:610:242::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sun, 12 Apr
 2026 23:37:35 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%5]) with mapi id 15.20.9769.046; Sun, 12 Apr 2026
 23:37:35 +0000
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
Subject: RE: [PATCH v3 2/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v3 2/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Thread-Index: AQHcxZWBm8lw1Xmwb02a/xR2Xzha2bXTLJuAgAjxliA=
Date: Sun, 12 Apr 2026 23:37:35 +0000
Message-ID:
 <BN8PR03MB4977C3A5917167F9B8BE6A3E96272@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
 <20260406-upstream-ltc3208-v3-2-7f0b1d20ee7a@analog.com>
 <20260407-outstanding-sceptical-giraffe-3fd6bb@quoll>
In-Reply-To: <20260407-outstanding-sceptical-giraffe-3fd6bb@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|CH4PR03MB8019:EE_
x-ms-office365-filtering-correlation-id: 64b6f4f8-600b-41a2-d176-08de98ec7993
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 1rcJ4qW9oVlRZqEPCogToiLWCMgM4jTwP8B7mWm9YvDqy9zKIEMiCfLkbK+dmVP30KCZvKrL7m9GVc6uvRtVjAOl0cSpufG540J8hZnGWARG3LrQxwpUzZkwNNTr0dabe8OCVcXpyntXHJFC7QffFYR0P+zMQbKzSO2XyslY3jrIjKlrClQ0ImRQ5igEw7/qKURSrar9hskTWARQbiFwmFuKbhG6WoLTnaALUANC7BYc6WzphIcaDtuNcibkw/0RMvTDubgIzeoBPuEq/tl03UeRl5j7/iQnzjMkPuM8YfR9+lPO5S6+g170njBQuCt/TMlUkcsJm95m1Z8Jz6eQiU2ZcANEp4pEVoTT6oAEDwnMldBKIswkYo2DF6rwG8/+FPABbyGkubbrJSJOyUrrb9B18iQb2yuSvTkfcwMKgTwaa+7zMP4y5PsTkMxQDYRterjNhXiQ3GNuR1INFAn/i7+2UPev4HurI5vnusikffP6+oz6VrDB7HIgNRiDY9tYNGQHwjshfKimqeDvK+A+XxubCSjsb4kvJH8dk+fxXfPFJIq1e7nrXxVXCiFSx+c8TNrs663OvmQZASK2dPi3L6Is7E/JkAkBfV4JBAs6YLIpWL3O4amr0RgsVVgWsmyfv6/zxA6Ol9mzVzzq8Tz9IOvkUM8CcVuL7VBTkjMyxsVoMS5PHshCc24KoSQnH0KJWxCTWvd/7w22sXty03nm0LG/mjSV5soOqIxXd1xbMASAwfOgQA0+agLX8pUuuEbSJWYLPfIko8N+kOr56wXEbKScmVl1GL5+mnnzS/k6/Uc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LhkPWiu/m/aYZcWpzjKXswzxpMD0bAjxZHdU/oiUYfMhaFHk7iL/LLN0FR4p?=
 =?us-ascii?Q?Ujkwrh/55Fqg4eWZ446FkhSm1J7xyYE5Drzy99S3+S/Z3DeoOfju9b7D8fvd?=
 =?us-ascii?Q?IZbm7Anbvx4hd8iF7rneZQqbSvorH5hgw6V9sDLJxsEckrx298DNTYEMfAsI?=
 =?us-ascii?Q?NDZDo81VzVDbxcuJ/gHlvzAgCs85vOg0+2/+2QhiR4ACM1pFJYTB02q8ZdAd?=
 =?us-ascii?Q?QPhtOHYdmA8meCzpKKGMQdNBkngyRTkyzNCX7GrChU7Togom+zVCpN0J3Jew?=
 =?us-ascii?Q?HkNXF5WXagdF/zWpEvMyme2oQs4BxFLpQi+KrDolP+xfzxpdJevZg2JIufUt?=
 =?us-ascii?Q?Y6vcuV+i31pFdrWUphhbpVNGgK/a4BZWSfU2W04MA7wLELDLnFUnuqF5GYeT?=
 =?us-ascii?Q?NDnsx4VZUhZwYGc3f4WyYTuP79BTi7LJ8IxtTDHmpaTC2gDq0jJjImKAw2Er?=
 =?us-ascii?Q?aQME29tl0ECe4DZXo4I0zjXkrPuOu+3ZO/Iwc6nOGODYSavuNvKi0at/OB/o?=
 =?us-ascii?Q?E6TbswoUGATCjPOFE3Df+PVpM1Q+cu4AgTuOsRPYHYJJjmi8wWiU9MSvrsEo?=
 =?us-ascii?Q?ddB/DMqT3C/Sjh0nbOnBy+gCJkezestk/q8hg3eNUDwvG5ANvSimO2rRk/X2?=
 =?us-ascii?Q?kEaHXTCBtba50Ho1IYwITSpvZD2FsLIrswc2/BX0biIRqyRVgtjTsIGTOJ+J?=
 =?us-ascii?Q?5YRm9xNjBPEhOswjBqFz0bz0JV5rx5GQZR+shWgnt+UK8ZW0nuy0BZdXmU1/?=
 =?us-ascii?Q?xa691JZDjeozdBG3Uw1kJwBti0gLMSKVmEMDpNYXJegRy2SkbQ01yZWE/yjI?=
 =?us-ascii?Q?W1wsGRjeAIglgBGXLtaYIliJK3gITvPqg9yBDzNEnNp0VjhATN9jbMjLwzUN?=
 =?us-ascii?Q?EEbDyqo9+uz5VXclrx2smItCFr2s2xu/JH5ww+3i4sgxa61RcIp8oBeHFDY3?=
 =?us-ascii?Q?MM5gIHUd1qXS6XDIl3Hz4K6h4qRsISuwTQqkHBx5yZY3H/rJ5GxJqj9x+FBn?=
 =?us-ascii?Q?DSKIzSHQk3wZb3EqGyKUcDJXT5PdyvM4h8UTEuj8SFk6vEGqvOLLWaPYYeqP?=
 =?us-ascii?Q?Z9XhhIYvsERePwr6uo+yDjyzrFCOvghMfFbVQHc19O8Wn42S2ejbms56nvi7?=
 =?us-ascii?Q?g/5qfIynFOK6D3Q9gmO095XvNofWzYanh85+VRD+c7YYzcmJ6uc1NNLTHcQ6?=
 =?us-ascii?Q?tsZkfcNc6VmuSSYuxwmjpVal8Corm3GAMGyJKCVVpXTJuqAu5C1ZfPmo7h60?=
 =?us-ascii?Q?TJZZc4FwJp8zbFnm8r7Ar740O6cvcKlwCZz98mbE9wKtmg6JD/zNXzt4zQrz?=
 =?us-ascii?Q?NAN1Ul7QKGx+O+FCb2p2m4JAMRsLr/lWv0u7Amx4dujC0OGhNx+t5I9nWHOt?=
 =?us-ascii?Q?EnQAQjw/7KA0Zx6qtz1bX676Is6Bkg8eGyw0qiCewp6CpA4eXLsAqDffsMkg?=
 =?us-ascii?Q?zTe6vSPHJ1FWzDsNmbJKKZMEZumeNufQRfXpDcJmPtWT0Tk2XcIY4OWJ8q51?=
 =?us-ascii?Q?/csGiLUSnBUTeBCBmJFrAfikNyHvOIRKbyTwb9Z3OsrEXvzAzck8UChS+kFk?=
 =?us-ascii?Q?rwBfrBc4hEumxTdb1mrAsij1/DGnihQSMnXDYjDuPmT2dnd4wycqYigesocz?=
 =?us-ascii?Q?mdUERuoSLBH8F9fOmjTAlZLS56bRRlQhbQ+EUVYTliYRa5HSicgf8w3XwxHL?=
 =?us-ascii?Q?HVmiQUfJzuOd/uE4T06/2aNKrscAENR6dnwDS3N7jl4A92+9u3DjhrqSDqQJ?=
 =?us-ascii?Q?A4+wBM/qSw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	dtIC7MNuPW8ySMQA6QuHCLSSAi4nqvcLg88QpvH2pVMebNGy/xaPLFx6ylvNpe29QHKUI4ykwLQRxklQbuIR5YrB191nxWAj5Nfy6EWnN9n6NTv79sxIdJWU1whDSEqkU/0yAhqbLsaxgfm2tSIYRg7csfrCuI0WSGyGTnTyGYRfT0KcEZQLfBglWbSGLJZsA69F0BNlhVFHLVqcUpVaQPAeGLD8A95P06PHty9aHy6RotxTDHi+4iucc6VDrwx8iS9dOo/jD8d5aHIbDN3Pk+kvtvpDO2GdaWZCCtlHpmMKImsEjeknRR3jnkIbZB4O4n0OSlyM7PV4QbEHOrZy7Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b6f4f8-600b-41a2-d176-08de98ec7993
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 23:37:35.2111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVhSzXmxFS/BD86Z5LBKOHUdBXMmC59rPWjKDi+ywqWwYjvPRKzVqRXCL4Isaz9fWuuVZShasgM3DH3jun4dfmIy7zxThus8iroU0uhu4DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB8019
X-Authority-Analysis: v=2.4 cv=LaUMLDfi c=1 sm=1 tr=0 ts=69dc2cc2 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=UAnEw0_ee4FPkflazw0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 0_NIO1rEPxLZAUUpsVDGSKmATKgdKnwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDIzMyBTYWx0ZWRfX1kKm8QFR6Jw6
 dALU9p6ICPAV6Y6+WWaH0aezPmIHP5nxzb4kS+NxydOtwnSLeiWlVrNCzYafPP7eDrYpnzuDMBc
 E02O8jg3MPKrxzcsVt5Xg+dN+d7Gg8ZR4DuQLm/I4kyS1iMMqJJ0Ehgiq5yqUa6/3EX7TG0sIJ9
 3Z8knet+gX7HheuJ768R9/U/gEV5lPlnwhrtEU/ufnZaVmwp2exvC4o7Qvoq7BIqboM8y2FnHEZ
 INU1Qs04dFV1uXu9Sug54kjEgVLl3M/GlTMC3PdVVw9ndIK21eq6y/+LPI3Pwesc5EpcYGFrPO5
 wRibRQ5w0Q+E6+eusy+qHkmWJZZVK8gUKrCfMQHVpRMs16Bt9UOvWTGBr6ePDw4pnRTM6p7lUih
 PaCVvUlYzI962lztyIuXVeDuJZvvQil46yqnxO+25J9Bc7Zc7Mw6VRs+FUys5LDlkm0t9Ggz3vS
 sfi/BIPY23I+S9H/42Q==
X-Proofpoint-GUID: 0_NIO1rEPxLZAUUpsVDGSKmATKgdKnwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120233
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7701-lists,linux-leds=lfdr.de];
	R_DKIM_ALLOW(0.00)[analog.com:s=DKIM];
	DBL_BLOCKED_OPENRESOLVER(0.00)[BN8PR03MB4977.namprd03.prod.outlook.com:mid,1b:email,analog.com:dkim,analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0-6:email];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[analog.com,quarantine];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FROM_NEQ_ENVFROM(0.00)[Jancarlo.Roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.563];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D12D83E66B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

Thank you again for the review.=20

For clarification,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, April 7, 2026 2:58 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v3 2/2] dt-bindings: leds: Document LTC3208 Multidisp=
lay
> LED Driver
>=20
> [External]
>=20
> On Mon, Apr 06, 2026 at 03:17:06PM +0800, Jan Carlo Roleda wrote:
> > Add Documentation for LTC3208 Multidisplay LED Driver.
> >
> > Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > ---
>=20
> Still incorrect order.
>=20
> ...
>=20
> > +
> > +      led-controller@1b {
> > +        compatible =3D "adi,ltc3208";
> > +        reg =3D <0x1b>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        adi,disable-camhl-pin;
> > +        adi,cfg-enrgbs-pin;
> > +        adi,disable-rgb-aux4-dropout;
> > +
> > +        led@0 {
> > +          reg =3D <0>;
>=20
> I still expect this to be complete, so at least function and color.
>=20
> Best regards,
> Krzysztof

Are you referring here to keep the led@0-6,
but instead of only the reg I should include other LED properties (i.e. fun=
ction and color)?
If so, I will add them as such in the next patch.

Do let me know if this is correct.

Regards,
Carlo


