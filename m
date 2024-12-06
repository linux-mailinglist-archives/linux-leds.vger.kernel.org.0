Return-Path: <linux-leds+bounces-3514-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7A89E7B08
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 22:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 162C016653A
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 21:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E9B22C6E5;
	Fri,  6 Dec 2024 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="H79WklEs"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B04922C6D3;
	Fri,  6 Dec 2024 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520534; cv=fail; b=coBk2D/b6yMncsr/lyHdIdTo945J1mgjGfoKdnqouf1loxwhdnfk2SgunLIxcnDlnWBNwC/ekGxK0f7GEga4mXy2olN12NUzlj4HVB70J/UfJ7RZCr6vxPruRIZ3kLBS0oWBpGTuRnj9cU5oD4V7J4RD4E7D5w+zJ1YQuYC9SiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520534; c=relaxed/simple;
	bh=fydG+Da3Oa6ddOEtfMXHqtGeLXtf0dGHEKfVC5HxN/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QVF8KJgQubTTyVfrKmmk5CPLNQCwl5AQXFvXtWj6Q3byEnoBU+yCcs77vGV/A+oltd0JYK38J5gifD8vB9E6HVySei1N6H+5qKi0p7EnYaeK5v46w8vZseSskX4SWvQ6BT8KQBMgXIsXhhE/jaBvWL67VnFpzBmfaS6VQPZbW2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=H79WklEs; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R55dCIZTDS13KIyeqBDEboDk3cxE+ZqSSlG32VlkYNrgYdOQWahrxYuIde4XUOyC6xjX/jNM9Hpkeic7SKcBOEm3fkuvw6cyD0Yoo6riBGZYeaAsIgYL/Vl9mGmP+Zy6XpPfTSLY/Qo7e2+KxG64Jd2cFAjX9Tb53Zixz45Tdf2SqYKovPrPtlVNR+Qz+luJv+SjHDnB0APmH9Vx++i+NvCiO/h/VPqUOmvSAl0S6dy+IcExD23tbFy9Mi1Eu0Y0gD8Zdn/Qb5aIdZXVntTNL38q5N0SO51ecaVG0hHlgcsy4SUBQTyRwOJVqzrYNINyvb6lcgvngt4cLkaKvyRHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fydG+Da3Oa6ddOEtfMXHqtGeLXtf0dGHEKfVC5HxN/E=;
 b=b1Q1E19KBGy3Vujh04XxnqJm3wwOkSWYAdTJA7/nqa0XvOfRKHKPQCfZwcg875fjPpaPQm1XSy0VckyxKkCTdXHin9STe3Ixz9KfE5zD8PoNFKgllWJioVMY+IJ9VkclzlSxaEIccR6wMx29NXc6OTxv0T0vGlyi2PcNLa3hZcu3g/KNpPdBYmTq2iVVIRjNPZhXf5C3akRGvP4ywtcegzgyeGtwdo+iMl8JozeQjA9av0KQ7O8xc5i2BmGQQTEAMk3SEvwpqbX86WysTM7N/GXLLq+SmtRO2wVP4DpnbU4QIMsbQMIqqlzVfpVUIpdNOgsZKPBB0r/oLHphkgcw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fydG+Da3Oa6ddOEtfMXHqtGeLXtf0dGHEKfVC5HxN/E=;
 b=H79WklEs1/9cDTwof1I0wL6v04jN0FJwl2lw3TB/Wx798cktAZfFsppsu1eFXcUQiS3FJIsu7w6ZIEc+eesAbG2bjWy7O+YAK03LH3xylg9Gw2M9EuZQ6dDM1EEVdxgNsrky7Lr1IAG0V0GHe90FtEBkr9Oxpkj9tOf7nwnqru8az7KXab0mg9QCOyB8bTvlJMkLs7V7qPB7SE8jhRFx/a06xfZz0tIOIX3C4OzUvClN3cXI1SGu8rSUXFjPSKPX1JvpKx639MwU0mw7qNdo/+D5uvT5P8ugQbCnl3TEqxHbtTHQxczWtaijdQrTaqhTzLnMWS5t6nzEdz+qUfsRAA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS4PR10MB5394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.9; Fri, 6 Dec
 2024 21:28:49 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%6]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 21:28:49 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dmurphy@ti.com"
	<dmurphy@ti.com>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "afd@ti.com" <afd@ti.com>,
	"lee@kernel.org" <lee@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"danielt@kernel.org" <danielt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] leds: TI LP8864/LP8866 support
Thread-Topic: [PATCH v2 0/2] leds: TI LP8864/LP8866 support
Thread-Index: AQHbSCVrrUWv5n8pBE6ssEBfeyTSkrLZu2EA
Date: Fri, 6 Dec 2024 21:28:49 +0000
Message-ID: <b92f308ee20b8046b73aae2ef029f8dc238f3827.camel@siemens.com>
References: <20241206212421.1132578-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20241206212421.1132578-1-alexander.sverdlin@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS4PR10MB5394:EE_
x-ms-office365-filtering-correlation-id: 8297b835-5af3-474e-fa42-08dd163cf96e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3FxNlJsRUJwVXdhNDlnN21aOUpwT0hhYloxVHc5ekxMTWZlNDlESm0wYjYr?=
 =?utf-8?B?NXZOQjlsQlRSMEMrWDdYUW1vTGpLN3dacFBUQkJxajEvblVzSEp3cWFRa1Qy?=
 =?utf-8?B?bUdDemVyQkJyL2R4MTJsemNvN3YyWHUwOTJzeTBYWHJreEZLT3Zmc3hNUzZ2?=
 =?utf-8?B?MXphdGlXOEJhVlZqNTAvSXhkc0NsRVZhR0VOOHlpcjBGbHRGekVqdDhsOVhT?=
 =?utf-8?B?dEU3M0c5RG83aWU4QTV6Tm85OWFJVDlsRko0bjEzT3Q5TE5jTkdDc1N5aFZL?=
 =?utf-8?B?TWl3dUd2YmcxZS9IdG9uemN3K0JuT1AwUzZ1UW9LTForS0UvUXdnQWNqanN4?=
 =?utf-8?B?dXIvbW1OMEkyU3RBdTl0RVRBMnhGTzhMYm4ycHU3MXF3cS9iT1dGbDdTNDNP?=
 =?utf-8?B?UVNSelFUWGM3ajdaTmVmWCtSckdSWkNBU09uM2F4M3Y4NjBwY0tmUEt3WUJo?=
 =?utf-8?B?QWFtYndkQjE2eUZnRTFLRW54NFFEWW0vUWpBRjV6VFFlbk90N2gzMFczSEt2?=
 =?utf-8?B?bU1nQUN5aXh5aEJlN21tVWJoZWk1QUh5UWZBNWpyNGVZUm5URm9DdFlBY0Jk?=
 =?utf-8?B?Sy85dmlUVjk2TENYcUhSWTBVTnVLZWdmRDIvbXB3dko0WnJmNE45RC83Tjhu?=
 =?utf-8?B?U0dFbnV4ZEhzcmtRZ3ByTmNaSXNtVm9RbjY5bTZkYVQ1SXprcWdaTjFEK3Fs?=
 =?utf-8?B?cHRhcHZmM1duekUvVkYrZmhUQlI1M0xIQ3pnMDY0SjM2RkpZZ24wYjBzT0lu?=
 =?utf-8?B?NUM2VVRXNmFkUnp0RlFFOWJITEQ3cmRmOHFQUmpHejFvdU9oZnJCVTZmb3ZY?=
 =?utf-8?B?ZlZOUTJRZmx0WVczd0NFMFl5RFF4dFh2QkVsc296KzJUREREOVNUNWxpV0gv?=
 =?utf-8?B?ZlFxMUNyL0FneHZ3d3hpSy8vaGQ4OVZ3dVJXbHFUcGt3andaekNlNUdZMytU?=
 =?utf-8?B?YU1vZmNSUVZiMlhZanRnRHl2K1FQMXkraE5QMUc4cXllT2JmNkM5SjZlWmFr?=
 =?utf-8?B?VG1obEdzZm0wdVpqcGIzU1FRSllsODBsUTlUMjlZRzEwRVc3dFhYWklESENa?=
 =?utf-8?B?STFMZnNNWHJqMTBXU2UzbFkwMkhtZFgyTU5wZmJPbWxUVFU5c1JuZWNHek9y?=
 =?utf-8?B?d25ReWw4OW9TbzFWcXk2cmxyVUd0ZkYxNGFsdVFXSnpxYmVKRVRBOEwyd09M?=
 =?utf-8?B?MzRZY1hHLzIrSnVIayt4R2ZSV2lJSW1IUDRtMlNrT3ppNmt4VmhYZFNqQ3pr?=
 =?utf-8?B?TG9uc3JvZlZ5OVpudnlvbWhMaGtDalpGb0E1c3JGcFBOeTBoUUp1Nk8zSUVO?=
 =?utf-8?B?aW1hWDNJaHU2azJ6Zy9WQkkxKzVhaDFkRGQ4K1Vkc3drV0xvNG1IbW9FVFM0?=
 =?utf-8?B?eTJnU1Y4ZFQ2aGx4eUtOaGtPRUhPYUQ3WVBlWEZjMXllWCs2L01TN0NrV1FW?=
 =?utf-8?B?UTR0MU5HcS94ek56emJVZzRncmV6bGpRODlneFJxSGpkZHFDK2ZJQ1lVQ3J0?=
 =?utf-8?B?V2RlR29UMXVqRHVydXpXMllKbFk5OHVNRnR6OENKaUhlaUNPdEsxWDBpRVli?=
 =?utf-8?B?SDJJK3gvaXdZTzVDTWFTdUVoT2t3ZDgvcXg4ZjRhSGdCMGo2Um1MOEk5M3pY?=
 =?utf-8?B?enhqMHVNZFJlT0NPSGxNSFpJR0Y5ektuZVpRcXlTUjFaQ2llT1dSTUZQOUtw?=
 =?utf-8?B?TTdwMERhTWhKeWc4VWR4U3J0TGJ5OGhQa2k1enJ6MzBMV0hHU3ErdVRkUllh?=
 =?utf-8?B?QkphVkRGZVhQOHpVR3F3eTRGSDVqeEFTZDE3cGlzM3YxRGlPdDltb3RqWE1X?=
 =?utf-8?Q?T8ppl+q10wZ1ZB03FEqg9C4roeNQwfWAA7gNo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmZscTBpcERuNTZQUlFyTmlRdlk3YjNMTXMvaVREWDMwcDNZQVlaNDJ0UzZE?=
 =?utf-8?B?RkpSYTJ6akROMTB1azQrTXR0TkRuUHA5dCtSNmY2M2xKcFpwSnBwRVgzTlQr?=
 =?utf-8?B?MXRUNmZPcDJGN2pjcEJIRDI2M2JjN3JDUEtXNERqd1RzSFkvbGtsWFB2U2xs?=
 =?utf-8?B?TVFaTUFTN0tsNlhaZjFkNEdJRlBmL1FnMVdvTTh5eHJyWG42cXp1YVIveXZ4?=
 =?utf-8?B?UDArRjlrRlAxbDJTR3g1ekMyRkl2b3JSMTRVc2xGT1NwVzVpYzFYLzZtd0VC?=
 =?utf-8?B?YWlGZG16ZCttb3N1U04xUnEwNnFDeUczaU9sNm5udGhvbUU4eWxPbEZab2Rh?=
 =?utf-8?B?SEtxaDJDTm1FWXFBQngwMDN2M3UxVnVuU1d0L3NMWmY4YThEOHBSZXpvdXJH?=
 =?utf-8?B?TmdsZU9TUnhWY0s5dU5xeGJXRUNUV1U3RmFGS3RacUZORGx6NHlyZ2drbk8w?=
 =?utf-8?B?aHh3Kyt2OTEzdW1kc3NrWGt3b0tMcEY0QkREUkJIbkVFN3JCbExaTnhXdEJK?=
 =?utf-8?B?UzVvY3F2bERaRWVaZTVpc01yN3cyU2FvcFFaSGIyQWVhbEhOOGxlNFYzVmJK?=
 =?utf-8?B?aVBQNGNxSDlhMnQxcCtESWIvOWloK0Yvd1JZeUJ4RGlETll2cHhhWWp6TWVO?=
 =?utf-8?B?RSt2VWlHa0xvd0wxRHZDYlRLY0N1bnh5WG9IRUR1ZUlBVDk5ZzhPSW9JOEVB?=
 =?utf-8?B?TXhRMml4WUR1QWI4V2tBaXRrL2pEYmNZYWtRZFcvam5XOHh3YlF3Q09pN2pS?=
 =?utf-8?B?c1VzZmFzQjJnaElVMStDczhCekVNMm8rWkdRUk0raFdJVGdlcldncVk0dTdB?=
 =?utf-8?B?OUtaN2ZHV3Q3U1hmQlBPSGVvQkZCdG1vRFdzT2lJMHEzS3FuUURQMkJScHZH?=
 =?utf-8?B?bktUWHFrNm5Cd0hDa2RaR3VzRmhvMGUxUHhWT3E2bk1OWEhUTndIQVNXQVRK?=
 =?utf-8?B?NVhuRXRmaDVncnRrYnQwY1cvSUJQYmR1eVM4K1BzempzTFRNMEplR2wwOXhw?=
 =?utf-8?B?NFpBQmE3QkhuUUJmNUNqRm5POXVIZTVoaFBZQ3VtZlFoK000bldvTkFHdDJr?=
 =?utf-8?B?YUFvNjJCelFTa21SdFhIZjdsdElGUld3bWJJdzMxYVg5WUZwSTdjclZWaXpx?=
 =?utf-8?B?d1BWWkdHQ2xIaFIwUSsyUWlFM2o0UmpQdStINnIydC9CbnJlSURpT0V5U1pT?=
 =?utf-8?B?Ulp1OVBCVWZrVzd0L0tRZ0VJRGhCc09zbllaN2dMT0ZiSk1DbUFOTi9nZ0hR?=
 =?utf-8?B?ci9oSERUWWswTnJ1U1hRZjBZSytzSkNHNW5vTGVYWmp1U1JtbGJXZnE5cUZS?=
 =?utf-8?B?ZUV6bkhWTWV5TWdZRDVOTUYwMnpGU0FKZlZYNXBoWHc2UDh5aG96QlcwZ0dC?=
 =?utf-8?B?LzcwSno0cHkzbTRKWXV2czhkSmJNZW1DZ05nTzhOc3VibjZNdjJGbWRFTkdI?=
 =?utf-8?B?RHR0WjdsNGUwVVJkUmRhNEQ2NGN2ZzZJSGNQRzdicUUzRTJUTVhhUytUbHlk?=
 =?utf-8?B?c1lKL2xJNzA2NTlVd3d4LzZzSlMwT2xvbVcvNDVPcFVzemZzNk9ZRkJqcmxk?=
 =?utf-8?B?RzRzQ2toTzBqTzM1QkRLMmIxV0xPclg4d1h3WUJwcG1vQnEvK3I1QkpaQkIy?=
 =?utf-8?B?bnh5Z2xGR1ZpV0FBTFFwdDJ3MzAybFp1b3RHdW1MUThhUzZYN1V6Um90Ymhj?=
 =?utf-8?B?cENZWmFwZ1N0T1YxL2FhQ3djWGo1dENYY285MS96TmdGcjZvSEZQZnZraCs0?=
 =?utf-8?B?a3hiMTlVYVNPeVN3SEp6V3VQV2oyRjV4Y3lSMVFhbFRWa2JyY2ZlV2lUQ1ph?=
 =?utf-8?B?ZnY0SjB6NENLdTZnZm5UN2ltOTh2TlFLTFVWZ0p0REVielJHWk5tQ2hBV2Fo?=
 =?utf-8?B?N1dKSml2MUxYYW8rL243NkdXUDdNU01jbEtOK0lTNC9STFJ1SUN0Z0xMQlg4?=
 =?utf-8?B?ZEJpWXNRbkFqSGFSWVFNMm5iTzJjdzlpSHZmMXpDM0lCd2xYdDBGV3FjaTVN?=
 =?utf-8?B?dE04NDVJT1BwMmg5azF2OVpjUzJMaWIxaWRnRHN6blBLaUJEYWNpaTRBbjB1?=
 =?utf-8?B?alZZekhDR1dRT2lCWUJpYWtXUFJuelphc3VUZ2svVUc3eDd3Uy94MFYyL2RN?=
 =?utf-8?B?c3NCQjRKK2RNZnA1V3grUlZpUzFyOENWMWdPZUFJdk5MZ21rTWdqYkV4Qk4w?=
 =?utf-8?Q?ee1a2Fd4CA1A2TLksuui/Uk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F642420EDDFCF4EBD4D42BE35959154@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8297b835-5af3-474e-fa42-08dd163cf96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 21:28:49.5016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KORQtjWIXJ8TrKMoAjAYZtWx8KVVCZVUzNwEHZq54106kPUkmdpxH18wBMwGa70Eop1oexbOCEFoNazeune/Mlsj/XHd3BX9GbwroVEOwrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5394

T24gRnJpLCAyMDI0LTEyLTA2IGF0IDIyOjI0ICswMTAwLCBBLiBTdmVyZGxpbiB3cm90ZToNCj4g
RnJvbTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+
DQo+IA0KPiBUaGUgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYSBmYW1pbHkgb2YgVGV4YXMgSW5z
dHJ1bWVudHMnIGF1dG9tb3RpdmUNCj4gaGlnaC1lZmZpY2llbmN5IExFRCBkcml2ZXJzIHdpdGgg
Ym9vc3QgY29udHJvbGxlci4gVGhlIGZvdXIgb3Igc2l4DQo+IGhpZ2gtcHJlY2lzaW9uIGN1cnJl
bnQgc2lua3Mgc3VwcG9ydCBwaGFzZSBzaGlmdGluZyB0aGF0IGlzIGF1dG9tYXRpY2FsbHkNCj4g
YWRqdXN0ZWQgYmFzZWQgb24gdGhlIG51bWJlciBvZiBjaGFubmVscyBpbiB1c2UuIExFRCBicmln
aHRuZXNzIGNhbiBiZQ0KPiBjb250cm9sbGVkIGdsb2JhbGx5IHRocm91Z2ggdGhlIEkyQyBpbnRl
cmZhY2Ugb3IgUFdNIGlucHV0Lg0KPiANCj4gQWRkIG5ldyBEVCBiaW5kaW5ncyBmb3IgdGksbHA4
ODY0IHRvIHN1cHBvcnQgYWxsIGZvdXIgc29mdHdhcmUtY29tcGF0aWJsZQ0KPiBkZXZpY2VzOg0K
PiAtIExQODg2NA0KPiAtIExQODg2NFMNCj4gLSBMUDg4NjYNCj4gLSBMUDg4NjZTDQo+IA0KPiBB
ZGQgbGVkcyBjbGFzcyBkcml2ZXIgZm9yIHRoZXNlIGRldmljZXMuDQoNClNvcnJ5LCBmb3Jnb3Qg
dGhlIGNoYW5nZXMgc2luY2UgdjE6IHRpLDg4NjAgaGFzIGJlZW4gZGVjb3VwbGVkIGZyb20gdGhp
cw0Kc2VyaWVzIGFuZCBjb252ZXJ0ZWQgdG8gWUFNTCBzZXBhcmF0ZWx5Lg0KDQo+IEFsZXhhbmRl
ciBTdmVyZGxpbiAoMik6DQo+IMKgIGR0LWJpbmRpbmdzOiBiYWNrbGlnaHQ6IGFkZCBUSSBMUDg4
NjQvTFA4ODY2IExFRC1iYWNrbGlnaHQgZHJpdmVycw0KPiDCoCBsZWRzOiBscDg4NjQ6IE5ldyBk
cml2ZXINCj4gDQo+IMKgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3RpLGxwODg2NC55YW1s
wqDCoMKgIHzCoCA4MCArKysrKw0KPiDCoE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyAr
DQo+IMKgZHJpdmVycy9sZWRzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKw0KPiDCoGRyaXZlcnMvbGVkcy9NYWtlZmlsZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsN
Cj4gwqBkcml2ZXJzL2xlZHMvbGVkcy1scDg4NjQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMzIwICsrKysrKysrKysrKysrKysrKw0KPiDCoDUgZmlsZXMgY2hhbmdl
ZCwgNDIwIGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3RpLGxwODg2NC55YW1sDQo+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbGVkcy9sZWRzLWxwODg2NC5jDQoNCi0tIA0KQWxl
eGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==

