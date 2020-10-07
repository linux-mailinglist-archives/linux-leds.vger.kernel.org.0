Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3EC28587A
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 08:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgJGGH3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 02:07:29 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:36911 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgJGGH3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 7 Oct 2020 02:07:29 -0400
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7d5b1d0000>; Wed, 07 Oct 2020 14:07:25 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 06:07:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 7 Oct 2020 06:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YV3TqIc3chTJNCHhIfa2GtKeiDVjo81/akhaVdCQ0/tNMMrfybHOBvT/TxPNOnmODs1Gcye9LmY6HZ9piMU8wTp+kVw6HAvCMryP7mr3x4NIFAf6udcwcAe02KmWcY2Y6x0sJDb3XEj5+Od/N7aCMVvhY7mscaQmedk3vPuNPwGbAoPaY9in9sm3zTizwL7IEaUDY2Kemvy1uXRcsyMqoJULEjUcODwQgiVlxk4IFJy2GOY2WVSj1e89W0xjfxEUYE7m2t5s1QJ4MIRA6OMDYXSpAeaMsilkliiBiH3HzcLs0Q3rLmar9qpvb1oXI9clIhHk1vvGefn74WG9tGYUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNrpNr+q1B4KkKoZCUm+8NEq1jpS95y5gQpZSdIdpc0=;
 b=Q6VfDlSxjiBnSco7YLcXRUb+clhkF/QlomtP2Gi28qclFBLFRmkiJfwjlcWNAKQltjK9dn1fm69f2Ae1a2ikLlbiqxyO9WxWKOLyiK/rexACuFMS3+D780nh2lXg6qLaxUTfrbVbLEvzouhwzXHn7NYMRXjWbbs2P8gt30uUqJvRv/Mak4tCiBJ1jv2ivgucKUKHxizFFvY4Hh/Dv6vKBsaq1dXvWutf65xZ0RUFloeg5RNyaVYzzPZQDay10jchOMSvrWFoqHmR9B+yWEcmLMO5TeR+YbfmU9R+QYHYEwxzRzWTIuSZ+KqPOV/y/TGanfB+DEhKFciUizP1OLob0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB2534.namprd12.prod.outlook.com (2603:10b6:4:b4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 06:07:23 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484%5]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 06:07:23 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Marek Behun <marek.behun@nic.cz>
CC:     "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amLNSKAgABrK4A=
Date:   Wed, 7 Oct 2020 06:07:23 +0000
Message-ID: <DM6PR12MB3898A52EC09BDD408A6029B7AF0A0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007011527.420e03b2@nic.cz>
In-Reply-To: <20201007011527.420e03b2@nic.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nic.cz; dkim=none (message not signed)
 header.d=none;nic.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [109.186.235.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd05bf29-218e-4c96-e82e-08d86a8741f5
x-ms-traffictypediagnostic: DM5PR12MB2534:
x-microsoft-antispam-prvs: <DM5PR12MB253445F2F17846BFB7F2C3FAAF0A0@DM5PR12MB2534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:334;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFqHg88tyD6JZUsKbkyxPEk6B3FUdjwZLYDSBVjYq8BKmvVie5S+JejUL4vz1zj9QAaIg6aZ66Gi2XDlbAfstkt5vHoRL/VHW9IoFBqHABnYupzael/LueUvOqgBHLLYy/ftf2UD+ZxkS32HnzeLg2vSR1Q1RhOyIVG1VdCi2xrQjw1lS/xf1T5q28TmHzCK4M0oVDSa/7sDzlXBiNGjjh9lGM7Sges+GAK6oSSiGwuUyCX+HidxMKrH4cw2jtwQjPT+Ys9LVxLufDNm/iHHQouRI8n7OVdRibLjuHHOXCyut4oxhffy+LVkMfdZANetu3Yp74eoRo1TIFhu5yOxLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(316002)(9686003)(54906003)(26005)(186003)(53546011)(71200400001)(83380400001)(4326008)(33656002)(6506007)(55016002)(478600001)(2906002)(86362001)(6916009)(76116006)(5660300002)(7696005)(52536014)(8936002)(8676002)(66476007)(66946007)(66446008)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: vrDWulyHbz5aPuE+EH5p0LG/89iOoKIb+G15zuiPBBEBMHWOEYYaQXxdxlCI78J5N7Ic30KqgrWy2CKQOSN/XdM0DRpUTt3Ww5LwVT0+cdXmdCcqs2FOWaYKNY8NcPuS+WwuB1kqnNvKoE44+hWfEiVmPihqBJ18krjccoPhBAxQ7EzegHzU20RW1LXLjbhP4MerTCEsnlCZRJoR1JGmDqqFSoO7CIF21kgT475ipiWTDdweDRQmvgGjMWD93S9/tCZOajuibzK4LhFGiRqxWVDJznFtud2b/ytBBNeopAm5Fl2YkUz2IvOZ63cKKfzszR+dKmqvcRDZPgX6OGzTNyCXIxv1sZvGihq5bPFlNtCXa38D72RO6zyuP91Pm2j6RpID/d3ntM+9uR8qMeXQ7yLjBQimPP74RSA38kZB5gLdeiaqN3P7XidXe5FJ9HoDfOl9m4AiuNxufSkptNWUaHyAoLYCuvvBr2Cc9+0Wj8iub5Mgj6qDX5mwUfvr1j+wKc8PjCp1/O+SWiWNARh6iRK7i2u/MfdszlqDV++s4Un/RcVk/gAcsejVuSXVYpdbgyshGAhjRr2He/OvvgblkhBUoDXjKL9RwKllAvIlx/MEWMbh26mTDboW0803KASyxMagUvTlnloUEKGpwYkbVA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd05bf29-218e-4c96-e82e-08d86a8741f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 06:07:23.2449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtHLDs4aROBDNEcU2cEWoN8xEDVl8io3g1tYcYGD8YiHxpDWucp/sTr/edhbiD5i8REAOEIE12xVGU5SLJ8++w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2534
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602050845; bh=eNrpNr+q1B4KkKoZCUm+8NEq1jpS95y5gQpZSdIdpc0=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=Pb7f1AoDg9mKNTEgS+nDNlBqm1Yq9ylacuGu34E7qoWdi1ECVqk0kysJkqCLVROnq
         GaL0w00qKiW6ZF/FrLHM8mfNVtMbBMcoLmaDG78PvfOpy6yDcHPbeU7IyEmzX2tXnx
         PZ+onDwVrCN0mmyr8QwpZOHu7uOwEi/91HVQ2+R6F/JnO4C1aBTeuL6VPauruTXgYw
         m0Ye2VRZy7jNR0JWbKQ4RnzBXysyGzc4SOYERsgbMUUmtb9pRhdbnivEKz0GMibr+2
         7ktawGiPYC1ZCguZjrEDrEWemeSF/xthDh8zSis2RU48vvpk4Ni0R0Uy8Isti3RXgn
         TzDuN5BB4D41Q==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Marek Behun <marek.behun@nic.cz>
> Sent: Wednesday, October 07, 2020 2:15 AM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: jacek.anaszewski@gmail.com; linux-leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> On Tue,  6 Oct 2020 19:58:50 +0300
> Vadim Pasternak <vadimp@nvidia.com> wrote:
>=20
> > It could be more than one instance of LED with the same name in the
> > modular systems. For example, "status" or "uid" LED can be located on
> > chassis and on each line card of modular system.
> > In order to avoid conflicts with duplicated names, append platform
> > device Id, which is unquie, to LED name after driver name.
> > Thus, for example, "status" LED on chassis is to be called, like it is
> > called now on non modular systems, on which platform device Id is not
> > specified: "mlxreg:status:green". While for the line cards LEDs it
> > will be called like: "mlxreg48:status:green", "mlxreg66:status:green",
> > etcetera.
>=20
> :( what types of modules are these? Are they hotpluggable network adapter=
 or
> something like that? What should I imagine for example mlxreg48 device to
> be?

This is new modular systems which could be equipped with
the different types of replaceable line cards and management
board. The first system flavor will support the line cards
equipped with Lattice CPLD devices aimed for system and
ASIC control, one Nvidia FPGA, and Nvidia Mellanox gearboxes for the port c=
ontrol and with 16x100GbE QSFP28 ports.
The next line cards flavors are supposed to be equipped with 8x200Gbe QSFP2=
8 ports, 4x400Gbe QSFP-DD ports and few
flavors of smart cards equipped with Nvidia ARM CPU.

System is equipped with management card and has eight
slots for line cards.
All these line cards are replicable.

The system is based on Nvidia Spectrum-3 ASIC.
The switch height is 4U and it fits standard rack size.

>=20
> Btw it would be nice if mlx-platform was converted to Device Tree API ins=
tead
> of registering each device in a system by hand.
>=20

mlx-platform activates tens other platform drivers.
So this is a huge change, which will require huge amount
of new definitions for DT API - actually if will be register
map description at bit granularity.

I can think about it for the future.

Which real benefits you see from such move?
Currently all our system are based on x86 arch.

Vadim.

> Marek
>=20
> >
> > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> >  drivers/leds/leds-mlxreg.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
> > index 82aea1cd0c12..53130a8656b1 100644
> > --- a/drivers/leds/leds-mlxreg.c
> > +++ b/drivers/leds/leds-mlxreg.c
> > @@ -228,8 +228,12 @@ static int mlxreg_led_config(struct
> mlxreg_led_priv_data *priv)
> >  			brightness =3D LED_OFF;
> >  			led_data->base_color =3D MLXREG_LED_GREEN_SOLID;
> >  		}
> > -		snprintf(led_data->led_cdev_name, sizeof(led_data-
> >led_cdev_name),
> > -			 "mlxreg:%s", data->label);
> > +		if (priv->pdev->id > 0)
> > +			sprintf(led_data->led_cdev_name, "%s%d:%s",
> "mlxreg",
> > +				priv->pdev->id, data->label);
> > +		else
> > +			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> > +				data->label);
> >  		led_cdev->name =3D led_data->led_cdev_name;
> >  		led_cdev->brightness =3D brightness;
> >  		led_cdev->max_brightness =3D LED_ON;

