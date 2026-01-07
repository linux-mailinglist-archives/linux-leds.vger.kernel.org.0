Return-Path: <linux-leds+bounces-6542-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D70BCCFD002
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 10:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE07A3053292
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 09:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D903932D0C6;
	Wed,  7 Jan 2026 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="wA9+igRL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E375322C97;
	Wed,  7 Jan 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779564; cv=fail; b=C9sBYasgRKnvv8DqJzb9FodXCv0XcDO5gfbP9XVw07IZhTvus9Yu/SaktXYpROCvAJ1aGZXVGdGSGkuuoc2uYfel8VwxWRusnWqVrbjv+aI+Zmqcrw/dFo+/zi4KRdbu3b3592Q/vDUubklvyplPAYcwhZ9xerAxd1eZys3r9mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779564; c=relaxed/simple;
	bh=eldYFGp9wtz8YHhLB2NPw+8njsVt4kVINnD3gBBMg6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FXWWXQ5NgVosk6t23FCjE6Fnn8LobnTDrwi+EoI/JHS3NQqegfCyx4df6/zRai0SSVibeB3jbKvgzp6bQggJsXNE9QEG7p4EO2d/yiWHFLgvjs8eT3TEHHUuwVMA7uzyvGu0INJwKg5CYLCAO5l4MMVMJFGNggUEWmWf6QSW9W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=wA9+igRL; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078N44o3431434;
	Wed, 7 Jan 2026 04:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RvR6C
	D2lfpZaCa/ToAA4FqoM4HGuNml/0fTA7x474uc=; b=wA9+igRLGj9cFzlE+NbFd
	7CGaG705yTurLUDbyy/FTQghWWdTKBHIwFDrgFYnUVCGfvhMYlJY8v9m0kqfxG4Y
	JQ4Tc9QR2XQeWwaQeXlkKDzNoXn3QLlvmhNKL3/Me5MEaIzfBDlcOrbq0ggAGf6X
	5SJhk9W1GaEapuUQLu6HaXdVeALk/BHWMQVqKL+aQRr2AAnrqyvGsgQ0hf7yO7CZ
	tjYau6g713jLdixwD5bHj3VsaG4HrQDIxzUSxz9gTW8Yux4s6GV1DoggA9idZzgU
	eydmEKyw9h/GlboAtNjg0gAd6R29MYMQSmStzmqc4i7i77Kj4qPHjmqzJZaU8ZYD
	g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bhgcghksj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 04:52:27 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/E58oMncp6cGjh8zPGqZtjp633Z7AQywHed7FAMVEPVhE19StaxUWdpvZ3BTbIRHIYVcenllWU3IP53KYn2Fr3/X2aKP/cToRM9xAkZVEYN/Ukx1fwsBBRbHLQZTfGs9cTZ+YWxg/JJRSpFG9jJxutErz5k7CH3X2QqCRn51rUx6QrSf8EBxHQDi8YnOO66gd9f1OIjO+UowYoV3PZ2GrhHzq55Cg/ketR2aQAhjO/moxtiYYs0YyqdDgoBpwW8xBr7GMwvxMCE+iyQ03paBFs7q4dgi8LtuOBi5ipbn0uYKwzauYKxARYLdhk+y3ryMPkZxz7z1YecWdJMYkWdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvR6CD2lfpZaCa/ToAA4FqoM4HGuNml/0fTA7x474uc=;
 b=SnL6N1ku11YLb82eLR/AQshkna6GXpRorqEa8OECbUucozkUzi9nrF6kex9Q2KJosQ2kkrHkgouNMwORcrJgVD3Jix44kC46JSHEqcNCFykltdMSh3vjpMoXtzSyPPRW0XNR7w251OYpolwEiOgGnacQ2AXbkpa+bNUCrkkYfJ/YSgCLn62Fo4RFv1j/Jw1ZejrJIL5+z7pi+0/0QC1A7N7tjDMXRCzA61jZCOxJImnGltvzas/8xeapGXmciSQoVHrVPi0r3/Ym67mSpkK16MnjsVrgMkc5hgVQ1HQrRqnM2jasDMcghpVOzY9kOwiRpwyASwVRUdV1vJQ974UfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by CO1PR03MB5891.namprd03.prod.outlook.com (2603:10b6:303:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:52:25 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:52:25 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] leds: ltc3220: add driver
Thread-Topic: [PATCH 2/2] leds: ltc3220: add driver
Thread-Index: AQHcfs0um784cUmyDUy+GG4zFv+JibVEy0yAgAGdRgA=
Date: Wed, 7 Jan 2026 09:52:25 +0000
Message-ID:
 <PH0PR03MB6525FDC2D62DBBB57CB99905ED84A@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
 <20260106-ltc3220-driver-v1-2-73601d6f1649@analog.com>
 <20260106-opalescent-wildcat-from-venus-feffa7@quoll>
In-Reply-To: <20260106-opalescent-wildcat-from-venus-feffa7@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|CO1PR03MB5891:EE_
x-ms-office365-filtering-correlation-id: e2a84da2-044d-44c4-c963-08de4dd27637
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?u/MVnVpCHHPGT3kQ183DzaaWt5iPET5sSvKgrPit9eSB6RkyR/FzKSz9hRVf?=
 =?us-ascii?Q?W83XmBu2sBgGTLR1/db8BWl308pzBoAsLRN/aiymCdC62vJ9YN6T7nuhq3SP?=
 =?us-ascii?Q?1QgwD9tSToJdMUCJZcBx9UaOAckOaEWSc89gz//Xc3HAJQOhVQWqJo7iuKFC?=
 =?us-ascii?Q?evCwyCselZS9st5yxYWmlQBOG3iFgEpIk4lJwzXCVXWyUOPTXR/eEPQat5/e?=
 =?us-ascii?Q?c+ZqawsQKHbkClHQ8mwvQZnHzJka71HhRDRKeagLuihHUcGCD0tLoYZIiuIE?=
 =?us-ascii?Q?vRv4VuWxCF8FuVr8JprAPl7g9YhjMB7jVuk4bMG6jjEOrZ9xCaUfyhzKc7lE?=
 =?us-ascii?Q?fw4rYs8E70VmEuKgF/vvHIJwPYWXTPi9qgav5Zhk2KO7AGz2adG3QmOUDDAG?=
 =?us-ascii?Q?qUoHKVuJVX/0WlsTzW9FlOyMfpq8n1IZHojA7WVp4PMhYLu08Ym41oCWFroU?=
 =?us-ascii?Q?gao/zfUgKr/nFYM+TA+qSebff5iFfPkWmqqi+yuR0QEehaFztZkxV+f3mgkF?=
 =?us-ascii?Q?2hxDySGmyikdSO/tSE9b2IZG3wcZXtOhSDH8crAelEkZugZs4Q6f5kL5ZCbi?=
 =?us-ascii?Q?tpchiNXPHfl0CGqKolLkqFzTODbkhyzvGdwd4MtaasBCH7I+it1ygYPEKb6r?=
 =?us-ascii?Q?boLc9bz1NrC7G+LbDEPeIBhJeIJMP2WwWPDpaKsGZfQyqjIBLp/M2dz1Oax0?=
 =?us-ascii?Q?sM4qDG5uxY9cpCsEXf5jaZbL1TYUT7xHBtG10vN26P/fw1XYWoA3eRIBO7FE?=
 =?us-ascii?Q?3cmLnEVFQMPsWLcysxnW9sReyBH4UXI3eQpKZGRFgCepMGpwhVjZ2vlItZ7q?=
 =?us-ascii?Q?K5ZoieotMu+0j7AuRBVA+4qEbZV3/QiYJeB5221Fvsahn4Hg+KXe5MpuojP4?=
 =?us-ascii?Q?7vTcQxggEcR7qWKihpuNkxt276nddd19vd/mAzmkNyjrooJGm379YbxODqvG?=
 =?us-ascii?Q?XBvsRtEgYVtScHQfDnyr7oTSjqRZP7+xrSvoHH6XQ5na3UpgjrcHR1S35PUI?=
 =?us-ascii?Q?EBSVIVjHlTq6JF8IF57PDEd9l61oF1MDOgc5dH608E0iMjYZkz9vA6E3+W6z?=
 =?us-ascii?Q?s+ERDUi+109V2iO+cr8sJQly57SafSS1Q3wsMYNmnC6apgs/wgM8kxqA1eOp?=
 =?us-ascii?Q?sRXbbs8JKBh7BhShuCFr8vxyu6Sl8W9J3NAX1pfXu7Be6uclvuHpjnk8h9Qu?=
 =?us-ascii?Q?HpATcSvscHXsilvMd+X3LTMe/gSntNVfCuvS1Gzpk1mA3ESpWYPX3Tiie1il?=
 =?us-ascii?Q?/NJoRQ53X8rfNJN2I8PBLpkFXI9ooKO+Tc5iuB6s3C3tbAmlPfLwEsfLdxce?=
 =?us-ascii?Q?7wTPOCzEBq+Cc2KlYgDWIscVFTWTmXeJu/hpaiQUP06S6oVpOOxIDo80txUn?=
 =?us-ascii?Q?F7w3rhb60AEebjE4D/uV0ylvG9L8dzSeoOuOLdrMlvMAGpg6Ei6gRdUFL2/d?=
 =?us-ascii?Q?BMl44ft0+JylpZzrJgEQQBEWp83IzbJnshZBq+IN2Uryiop8kxswLYt3ukHl?=
 =?us-ascii?Q?eoSZv66zzXj0UmOs5DPXYZUCrFY8PYS8qNi5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lOTKQNsFAAPRGZaJpHyHKZHyCN0Vy7Mq+vxFh/86tHU20XcOuqYuFFXFSH4G?=
 =?us-ascii?Q?CyzjdZSVPmy/hi6I7o1Z8hVALygh4dZXOWe7LrwwEdYkoMec2vfrnqtOwBu8?=
 =?us-ascii?Q?TOzXwPX1F7NZdsS7nzawtygwqPQ+JREdME9aY6TXmZ/DjBCkJmpLjwTYn1Vx?=
 =?us-ascii?Q?vhOBgepGztEq3pj7MsU2/fjvspqSKBpitHj+Fz33lm89r+ZN0D0fjMDoKeUG?=
 =?us-ascii?Q?Zm7Sh5nqtVLAqGYwl4rA1CfO4+ibfcaCjFX1NYbDy4icX/fozImE+UXoj1cG?=
 =?us-ascii?Q?JzOm6MKo/Zaa3ZWSzCscGRALqskeJRsKWnEV7k7Zuw2aMe/ZGxECec0YvA5j?=
 =?us-ascii?Q?571bdNuXTipVLYcsfI25K+118UDD1Z7WG9DE+J5fw3VFbY9zkO0mUeAfbxIS?=
 =?us-ascii?Q?aFSomhLgl+kpJf8IS/MsLN4NKaDZpReS1w6X3Ra7+RFdobV4PWRPqoMV7foq?=
 =?us-ascii?Q?1zrZNCtcqUeJ0lwwbw2AfF37SRgRGDqYySVqhip1awQDxoQv7VBJPLm7T6Ge?=
 =?us-ascii?Q?SQBfCJ4rU8WInS2542Np8RhIxZckSUCr+9zYcXaaKSm8UB4ZmcBGFBgU7WEg?=
 =?us-ascii?Q?MnQx2zVHntkhE3ZVO+ZmJGaZij6bRC+xMC47o1PZVKcRqJh/xzq9PpjFw4t+?=
 =?us-ascii?Q?gBUWb8BSbieH4iPQZD/hP19Od43iu06mODYerbazBWmnR+234JbNpUXNj/tb?=
 =?us-ascii?Q?HSB3IrgWXGLs0GntnIjEU4hLjFb4px+lkiHbtDMZ25KrnoDn8dVwZkc/fDRZ?=
 =?us-ascii?Q?Z1+UPlwyVkAgITFj5iiQwksCb0ddM7uZY1AqJWdMO4pxaiG62ANVJSIiFwYW?=
 =?us-ascii?Q?1H7s0xYpiM7NDUTD3ZGAJ0WiTy/PuQqCEMReLDCN2xttWf/JA0RpSCuA2sTD?=
 =?us-ascii?Q?R6kPOC+rrwSFAWVkT33fRWqVcSGWErVbKLx9Ka0BUBmP3cMxEeTwtPqDfufV?=
 =?us-ascii?Q?9WKmO0gKGYutOwpIeWYTe/rkrBHvgW/qxQHurDpqjoX0JqsIOjfQc26hMiLR?=
 =?us-ascii?Q?eNXNB3Bic4/Nsu3SDfS+9gGzhqBSXlrYNhrDKHnzn1Hy2vyLewvKZyObYWAI?=
 =?us-ascii?Q?xgNx1yXJYwccuitcETO1gaTLtjNEm25Pg+65fswQDeFYz0yvZ9AwOC79RJkl?=
 =?us-ascii?Q?82iexWGgfa+wgAuGPohJmsU+MoBPaSBvmjeRRMw3eyj5A91KzUp9f2glv+qT?=
 =?us-ascii?Q?pC+0kiRpo1kYrJea+C9sJnL8h+RuV5rV7Y64r9CFnY70NQtGinQiL/Jk/KXx?=
 =?us-ascii?Q?f4jNRwqr3UHXH5jD22TYv+UZBt2izxcCANE1NoyMnu7FL9U/Ga8lTcgueDrw?=
 =?us-ascii?Q?dDegQGl++rbMR2MSCox8UQz7V+gAO/5nPuwdBilC+ej50pryWRaiaaYpMrHU?=
 =?us-ascii?Q?0Ew34oXoWoVfjrDhcGGArUJEPFLa/vW3cIf8fTNOPxG3y4myhJU3CkiY9C+v?=
 =?us-ascii?Q?b7/S3TfrDyCwrGUvuAnI2f9j37veAPP66RouKS4tWVOB0p4qbVFVJTBj6jOM?=
 =?us-ascii?Q?jKkSHduPwjUbmwoB4nankEQDvbjVPQ9mZW26UQuXVCzLa0dGi93kt5NEydnD?=
 =?us-ascii?Q?WeA1k7TgsRnIyqQM+4VQ75d7ZMMnMY/NASODoexyNu5SM6WqqMJX7jdUcmYT?=
 =?us-ascii?Q?KQXrvuYVAtene2jVMYTqiZK+LyX5sMhfTLl13fKCezrbZdMwpSbx5eTnNzOt?=
 =?us-ascii?Q?NU6l/y9ycNzJHMuLW+eHSeWYdXzrPSNYWrbPEypBP1oRufsba4jebU5fLh/J?=
 =?us-ascii?Q?CDfm6Ua8Ng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6525.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a84da2-044d-44c4-c963-08de4dd27637
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 09:52:25.4615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/eoZka0ueQW8lGKMSYHo+eAIx8Ic6OhUJ9BMpbKAOlDZScQufDi07GN5gKnZoxBs4CBMzZMQLGsWZESBN1n9oNZ+XtCHj2y8Eu67YJZ9kQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5891
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3OSBTYWx0ZWRfX51/S6NfHS1OR
 CfrgijgBvKe0KYbENL2lGhQY48SUb6HiwWQ5Gc7b/1YyJrQzRMcZM1U0O4aC0RiS8rXNrHjcCpp
 qxsRvP3J5InxUosq6bnHjWsmYdBLAe+KtM1jP7ZITlUmNa8y9Dxwnw1yimPHLMzA+k0cckGYdST
 PnIfD0qQep7m87f0Xk2XMejI1WFQkZeypts2SuP0Ek4I+j6Alq8y/u8WN+KJJ2aAJ55MB/PXXG3
 fueVjFgmJeVjrXcwJfP3AnAlqVxLhF28sFmAgqJvhBuZK3h5yjE6V+hhUtA9k/JL6x8AHIaYPQm
 a2rC215jhWwazBlgcTO5LkzFt4U38nL/JzkRBlwu59iJuapZlD2vo7sDg8gzkL1CnuJpMKkgXhe
 b/GpahrCpN+Mjrdha4RmOkhxhSSZZNehKymj8++6UvRTrs4rgO67RtVxop/GGTojOJgTcZATSpO
 hMpu861WMDlEvquIU+w==
X-Proofpoint-ORIG-GUID: Ha4PLfy9fziLsPcbt-dtmClvlyANWVYU
X-Authority-Analysis: v=2.4 cv=VsYuwu2n c=1 sm=1 tr=0 ts=695e2cdc cx=c_pps
 a=O51v7cnaqDfW0jhhC8GRpA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jOvDkuRAWYEksfijxOAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Ha4PLfy9fziLsPcbt-dtmClvlyANWVYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070079

> On Tue, Jan 06, 2026 at 01:27:08PM +0800, Edelweise Escala wrote:
> > +
> > +static int ltc3220_probe(struct i2c_client *client) {
> > +	struct ltc3220_state *ltc3220_state;
> > +	u8 i =3D 0;
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter,
> > +			I2C_FUNC_SMBUS_BYTE_DATA))
>=20
> Odd wrapping.

I will fix the wrapping.

> > +		return dev_err_probe(&client->dev, -EIO,
> > +				     "SMBUS Byte Data not Supported\n");
> > +
> > +	ltc3220_state =3D devm_kzalloc(&client->dev, sizeof(*ltc3220_state),
> GFP_KERNEL);
> > +	if (!ltc3220_state)
> > +		return -ENOMEM;
> > +
> > +	ltc3220_state->client =3D client;
> > +	i2c_set_clientdata(client, ltc3220_state);
> > +
> > +	if (device_property_read_bool(&client->dev, "adi,quick-write"))
> > +		ltc3220_state->command_cfg.quick_write =3D true;
> > +
> > +	ret =3D ltc3220_reset(ltc3220_state, client);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "Failed to reset device\n");
>=20
> Your code is not really readable.

Do you mean the text wrapping? I will fix it.

> > +
> > +	ret =3D device_property_match_property_string(&client->dev,
> "adi,force-cpo-level",
> > +					   ltc3220_cpo_levels,
> ARRAY_SIZE(ltc3220_cpo_levels));
> > +	if (ret >=3D 0)
> > +		ltc3220_state->command_cfg.force_cpo_level =3D ret;
> > +
> > +	ret =3D ltc3220_set_command(ltc3220_state);
> > +	if (ret < 0)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "Failed to set command\n");
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct led_init_data init_data =3D {};
> > +		struct ltc3220_uled_cfg *led;
> > +		u32 source;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &source);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Couldn't read LED address\n");
> > +
> > +		if (!source || source > LTC3220_NUM_LEDS)
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "LED address out of range\n");
> > +
> > +		init_data.fwnode =3D child;
> > +		init_data.devicename =3D "ltc3220";
> > +		init_data.devname_mandatory =3D true;
> > +
> > +		/* LED node reg/index/address goes from 1 to 18 */
> > +		i =3D source - 1;
> > +		led =3D &ltc3220_state->uled_cfg[i];
> > +		led->led_index =3D i;
> > +		led->reg_value =3D 0;
> > +		led->ltc3220_state =3D ltc3220_state;
> > +		led->led_cdev.brightness_set_blocking =3D
> ltc3220_set_led_data;
> > +		led->led_cdev.brightness_get =3D ltc3220_get_led_data;
> > +		led->led_cdev.max_brightness =3D 255;
> > +		led->led_cdev.blink_set =3D ltc3220_blink_set;
> > +		led->led_cdev.pattern_set =3D ltc3220_pattern_set;
> > +		led->led_cdev.pattern_clear =3D ltc3220_pattern_clear;
> > +
> > +		ret =3D devm_led_classdev_register_ext(&client->dev,
> > +						      &led->led_cdev,
> > +						      &init_data);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Failed to register LED class
> device\n");
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc3220_of_match[] =3D {
> > +	{ .compatible =3D "adi,ltc3220", },
> > +	{ .compatible =3D "adi,ltc3220-1", },
>=20
> Why do you have this "-1"? Even if this was a real hardware, devices are
> clearly compatible based on above.
>=20

I wil drop the -1

Best Regards,
Edelweise Escala

