Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F98A30DE70
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 16:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbhBCPmP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 10:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbhBCPlC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 10:41:02 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED913C0617A7;
        Wed,  3 Feb 2021 07:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIgF4DRngqGWaEgkTaB2NZoEurOGDGnPRmSC1goP2YEtNU2Rlv93W+NxK+BdQdvaUVZjYlqtCuDHN+7TqmzqR4DYBY847DEpqHt2AJdH604m1WfwtYJ8Fx1x95mkWXqcNc0N1Sm4BLosIKHju194TUoiZXvhcHhhskF0v5UZQYYzR7Y/StvLdGmv5tFjD3iPNgi+zVug/WoA8zWkPHdLDRohSvVQqMKKGvp/UCP4GZaBLz+LdInMwW5wFqJzVnKWSn+hvAyKgSqTrM1p/glWVuatRLfp33UyrKdvBXoQbufcIGbG+20O8hIy3KHq9cglXVJtkx3l3yX1hx0nLPwZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNJKGMOVr1s7ykYmRKZzd43izq03pbmQAMY7+AmmQbU=;
 b=We/Clcd/RRGkLY+xByK2bs1kaFTGWgWDjCfo84qO6l64jWUJsYupG3hZGVkY06/G4ndLycGnNw/i0ONLke32fLAsInigo6giVRpZGsxEcT+HU85qeQy0B6EaQgSPrl8f3Krb7jmWx0e1L4waG7vcNeG+eFK9C1baxDPWv93Gn6fStN9EJqD10LlCueK+RkXzxx6vpWm0PzdyXeACjpasCzIFMFGZCM9bwBOEJABkH2IVNNhA7C2Xfiw6PgoKC0qQuvKN3NHkpfMBi7t/i72h2zyccll8K9vgnxVWBQs/b5uHgu1KZyRbt1D+P5Cpo6lOsMDu//Qn1P0aXzHXJiGeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNJKGMOVr1s7ykYmRKZzd43izq03pbmQAMY7+AmmQbU=;
 b=jf4tUIxTf3UpTJ9asr/N9iIt14b497BTh0lO0Kk78Gr2eFOVP0s4OqgmqxhRl4oW1JYJFDM30+EkUSp3bMSSFrYUaB096I1CZsetMxdUPnI6i2ZHo0YZxg4ztYHPwyHU74bQ35EhQStFr27pykHmEI92JHo4BerzWgSFbqAnWeg=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DBAP190MB0886.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Wed, 3 Feb
 2021 15:40:00 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 15:40:00 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Thread-Topic: [PATCH v1] leds: lp50xx: add setting of default intensity from
 DT
Thread-Index: AQHW7lFOn/1Jlt56EkOy+ZVk/3cx2qpGlWAAgAAP4bA=
Date:   Wed, 3 Feb 2021 15:39:59 +0000
Message-ID: <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
In-Reply-To: <20210203142940.GB12369@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7638c5e-44b6-4e09-eb71-08d8c859f75e
x-ms-traffictypediagnostic: DBAP190MB0886:
x-microsoft-antispam-prvs: <DBAP190MB0886333E371803BA956ACEB8D9B49@DBAP190MB0886.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SbBAZOke0PRGkLb6kxIKZSfPq1BmXXHtDQUj6r09Lcixk3T5iokpe8fbV4QU2Fnx4ihFHRgZQdyOKK/nI62d+dWbF3d0XwlvUBS0LBPL7iFYieTlbPRY6ra97lJjaXBJt+1zg+UZD3rC7K4SrpWRvd/SSiqbm/Ta+fqwOI/G6CaHI0Kxp6bVrfhBOGpeTv117Ccc3goi4vdQrQWgGHQMZ+6XbcQezgW6eTtWv046WjQEUWARqmbEWQ17bxsjGl2GnHRGKz7gjS81bI91TU2nMxX3NAYB2xJQsmys88UQSwq4o61Fai8XXmHu4jrs9YIs7T0MGVsCpv8QRpY28JTT56/ZxfPAu72Ples6+qFEQjp/VjBeLMp6ed1swpUPGwA82dMErPYYu+pnhcPB6xREkeATVV7Vw7mF78pDY/ekIUhURzzBmKD4rVL9RFgG6LIqbS19L2tdYoejipuKXH0ri989foWVDnEmizmJLfahwEELSLbM18tn1jcgSv/OUp66k2j5RjTSRCp+9lTi0kHdbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(346002)(39830400003)(316002)(54906003)(86362001)(6506007)(478600001)(52536014)(55016002)(186003)(8676002)(9686003)(66946007)(2906002)(71200400001)(26005)(66476007)(76116006)(8936002)(7696005)(66556008)(64756008)(66446008)(4326008)(33656002)(5660300002)(6916009)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?G/7sLxgUUkR3y5Uc4Hlr046vUUdJD2Sqks1jB9L+V/A437T2U7i7o11zTIEH?=
 =?us-ascii?Q?GmR4QMRfxkStt7qsT0a/e16B890tt/A9e+v/KctyPVW+jIyWBUsB1+aZEnMH?=
 =?us-ascii?Q?6xVIupo5sthNfnPGoAZZY9HO1Sk+elteL9nzjKCFGgTMR3KkNUa2PFEckwqA?=
 =?us-ascii?Q?FCPwW9gVpUdBsFhpbH6AsQ+gyAzf4kVHIpc/zmsWe1eKlf7tYhmvPaOaYyUm?=
 =?us-ascii?Q?yJLma2KifJjQQ4eaQKBEq2U3qhn4+k4DNS6HDJGX13DzZS8QZaZ2RzBKVzj0?=
 =?us-ascii?Q?3MEZGnckDEWRQu7d5J1YTpTnXP6Q5MBNLH1p0nH0rb9nyAeYxWXb7+hQMbjX?=
 =?us-ascii?Q?EIo4IZy+bpkji6lRU1M/9Fc/kPyWu2pcDkEC8NSDngbeMh1hBDqDVKtDGPjO?=
 =?us-ascii?Q?TiFunNZiRf+aZ+kn2gVapMQ+056hRj8D11h5dL4CNd9Ctd1OsrfqM6UU2AfN?=
 =?us-ascii?Q?vp5WgtjiIQiyK1Jxm8CcgZ7fM1oJzst/tBwDu7T24Y2bcQcD5h9oFVIrGmOz?=
 =?us-ascii?Q?t/HqTsqHiqkdXbsIHadAKMPG/O1p9AEJuguPGxg+w21C68cL1zzz2vAahAPC?=
 =?us-ascii?Q?Q5zpzM/lcRNlppfssgKuApsgC2O2YbkBco0UCBcYSP/GwofG6+w2A9eMyVNp?=
 =?us-ascii?Q?gIX5O95FhxOPterb1EcYH9QcVei4iF39ipf5CmWLZOtZKCQTTH5M6Xd1tdGa?=
 =?us-ascii?Q?CfW8pHZ1CukyNAZwn5YTZ78v+1PFOECqB+13yOejAX+sdrSWq2uUAuIKkSvq?=
 =?us-ascii?Q?xRHomLxDYgSY1GYnMOU7NROabQiJ00FducirB+/A6XsKGTaDj+yE3ORELYVa?=
 =?us-ascii?Q?CFV/dIuxXCFX3Ndl3fYJuCTf8oLi2OQNm1pryBhuJYOopsPM4he9eNYLYst7?=
 =?us-ascii?Q?xZvHHtXpPxlKOBlsAhXhwPQaMhHeoIyUkS2cTpGw6xnwcJBF3g0R4p4ufD/S?=
 =?us-ascii?Q?E2US4TdcifC9FdrOuqNCJl5ZM8uN5ryUriX9rw5ZDqW6wXSNLFw3l3J23gYP?=
 =?us-ascii?Q?3rb3DtrD38iiE6NecmZM6EnNneaaexFmVXYbdqhdKocY9VSnyFKta0mqzU32?=
 =?us-ascii?Q?pciCrkvV/L/fV6E15JYxwFKDHgr0vuURqPos/TfQgVBwueuFcMjvZlU1hjEc?=
 =?us-ascii?Q?9A1TIovrSlMK65n8mihSpbpYgW2eWuwnk2VnsnpDl0L/ElDK+f6MrEEwKqOf?=
 =?us-ascii?Q?tkd14SlDzQSLEhTPNGW5VZYY3f0t9XFtJpxAq7r8S94PFlqAhvxRnXT+Arxc?=
 =?us-ascii?Q?jvHisflI+C5ZdaOylkkRFO/Cf48gBX89XbRL46o1o3DvypLPfwiwL3WuMuhx?=
 =?us-ascii?Q?DELrRL06lG2Lrc4EkemAYuFb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7638c5e-44b6-4e09-eb71-08d8c859f75e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 15:39:59.9966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCk6AMwLE/OZvwwWX4Wxd6OnKyECCVLb0YFClc6RJDy/EFe/KE2KGHKDnh0WaicugdpJF/+yeL7LYqDOtY/6TGIXbQHuPXgKI6JCKqWhubk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0886
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

> > In order to use a multicolor-led together with a trigger
> > from DT the led needs to have an intensity set to see something.
> > The trigger changes the brightness of the led but if there
> > is no intensity we actually see nothing.
> >
> > This patch adds the ability to set the default intensity
> > of each led so that it is turned on from DT.
>=20
> Do we need this to be configurable from device tree? Can we just set
> it to max or something?
>=20
> Aha, this basically sets the initial color for LEDs the monochromatic
> triggers, right?

Let me try to explain in other words: I have one RGB-LED
which consists of 3 Colors. Each of the three colors (Red, Green, Blue) you=
 have
to define in the DT. For example this is my setup for one RGB-LED which I w=
anted
to show the heartbeat in Red (half intensity):

                                multi-led@3 {
                                        #address-cells =3D <1>;
                                        #size-cells =3D <0>;
                                        reg =3D <0x3>;
                                        color =3D <LED_COLOR_ID_RGB>;

                                        linux,default-trigger =3D "heartbea=
t";
                                        function =3D LED_FUNCTION_HEARTBEAT=
;

                                        led-9 {
                                                color =3D <LED_COLOR_ID_RED=
>;
                                                default-intensity =3D <100>=
;
                                        };

                                        led-10 {
                                                color =3D <LED_COLOR_ID_GRE=
EN>;
                                        };

                                        led-11 {
                                                color =3D <LED_COLOR_ID_BLU=
E>;
                                        };
                                };

If I would not have the default-intensity I would actually see nothing,
since the intensity (which goes from 0-255) of each led is initialized with=
 0.

I hope I could clarify this a little more?

Best Regards,

   Sven
