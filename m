Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A1D33D068
	for <lists+linux-leds@lfdr.de>; Tue, 16 Mar 2021 10:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbhCPJTq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Mar 2021 05:19:46 -0400
Received: from us-smtp-delivery-115.mimecast.com ([170.10.133.115]:60602 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233277AbhCPJT0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Mar 2021 05:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1615886365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=5jWSfQgnqbfQo4A5J9LqB42cSOwgGC/UALdMhx8tGZA=;
        b=TI3ROw5AyK3tbWVrowNnZrz8c6M+VuR/a3kEYqjnZAOwFMySgP8DgycJ7+lh9ztZ/7ssDn
        HmzfIAnkm/I5fQ0e+ODgqEuej8qfsdpCDMuZKrpprtlednlnroppXkD84CIYbNBvOpqjnk
        b6OD2dnhPRmtRJM8NtkrjxeHvDJ9MkQ=
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44]) (Using
 TLS) by relay.mimecast.com with ESMTP id us-mta-8-aqQxWAyNMUmhptm5kN1diw-1;
 Tue, 16 Mar 2021 05:19:22 -0400
X-MC-Unique: aqQxWAyNMUmhptm5kN1diw-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by MN2PR19MB3936.namprd19.prod.outlook.com (2603:10b6:208:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 09:19:19 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 09:19:19 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Cheol Yong Kim <ckim@maxlinear.com>, Qiming Wu <qwu@maxlinear.com>,
        Pavel Machek <pavel@ucw.cz>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        the arch/x86 maintainers <x86@kernel.org>
Subject: Re: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
Thread-Topic: MaxLinear, please maintain your drivers was Re: [PATCH] leds:
 lgm: fix gpiolib dependency
Thread-Index: AQHXFeppRRIKdHAaEUOokFXZWnMOpQ==
Date:   Tue, 16 Mar 2021 09:19:19 +0000
Message-ID: <MN2PR19MB3693640C2022784FC3DB7BA6B16B9@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <20210308153052.2353885-1-arnd@kernel.org>
 <20210309180851.GA4669@duo.ucw.cz> <20210309193910.GA7507@amd>
 <YEgeoPqCCgTUEsSc@angband.pl> <20210310072831.GA29779@amd>
 <CAK8P3a2+o8N77A_OkP+QD7ntA+M4U26k15Hh1rNN16-afcTp9g@mail.gmail.com>
 <9a74ce79-b7cf-dec1-a64c-d928b5712645@hauke-m.de>
 <MN2PR19MB3486B88ADF5BE557BEE168AEAF909@MN2PR19MB3486.namprd19.prod.outlook.com>
 <MW2PR1901MB2187816296E1B03F91EB972BD0909@MW2PR1901MB2187.namprd19.prod.outlook.com>
 <MN2PR19MB3693B7620DABED199AA304B5B1909@MN2PR19MB3693.namprd19.prod.outlook.com>
 <CAK8P3a2t-C5_JOcTUcYq1UCiDUDzMibvT0ToHut6hEJCtoj-YA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 798c57df-ea38-4236-2a45-08d8e85c941e
x-ms-traffictypediagnostic: MN2PR19MB3936:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR19MB393689C39362AB2707B17E84B16B9@MN2PR19MB3936.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: c3WPKMh0oKACVPTm6yWGbgI3lVaFi1lc9DLaxKhzWe7NtqtnenNn9D2R6IxDvttLBguVlRrCYnJFd/zd0AyNluwoac01dn5LluV7xBdewYr7X60ckTqVEw+6b6h9vCMwHOHSEHO6gFwQFF0X10mEVGpNjSHp6BBV0vRi8ju9FW/juk8Z5Yxs8cfP5qCf55M15gIWGTgcLcLUizGnnGB0Qdk5fMIXPTtUo3Y3AljFkxSaDQu4ANp/IIKHE8wem+KentWxQQWYcRLCALS7xHSFble3rRWy5008gnoExVk81SQ/kAJnksp/1e+EyRiEAew+57t0wPqUJ+d1uGP320bKOO722KfvNjyVk6BP8RH0QpH+eSoOXGDWIZEWa/dNosLmwjhi9UX4DHN6abJRd9z1CpeeAXfecTUN0IWU6y5zN6lECtKdcnpw4jprwDpH4URXyftZWpjO7lpccF9A/Xh7T7UxGtg5RwHq+xOHfQuApFK7Ykk7ZgnNY/whDpO26ECX5ZXmRs4cnaCJB8FL5knObDsopLlyAXCKAnla6NAalfZoYgtYM4DFBqSesuP23jpjNFuUTaAWvIEYWmHX/HLJ9uMLyvfN6QtA+PtYvyOUsDQlWwqntcBhyLzDIzT2IZ+PL0eHPEMUiiNkLIRuT9Cs1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39850400004)(396003)(26005)(316002)(76116006)(66476007)(186003)(66946007)(91956017)(83380400001)(478600001)(6916009)(64756008)(6506007)(54906003)(53546011)(8676002)(966005)(7696005)(66556008)(8936002)(66446008)(33656002)(9686003)(5660300002)(2906002)(7416002)(86362001)(71200400001)(52536014)(4326008)(55016002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?WsJZETen9V4hRe6teJcQotq+nDDZ9X4BK7Lx8+5Ua0DZuje7/ogU5GG+?=
 =?Windows-1252?Q?2SNMNEXB7YBySp5u5XvY4gMV1OATSWX4qhjGIfvkR45jPdUZEWte1lOd?=
 =?Windows-1252?Q?afppYBtY9cDtc6Nur3WFuBeWcwOL5fXyo4Ow+x/aiE+1lKPD9ourYeYM?=
 =?Windows-1252?Q?IY9546yDQRTP+pUjuJc5WMaNhB4XOXyfuARPI4p8AvOo49D9koCR7GhK?=
 =?Windows-1252?Q?w4jRxgzksg0o6Er9VdtrKcrWP+IzuEHfFBIn+JkHh7ZNTCPd9NhLPTLL?=
 =?Windows-1252?Q?XpS2LY2VOccANwAkAL7zOdSc7/VVs29ZPe/NCcxMeGLM8aYQVtE0/3KO?=
 =?Windows-1252?Q?XfFXOkNzyFXqzY4gARHLwS2Pzua5qnrEJ28nafHL3h+9w1KEj1QbtKzi?=
 =?Windows-1252?Q?q+WDRaKKoJB4u3Sa7z9/ROHbodVEJL8y98sElbRYDKykR/ohi5fyIY1l?=
 =?Windows-1252?Q?7AWURpRxXQt7ZYGofS+BVN7xg0Mj+lSq6SWAKdHOT1J5d1LCM6Lwr39b?=
 =?Windows-1252?Q?wckh/D9eiSjeM+REBG04fpy/m4/DKOvxmsvL3N4iTNKLtchyzmuIgY0e?=
 =?Windows-1252?Q?Wu09e9//ILdl0CNR8q5deIPNks/0Ng17/eATmcITDuhtIRpauPRoXuum?=
 =?Windows-1252?Q?o7BUEBq+pNoEPQZBWauDVec2AbUcEA97KdYrNaMracNq1OcLxd3Hhg8M?=
 =?Windows-1252?Q?yK8o0UxPNByPbWO26bcCjYA5nUOTJgfDWId6jfNs55KJF1N2FU7HUsUP?=
 =?Windows-1252?Q?tDnq9quQ5vbvS2tt08pXbGLFvyU+7xYWjK4n6D/vIKMQ0ZQmKy+dUI72?=
 =?Windows-1252?Q?nwqi/iZOE91iZl9f/zPuT1OO+tMHVHDb3i1DKC4bmfoGbHYzdmr6JcV7?=
 =?Windows-1252?Q?MmWBYUqkUO6AzUgHkETrhRmRtp54kgfx2RGqn3ZxGHJpRrboj/DuiDm0?=
 =?Windows-1252?Q?JkbomOcPEgXe0mKqAnkg1Wd3fja94CvKLsEoxE0SD16JFgTrApikraUF?=
 =?Windows-1252?Q?XPzmR2kxTqcZI8h4RS3/dMR5uIFNeL8z4Qy2wk2CPlp1HacaCUrSk9B7?=
 =?Windows-1252?Q?VO744gN88StIlSHH3YjyjfG+dvB8VxTdHaUUxZiyC0+ceR60JPdCD5aj?=
 =?Windows-1252?Q?xPjkG5vkBreWjIswLZMeCTsNhq9kZaHMqI7qGYX5qhNi6MkK8rvWeDuX?=
 =?Windows-1252?Q?MRCva1G9O2GT7SXu90jhSuFnKztvqV3/gbQzDYK/Mutfz0ppesMM0rES?=
 =?Windows-1252?Q?uvIzBS+8/f0TIvy/0ryqWS0DmLFeHmjRqwaQ84YkrC7Nv+6GVg3h55Gz?=
 =?Windows-1252?Q?ievskvzzQ74qM4jQ+oLxQp/dJvx+reBIatoEeMELIrzktfHNVzPCuoa8?=
 =?Windows-1252?Q?CeUzkep8FTXFjTkIGwoBJqRtl8tNVQSMizYDOUu3QMnjt68FwavbNZNI?=
 =?Windows-1252?Q?1QH1qiClD01A4efXu9r+Pg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798c57df-ea38-4236-2a45-08d8e85c941e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 09:19:19.2055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7TLectNyO3+rHq/O1Rz5zSnJhjXBgn9hh7Gc2romd7msDdzNPKB5oi9xkwjiaOlQ4vWRPn8APme+GnQDnFDMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3936
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Arnd,=0A=0AOn 11/3/2021 6:01 pm, Arnd Bergmann wrote:=0A> This email was=
 sent from outside of MaxLinear.=0A>=20=0A> On Thu, Mar 11, 2021 at 6:48 AM=
 Rahul Tanwar <rtanwar@maxlinear.com> wrote:=0A>  > Hi Arnd, Pavel,=0A>  >=
=0A>  > Sorry for the hiccup due to missing email address in the email chai=
n=20=0A> during the ownership transition.=0A>  >=0A>  > Henceforth, I will =
be the maintainer for all kernel drivers/code=20=0A> related to =93formerly=
 Intel=92s now MaxLinear=92s=94 Lightning Mountain SoC.=0A>  >=0A>  > Pleas=
e send any Lightning Mountain SoC related issues email to Rahul=20=0A> Tanw=
ar (rtanwar@maxlinear.com) and I will ensure that I address the=20=0A> issu=
es in a timely manner.=0A>=20=0A> Thank you for the reply and for stepping =
up as maintainer.=0A>=20=0A> I tend to merge updates to the MAINTAINERS fil=
e as bugfixes the file=20=0A> contains=0A> the correct addresses at all tim=
es. If you sent an update for this to=0A> soc@kernel.org,=0A> I'll get that=
 merged.=0A>=20=0A> Since I think this is an x86 platform, you can alternat=
ively send the=20=0A> same patch=0A> to the x86 maintainers.=0A>=0A=0A=0AHa=
ven't sent any patch to update MAINTAINERS file yet. Thanks for your=20=0As=
uggestion. I will take it up soon..=0A=0A=0A> Are you also planning to main=
tain or add drivers for some of the older SoC=0A> generations from Ti/Lanti=
q/Infineon/Intel that are now owned by MaxLinear?=0A> It would be good to b=
e explicit about which ones of these you are working=0A> with. From what I =
can tell, the arch/mips/lantiq/ platform is only for=20=0A> fairly=0A> old =
designs (xrx200 and older), while support for the slightly later mips=0A> a=
nd x86 based chips was submitted a few years ago but never merged.=0A>=20=
=0A=0AThank you for asking. At this point of time, our focus for upstreamin=
g=20=0Aand maintaining is on LGM(Lightning Mountain) SoC.=0A=0ARegards,=0AR=
ahul=0A=0A>  > I will wait for more details on your fix request for LGM LED=
 driver.=20=0A> Thanks.=0A>=20=0A>  From my side, only an Ack on the origin=
al bugfix I sent [1] is needed, but=0A> Pavel had other concerns about the =
driver. I expect he will follow up on=20=0A> those=0A> with you.=0A>=20=0A>=
 Arnd=0A>=20=0A> [1]=20=0A> https://lore.kernel.org/lkml/20210308153052.235=
3885-1-arnd@kernel.org/=20=0A> <https://lore.kernel.org/lkml/20210308153052=
.2353885-1-arnd@kernel.org>=0A=0A

