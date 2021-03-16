Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671BC33D030
	for <lists+linux-leds@lfdr.de>; Tue, 16 Mar 2021 09:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhCPI5W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Mar 2021 04:57:22 -0400
Received: from us-smtp-delivery-115.mimecast.com ([216.205.24.115]:29152 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235866AbhCPI5C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Mar 2021 04:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1615885022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=FvILtbiCxppFS63PA60LDPVQOEvg9MfOZMI+938mH7k=;
        b=pP3jyPj3SxmYReYgvulXZLF9rca4Q9wIrpwkYnIs5Ji5D0k/FAxb3VXnS6/97CiXcEGYRy
        FZsaTb1Nr2U3LHbw3R7ia9W4rioJG4/KuMcikNSwkIzQ/PNyuImXikyoKTzFgcXyxt79zz
        KP0wwkQeZV6VGGPCK4jExYzZWJQpxtg=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-4F2l5w7ROCqm89FgncxaTA-1; Tue, 16 Mar 2021 04:57:00 -0400
X-MC-Unique: 4F2l5w7ROCqm89FgncxaTA-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by MN2PR19MB3726.namprd19.prod.outlook.com (2603:10b6:208:18f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 08:56:54 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 08:56:54 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Arnd Bergmann <arnd@kernel.org>, Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH] leds: lgm: fix gpiolib dependency
Thread-Topic: [PATCH] leds: lgm: fix gpiolib dependency
Thread-Index: AQHXGX/MNzC5XhZ7M0WJOlGvthYGUg==
Date:   Tue, 16 Mar 2021 08:56:53 +0000
Message-ID: <MN2PR19MB3693DDA96346488BF0A422D3B16B9@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <MN2PR19MB36933AFDC4531D0F7A984608B16C9@MN2PR19MB3693.namprd19.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44589e63-9e4e-4122-1bef-08d8e8597257
x-ms-traffictypediagnostic: MN2PR19MB3726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR19MB37261C3094D58323054B746AB16B9@MN2PR19MB3726.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: VWLpBecTu9XbuRp95NDrmoWxYe1hpyz/TsdWYuYUkxrdwRx/XESpoMZcMlf5ogYKuUOQkZQ8AlkGIbRXRF4gBLnAeXCaJab884vh4oIKDamesELeoHLc4OvACmfpkF7yl040sT60sLYx6uWzQzG/SCdBGerWv8gxzP4oB38qJysShRGEUu8fvxox4737Y6IzDJRqqUJ+9gqFGAk2BlQ6pHHCIVfr9cG7p7mUabnp9+C86bO8fEl+Dbqd1DtPV/QVmJ1RKRfqh/CbPSge7hgOogQ09oAFAIZwLrSkjyROsGCutVwkpe58y02OIz4lExubdLgmAzWg2de84t/WgafcZGnBiJ8mRz9wDyCRWEDeEg2q4L1qxpd7Z8R7wxYWcREvis/tLwaH5/eRSb1yAx+4O70vHUY27m1NHbz1EQFgKpCGIKF+gL2eKyyANUDPN2PeFphJJM5lIn+TvuFc8BSNF+5JXfJRwsncm2pLwalb78BqnGVm/sdIIfllEkcfftTk5Dj3zbywhHBdk+sfaLgSrK4B0IspvEP0RIKm+lCTE0+q0lNb3D7ZBVYPMQNOscrkGv+JZe84d0WzdwZo35VSQnWIIeQHaQ1qxagdaL3oitbhagGd5P+f97YH89lOtabnDepvgFFKCsQIJwDxrr+SCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(4326008)(26005)(8936002)(66476007)(110136005)(316002)(6506007)(7696005)(478600001)(33656002)(186003)(54906003)(53546011)(55016002)(64756008)(5660300002)(52536014)(9686003)(2906002)(71200400001)(86362001)(8676002)(66946007)(83380400001)(107886003)(76116006)(91956017)(66556008)(66446008);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Hh/mZOQCKL5OMbzk9pk5B57pU17s4kMV0zhDTWs6ZEz8OeshYau8PPBfi/GR?=
 =?us-ascii?Q?CuSQ1KX87c5gNbOAm+vKf5A820ueCrQqXzY2KQvsI1DJiTKQWlicl1rB7WlV?=
 =?us-ascii?Q?8UFPqtRU1v3feP6NzO3eQ0ggeo5xUDZ+Tf1LSwsYDaXsLAhf0mwJ2B19wseB?=
 =?us-ascii?Q?ZAnHo63i1wGkQLqVqgdEwjDEfKS80mfTvpfY7CzvZ0c8dFuv8CQb0dQ5Jh2f?=
 =?us-ascii?Q?wMJwLOnBF1kdEXuPG+KAfpTfU4MVX1ljsR+MqPv+54W5Qno/bnqrVGX6iAiH?=
 =?us-ascii?Q?deiokO7ftDnaDzOsH9c/2qSoBNZSdQj80Jv6M7NdDI79OCEA/OCucqF/IG3z?=
 =?us-ascii?Q?A5n7EwMlP8bCN0vjjN/wh2E/ousQ32xRYkrxOg+r4RtUlL4xNKTxfFTj2oJ8?=
 =?us-ascii?Q?bCEHZKLJ5KuQ3HsWloSZ2FVJd88uqcoWe36c7n/HsmiBh4mLXaLm4f/bssyJ?=
 =?us-ascii?Q?vO8/VY3ZUP+oFzVBx+6LjiryQx7D1qDTTJ5P06iu7fwxAcGF99EWrct9nWE6?=
 =?us-ascii?Q?teG4FGeAfQUlfyDZ2lYdrQd7UP51N8O9Z83NFwTRdibpxLmrOmH869PkYz+4?=
 =?us-ascii?Q?vtsYSHcU76TmxAwpw8Lysi3KRKG2Q/P9Vnfznv1iqn36FGyHvwPf4GuC4Ks/?=
 =?us-ascii?Q?3y+10AeMnll7nCwQTnevahZQjeKar4Mrbj6bxsQlYWZ7dkUUKCCdeh2xm0Xw?=
 =?us-ascii?Q?0+XrxJlzV8uETvSsBuMWQCwIf4MWogmP6M8zPlxpNrI1bXW0giOlWuRd54bW?=
 =?us-ascii?Q?TlMLde4Nn13UsFqnbk8R7tn4BKJsY2FxjFok/sMj76z3EjGL4MaYINB06CA5?=
 =?us-ascii?Q?16HvxDxQ3rv9pNAk3Xu/cbDmOIj7bToO6OB7sq0mqVWp6xXsaPy4+3bz+oEw?=
 =?us-ascii?Q?2hJGyXEJpCeAYB2O78XW+2poWqC9d6PA5LRXuPoxCuNSafRII25kFKUX+aXK?=
 =?us-ascii?Q?Pmuy351oZhZqBSl4/fgLAOZS33WS0De5MVyEA/WSxDOd9/3oSzVOuCI+9X9S?=
 =?us-ascii?Q?u6tuK0nZKjc5+XtqcNJcXi2ovvP++auFHfH87QyCJZcauj4RfYAgIyiNf810?=
 =?us-ascii?Q?gXfL3tK35C3xyPXjDjd7wwntwjMt6vNJcA98dXTgEjOguccUE5ySVbPTH6v3?=
 =?us-ascii?Q?YZ2vJ9EDJHiYxJ5QZgCXDF8oEZm/UYb6nvi9G/RDB13QVPgDywpGLiunoGq9?=
 =?us-ascii?Q?PrOLZ8oDL6Vt3IDlChhS4lrte7gRbC6QKnh38dXceRF3A6+VwvJtiFC1Kw9Y?=
 =?us-ascii?Q?J7SEoSaBbXDzRqvm4PRW0nLJyz5VHeI4e3XZsftrw1wwGSbtkmHQULYtTKkC?=
 =?us-ascii?Q?ftOYScONBbQjgarg+1BTUuF6uPNz/PZGviwuYjbR8Zy5kA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44589e63-9e4e-4122-1bef-08d8e8597257
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 08:56:53.9510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clRJZqQ/cO71mFAY44MbDo2FFvSOZrasvVvvg2vR+hkTj1Ero4afzLIazp//0Rri9vNEPdT5OBk9+R7YxjHbuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3726
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 15/3/2021 5:44 pm, Rahul Tanwar wrote:=0A> From: Arnd Bergmann<arnd@kern=
el.org>=0A> To: Pavel Machek<pavel@ucw.cz>,=0A> =09Amireddy Mallikarjuna re=
ddy=0A> =09<mallikarjunax.reddy@linux.intel.com>=0A> Cc: Arnd Bergmann<arnd=
@arndb.de>, Dan Murphy<dmurphy@ti.com>,=0A> =09linux-leds@vger.kernel.org,l=
inux-kernel@vger.kernel.org=0A> Subject:[PATCH] leds: lgm: fix gpiolib depe=
ndency  <https://lore.kernel.org/lkml/20210308153052.2353885-1-arnd@kernel.=
org/#r>=0A> Date: Mon,  8 Mar 2021 16:30:46 +0100=0A> Message-ID:<202103081=
53052.2353885-1-arnd@kernel.org>  (raw  <https://lore.kernel.org/lkml/20210=
308153052.2353885-1-arnd@kernel.org/raw>)=0A>=20=0A> From: Arnd Bergmann<ar=
nd@arndb.de>=0A>=20=0A> Without gpiolib, the driver fails to build:=0A>=20=
=0A>      drivers/leds/blink/leds-lgm-sso.c:123:19: error: field has incomp=
lete type 'struct gpio_chip'=0A>              struct gpio_chip chip;=0A>   =
                            ^=0A>      include/linux/gpio.h:107:8: note: fo=
rward declaration of 'struct gpio_chip'=0A>      struct gpio_chip;=0A>     =
        ^=0A>      drivers/leds/blink/leds-lgm-sso.c:263:3: error: implicit=
 declaration of function 'gpiod_set_value' [-Werror,-Wimplicit-function-dec=
laration]=0A>                      gpiod_set_value(led->gpiod, val);=0A>   =
                   ^=0A>      drivers/leds/blink/leds-lgm-sso.c:263:3: note=
: did you mean 'gpio_set_value'?=0A>      include/linux/gpio.h:168:20: note=
: 'gpio_set_value' declared here=0A>      static inline void gpio_set_value=
(unsigned gpio, int value)=0A>                         ^=0A>      drivers/l=
eds/blink/leds-lgm-sso.c:345:3: error: implicit declaration of function 'gp=
iod_set_value' [-Werror,-Wimplicit-function-declaration]=0A>               =
       gpiod_set_value(led->gpiod, 1);=0A>                      ^=0A>=20=0A=
> Add the dependency in Kconfig.=0A>=20=0A> Fixes: c3987cd2bca3 ("leds: lgm=
: Add LED controller driver for LGM SoC")=0A> Signed-off-by: Arnd Bergmann<=
arnd@arndb.de>=0A> ---=0A>   drivers/leds/blink/Kconfig  <https://lore.kern=
el.org/lkml/20210308153052.2353885-1-arnd@kernel.org/#Z30drivers:leds:blink=
:Kconfig>  | 1 +=0A>   1 file changed, 1 insertion(+)=0A>=20=0A> diff=20=0A=
> <https://lore.kernel.org/lkml/20210308153052.2353885-1-arnd@kernel.org/#i=
Z30drivers:leds:blink:Kconfig>=20=0A> --git a/drivers/leds/blink/Kconfig b/=
drivers/leds/blink/Kconfig index=20=0A> 265b53476a80..6dedc58c47b3 100644 -=
-- a/drivers/leds/blink/Kconfig +++=20=0A> b/drivers/leds/blink/Kconfig @@ =
-9,6 +9,7 @@ if LEDS_BLINK  =20=0A>   config LEDS_BLINK_LGM=0A>   =09trista=
te "LED support for Intel LGM SoC series"=0A> + depends on GPIOLIB   =09dep=
ends on LEDS_CLASS=0A>   =09depends on MFD_SYSCON=0A>   =09depends on OF=0A=
> --=20=0A> 2.29.2=0A>=20=0A=0AAcked-by: Rahul Tanwar <rtanwar@maxlinear.co=
m>=0A=0A=0A

