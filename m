Return-Path: <linux-leds+bounces-6934-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6+pbLkYjjWntzQAAu9opvQ
	(envelope-from <linux-leds+bounces-6934-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 01:48:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B6128BA6
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 01:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADE173071F11
	for <lists+linux-leds@lfdr.de>; Thu, 12 Feb 2026 00:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DF01D88B4;
	Thu, 12 Feb 2026 00:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="h2QpPkSq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923D2940D;
	Thu, 12 Feb 2026 00:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770857283; cv=fail; b=BvNogfj7M3Q6yBaAgcMBLSHWq95+vLay1+lTcPTaeH/JB2adBMKV5OvtMkv78+AiIDQ1rzNdlbQd0OvU/pM1GS0oOJRii3d1ZygCe2UL5OCLss+ZHg7feP1YiVtefaTifQkgZOpg6h9K0OwdeeUEb0Tvfn7OBV0HUe+MOt/cc9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770857283; c=relaxed/simple;
	bh=rkgVu3p6EA255SscxUNztpPcFiMSANMlU1XNcHg90cg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mI/y+Ap/j8KDay85LSm5p4VSp9hyPxik7LfV2jf+lZ9J9JHL6erNVXvhBf8ZCV0RtIskNj2r72KGKDOBmq9Cvc/aQt9I7gRrLYK3WIq1kBiWBh2RD9ZunpKcERmHi9qPwB6ZD+BbKFmmV6SNXC2/MVd46KjyLMMAFTlu/lMoP7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=h2QpPkSq; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BMcd6h3319000;
	Wed, 11 Feb 2026 19:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=rkgVu3p6EA255SscxUNztpPcFiM
	SANMlU1XNcHg90cg=; b=h2QpPkSqCqFIMpjBiadfm+qPwiAR22LwqgiOGEBZh6Y
	QcjyS2WEMXBLKQPmJ2QSBFG6N9Zq5WD0VtWuKjVAHO9BZjUq46JTucRELVpt3ymj
	9krEd8XubCOHW+bcKPjsmWwUG1mTTyjgeZOwqKk2S7ISgFh3aCeuB7VpgiDdAgKB
	diYmsY19D9DahQT+L8DnOIUkP6H3mrinZnjbalooNZcM6TX+biR1ekD+cX+09s0V
	kYbv934wH9+CVoFgQA0kCqIEe/Xv5IJV1cK0ip0WedmapcC8vDdTS4dHxV5qpHM4
	gJqklzW+IvN0ofUrWDJZTCqhqpLs5ljIdMgDS45SGNQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4c8v129wpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 19:47:51 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYsecTCp0yIZrP2jg5CdPJLbSu5rseLk5Ibo63OpJhtB/IfwIOxQTfjD2pYUh52bxa9hYN5LiDip+gJwPb6goitnZnAN+YxzfUfYgmmE+N+fWNcH7R1crsAxMCbHw6e/juisyqs+cBZZuJrP5WzgL9iqdciQWOxEubN08P+34l5Nu7VFrQ3Oq5lUkmT4JUHZ1YpIggWF9gaXC813Fr7JGAG2I9bITCFMMJBPctO/j1eI3d5ugww63YxfpZh8MfqZ6fjy7YibbhjAioT8sMEVJqpzMDOTqlxh1tljPZdYa1Qtxls0mbCe3XriUZhISj6qHLHvtQSu9YPzbNvDds2/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkgVu3p6EA255SscxUNztpPcFiMSANMlU1XNcHg90cg=;
 b=dfTiCztrJaEAghogDtqAN9N9dzx2dsYVRQArHQxIeMZYHFUEp68m2p3RYD5GH27rS/EYWikECgs8RLZio9xQ7ckDeZciBFSlivnIe98GnEXylxGDcr3eBRimj/slcfVjtyoowpsrCbbGNcrXWGtSIE5Cj07F5QCFHWC7fHouEBSkY2HPFywTgsZ0CLP/GFarGKbhZq29MXeMxAHe+PcOMNo1mIfT1spGkIFObb5yJY03sr35P11eiFJqVudE7dkH2atNFHYWS1ypd2pAP/ZBGCTK/0E841VI2vkRI4WyLPk7ciP/x4e7iWag3W6w2cwelfm9dyJkRiQNLisre2zbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by BN8PR03MB4929.namprd03.prod.outlook.com (2603:10b6:408:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 00:47:49 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 00:47:49 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>,
        Lee Jones
	<lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: Recall: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Thread-Topic: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Thread-Index: AQHcm7k1ZFRzWenLP0KaNLaIr+amlA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Thu, 12 Feb 2026 00:47:49 +0000
Message-ID:
 <DS0PR03MB7228AFC9F72CE2820FCBB431ED60A@DS0PR03MB7228.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
 DS0PR03MB7228:EE_|BN8PR03MB4929:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b78ae4ce-c4eb-46ce-8611-08de69d05886
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?I7XutxnB8gDiXxkGk/KBxDE/7dN8sY5lp5yaoMJXazwp8CpUZUVXvSLmT8fE?=
 =?us-ascii?Q?EWR1OdVNPxtOeiH+7aOjh/f32+FPJquPT0KKSv0Vbq0yy6pLoOYZVq0c1DRR?=
 =?us-ascii?Q?x3TAREBIVX5nHP9vhrPfUKlgpCPEqiW2kHq1HgGRC+aZ1MbJ9rmLEwRjCbBZ?=
 =?us-ascii?Q?vhfwia95X30k/nQWwGtZEuHsfaeq0OEwTYeAjCvvvi5gqIDWgTB0KyQVjC21?=
 =?us-ascii?Q?Vb0RIh+T+E1FBEJl4SloOdxOOs0nUkLZlEwoZ+U6Kua7MBRNQS5bUK1ALcEL?=
 =?us-ascii?Q?uChW6Uje5LGODcDvvcLMjj21AFjj69ZTV2BCn8xJiyfXiSeK+ow8lCxtKGFV?=
 =?us-ascii?Q?jZiE8WF83v+B1c7dFw61h8a6zf2cT60SdWJFBjtvH3vIxuv2Wo2ceXYrD8gP?=
 =?us-ascii?Q?1TTkKSuehGfrgpvBCle591x0rHEkgMgAeJFISJYqdK0gneBT9Ev2Gn5Szs4c?=
 =?us-ascii?Q?RI8vMnxkfF3uxWWiOnywyTUcxduZqCq4BRYXSBE6LLETj0+9mRlW5Zx+uHKN?=
 =?us-ascii?Q?FYZC9Hz9yT/4rn2J2k4RJqwDMzYC2IyC8X5AAFEn0Qzy83zi5QC35hYgd9mJ?=
 =?us-ascii?Q?deepbKdQ3KinBTYs+3uNZmWUYPW0I7vt6tWthiYg/6S4yszGE1FPuDccRJwI?=
 =?us-ascii?Q?Yon93r+7QsCyIms661bhN1xudSbU5Nr4Sk7jAotL+6s7KgMiMdMhS7ZWB9di?=
 =?us-ascii?Q?XMWFWR+568Nfq4Tc8Rf5FYi2tlzlcun5eoMzFFw4mnOucsLXsBgR7y4OHpm+?=
 =?us-ascii?Q?0Wu9blpKbaf3N/TI5fGbUNhN4wvIXcV474fBfRzHlyR6OdBrk+MQ4IBgShq9?=
 =?us-ascii?Q?u4AUABNkoXo1uF5gBgzUsc3p45DOEmhL3rLRukxByHi0iYFS//hqlCcqwIjA?=
 =?us-ascii?Q?E3XNFxpl8NPULSoAcnrOTGNmDdYD5YsEK4NinkK1PSaZ0ce3MG5ioWre0C33?=
 =?us-ascii?Q?r0FzdAyZXW2vApt3iYrSf78E8ul0RMCx4IW1jT4K+b6aciHlM4LyPPpzNRwF?=
 =?us-ascii?Q?X3OfBw40PNgOaEmtRjcqw1BAtPcs3hbTNZzgXUFfYKhKWBHNaDjBwrkeEENh?=
 =?us-ascii?Q?Q/Ilou06yd2eHZQtj4/iBNhrK13tBQIniu0FofwQkVUVfsqb/I0OLElob/2x?=
 =?us-ascii?Q?8vIrNdRycebU6S2ZhgxlkB4r/0TeUSxJtlPROGUBWq79MCByF7bLAsKeHF1D?=
 =?us-ascii?Q?o49NPSh75tEvry9pDYUCPQtJ9Shg0KfupZjmv24QWGcAzXzIQ/uchRn30o+Z?=
 =?us-ascii?Q?GmDl8/UT1dpKyj7FYt/aU9tvCK7r3/64HPpLZlldm6Cof21ERZ4lNgX1GyBQ?=
 =?us-ascii?Q?jGuzxudAIeOBlHhXfbp9/YVlDPHylFnCULfUw7SX98Tl6eiERDGR31O/TDNL?=
 =?us-ascii?Q?IEK5qCyZH767ICpoyrinr0Zgn3q0ocG5+zdEl/Z77oQ2155UaiES28xgL8To?=
 =?us-ascii?Q?PWD5TRICrL6X+CfAuWUffhS30Ol12vmrg8SdjSBTBywsiwoJYgzkyb2e5kCl?=
 =?us-ascii?Q?16NG24owtIrkKeMNUGShZgTJswOM/6EeeF77iHQaQKfhB8eZqMdRc8e4rpJA?=
 =?us-ascii?Q?l78DhZChZ8VZrdC0xD33sYHGcrO81PEFTX0RUPm5CIpTAdVHvAphReut3o8w?=
 =?us-ascii?Q?5QfH5q0BmwooetFaqLqZRv8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eqvtQiabOEg8rDecvZYNQa55WfZ+f0ZAuaUGOUVjVcPsT7u7LC4vkEH0HFeN?=
 =?us-ascii?Q?fGy1skkRUXayLAtR7vA0S5GIBSeoKjzuEwSury1xdwC4hwVVECNLIAk68Msi?=
 =?us-ascii?Q?VWJ6UkZiO/oi5ijePP/r+mLO5LgA8fPVN1IAzhUwXxS4yxRjP9RFDfyOExYX?=
 =?us-ascii?Q?C3jHIRV/4XNegOuM0s1JMqmgfB3yfJed+ecaVzdwFYsLcL0GECutYxFoatsd?=
 =?us-ascii?Q?ByxjdOM0humNZXgkJAxJF8wIfI6ek1mLvgQPPvvVB/0HqpZZJMd3KESzcRfe?=
 =?us-ascii?Q?sZznUPrAFpjQqp1l7QsjlYyq3tnATUdbqF5wA/AZNbrEQc8+YNsSf+Zj+42R?=
 =?us-ascii?Q?IBLr95BtX6fYyEi1v929qLO3/i7yY2otZrrDo0ICeA6gGHfWvGOI0u9ttmxV?=
 =?us-ascii?Q?PurIc9vFBOFuaehYGNHGxeai4PdEQPsbLS2LIHnE1zf4spAFHBDDEfQVq/aO?=
 =?us-ascii?Q?YbCrt5JI8tznag1oHZCHnrnhJCzeGhN00ThAqbOg34zH66YN+Fy7yqxBIGkl?=
 =?us-ascii?Q?c4PfjMHW9wVbTqa/OfzfSt+sCAWVzDc+QOUhnzaaYElUmUe96Y6P13i0TRjI?=
 =?us-ascii?Q?DRHggThvINOi9tko1lDjnn8WmYZ4JZaZQfJaT+JIIru5RKxd8eerYKi4nHrZ?=
 =?us-ascii?Q?NR//jiwYUEGNxEV/vx81iopWZdNhBAMf2k0o18+XjsNFGBzdj84EwK5mnN5I?=
 =?us-ascii?Q?gqvGZF9JhDe3bXJQVfu7z51LSf1hMMDaGdnUgL3D/9Sq3JIHSoTKqxmIvK3L?=
 =?us-ascii?Q?wtT3bkpQT/uFKK9WG8U07ip6jhiVPun/BUlOADFNvi9l8YLF8CFmRicVUuxE?=
 =?us-ascii?Q?PexcQfoXURYl3ek3qdIczNMIza8BsdM6BB6aSGOC+S19wyWFl0u72PWSXT+m?=
 =?us-ascii?Q?2LSACH6wFfKu0U9EgK+Kjf5e09lBwxzoULbywhGz+/txeLrLpPI0xf5Doyc+?=
 =?us-ascii?Q?KpdtiblW5QFtAjhZFWbtmEVabGDOEh0y9ijV/dAOsogOak4ETwoKbLJ2FZ7J?=
 =?us-ascii?Q?CuOlDkoEs137wvw6c0DBdiyfCrmHMaEF7WC1UwnhF+lMsj3TdvWQuZloIhPD?=
 =?us-ascii?Q?/ud+JVKkWahyyv6ECn0E0ycjzHx0Nel7L6Rt5kM2AoB/95V1HqAeI0dc5ulH?=
 =?us-ascii?Q?FHrCJOCaXFe0Q03mmaoMlcOLDV9XucXIFBodjzV2g1gAwsA3/jjgyorOMB51?=
 =?us-ascii?Q?76CpK0OLkuTzGY1PJNCC9Ay8FKojQNlK2bhMmN43ADtu8loqvevD1FYCMMJ0?=
 =?us-ascii?Q?3t1uLpawv5E+syUAUqf6vcI45Zf5c2hmUqAp4i9TihELGqpTU6jgN2mc0unF?=
 =?us-ascii?Q?xbk10zNiEXbGOgHGZfmWbgekfVlLLaz5QJ85zHoVfif1GUek2xN7qQHcEoNx?=
 =?us-ascii?Q?d9ZiGheM2O6PayojNh9xI4SRxi2gRv8LpJKYGUmAgmwS0MYivDsmDcLRdFRK?=
 =?us-ascii?Q?bp4kaAVnm6umFWQo1QvWEM1YQhytDRaTFGhevBKmw8BeoNRsliunbU4Nlymr?=
 =?us-ascii?Q?8dAIvHiKpO1/zspSl/9pqaj6ZJLkKo24u9VO1YQp3uxb5T1AWI0YqrJ4aWtM?=
 =?us-ascii?Q?nEwaFlyY0N2RvEw9aUq5WaN+UP/p5M2bXoam0cNjja3zcijH3jXrJHMs/2Dl?=
 =?us-ascii?Q?2MXki3IluueTS/yn6gxwx1TfUJUuLl9W4B/oB6ACtk6ajXlm8POfwhKa17Nf?=
 =?us-ascii?Q?W72Shlv4MOrifD8dIUW9MpY0WV3XJ2EVPC0x9NY0LHkNjz6b4X0wecDKL0su?=
 =?us-ascii?Q?5jXLYb9YtA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78ae4ce-c4eb-46ce-8611-08de69d05886
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 00:47:49.1885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H2z+i5/CWjXbadV+L4tL64hC2cIeptabfvX4pjJfkJq1CFaGDJfr8ndXJhOQ6T1IMBxGPPLtjHdCH2pnocvc0Z/z/BBXRXVU8mi0eJyM1xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4929
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAwMyBTYWx0ZWRfXyzvWMtND+28Q
 QVMWTDfaDcHLU9dxcG17mqqDnqQdqbRaRZ7XfPLLMvSLvXjy4yPQaPfZMq0qunpkC9TK76DZS71
 YOVdomoaKy1HslNWIqGl9zlCT/lEkpd4Mg8WY1nz8tjAJPXSH/tzyiRhZj7ghGJ275FgFglJdDC
 tZOQcXaTYN+MFA6kj9JG+ZYaiuFcI1DBQT++lOmCaUWgH0GT3xzWGP3FskzuP3pmRNyNCAtVNRC
 COkutRSimMyhBehlNXkgnrY6AC83lIdCiup5knWH3ZNQgEsy7+E+LhKmWfleX/ZWFqytDa+7QeD
 43bP+LH5r1MRemkCwpSvhxM4IGt/FsO4ziC80w64/8ws16fTdihDPVL94rPiy3R0PauAztJT10c
 50/m++JPQe//q+8RdUkfoefwDq5k/cK6JMofhK8lbeklABMcs5Bze2ibhca0kZiJlN3uarPX9NJ
 bYYeUR8rWPCxbevI1WA==
X-Proofpoint-GUID: LN0bHOZ7EfVkAtWampwMwgI0RTZK5BXV
X-Proofpoint-ORIG-GUID: LN0bHOZ7EfVkAtWampwMwgI0RTZK5BXV
X-Authority-Analysis: v=2.4 cv=LrGfC3dc c=1 sm=1 tr=0 ts=698d2337 cx=c_pps
 a=OswsEo8IlqVTC7zrgcx7Gg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=j7sNkgOg-RBDAQ7q87UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6934-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:dkim,DS0PR03MB7228.namprd03.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C1B6128BA6
X-Rspamd-Action: no action

Escala, Edelweise would like to recall the message, "[PATCH v5 0/2] Add Sup=
port for LTC3219 18 Channel LED Driver".=

