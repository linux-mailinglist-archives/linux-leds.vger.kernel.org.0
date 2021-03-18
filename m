Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BF5340271
	for <lists+linux-leds@lfdr.de>; Thu, 18 Mar 2021 10:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCRJtg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Mar 2021 05:49:36 -0400
Received: from us-smtp-delivery-115.mimecast.com ([216.205.24.115]:27287 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229784AbhCRJt3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 18 Mar 2021 05:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1616060968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=zXTac+ynosdg7msYxlhu/887gVJ8gwF+TNtagdxLgu4=;
        b=bcqYF94rmaHv228660DUJGhz2dBEH5qX4AoP+IryuTwxDhCnmueTzN0pdlO9/KIPFmjtxX
        PQogSJdWa9hEHt05t8ceO8nfJQlkfEY2Sb4Aa8u7KRZEItbBUN6G0UF5DRU/0OoGLJLBN6
        w3rPessZsy8jAHVpCy+VkXmybKBoE5c=
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-VdnhPzswOHiEZrC8Q4Zqyg-1; Thu, 18 Mar 2021 05:49:26 -0400
X-MC-Unique: VdnhPzswOHiEZrC8Q4Zqyg-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by MN2PR19MB3294.namprd19.prod.outlook.com (2603:10b6:208:152::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 09:49:22 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 09:49:22 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Topic: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Index: AQHXGwlKnpCn2fIGT0qLVmIAnSpIpQ==
Date:   Thu, 18 Mar 2021 09:49:22 +0000
Message-ID: <MN2PR19MB3693318349FCCF3201E8EA80B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20210318075552.GA2331@amd>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e323934-6b34-4e6f-b5ef-08d8e9f31bc7
x-ms-traffictypediagnostic: MN2PR19MB3294:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR19MB3294D98269F0D9F5D75BBD43B1699@MN2PR19MB3294.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 3S+tf06orCVJ/rpajT9hys6/Ospw5N4LR9yLxLwJ703SNLtbf+aswwwwrbJSqMidrQB01BeWr5uZcmZ/Jw80OnRD8W7EsZnA7rpPVOCUJOjTVSkwhophCneefDC+BurpZyjLtDYNSW742eKN4huLgX3UdUpb9YfKof7phUYBGZY5jUJtHlhsFjMEeWwghOLqp/hpVXUknLJjoAiGpynQ4NljkKcECpkPiBlAhBj57cU86/MSS2u/ruxzQSwU4OV2bRoHmNAva3kvJmec7ZDN1HGGhymHV3vxKt0CmB1vH7MGZiKuBg+vX0ng8o8dITXUODEGb8qEUUQTj98Xvp9+LutZH1ZsnjsSr9IuM6vsbTz6ZNGgnm4wrKPbTdVSaZ9VuKj+G9mA+AeqJW1xjrSNedoe6RZWOitl5tQf7iGr+aGV6ujnVjFd69FefwNPlG8rHyuQOU3CYtwCK15br508946OFUigZOXHgUJidnK/8EOPrhOR+nV2eG5qPd81uRekvZWWKIN1/yiDvRf+1mWnBMJMUOLMrpVWhjZvNVgFuudhjOjjcveov/3yLQMWIDe10KfoBdQRTqDkHCx8lOtHbWt/YO1/8TM6A8U+e57r9UoXswA0iBxVNvt6ExorBQwu+tAP88HHAXs7UTa0bKRdHx7NUr/Jps/GdRWMm+y0+yoMAjgh7+t1bF65X/qyFPBce4XUrNcHXUvmtlLEOPd1Fw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39850400004)(52536014)(66446008)(64756008)(2906002)(66556008)(6916009)(7696005)(91956017)(76116006)(966005)(8936002)(8676002)(66946007)(83380400001)(54906003)(316002)(6506007)(5660300002)(9686003)(66476007)(33656002)(107886003)(53546011)(55016002)(71200400001)(478600001)(86362001)(26005)(4326008)(186003)(38100700001);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Sl1XmUbPOK0/L05pMATia9S/6l9EDzqQAJFpbvEUA4l2GGHGmSyi2nlXf087?=
 =?us-ascii?Q?paRzLKwZwK5oR+mWOsKY4oHeGD4jzg0EovG/G7VLr3zpXJniWkvTtVbMSc+Z?=
 =?us-ascii?Q?bk9wuJGb+yuZcAF5B2TbS+wq/SfP0+d5ooC95GmM35ZTpFUowr8H8u54ohd9?=
 =?us-ascii?Q?Im6+mSs9N6vFhAHrczVNMivQuW5hBdMcyY02/0TA6gdcR6PkUe3rePrs1n9z?=
 =?us-ascii?Q?KUYobmVt7UHYVO4PUu4oDBNoB/dpPYza/fRs/HewTJs/xwYDIJgz52fZQtGb?=
 =?us-ascii?Q?w7loxJQTWkMv+qfD3HpfWQ4luvN/Ef8X5r8VkouqQMBln+nXxXhdf+Xx1ouM?=
 =?us-ascii?Q?yjPu9DI2HtUkh7gIDuIvOu68mxM51ULusy7Jjs5JRfHZ3OImGCu7nFBcrXPJ?=
 =?us-ascii?Q?z8W1FwVi/yvvNUdfFaUhiWYnToNRNCRf4tNp2SzQUG6xvggQIKWiz20B88ea?=
 =?us-ascii?Q?Hx/elzxV1pUDCebf+rq8OEZeIri7oQ/9k/ZZ2Vq/OE4KhcQRB9UXGLfheH5i?=
 =?us-ascii?Q?1xw40356Hm5xABnOhdN0TwHtOUK8atasB8ll4Cx3YWoQ/87oWYLWQZpisd0o?=
 =?us-ascii?Q?2a5lSSU3tl4MuXKJLmetNIVm9qiL1+H7aYUCwbAWVa8jWyxCMjlYGEd8sn+l?=
 =?us-ascii?Q?Hz0UJd5WDSkyD6kFWLDkRb7VQGRD1GfUbGJBR8tNGoeR7+wHP3b21uo7XItj?=
 =?us-ascii?Q?JMr7SH6sF55zGvezVnI/sj9S6quMvqLhBv0K3xYGdxUZuWRWxw4P9EUFczq9?=
 =?us-ascii?Q?ZImIfVgXL+y2vX6ujmIa/lPp4X83339SimINWKxTlA6f59ELCZx2ilG6EilD?=
 =?us-ascii?Q?KzJikq5kOAXgZuEVgp9lS0WO6geROqYGwYcyoPVnmvd9XEQfsRQ/I4pk382E?=
 =?us-ascii?Q?cE4zF1L2hntc9DF14MzwSe7Rdz55XXBKI8qtdYriYJejN1h/yPwV6vDlasMC?=
 =?us-ascii?Q?rNFRhGpUqN1AIWx/Kw9oDAN1PiMDbAsD8jLsboHiXiZF0VZGb/gYPXH1UPnY?=
 =?us-ascii?Q?Cv2Xc9PrHEz20XjmNUcl/6GMQNkYTxKyXjjLkm/QpvfTUhNQ8W2Himw/toK3?=
 =?us-ascii?Q?46fxiXgjW6udPyqbXPddBQgSDTlbywSoQRPG+jxOCfz5PIErBnxG7URtQN2D?=
 =?us-ascii?Q?MP3gVY5Hvcwp1f8ej1/y9WgHZ7QI/gQQ+iUlblZ9SgY/gXRAAqh7kl0FgP6m?=
 =?us-ascii?Q?XiojpsOEx7KSlLJGIegcbU0NQ0qN5xTWbT0cQxCDXY+so3oQnRqx33hmduXY?=
 =?us-ascii?Q?7nD8RA6PAqEIKREcL91b8z5OiMLjjCNovBOFwhcoS+ybxLHG3nvayQYM+Php?=
 =?us-ascii?Q?De0nf6+BhlKzFUckL0WfVLzmpfmwZkxiUHX4YaFYsUiKUg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e323934-6b34-4e6f-b5ef-08d8e9f31bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 09:49:22.2894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BvPTD+pYmEn/wBUYoruiOLrQt6ELN+TWAY5st7XpE7BBtocOAn2SNStLz1Go8Oz0krcL5fROUnFOrsR9z0Pqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3294
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

Hi Pavel,=0A=0AOn 18/3/2021 3:55 pm, Pavel Machek wrote:=0A> Hi!=0A>=20=0A>=
  > Remove unnecessary Kconfig symbol LEDS_BLINK=0A>  > Improve Kconfig hel=
p text to make it more useful.=0A>  >=0A>  > Signed-off-by: Rahul Tanwar <r=
tanwar@maxlinear.com>=0A>=20=0A>  > +++ b/drivers/leds/blink/Kconfig=0A>  >=
 @@ -1,21 +1,19 @@=0A>  > -menuconfig LEDS_BLINK=0A>  > - bool "LED Blink s=
upport"=0A>  > - depends on LEDS_CLASS=0A>  > - help=0A>  > - This option e=
nables blink support for the leds class.=0A>  > - If unsure, say Y.=0A>  > =
-=0A>  > -if LEDS_BLINK=0A>  > -=0A>  > -config LEDS_BLINK_LGM=0A>  > - tri=
state "LED support for Intel LGM SoC series"=0A>  > +config LEDS_LGM=0A>  >=
 + tristate "LED support for LGM SoC series"=0A>  > depends on GPIOLIB=0A> =
 > depends on LEDS_CLASS=0A>  > depends on MFD_SYSCON=0A>  > depends on OF=
=0A>  > help=0A>  > - Parallel to serial conversion, which is also called S=
SO=0A>  > controller,=0A>  > - can drive external shift register for LED ou=
tputs.=0A>  > - This enables LED support for Serial Shift Output controller=
(SSO).=0A>  > + This option enables support for LEDs connected to GPIO line=
s on=0A>  > + Lightning Mountain(LGM) SoC. These LEDs are driven by a Seria=
l=0A>  > + Shift Output(SSO) controller. The driver supports hardware=0A>=
=20=0A> What is Lightning Mountain? The codename is not widely known. Where=
=0A> can we find that hardware? Notebooks? Phones? Only some development=0A=
> boards?=0A>=20=0A=0ALightning Mountain is generically a network processor=
 with a primary=20=0Atargeted application as Gateway SoC. It has already be=
en added as a=20=0Avalid Intel Atom processor variant in=20=0Aarch/x86/incl=
ude/asm/intel-family.h as below:=0A=0A#define INTEL_FAM6_ATOM_AIRMONT_NP=09=
0x75 /* Lightning Mountain */=0A=0APlease see [1].=0A=0A=0A> If user is not=
 likely to need the driver, say so.=0A>=20=0A>  > + blinking with a configu=
rable LED update/blink frequency in two=0A>  > + modes, 2/4/8/10 Hz in low =
speed mode and 50/100/200/250=0A>  > KHz in=0A>=20=0A> kHz? But I guess we =
don't need that here.=0A>=0A=0AWell noted. Will update in V2.=0A=0A=0A>  > =
*=0A>  > - * Copyright (c) 2020 Intel Corporation.=0A>  > + * Copyright (c)=
 2021 MaxLinear, Inc.=0A>  > */=0A>  >=0A>=20=0A> I don't think you can do =
that, and I don't think you should be doing=0A> it in the same patch.=0A=0A=
=0AWell noted. Will revert it back now and update later in a separate=20=0A=
patch. Thanks.=0A=0A=0A>=20=0A=0ARegards,=0ARahul=0A=0A[1]=20=0Ahttps://git=
hub.com/torvalds/linux/blob/master/arch/x86/include/asm/intel-family.h=0A=
=0A

