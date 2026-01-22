Return-Path: <linux-leds+bounces-6696-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDwQHAbMcWl1MQAAu9opvQ
	(envelope-from <linux-leds+bounces-6696-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 08:04:38 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3F6261D
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 08:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3E9B4E8896
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 07:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E384611FA;
	Thu, 22 Jan 2026 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pprOGkUE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7631063B;
	Thu, 22 Jan 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769065461; cv=fail; b=qMovRU/A8VN9oYB3S0KGG4CUhJv0qSnAASIdJBUuTFIRJw+zGZUuqD2oSeXbCrRCUKl5GQFi6jjpwvUpJjQbRiz3vjaHcmlgPuSjTFtXdIAX34lnIxvAlrie/Y2CS3b9LCziGDbeDzwGBnc2bWZ/qjjqKO8iLC2QJlNcuOyOVso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769065461; c=relaxed/simple;
	bh=Ppi7rZ8hBc8mskL8VT7TgLrcsINKq77L0sWvhhAxlhg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HPnVFW5ZlGErdveI2HIDeXrVx/CpLFvBi6TXfK8b68qJvFL4dthhmKSLAfUr/kJ1CFJxBHVpCe1+vUABUstv3HHRajwRjhaIHH4WMxmrJ7nBQvDhOvUqP43+xfczEb4wzXPJO8gS6ql78qb9T5ybzTbgh+7bHpZP+kBqITHgQZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pprOGkUE; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M2BaTC3981797;
	Thu, 22 Jan 2026 02:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=YvjeQ
	GYcP9rVSXuaZAQo1iojPXt3D5MHbVv34JCzIlU=; b=pprOGkUEk0/ljtAJoHi0b
	iZgx8X1pd94C74gqI5rgQDgZXnzlGFL2cp5iToBLjHb7gBb5PER8tnDAEL3twqvQ
	WvjwyJZfpqHg6e05XmjAs16/T1F0JPEgANv6oUHfXqkZT62nc7ycWrHZl2tzblFG
	WaXfnzuFE4tJsfEbcd3NMqO/ErXz84zl8MDmskJ8rcEmGLgMJl3eVv9XZpJudk1Q
	rycEBqkFTq7xA3zSbXVWI4nhkDrco1mRLI0GIAM3z6wyf+cG+kr1c48yM4ju/Pqo
	0Fw9q9eQXdGDgx5+FXoc8e7WlD82hjvzkHnZZKfldoXSM2IM6UJgnBvM/fFQAiyK
	Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4btqvdvv78-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 02:03:56 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2+DeHtFzIcH905Ol+8i3MFT05kiJuYPDSCSUz0hCPYJ2GSbn0MLnENPmR1hK4a0N035wQZppw5EZ4VSJJySFR2m7TJfyKBiOkMFdV81qaKRmcLJmLO7RmWZ8gMJgwYmxCdJCBsBjrywTwP+SK/xlX9oSoetuyXT1S/VvhWLCTiAIcKiTZJxGWfMnmg/YRYOn7uXBoKK9+5QxUqEVOkqoRAqBzb49fFpbicsL+iLMhSSEITxJ8ad+4easMfDy5o0PPOly3rSgeFyQ6fevyCdMZHYU6cnlkdf7ZZi1jAShjZFPN+ecz9W6Da9lLlTnKKWQpLuq5Ubpzn/qmvfCx0fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvjeQGYcP9rVSXuaZAQo1iojPXt3D5MHbVv34JCzIlU=;
 b=NmGVxXLs3w92mIRIDRxxRc0/iuvKeOC90IWNxTQZH8mwkZHoqot7f+XqeCc+1/BFItckodn6DwqThQkxcGzmJAvcV3WgIQi3B2nlr9Xz1xKjM/lfvxQl7mpJJ01AaCWpFK4QqnJBUnh8vbJLJHjxC0+wWeu/Z/etJDqcmxfZLgmMi3bh2onCjUmfAwJ18mtj08hY/H1P5R7TJkB/aQtWg+qva3e/KwgbE8aJ1H3HbQ9HwnkCwF7QhgkeqNxUOAEQwAh7ugbnybkjFzY762gx7bky5sIJexz85YG5VM49TFLzk2a8hKC2FC+ec/1a03tBCBFnMFZHUw4AmYSUfiQ2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by SJ0PR03MB5725.namprd03.prod.outlook.com (2603:10b6:a03:2ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Thu, 22 Jan
 2026 07:03:54 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%7]) with mapi id 15.20.9520.010; Thu, 22 Jan 2026
 07:03:54 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Conor Dooley <conor@kernel.org>
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
Subject: RE: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Index: AQHcic6tjFW+bcpmU0i2CxGvtjuC/7Vbef4AgAJMo1A=
Date: Thu, 22 Jan 2026 07:03:54 +0000
Message-ID:
 <PH0PR03MB65258CC31A76A0CC9695A75CED97A@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com>
 <20260120-ltc3220-driver-v3-1-fef612ec4faa@analog.com>
 <20260120-magenta-emission-2aacd7e1772c@spud>
In-Reply-To: <20260120-magenta-emission-2aacd7e1772c@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|SJ0PR03MB5725:EE_
x-ms-office365-filtering-correlation-id: e9eac1f8-33e7-428a-012d-08de598467c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k5ePidSGVjD9eso/yE944rXrybpwTS0wR/esaV2nagsZb3MzvuizWnrzur9f?=
 =?us-ascii?Q?+NJJJ9FH+n9xP+UI/uEUCQLuRsbOkpopE3rlK6B+wjNJMVTHVpiD0gd6WQ+0?=
 =?us-ascii?Q?zfS4wO4kQ9JlUdmdrEsVerjiNzQb1QBcGS1aoAR8mGBhyCCbVawqQKSari0N?=
 =?us-ascii?Q?AMmbpH2eWLNhu5ElJG6T/eCQ4nhfE7ErneQEvCVIDqvldW11uhqnsDorPu1/?=
 =?us-ascii?Q?IQ/95YhJG7DQO6qSG+2bY9teTENc5eFVilkM3Wgt2y4Rok6lmwKLWvwe4wa4?=
 =?us-ascii?Q?+b7XIatCe7PlAIGZExvEh24Go64gywQEQjft4FsXcznH6QiPt/z9ta9oQk/A?=
 =?us-ascii?Q?3qh7OcrHZ2dz1bH82mDfPa17aXe+FVU1jsCXiJGlSDY4bQnKS9HT3CaPXaSi?=
 =?us-ascii?Q?j8lqX1vR3EikpmF4qw1a0dfRqkVGlBmJdp7Kdm29xFKDZxboRr+gzu6PAJaY?=
 =?us-ascii?Q?16zmrhsgOicSq8TWkO3qDo5GHfGH+usHHRzOMx828raQZeic6zGnj4tWhg09?=
 =?us-ascii?Q?BL0lilpNqhS8NoQg7+C1rJFcl/ougjfdgZzLrmZI8/T+b650lfOVerK+KrYb?=
 =?us-ascii?Q?GWvQr8zWr6smFdGAR2GMQNhk4m0R5lOkMIuc1pPaTGYRp9JjNaEF1MUSWkWC?=
 =?us-ascii?Q?w80TfY0GiFKcWQp0Zn61FINs09twcaagewqAX9eqohaObtUWF2Dh0gcGt0dE?=
 =?us-ascii?Q?sNSer+6yuUEavxpRUX54a89KQTJooJOP5O6gVUnjUGSVVjGKm8z8PmQ3s2kW?=
 =?us-ascii?Q?wZO5lOOWXD1d91+1G5NIvcRHvI+xz0JtcYVdd9jIVGAMbXQjHRqStFMpsI6l?=
 =?us-ascii?Q?gjoQe4GjWYQb3MF6623fE87ov/CNXv8/SDrNi59pMV7sJFLSuB/uRML3BBwg?=
 =?us-ascii?Q?6RxwlSZi8AHaGrG/Qu24GQRf4EuRdqAEcFQXW3lbN56sczSfXqp91rALvO0Y?=
 =?us-ascii?Q?vHLlLuxKcICeaUylt1AAHVo7pu5b8fknHA/b3Oc2fKdS3ko8ttVw8BA3/6u1?=
 =?us-ascii?Q?Mqzf0kzrkPcPjQ1IoKD1vdlvviNu94hmxPBHMW5nGXGUcqhF8vCTqPWWYIj7?=
 =?us-ascii?Q?ykU795oSjM/2VnAuFEQzRhgUFOeuPG6eAcL++JOFwufA/eTZJUj6wF+XJeV7?=
 =?us-ascii?Q?cAWCihxCmr1UnlZxy8bMxLr4kVjIVK0tXUop4qJrmGBHiXI/whuEUQY7ipUK?=
 =?us-ascii?Q?2DEMH0sl7UzpoHGZ8Au+i9GBxgafHQ5ykHTH6GpLWeV5dWNIaoaJrsjir6pX?=
 =?us-ascii?Q?ah9vFwdLJjThllrQoGiJgk0mu0YurN4eFtBX5YevVQzTOmwLd//caoywdTUs?=
 =?us-ascii?Q?izqM2TC1ujIMXGj/Uo+F2BmxcfdgxjilkCnpQNNVjvnREqfv9KU7V0eUJIdW?=
 =?us-ascii?Q?TPyhOY4/IrIcq0n+fe+jx4JytIs+Xhpz79Fstt3GgFdmr4oWs8wOml5p1TmH?=
 =?us-ascii?Q?ubvzAiexYvbMIkZft9sWHt7L/eIn6xG+hobjyl0wx793GuoNSnRo0ttQ8IQ4?=
 =?us-ascii?Q?E0RTA5cw/qzHhNuvkDmFB1FV6dkr0J5tX0alZjTzH+3XL/rUsHwHfQaThRQU?=
 =?us-ascii?Q?XoTnrk/BbPhSJMwOcNySrqCKIgYdNojT5mCXZ2WG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oyIQw5g6GQWUu7KBOvngczbp3nsZdUz0soUcvHpRGYLM2LYRNr4cJIlkVsns?=
 =?us-ascii?Q?aoYxJlyft6qZrvitriAsfupbiWMcEOkZgyjpGSSJkLJivNJWsTZBuwOG3XU2?=
 =?us-ascii?Q?wvHbQFS8Jbz0bGkwjSK/MLNeqbjEO0+LML4NDWjN3c2FQXHOKhWOoGY3nBvY?=
 =?us-ascii?Q?DjYJRgGdI3lDAitZnXAz1uiUNSmKLZBgV6LurIWzGiB10YZ3KfdPKrYaE8nj?=
 =?us-ascii?Q?d47626/me1I3V+8NFFHZQ8wU4PSd3UxDsAhTEV5Xi92CKfBTGzWeon51ws3m?=
 =?us-ascii?Q?lWrC2yXBH/E/MvPMedRFMllBTLhnwKVtgkB8BOdGStdHZJFTdjSllE1UWt2H?=
 =?us-ascii?Q?ZkwuyUxz8G1yFDKlH55j1UY1BGMCWumIKkthojYFrn5g9hyWED7gAXluMhjC?=
 =?us-ascii?Q?1zD87/N+roX7y7l9fheWtXoz5ldeH2D9zXu+EfV1O+6xGCfv676Ro0X3G9if?=
 =?us-ascii?Q?RFo27Rm+58/CMZURVyEmZZt7DT4AWqAtqRWJdg8+X4HqnL7ynUuBJyM6pNqz?=
 =?us-ascii?Q?LopnX2HwDmDTw1ia26QH1VKnC9Ui7yEPR/QyS6t8FGufK/A5lg9ujJEamMTB?=
 =?us-ascii?Q?dB4KqVutgLQRg3vCrOQnOTqkuMwORU1eDfwFVs4nih6E7Qee/I4OcLHf8F3z?=
 =?us-ascii?Q?bHz/H3gZxxTgohLOpKSqpLtSkfed0/e6PqXhuThes3RC2ZNE1DQO/+K9kU7u?=
 =?us-ascii?Q?ytu03JmpY3xz3+rgYCeWDvMB7EZXRRJFJ8OlyUGKVh9E+4pTVDvT4X+xAhKm?=
 =?us-ascii?Q?Zlg+ydzm4hjsw/XlAge5I3CscBA01kgmVTHSiYGqMznC9czZQwDhEqM8RacQ?=
 =?us-ascii?Q?EmCJ/FDzLAA+Gh8dpXYgjw64s6Hes0poix2WvfCtnJmZGQSdeemsKJmxqofz?=
 =?us-ascii?Q?kbxJDu/r/UhPj78FvgqKTCMc1ywX4HrzWYcEJJSLXNQVVuoF0UtMBayv7aQr?=
 =?us-ascii?Q?D/3Xrf1MjC8l8mD5HY6ydV+cw57JLWaHlLUKmrBj6nq3RIP3igdXA+cc9Bao?=
 =?us-ascii?Q?mHgLI/IXhIWtwnuFmm2Az34T+wp8/gwyYPljdLQyCOw5fyJew6ss9m5nMX9D?=
 =?us-ascii?Q?kCwNeCnvEx6Ez8bKf97PN4HcflCo8Ctpz3EkeiPHtFzgs5mUVS/TFAM8fn1P?=
 =?us-ascii?Q?cZw14SL/3rxwa7VLd8YdzXo3ZKWoI3rozm7hW3Hkvm08FGgjyBeC1RE1tPSE?=
 =?us-ascii?Q?PU7o45dSyWu4rTTF0O6E+U+tZWWQog6GRbUoK5fatwEkY/+ZUXGT1xDcClYm?=
 =?us-ascii?Q?huWpQxfUStComn8obZMFcSwstALinH3Ds20yE5LrYJ6/MACUhtCcvm6hPk+R?=
 =?us-ascii?Q?eY8zYs55wXfbKfI+kMCQRI943XZ6DJUaJKIO42Hmmq+nJKRkqfxQA7OvrOtt?=
 =?us-ascii?Q?EQu+w2FRpniw8/oCjfDbAE7wLOYVWSimReela2QkTwaLym5lLyC7wWZm49U9?=
 =?us-ascii?Q?jARrQHgRez/viuig9lzIm/7Ycvgrla10+RioWhNAi7fERcvHQKYH5G+n3GVN?=
 =?us-ascii?Q?sGFS9zWCWdNlqwmY18AGgYj5BOp6VCQKR0Gjyj5bkN9lRBriRxI9bhWB4BoI?=
 =?us-ascii?Q?zxchRHvIE53+JcIrEC5HpHu70bOk13OdduR0zoSpsnsQH1znW9ZPHml5egnQ?=
 =?us-ascii?Q?hboZYynUp1TMax4W5Mdy/MF0HVM5ewS+2CwgrGz78YQmInU3IfxRUasfOTkT?=
 =?us-ascii?Q?W/8g9idIHf9yebG539se69+2im64z6UWUleOKn26L/uLr6WUoIXzcVix553j?=
 =?us-ascii?Q?prl+bcVdzQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e9eac1f8-33e7-428a-012d-08de598467c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 07:03:54.4124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ZCLI+oQfEs9MBxM9VPIzzlc41MvM0Q5PTBjHwvNCod0I6gQpijsJ/MOINGk7Q4L+bVEm7if0pHig5t6QPlhzRn2hNKCaxKUXTl3+jIubdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5725
X-Authority-Analysis: v=2.4 cv=O8E0fR9W c=1 sm=1 tr=0 ts=6971cbdd cx=c_pps
 a=uEYA0xFIOgoeTHFe+isxXg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=XYAwZIGsAAAA:8 a=vA0NzLg39AQL2E9NHlsA:9 a=CjuIK1q_8ugA:10
 a=x-rrmlpudb0A:10 a=V5hIW_BCtU8A:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: L-uciildfiwx_Z4ryOvBs5OtQ6anMud7
X-Proofpoint-ORIG-GUID: L-uciildfiwx_Z4ryOvBs5OtQ6anMud7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA0NCBTYWx0ZWRfX/EceWIeqnifs
 Ncdnds3IkxsEFURbghHvJntC12GsSCFwUyyap2ThKLMSdt9rk74Sfl2fOY5Zrgt7F25ZV4XLhsB
 04ixxf3sHnVWDv/CRf2lE707GyKm7dnWaU42szLRksZmhVlvq3wtKjDQe4UeHo3KoGeNtqxGjSf
 FaV7ooPmF5tLwcdHpo/rDUdxuo7xSW8DgRX8YiPzbjnZ1hKL2++E0yqGSASRyN+kZcWA0KjOnxj
 rHLOcuE+9Pn9oizHJ1GqsH3V6aHxW42Zt+zCKTc5G30govryJdz0ElBoTNuhjNiBTg2BzSPP/Nc
 w+isPqsjvRTpYmtUsO88PCwnRMe1PE/B0XVyv6BUrFHXtCpU9pyuhFSpOltlEPBRyWG/F9W332b
 tjyjeTk6WmZJ9Lh9gJgE6m2tk/iCtDxyBWU56r1UuFBlrfj4Dyh7f72LIWY0+fb9fDqRvzbqQ+L
 hekTtpp+pLgH6VP7VPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[analog.com,quarantine];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6696-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,devicetree.org:url,PH0PR03MB6525.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Edelweise.Escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2B3F6261D
X-Rspamd-Action: no action



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, January 21, 2026 3:56 AM
> To: Escala, Edelweise <Edelweise.Escala@analog.com>
> Cc: Lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Rob Herr=
ing
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-leds@vger.kernel.org; devicetree@vger.kernel=
.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED=
 Driver
>=20
> [External]
>=20
> On Tue, Jan 20, 2026 at 01:35:06PM +0800, Edelweise Escala wrote:
> > Document device tree bindings for the LTC3220 18-channel LED driver
> > with I2C interface, individual brightness control, and
> > hardware-assisted blink/gradation features.
> >
> > Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> > ---
> >  .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120
> +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 127 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> > b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
> > new file mode 100644
> > index 000000000000..6274c6c6ad79
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
>=20
> filename should match the compatible, so s/leds-/adi,/
>=20
> Otherwise, this looks pretty okay to me. With that changed,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: changes-requested
>=20
> Cheers,
> Conor.
>=20

Noted on this. Filename will be changed to adi,ltc3220.yaml

Best Regards,
Edelweise Escala


> > @@ -0,0 +1,120 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-ltc3220.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices LTC3220 LED Driver
> > +
> > +maintainers:
> > +  - Edelweise Escala <edelweise.escala@analog.com>
> > +
> > +description:
> > +  The LTC3220 is a multi-display LED driver, which contains a
> > +high-efficiency,
> > +  low-noise charge pump to provide power to up to 18 LED current sourc=
es.
> > +  The LEDs are individually configurable to 64-step linear brightness
> > +control,
> > +  blinking and gradation control via 2-wire I2C interface.
> > +
> > +  For more product information please see the link below
> > +    https://www.analog.com/en/products/ltc3220.html
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,ltc3220

