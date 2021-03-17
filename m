Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9D333EE00
	for <lists+linux-leds@lfdr.de>; Wed, 17 Mar 2021 11:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCQKFD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Mar 2021 06:05:03 -0400
Received: from us-smtp-delivery-115.mimecast.com ([63.128.21.115]:38246 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229841AbhCQKEs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 17 Mar 2021 06:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1615975487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=8/m6J9FMAX9cPANHgw4R6eh5Scd8Q93QgR+jvdX3K/s=;
        b=NZDmQ0um7C3Kae2FdKodcXqkD+eVMW+jNAOLRuRvXl1/yLvb6u5sJV6kasJGm6ZI3Ls8g3
        vFfhMy/sqotZ8mCp6EQI3VwwhBN3N5s3Yh050+gAApfLIxZGppzdmTC1Wg3dIAqQGwV8TC
        IICYaqTAOkV85Eiqnz2AksF5agPPAZg=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-bDpi-L5yOkOYVT0bDry9yg-2; Wed, 17 Mar 2021 06:04:45 -0400
X-MC-Unique: bDpi-L5yOkOYVT0bDry9yg-2
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by BLAPR19MB4532.namprd19.prod.outlook.com (2603:10b6:208:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 10:04:41 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 10:04:41 +0000
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
        Qiming Wu <qwu@maxlinear.com>,
        Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Topic: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Index: AQHXGwlKnpCn2fIGT0qLVmIAnSpIpQ==
Date:   Wed, 17 Mar 2021 10:04:41 +0000
Message-ID: <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68df1551-5254-4f4e-1abe-08d8e92c1541
x-ms-traffictypediagnostic: BLAPR19MB4532:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR19MB453204BEC17D37BB09FA9976B16A9@BLAPR19MB4532.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: GJtMkGSbMaa/1y0c2ohQ8jfzaRoREauWNtbOINNXnDKm1d863WqKsxP40Bdq6OYv2rJKuCKrD5KC1fVecnny0te9HEYGTXBr7DTToDRvE51yNlhrgJ35VxkO4QunUPQM+zMIbe9PJP1SjOzO6vKpl4HzmJm32QOaLQePnPqjTA+cpjVOV/ONmjV82IA8m9tf9lG9ClGMKWs6kT9F3Sj53hKxAvp0W5gAbjFA5CPM9PDH/KbYH/XOfQ4sv/uBo00PtQyoSCR3GXNPbMXF+yeVvtc19eFS5xzn2wXHiyg+qPg9dB47vn4lhuyIgSZsTy5v7rNJc2/Xg2uwlu5slNuIe+mbSdVEkHM9U4bdjj/3VBhw6OHy6PmXvJBfd4IbLfOcYpaxFAvQKHJW/DYBT1h7jq9AQGI4HEbfwM0KvDeGeQCnbVWHlYS1ovFIn3C643mU1w0n79yxckNPS8MVgLTclh7v5XHaimEmBju05LO9zuWyqoAlxKh0WUaoDneDtdbFijXREyHpoOs5GlX3uTJyMnzQBsxSKhzDlRR/AOtBpAbX8OiprXO70IizaRo/CvKQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(54906003)(8676002)(316002)(33656002)(5660300002)(91956017)(8936002)(107886003)(186003)(4326008)(83380400001)(52536014)(76116006)(2906002)(6916009)(7696005)(478600001)(71200400001)(6506007)(66556008)(66476007)(9686003)(64756008)(66446008)(66946007)(86362001)(55016002)(26005);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?M4NagPKsK+99fyypKuVwX60i1SBScH+PE0rT/GyueizagpOPNHR9jXExZGbK?=
 =?us-ascii?Q?66sNwy/NOYP1lvdanIo34Yx3sJsZE54/iqc0KsOVhPAOJRj8yz+/fJ6VM/gV?=
 =?us-ascii?Q?o7sY46n4u4qFFp2n1ajvvDUxQooGYgdyiRgSZCYNhvHi/UJ1mT06vg6JJOQM?=
 =?us-ascii?Q?6RY2Et5wJpCtQe9TwThE1FByZp46+KU2V8Wo+wcAMfqfP+XvXZz01Gawk7zd?=
 =?us-ascii?Q?m9bQB0NnpRrPgzAJJVpS6GyDA1nrfuOsYAK30FOHb+CicXKLPwOFtT56LqDG?=
 =?us-ascii?Q?zPzQUczWKsn5vyv2u/7FzESJ6DH+OqIRWxp/Pwr1Tsp99afz9fgSZADhlFou?=
 =?us-ascii?Q?0IuAxVTJFzqBC7HGUjnTxiVn3yMTGGv1fds/8wZlfID3KNnZbUOff6K0Vvkn?=
 =?us-ascii?Q?epCmUHLE8YPlqHwl7QFiiB4K5DYjpCvyED4KUDvM/igyT5e3vspMBd32wike?=
 =?us-ascii?Q?6+L1JjXxenxakiY/tCz5EJpw+R6QhRXe3OHlzYkUUOpmKwOIq5DE2+fPvAL0?=
 =?us-ascii?Q?5bRxfbWNEqQu6HFKww2MhL/6YVLkp/OMZlHDntvbD4/0ahBKnIYvNJ7Ad8sF?=
 =?us-ascii?Q?n0IkmswPM2adEvgWrXdNmBQ9fzMAT/+/9PrlWp4eyD+YFjTsek0untlIJj3E?=
 =?us-ascii?Q?yISa4dpkW50ZcZU+stlATiGAo485putm6oTy+UpPg7dkGX1MtPl2jjPIdeua?=
 =?us-ascii?Q?v+R6OEoPhqkmfc0Q+lSj0Rpyl39SZwuXEXSLnlpXcjfBM/xqhHwbak6pcBpP?=
 =?us-ascii?Q?8TgV6DEYhvEf0ttf+G7ocJ+N8liXGtapIfr5YjSAtaXWzN9J+/Vm685PXkdo?=
 =?us-ascii?Q?e6Wf1T5Wxpk/IvPpxYk2vmCsgEG2jITd2BtJEZykmYNMlXNmSkm/DOR75Bx4?=
 =?us-ascii?Q?EfFz7UpKOO1kVVNsfd3eP0nOOgBzqaIOBG5F+l2TBJB69/0Bbkb8WyO40k8+?=
 =?us-ascii?Q?g4Vz4HwXgqc1VruJnvJOvyaEx+RBxtjf4DayEZbmWFcPxWK/H8MarpqhaJYB?=
 =?us-ascii?Q?l1QsbVYC1OOkhDdj+h7SeJw4D2ylqKxPnCH4Y279azfuUgo8bHk9dcuRxiy/?=
 =?us-ascii?Q?QKWtsSITf1M7UaFMGRaHHlkwrb4+YbR3tLuQdJHFnmGjCQ7ieMh+uRNQzKv2?=
 =?us-ascii?Q?yLNS2JQKA3oKLgNzB2pRa72tTtveJ27Rz6waes+7i1ie4wfnpm6cwoEvFqcY?=
 =?us-ascii?Q?e82L2N68HIvgCQdN6L9Z6+5I7eb4FHzYzL9OD8gO3QG6a09juc4zok0WpKuX?=
 =?us-ascii?Q?NMiMvKJ97gK9mNkK68qcmM4gOaumbD/sGrigvDSHq44c/8sJ17bJufHAYTbS?=
 =?us-ascii?Q?JzCjFkvhExxepRM20y5fLnmpEYHdrn9+4gS+HFa1D9lV0w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68df1551-5254-4f4e-1abe-08d8e92c1541
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 10:04:41.6007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ei262Q82aOo2i/NFsRQLaz1Fw83jg71ZgJPAA5dDp7L9mEDhMYzXNIWWKCVVu8XOo40h371C2b4Qk8jtmh22aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4532
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

Remove unnecessary Kconfig symbol LEDS_BLINK=0AImprove Kconfig help text to=
 make it more useful.=0A=0ASigned-off-by: Rahul Tanwar <rtanwar@maxlinear.c=
om>=0A---=0A  drivers/leds/Kconfig              |  5 ++---=0A  drivers/leds=
/Makefile             |  2 +-=0A  drivers/leds/blink/Kconfig        | 28 ++=
+++++++++++---------------=0A  drivers/leds/blink/Makefile       |  2 +-=0A=
  drivers/leds/blink/leds-lgm-sso.c |  4 ++--=0A  5 files changed, 19 inser=
tions(+), 22 deletions(-)=0A=0Adiff --git a/drivers/leds/Kconfig b/drivers/=
leds/Kconfig=0Aindex b6742b4231bf..4ca8cd594518 100644=0A--- a/drivers/leds=
/Kconfig=0A+++ b/drivers/leds/Kconfig=0A@@ -928,13 +928,12 @@ config LEDS_A=
CER_A500=0A           This option enables support for the Power Button LED =
of=0A           Acer Iconia Tab A500.=0A=0A+source "drivers/leds/blink/Kcon=
fig"=0A+=0A  comment "Flash and Torch LED drivers"=0A  source "drivers/leds=
/flash/Kconfig"=0A=0A  comment "LED Triggers"=0A  source "drivers/leds/trig=
ger/Kconfig"=0A=0A-comment "LED Blink"=0A-source "drivers/leds/blink/Kconfi=
g"=0A-=0A  endif # NEW_LEDS=0Adiff --git a/drivers/leds/Makefile b/drivers/=
leds/Makefile=0Aindex 2a698df9da57..7e604d3028c8 100644=0A--- a/drivers/led=
s/Makefile=0A+++ b/drivers/leds/Makefile=0A@@ -110,4 +110,4 @@ obj-$(CONFIG=
_LEDS_CLASS_FLASH)              +=3D flash/=0A  obj-$(CONFIG_LEDS_TRIGGERS)=
            +=3D trigger/=0A=0A  # LED Blink=0A-obj-$(CONFIG_LEDS_BLINK)   =
             +=3D blink/=0A+obj-y                                  +=3D bli=
nk/=0Adiff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig=
=0Aindex 6dedc58c47b3..2de2973fbc6b 100644=0A--- a/drivers/leds/blink/Kconf=
ig=0A+++ b/drivers/leds/blink/Kconfig=0A@@ -1,21 +1,19 @@=0A-menuconfig LED=
S_BLINK=0A-       bool "LED Blink support"=0A-       depends on LEDS_CLASS=
=0A-       help=0A-         This option enables blink support for the leds =
class.=0A-         If unsure, say Y.=0A-=0A-if LEDS_BLINK=0A-=0A-config LED=
S_BLINK_LGM=0A-       tristate "LED support for Intel LGM SoC series"=0A+co=
nfig LEDS_LGM=0A+       tristate "LED support for LGM SoC series"=0A       =
  depends on GPIOLIB=0A         depends on LEDS_CLASS=0A         depends on=
 MFD_SYSCON=0A         depends on OF=0A         help=0A-         Parallel t=
o serial conversion, which is also called SSO=20=0Acontroller,=0A-         =
can drive external shift register for LED outputs.=0A-         This enables=
 LED support for Serial Shift Output controller(SSO).=0A+         This opti=
on enables support for LEDs connected to GPIO lines on=0A+         Lightnin=
g Mountain(LGM) SoC. These LEDs are driven by a Serial=0A+         Shift Ou=
tput(SSO) controller. The driver supports hardware=0A+         blinking wit=
h a configurable LED update/blink frequency in two=0A+         modes, 2/4/8=
/10 Hz in low speed mode and 50/100/200/250 KHz in=0A+         high speed m=
ode. The LEDs can be configured to be triggered by=0A+         SW/CPU or by=
 hardware. Say 'Y' here if you are working on LGM=0A+         SoC based pla=
tform.=0A+=0A+         To compile this driver as a module, choose M here: t=
he=0A+         module will be called leds-lgm-sso.=0A=0A-endif # LEDS_BLINK=
=0Adiff --git a/drivers/leds/blink/Makefile b/drivers/leds/blink/Makefile=
=0Aindex 2fa6c7b7b67e..fa5d04dccf13 100644=0A--- a/drivers/leds/blink/Makef=
ile=0A+++ b/drivers/leds/blink/Makefile=0A@@ -1,2 +1,2 @@=0A  # SPDX-Licens=
e-Identifier: GPL-2.0=0A-obj-$(CONFIG_LEDS_BLINK_LGM)   +=3D leds-lgm-sso.o=
=0A+obj-$(CONFIG_LEDS_LGM) +=3D leds-lgm-sso.o=0Adiff --git a/drivers/leds/=
blink/leds-lgm-sso.c=20=0Ab/drivers/leds/blink/leds-lgm-sso.c=0Aindex 7d5c9=
ca007d6..e41143a87e20 100644=0A--- a/drivers/leds/blink/leds-lgm-sso.c=0A++=
+ b/drivers/leds/blink/leds-lgm-sso.c=0A@@ -1,8 +1,8 @@=0A  // SPDX-License=
-Identifier: GPL-2.0=0A  /*=0A- * Intel Lightning Mountain SoC LED Serial S=
hift Output Controller driver=0A+ * Lightning Mountain SoC LED Serial Shift=
 Output Controller driver=0A   *=0A- * Copyright (c) 2020 Intel Corporation=
.=0A+ * Copyright (c) 2021 MaxLinear, Inc.=0A   */=0A=0A  #include <linux/b=
itfield.h>=0A--=0A2.17.1=0A

