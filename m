Return-Path: <linux-leds+bounces-6500-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F7CE908D
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 09:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC36B3002068
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 08:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD3F2DAFD2;
	Tue, 30 Dec 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="cfqSycMm"
X-Original-To: linux-leds@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011015.outbound.protection.outlook.com [52.103.1.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F203A1E6E;
	Tue, 30 Dec 2025 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083529; cv=fail; b=fuH5c2PjFU7YyRyK2glQ9SbABetJxf28LoYWnf/tUt4PqpY/X2Vm6RmGQ9PitI7/k6Jq35dQnwVVsaJPX3qvwACtqXSS+vXEOPu79NrOsQAKVmydjq6NRGpcSXQxdkUioX5g90AlsftzPqxszYVD2wqA18aDGVGUavyY+oLgmho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083529; c=relaxed/simple;
	bh=USWr0xhZhFhwAOeqyi42mIeYFVv7QNXd5U+rWNvjDz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M+StAf8bAAoh+gYik8ztHjswotaiWKsYimK/SYruEHJfhrt0k05/brORPVZ88q5m/e/sfagL5U1qZy/ToqV2mFsSndjSHU9xYlY4ulV6KVQPLv+lcxGw0xhH0sl4VpBKibVIWWYzvVfaqkumj4jz+/11toWggd1WfCm3EpBy/p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=cfqSycMm; arc=fail smtp.client-ip=52.103.1.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeYElUn/8ZlNHu7NOn17EhjfWi8gfeRJ11bFfzA7UCoeCT7asMKCrdeYKVvLnqhBSH4OoKZR/serZO4LHqt1mdmnYka+LwaUzeiF/5kxjlFDMILiw1Lk4YaopRF1j3QWK9RPSI/NDsrB1gV9uyh0Gy9m4hK69wjpqODuiEq7O9XUYgoNKuF5xdMno+gfw5L2PB6Egf35HeQUNktW2bEIJ/ggRLFnjPIA/lgcn/FOJoqvDLf0J69N7BObtpzYm7b9ak2L5g3sI3WZDrQEIoDqkX50iXABBlOPE9EOMKutU+eMwwYKaCayu9zR5rEYHZbLbCnygZX8a3/zqzPYqTCXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USWr0xhZhFhwAOeqyi42mIeYFVv7QNXd5U+rWNvjDz8=;
 b=Vh5Jrs4Uz2scSbhmJ8sIIMclTjD2BZLFoYMKgKLk+Z4J+noBaj3wKw3t8K1awWi+FVXtPwA72X9aQl842wnLvudgxP+OYHvt3LdzbLFOKafjo2lSo17p8iRvV9ya/mDq/Dv2FSq6N+5PUC6SennrBCL9U40HtuZdizFt0ntG8AIlibwUqlzx6y3iDv28twc4jCdP78fItS5aKpbA+rag95PNhPBFuYkBEVTuEKJrSjC04LJGqoCMIqtfkx21l09iocYnmCcDnRQtfJWJhx+c8sPVsLHV+3iEZ8Y1BSTzfaFRaUKdlN4WWJtZi2ySRP4fLgJe+Vw2s3mNDgT/xKX/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USWr0xhZhFhwAOeqyi42mIeYFVv7QNXd5U+rWNvjDz8=;
 b=cfqSycMm8nAGbl4g88Pq7feZ5dxMUEKqwn7fPEm8mnFSdshIfMFvZyO9uzFodUEgmb/uMYs6Y5PCU5j5C16nNbUn1mxId4AHX1XBaIRST0RdAeBbgLIp0aCj75si5xU0wMqjaLIcMZ0Uqz4ZCDm8XeGHr16PAOvdMWIq4qs8wDsryQxAodmDBtMHdIEGsgN4KyTH4kkog30fRPeGAPNnhSK3YL9vWq2JnK5S5mX2osntHA1+2U1F6Ls8V2w6rPTV45ay/iQ5umW+Aq5C/OH5xcmnj0YDGUIsBmGiHHNU2dp6LNNnJZabCajMScxgSoDKlhIvYugaYYY7DwJBAW6wnA==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by IA1PR84MB3034.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:3d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:32:06 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%5]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 08:32:06 +0000
From: Jonathan Brophy <Professor_jonny@hotmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Jonathan Brophy
	<professorjonny98@gmail.com>
CC: Andriy Shevencho <andriy.shevchenko@linux.intel.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, lee Jones <lee@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, Radoslav Tsvetkov
	<rtsvetkov@gradotech.eu>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] dt-bindings: leds: Add virtual LED group
 controller bindings
Thread-Topic: [PATCH v4 3/7] dt-bindings: leds: Add virtual LED group
 controller bindings
Thread-Index: AQHceSPp7IX2w1fFyEeK6kQpEfzhJ7U5ZEYAgAB1QcQ=
Date: Tue, 30 Dec 2025 08:32:06 +0000
Message-ID:
 <DS0PR84MB3746BAB4FEB95BA7AB47BECB9FBCA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251230003250.1197744-1-professorjonny98@gmail.com>
 <20251230003250.1197744-4-professorjonny98@gmail.com>
 <176705797007.3053564.852280537388416393.robh@kernel.org>
In-Reply-To: <176705797007.3053564.852280537388416393.robh@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|IA1PR84MB3034:EE_
x-ms-office365-filtering-correlation-id: 3f9768d7-8650-4948-4a10-08de477dea4b
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|8060799015|8062599012|19110799012|12121999013|15080799012|461199028|15030799006|31061999003|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?35Vt5/iCC26j6I0lofa8Risa3I4KC4/wrUQkXFyQSg9EF96ha8CsFYoHQd?=
 =?iso-8859-1?Q?f+I2jZ6yu2G4DXIRLJzbS3YMjgjDBHq6FnKFr7Ox4/wLnKBBEribgZIGQw?=
 =?iso-8859-1?Q?QsEDNO+bKlzpGm7p1+frbHjNemsTp487x5vQwimd0/P+ZGCMvwEZwhZlNU?=
 =?iso-8859-1?Q?U2sh6OH7t6TQC73Ejo3zaffYlYJpwHbbijwcyDm0XbGpCiA/pzYmeaH/fk?=
 =?iso-8859-1?Q?HBywffOzKVcw3vA+FnMNvL9x/DfCF5N4J+wmjPV3qbbCyT87Sgtu7T4Qvx?=
 =?iso-8859-1?Q?G8255q3CVWRq2+m2uccOfBEKSQ5juHtareG7ShHAJkn1aFnKxyFsNj18ea?=
 =?iso-8859-1?Q?OJL3Yw1JaGAGdueoj6ZEOfLigxxZh6lzv6QkOp/h0E3IWKbWfLw7SrAAG8?=
 =?iso-8859-1?Q?JzjKhsQvENXUzrn91HaSZO0brNTvTc6kWwA6XST+F1BSkAQV/R3jiNs+ug?=
 =?iso-8859-1?Q?v6BhE8GU6ClPt2qK7fwJI4d+UyRaOJp3PJJnr6CMpIdkM4PS7n8w7hNoaA?=
 =?iso-8859-1?Q?ZGNRCVcsfU8KJGUnFSA21TfjDbwyEWfCUarGxKCqSXetnFjicXhx1u1nbW?=
 =?iso-8859-1?Q?+7qhr9lXyI49cgdn+aggpT7ZGz3O/U/OB/twxPAPyip9P0uwZ9PqHjLCf0?=
 =?iso-8859-1?Q?aCFeS6vAJCITR2g/Kdvu2wc5Cp9ZygNuQ6m7EuqPJTmC5dzEEdp579AqZM?=
 =?iso-8859-1?Q?6e8yM4UiUhi8lOZ/5L/l0LuDbSuqMfwfLg0wQgmb22O6EGKv2tpDcXgHEy?=
 =?iso-8859-1?Q?zXMJGJXr6QB6ll/wvwDTXmiHrpukcIGkuHkoJ8W3UtBsyikzIPWzxHilbE?=
 =?iso-8859-1?Q?/g0TVju6Uk44jOumQutMv9xyTrJtQMu9sIYCk3H/+7nZpc7/8Llvw61NDY?=
 =?iso-8859-1?Q?YAIbRyps3O7gUWrpHVd8dsVeoCO5EJ3S+bWyzguNgpHwCudTjOrxBfSCnm?=
 =?iso-8859-1?Q?y+BveEVmPTw2qAfggyH+a9GP51oOY67KTl9uCSRnMFwqfmK8fGoi45Lrje?=
 =?iso-8859-1?Q?StUpxEdUBVXcY5P18tBjZ2z2kISCbUZYyRE0/duVN4/uSjnToVbQFtR93i?=
 =?iso-8859-1?Q?2eHFbhqbapyyvbD3kI//dCwDPTDV4tM7laKkbKQqxKCIXSTuAerBhuXMOU?=
 =?iso-8859-1?Q?iIVQkklAPeNw+qzS0MMObvQQeyU5fSB7ZG1DgCd/FAmJUjmTp3hcKQxio3?=
 =?iso-8859-1?Q?I6pDdPgRFvOqTtxxKntiOiy2JlmAaf8RmlgxqVdgBTSqmkZmGInYJdEj6w?=
 =?iso-8859-1?Q?9lBGkTAGwmtri+j8Kkx1ll0NnZrdV4Y36cl7bV3fG9/DQUrC0ZZIlf19Gw?=
 =?iso-8859-1?Q?idSA?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YmGpagCkGFXkKHR2aTxK5cm7UxOxQ1JJfQMlaWekxL8jI4n3zgeQA9pzpp?=
 =?iso-8859-1?Q?gQIafuHFH1HW2rjVp0SN+MRnS7DpjtXEZ+Unc3f2M39HCGXFnLVUHzZtz2?=
 =?iso-8859-1?Q?LDkXbuXI7zsfESXCUAqz0g6v0WCGOcFE7uxLP9ISIKITSsJ56oMVzgGFtr?=
 =?iso-8859-1?Q?wHoVEDnxr4bdl/JsPaMZzbuyQ0MVhVwIe/GnsnB33prbDKFCUP8ZYlvVv3?=
 =?iso-8859-1?Q?NddTMaNN7U4GCIfHz5j/CWt/uuIdzg2f1z16Nyk8hKGa+rlooOIc6wIgxC?=
 =?iso-8859-1?Q?JQ//O1xGu3VNGOFf26yn3SUlpwBdsRg1YGCB7JpsfRwyuic3QQ2k+caCaA?=
 =?iso-8859-1?Q?piEhPGcjMu9twGVGi6U/kWuB/asa7xW1u/jCrnr+2h98xzC9WO8EPq8eJa?=
 =?iso-8859-1?Q?0MFfd9usOxKfsy79fXW3c+PDzy7XknA9TfjxjV/0knEF8GQn2qDkcbStVh?=
 =?iso-8859-1?Q?JpOxAlJAvyLA0IVmoF2CcX1DgYy9vhbUqDA2RAjl3Fe9ldO761WWOy5oSP?=
 =?iso-8859-1?Q?QqdhekJPHECcG1VAOHrI5JcKk7SSZjFU0qKZ+W2WxDXDMsXDg6Ia/DncUP?=
 =?iso-8859-1?Q?kysfBkDwiuBHkJ12PN9m9JRv9VPVx1GbaeygLh8RBX6dhogzRJn4pTy3cC?=
 =?iso-8859-1?Q?BJiYeRxt6xvbCd0XtJznOxYDwZdZvkUAiiOJRk9XJCVlc6Th2fuK60vRhL?=
 =?iso-8859-1?Q?KHZvphJQL2WE8wpynHAkZLfZfk1bT/bNeFmYHbB8jldldwDmqO+1Q07E+L?=
 =?iso-8859-1?Q?KN44T53VheW5DmQZAdxNFjFuMLtCW3vyMqpu4FfGVtIX/Pikl1UUR/CCzC?=
 =?iso-8859-1?Q?wwsp2QzH18238Tg9Y1Tp6DDcmbAGVqwPaAH2/22cHPNlGTR/0K99jtFpFg?=
 =?iso-8859-1?Q?ArXwkQOXFTeJF6kNaWgB/OZdScQhiCsGeS0tiQySbZQQq16yk9RL4gH2P4?=
 =?iso-8859-1?Q?CpRxemtAoadP+OA6mgq2xUlRo3GZb/kukUsR0HydF2nZ1lewn48HhvA/3N?=
 =?iso-8859-1?Q?StFIEcPi1g/tNnjJJRpTCI9zWbwIVmyXTe+pEIWOMwyOzCO5g18BKsK6Tc?=
 =?iso-8859-1?Q?8MT7udX3t7zkkZ9Ye4/DqH9bRG7QWw0cvuYFfYfbMxrPPA8KrC2rKDhNQO?=
 =?iso-8859-1?Q?NLdP3Yd8ZZWYOsWLDc4Drg2MC0+WCwHKIzWqils7TIrvIuwSkaWJ7pgIBJ?=
 =?iso-8859-1?Q?W5zaft0TUA2ODWLF1derCsHjE12ZR5KLkqfW9s129EC7fBGN8xdbZntikZ?=
 =?iso-8859-1?Q?ddnqVF7cDhZM/NTB/WaY0skhNJUR/yzEbUYSFbZErt/tPP2RGgcz08cWks?=
 =?iso-8859-1?Q?KNUbyKGJqEhmlkRPOLNqygZZ6rXEoTxeDy/FjOx8M6ajT/tD+RKbtWnipn?=
 =?iso-8859-1?Q?A32oiErkgQmO9PJ/QTmEKUg4rrI+Chi0DXQF2ZLuef6pDfhnT/lP4IGJX1?=
 =?iso-8859-1?Q?4DVOLG2G6Fc1j3VshG4Xfb2+dFCelY0rZUaoD+FfrXeWae5Vp6qlzugGXu?=
 =?iso-8859-1?Q?7g483B0FdCY9dBykyJYHg9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a21eb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9768d7-8650-4948-4a10-08de477dea4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2025 08:32:06.0412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR84MB3034

>My bot found errors running 'make dt_binding_check' on your patch:=0A=
=0A=
>yamllint warnings/errors:=0A=
=0A=
>dtschema/dtc warnings/errors:=0A=
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/le=
ds/leds-group-virtualcolor.example.dtb: pwm-led-controller (pwm->leds): 'le=
d-pwm-blue', 'led-pwm-green', 'led-pwm-red' do not match any of the regexes=
: '^led(-[0-9a-f]+)?$', '^pinctrl-[0-9]+$'=0A=
=0A=
=0A=
Thanks I have fixed this and re submitted a v5 patch series.=0A=
=0A=
I have been testing on OpenWrt where the yaml and dts files are not validat=
ed and this slipped in.=0A=
=0A=
Many Thanks Jonathan Brophy=0A=
=0A=

