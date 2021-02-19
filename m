Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EEB31FA57
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 15:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhBSOJz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 09:09:55 -0500
Received: from mail-eopbgr50120.outbound.protection.outlook.com ([40.107.5.120]:36835
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230228AbhBSOJw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 09:09:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebZI4L0MQVUvl1egrEC/273Q5l9SGNz+dq2kf+BM5sjGD4hZV8eo1iVvfytDk4KJMtCkWskQ+mlBLbWDpthBNlRRNc75DvBbYYQxLrysGl2UWVJRzcToRT863yMAMGfD6vy6rxKt/u9IBdaR/iYuzaJJeSFOIuwHt4mNICIuyVgDIRiboR1DtlxnwgVHFYk4oO1zM0bLuM+U3maK0qSZoD6rhPd2RTZKeoUrKQ7Vq7giv7xOzKfOFgAvXhwnXJ9wh70Jf3vbIWOr8OhaWD0zVL21Vvi1fp6CGusawnEiagLxHt/dDPMVCJvw9wUigVamwX0PbrTDkbogZ2PosXl0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URJrheZzropLzt97xZBoaSqxEuEnJmYnsF4bQ5gE4Nw=;
 b=OQgDvqwI4nk0ip49zftr7eouNkEv6+Ee/fkmlKIeAhlG+nrZW0xsIwy1LjpMGDaJyxtQRkT+q30dlzMEwQyyiX6Vr4hqnZl8dW/0nMZtpPe64fzaBC7ZNbb3BQ9srEIjrFtESflcMQ4Wkui7CsmHv6lcDasXm9aZCWF/E1CQlJlpVS6JoPsLOSMR65r954/Zq/jU1up87ALvAxB4o1rZ/TQk8hEkqaDd/+8TiWO2feEidgHxDcvF6i6OUl6e+x2V0JFP0ltUX0PUHdGVcQ7hPLPfRaNr26xd92OQqmtOk9ReQwwy2X2qmicT14jwlg2Se9HsSZcDQ95Y4lh7Qhlv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URJrheZzropLzt97xZBoaSqxEuEnJmYnsF4bQ5gE4Nw=;
 b=iNyZqnEjsNfS7S1uQYMxyvnMbC9podgevjIFs8tgtO1e2e+6LSznLnjbqIPBn04WjSIYFO17E8GZhHwFYr5sWBim9X7Ka9FYe6KjFCPgd+FUADfNzR/Hx32lZyhBcvqJndihIVe+WrgiZdpa+zZcQmAtodbCPo+uqMN2PyRsqNU=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB8P190MB0666.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:127::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Fri, 19 Feb
 2021 14:09:03 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::64eb:97b0:de3c:4c5d]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::64eb:97b0:de3c:4c5d%6]) with mapi id 15.20.3846.041; Fri, 19 Feb 2021
 14:09:03 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNMX/Qkt5m5zEyD/i/lN5kehqpIFN8AgAE/3tCAAAo+AIAADCTwgBYAVICAAAMvgIAAKRsAgAACjCA=
Date:   Fri, 19 Feb 2021 14:09:03 +0000
Message-ID: <DB8P190MB063470370E6CD67900726B5DD9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
 <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210219111659.GI19207@duo.ucw.cz>
 <DB8P190MB06340AA6D789A80A4CE2B6C6D9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <YC/DUmhXate4NhML@smile.fi.intel.com>
In-Reply-To: <YC/DUmhXate4NhML@smile.fi.intel.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3d6a600-2bd5-41ba-76f6-08d8d4dfe9d7
x-ms-traffictypediagnostic: DB8P190MB0666:
x-microsoft-antispam-prvs: <DB8P190MB06667BF2C45DD3FC40480766D9849@DB8P190MB0666.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 35yYViW1uXeLMqwRemx9dE26MeCz4gXHBU0m+p/UouvmeBwckf5aqU9goIDkF+m+CuSO9M4QN/FH1oXk6D6sxMgmS6KK3wJwljALFw/Yy7edLrLT075VHgeSbPWstsr5PIAGT4ceGioFr86/redsZtChkUQDlYtSrCtzmeDUXuEA7SCbFfREr7epNldqg3mT0suKm5HDjwa9ck20tYFXRBSbYUFuNp2x+3Iyj5eSxZY+mb1GevSdUYHY5FHiRNUFkT1mhbUtZnSok4AC5QL3dCmhgNUlO/PS1aMPGku7EvmayBQCKL+esl49ZAoVpAqlTe81V6yZVrJuomtmns2KzP0P4dVGPNU9wvJRXvsp8Z+Ne0lJFe9Zn148jk3lygti43Mxz/8b9EQOLBx6UAnEEPMlC68E0LHRZFFWHmRaket4znM3sdHjIvzzwGeKX2aFUg2CwEYTt6IhYQDI4cpTjL5lmc5LRhyqP9U7JJj6Vv6veu8LbQ/oS+zbELJzdHQs8fVeHIcHIwObkSPxTSLSyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(39830400003)(346002)(396003)(136003)(55016002)(186003)(9686003)(2906002)(54906003)(86362001)(26005)(4326008)(33656002)(478600001)(66946007)(52536014)(66476007)(66446008)(66556008)(64756008)(5660300002)(7696005)(71200400001)(316002)(6916009)(8936002)(76116006)(8676002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IyVh/6EQnRx0EjZNVyjmnXi66Im8FJyEPzqefR1o2cE6oQ+CzLuxg+60S6NK?=
 =?us-ascii?Q?1U6dKHaf2VRefyzQl8FIcGT4Z0A7EBNzRo6E1off+9WKdQ6C0rai0ipqQ5ot?=
 =?us-ascii?Q?Hlb1Hjo6rNyEB/tvqcBoxYgjuSaBeKy2hTs2tu8kzG7rFTNK9AAQLDv94V1f?=
 =?us-ascii?Q?4NI91vSg/zogNLRKER/ZmNcNBg5MwD0cU2oOIodYfbDsgqvoiCwSmk37O/hA?=
 =?us-ascii?Q?l62EBmev9hmas5JNRm2RgtBFWFaatcrld9KQDez+3N85cIW70JQBCoHjgMbS?=
 =?us-ascii?Q?ENKj2k3wPRJbolz7bY5Msam/HVA8gIGS/9NjFayN2oJzoXHKkWGSZGHxVAr9?=
 =?us-ascii?Q?4aZU3F+qJNcSFfrQSVfm7fnpde5BgdqdQ7MlM7pCZw3mm2+duCHV3FTVX+aj?=
 =?us-ascii?Q?1g61ZLEqAau2YdS6IY1XFKUtQJQCDlcw/LFHCb73EgVfoGbqLKZDEDHv5S0P?=
 =?us-ascii?Q?+zAuRF4BgGIvNkRA2bzfbv2VpHVpqgpodJGlrt6yXjbvHzUURjAsB5QK54SB?=
 =?us-ascii?Q?locamhgjuZ0ILEftvlWr/8bnf49jUUmV4dS4IKRdTLFD+h9VIMzUCQiCNcvZ?=
 =?us-ascii?Q?XExrVFaUuvHJW68w39WKKXCql8G0rhgNKHS4ohAHfISTuXyDrywfXh31vekv?=
 =?us-ascii?Q?mB2pbZCa2/LUiTovu3dWgbJAN2UbKmFKF0OFHKOQqkkGcjSmqqRKsboClxc1?=
 =?us-ascii?Q?iFmp0sYGe+C9iDTfWqpMqF2Ym/87pLklzgCYDYZVUEzTEuIxl6W5fwka7w56?=
 =?us-ascii?Q?4faWWN9j6pONIImth2b0PDahJNbj/4QXr/zITkXDQhdPfLgVCtpNaekw3J+r?=
 =?us-ascii?Q?q8Dvn5ZJtbvxjs2MsYaGWEc/bYQof1DxziThhaQ9Bl5ADeSxfcu01znVybv8?=
 =?us-ascii?Q?G5VkBpx0JxztbuJq2TbH3I8hj1kboBUuVrGCHRgdZkbHKiv90Jr6ZBH0TvxY?=
 =?us-ascii?Q?Kqqt0WEBkrvv7klTx0CLR1qELcGbp4GK/+cwB+09NBquTTMhyhc3T5Fzb76O?=
 =?us-ascii?Q?Zd7A58YLe5TRlNZSnN8f2kHAKUsdiw5VzfC3HMJquZ2xSKOEn2IowwINM1Wo?=
 =?us-ascii?Q?IT+q22tdBrjdbXadfxupLYtcMUPmGJNCNdYJH4DX79EYKQChKljUF1sdpcKl?=
 =?us-ascii?Q?3xJV6uri9VNuBKo9FPTgwEG8sALoRm4JoLJOPwTmADU9mXsAeyLZ+Gj2h36Q?=
 =?us-ascii?Q?ftYrdqD3pEupcvmsOjQD07DLrMIK475715k1RAEvPRBaGWH7PK84mrLfP3SB?=
 =?us-ascii?Q?qgg53u9nR6WYCqflQ+MCyIO/httanpLf9fci+MX6OU5ez6gijJDFMQ6zIrMd?=
 =?us-ascii?Q?KXRoMEovZAcPNyUZfmoIxak3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d6a600-2bd5-41ba-76f6-08d8d4dfe9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 14:09:03.8325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: onTX9X9v53aG1xhyZ0F2+DyRz4/MWCSw+1qZHqEIs58dc1nmeZI6bQdpPcEa1pEVROWkHsFXsrfJAJmR4GpcHykMWpU0+P6HTs5Gziop9hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0666
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Andy,

> Von: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Gesendet: Freitag, 19. Februar 2021 14:56
> An: Sven Schuchmann <schuchmann@schleissheimer.de>
> Cc: Pavel Machek <pavel@ucw.cz>; Dan Murphy <dmurphy@ti.com>; linux-leds@=
vger.kernel.org;
> linux-kernel@vger.kernel.org
> Betreff: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensit=
y from DT
>=20
> > > > > Can you or Dan submit patch getting the regulator support to work=
? If
> > > > > not, I guess we should remove the regulator support after all.
> > > >
> > > > To be true I am fairly new to the kernel and have no idea
> > > > how to test this. So no, I don't want provide a patch (except
> > > > for removing), sorry.
> > >
> > > No problem. It seems Andy submitted series for this.
> > >
> >
> > To me it seems that patches from Andy don't make
> > the regulator work. Maybe I am wrong?
>=20
> I;m not sure I understand this correctly. Do you mean that my patches bro=
ke
> something? Which one explicitly and what is broken?

No, your patches do not break something (as far as I can see).
Pavel asked for a patch to fix the regulator. The regulator
at this time is only initialized but never used in the lp50xx.
I told him (see above) that I cannot provide a patch which
fixes this. He answered that you fixed this in your series,
but to me it doesn't seem so.
or did you fix the regulator usage in your patch series?

Best Regards,

   Sven=20

