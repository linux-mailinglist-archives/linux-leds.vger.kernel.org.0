Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5E310A5F
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 12:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhBELhk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 06:37:40 -0500
Received: from mail-eopbgr70091.outbound.protection.outlook.com ([40.107.7.91]:38016
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231311AbhBELWh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 5 Feb 2021 06:22:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2RkQSrqS8fz07bjM6b2IX5vH+ACXK6XUgOmo43ijf814akocWbvqNI93mtVV3zXgpaOEAfZBRnhSUnmieH7ZrEJlnMXu6cDMDj7ASk2qutmz/XA3iRAW7B1l0gzblb0OTg6Djb0gG/LSmFKQKewi6RazTcW+8Tl7fZU1epJlnpVD/IQAr6wd98BfTiTKYLsvY+QwFo5LRJ3WErkOrYaHmnVWi+pg0YwNlwe4o7MYAvoCJMUQTPYlqs96va6b+oNqtWJIPR718w7xk1z/KDTaxs0FDHJDb7KXipkR0csGthEMBzW32x/dLTeifyWlBbgLo9cxMy/7lK8wnW6oRR1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxZfnR5+0rQOW1UFWAQUP13ibXQhAazYdBhm20GMenk=;
 b=E2H6gIRtZ39RkTu+sTaqo02gcM44iyzg50sGCY0hKEmH7H82YTGw4zsAmOLjcyDQodLA2hkHZtEnvU01dF47VEy/yXB+8KatngKC19FEAHYdmwTclyFcPvVNZIqNcAVJ5uRQTxSeCaQAKeM+hgA3Ix1RfQTZDYb1lSMh1bg224i3RiN0mInE2Ze96O3lFiBmr7fhfAV0VXjcn4KacWUSIm5Bnn78yr+eeyptXg+ggSqdIFAE9gAaWecypCECEa8ihOKHkzL/A8oOH9BKab+IcT9mtcv91B29JI8Gg47UKoXRKEBBP2ofO1ym+SklpWp+GMyJF2iL+1VU7+nH8OHsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxZfnR5+0rQOW1UFWAQUP13ibXQhAazYdBhm20GMenk=;
 b=KvOtFIrb0/kg2G+E78lsXB8pcbOWt3htqDp7ca6ufevCo3SS8xy/XOcfWHVs8lgeIZG6DGa1v8GY5M0Ehjw1i5DWXqLSIh/r0DylCS5C0F9aWtkgIrvbDDAJEeQggCKeYMV8RUzA6JfNmjwFRgx4kcqkL1Klx0RMtFUkOvpBz54=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB6P190MB0359.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.23; Fri, 5 Feb 2021 11:21:47 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 11:21:47 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNMX/Qkt5m5zEyD/i/lN5kehqpIFN8AgAE/3tCAAAo+AIAADCTw
Date:   Fri, 5 Feb 2021 11:21:47 +0000
Message-ID: <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
In-Reply-To: <20210205103438.GB27854@amd>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c9d560d-ba86-46f2-06a0-08d8c9c839c2
x-ms-traffictypediagnostic: DB6P190MB0359:
x-microsoft-antispam-prvs: <DB6P190MB0359E7B7CE7A4CE0791D6BA7D9B29@DB6P190MB0359.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ppmX6u0E6r37m9CnpfDctPmhnPJEdFBzGt3C2xzIuFeBtUcWGugzy6IedjYIZgpzdCJ4Rl9gc8cHju3DFk/bzUeG9UvBe6X9MwddP8jUkarD74dUC48UPJHhsnn4FGt8fLlqcoRxGite4R+3Jx1kFPq7FrAPxiA1ZbWDAf3QooeLcyP7RTTKoZxIoNHg7FTWv8TJG9kCZa+AshTh4fmxOsc3lkHjMLzUNXkypitwpUysGmTG9+QYMXK9Vm7y+uHYSALZSETe29jlDjGEcIJ0mblS7LZz4X41PvKph4NFSZERRd07QvvKpJ0F9Aq+7B3YPU+cXgSY7509wq/g1fHYTrtrngbt/bSfSCccA8MguOde0o8QaXRvHI2qtFYHc6L62IIhtV5kdw9PPTBdGS5G4Niqus8mzidWzvapFuQgEVEOIHcXB4kNMXXqm8gsSISZwTbVRaEGud0oq9unZenLTS84VzZaPcGmVHDDd1Y6XJ+t6US2ShvrEWAbZ7HsTavZluxEPaElahtPBGpqBrbqkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(136003)(396003)(346002)(366004)(376002)(478600001)(55016002)(71200400001)(33656002)(86362001)(8936002)(186003)(26005)(66446008)(64756008)(66556008)(66476007)(9686003)(7696005)(76116006)(54906003)(6506007)(52536014)(5660300002)(110136005)(83380400001)(8676002)(316002)(4326008)(66946007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?D81Zb9Co1N9Qa5FnhR8a1ldXpVaJf3WCv9lgjFmTw9f36znyJpdVv+geY9x7?=
 =?us-ascii?Q?kuXZOrwQAfzUs1SbmD/yBomFqRlBgxVBqJ72gVAotdyXa32pnTBq6E9NR0NU?=
 =?us-ascii?Q?RVi4jrQO4mO98SlktY81//eMane+mCq0/GVp2e9zI77HbIO+N9WD9FEsTcel?=
 =?us-ascii?Q?Q8G0Aqa+GxBbOHzhXxfWme5LaygATiLBmhE927mKsNAPhvcKFt6+dF0jPso3?=
 =?us-ascii?Q?3Niz94C639CrqS2bkMK2NwcTwYRxNwebqp8m6xh5RQub3Yr8NNetAHHQEFz4?=
 =?us-ascii?Q?sJtUJv88Wt31F/z4J3r9upNBhDHzsErl7iT7UQnR2e8xt+74hpzzSZli+3us?=
 =?us-ascii?Q?MlBVw8eqzD5D8/AuzXAboM4ewiT8L4n5v7931Z5GXD+92lLlWUdRZ1f2SB7W?=
 =?us-ascii?Q?f27WchJOO0+O8EsLnxYHZ3zZQwGl65rPP13kd0vIfaLIUxVri+ZhA+Yi5p4l?=
 =?us-ascii?Q?K4zU5+ZO2O3fxzEyIc9LKTyLi2ob3v5/H5yV9LRmjb9W0ssDWeet5bNXgOKI?=
 =?us-ascii?Q?YeAkV4beQ20ei1Vq2uV4VuOLtjALdbrjOE5k7+KvdsEEoppNXxaqV0+/3WHF?=
 =?us-ascii?Q?riHO9x7IlPT/qs4sOfSxolfiZOo0uMfGdS8H+91XtHjG+evhMcgBMnrIDCnv?=
 =?us-ascii?Q?vYeIxiSksPRtHOxqTydzjzWWJJ2or6iAu/EzcdIuMkNBzLnOWiIn55BVdhOH?=
 =?us-ascii?Q?60mA+2o7Lw0d9gRPYNCZWNurMPyJRY3jxGnNyGCtgeXrLF2Ag8zyjIoQVJW0?=
 =?us-ascii?Q?GfNMXgU6FybIW/xHnO0cvgLrNIt3Ghm0uoxRBvyHa2t/S0D2SWD7t3YpLs/J?=
 =?us-ascii?Q?/2WJpb2VgZCdq1aRiK9sYs24PTXiDSMrPVuOVmyXqWz0C06uh+FbFAAuNYVE?=
 =?us-ascii?Q?tUyZXpwfVrfMXx0OAEaV6RoRAs+Ufxc2QARPhqwOULloV4jQK3iW0ZLZv84X?=
 =?us-ascii?Q?LOc5FHgGIuTeyr7LfxbZcr2ZxI5IXnnZFfDhICz3+VCmx9YZ3/gJfoj0h+3J?=
 =?us-ascii?Q?9ihVbvckYuZ2HEMCihRZEmKo/IYwPJAj14w7JZY96cg1JYxH017LOLgxdPjS?=
 =?us-ascii?Q?2fyE/riNY6lYHPmSxwRuvvx0TG75rgaw07cemBJiOosehtIEGQudlCcT8Xg1?=
 =?us-ascii?Q?P6NtiaisMiRDenGjJyWtJkM/jBVvNiSgTUGZqudlyN7ARCxJ/Qg/uIm/uV6d?=
 =?us-ascii?Q?O7+CNFsb5b4JUF4ALq6WUpAGzBMMkO+tr2pCtTdAeMflMMAwkJGdt553KaRo?=
 =?us-ascii?Q?/Wd1qsr6ciVs2/r2mF5qJqkh0rtk+Rl8yRfzZrJVNINUeihqCQEMOEbn3w60?=
 =?us-ascii?Q?DESbj7QVu2eID7HbshrTx4sL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9d560d-ba86-46f2-06a0-08d8c9c839c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 11:21:47.0861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzdvpFyXc2Vi/QDLYQp18+RKkhPt0BJzicPWHDZC0HdzhP238aTyj25xYNaOfkNo5JSgTjcM833HfQ9eBCfRHiNDu6W82Iy2PwtnuR5FzMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0359
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,


> > > > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.=
c
> > > > index f13117eed976..4b40bf66483c 100644
> > > > --- a/drivers/leds/leds-lp50xx.c
> > > > +++ b/drivers/leds/leds-lp50xx.c
> > > > @@ -267,7 +267,6 @@ struct lp50xx_led {
> > > >  	struct led_classdev_mc mc_cdev;
> > > >  	struct lp50xx *priv;
> > > >  	unsigned long bank_modules;
> > > > -	int led_intensity[LP50XX_LEDS_PER_MODULE];
> > > >  	u8 ctrl_bank_enabled;
> > > >  	int led_number;
> > > >  };
> > >
> > > ? Does not make sense and changelog does not help.
> >
> > This is an unused variable which is in the driver
> > (same as the regulator). Should I provide a patch on its own for that
> > or just describe in the changelog?
>=20
> Lets do separate patch here. DT changes will need Ack from Rob, this
> can go in directly.

Okay, I will submit a separate patch

> Can you or Dan submit patch getting the regulator support to work? If
> not, I guess we should remove the regulator support after all.

To be true I am fairly new to the kernel and have no idea
how to test this. So no, I don't want provide a patch (except
for removing), sorry.

Best Regards,

   Sven
=20
