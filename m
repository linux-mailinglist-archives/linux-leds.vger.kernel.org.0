Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A222C3F79
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgKYMBO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:01:14 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18791 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgKYMBN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 07:01:13 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fbe47880001>; Wed, 25 Nov 2020 04:01:12 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 12:01:12 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.51) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 25 Nov 2020 12:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HomxB9Vu97t7M1z38c1qdGYs8YP7Cl+FjQ1PXwe97IbLTvk7OoL2AgG2ojOBgANonNlJvOqrk/hYneGccNekscqK/4XwJvqUQIHnxO7SLMgw/Ki/7sp2AMzbS76TFd4HhJOcZ3Nxom+QZ28bxaA7qd5RMbDuYjnFmBMIk0UYYoqNCjVEvc7vcc7wqFOioAM96tZC86myRf1GbISmElM2SuSmXAc+oXK61TwQ1NkHRCp/V4omoNq0s/IBOTr3wrPHloQd5vki2Lv8F3CHUNOAGii5JuQBR62nEe9GdGx8Ju9SN7Q6hKhcXEj3vpa5RgCMJ1xHM9UaxaHyXiQpluEHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqvIICuEPyHUvtfW1Tpb95ltRz23grApiLAdOXyDF6U=;
 b=UqD1wA2fVHuOw3CMQH/MzTgoNSfJGjPNdSGA0Tk7+voTvyw6qidcFH484zRL2I/gT56bySfxSeWpmdbbkdc9QiGqSieQC9bQqx3pOfvodygHopUYA3FXPSVcj8KT3i04EHQZu/QmAAu+iqCZ6SqQwy6twZm/1fX8q/Tdgaf3VnDfw0yDmqG5YNunAeCENpsB4zru0euGFD+API0tFKAjOq5Nn49FEYUBlbh4RCXDurSTKvOY3c8feKi/g03vw3LWx1m54MdStR3ZAWZbM+G8w18j+NrEoiIGcqVgRXQO2FloeEfP6cpDa0UKcwGULFQI285sVU+ZYgdGG77TpnHycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB1931.namprd12.prod.outlook.com (2603:10b6:3:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 12:01:10 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::80c1:3479:15b6:a7a2]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::80c1:3479:15b6:a7a2%6]) with mapi id 15.20.3611.021; Wed, 25 Nov 2020
 12:01:10 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcIAAICCAgAAMliCAAAQLAIAACL5AgAAKnwCAAADKsIBLhBiAgAAKNyA=
Date:   Wed, 25 Nov 2020 12:01:10 +0000
Message-ID: <DM6PR12MB3898A41B55476CD3C659A16DAFFA0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz> <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008100508.GA16084@duo.ucw.cz>
 <DM6PR12MB3898258991C6F8C0044B9BBAAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201125112013.GC29328@amd>
In-Reply-To: <20201125112013.GC29328@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.169.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16a5243d-bb22-4fdc-cfa6-08d89139ccc2
x-ms-traffictypediagnostic: DM5PR12MB1931:
x-microsoft-antispam-prvs: <DM5PR12MB1931B1404BAE98C2CD9EE517AFFA0@DM5PR12MB1931.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8pyEsqTF+IOdQpzAOdBh0S+PbwwcHsIqkgfWWAXrlwqPgvnHmzkHJlpOGmzQQiIl1pfS1+NLyaQJiSp3socoHPMKeEuOR1WYrFdYb8FOWBKJ0RBxs8JGpUdDhZPd1mMr+3bhYb+JKMP/31NtH8ksvHxIiNac9EgqfQw5VMIg9jWVUP8LS5cw3HsBWOpdcXmgdmKgFMnCg+cL6Fw0JAuxmNnUbgs7Sh3oTMqwLUk7paZXXG7E/eDBVr2sHzuIhxW/JK0Dpo+FZwaf+kP3/xSzQO4PooQhDc+iZKAMK2SERaU2RygV/Jb8yAiz/bxN0zKh1OXTMMG2aMLZy9+84pcU8GIqgd8zlu8pM5yr/Eqy/KuN6IP5hJ7BVbTEJDNZglt5l/zd1fFfWY/hGVnPz4dyjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(55016002)(66556008)(64756008)(66446008)(2906002)(5660300002)(66946007)(54906003)(86362001)(76116006)(8936002)(316002)(66476007)(52536014)(478600001)(7696005)(71200400001)(966005)(8676002)(26005)(4326008)(6506007)(9686003)(53546011)(186003)(6916009)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?52xzi2P5ga1uzEnDKKw8GF1HB9p1EJQ1uJ/qNKHtQvjCwwrM5u+v0KbNM5Jw?=
 =?us-ascii?Q?y8zr068Vpv4b60h+wOQU+ZRPqRGBkbriPGsQ2xKSNPQ5XN3VF7uyZeFW46Xp?=
 =?us-ascii?Q?DJOJBClcqKsEAw/PaRO8zPWg+ywJwsnQtc0efUTDRPQBH2hNrjEIUwe4gFck?=
 =?us-ascii?Q?JJ1B6Yms6Xcg4I8yzN3PzpKGGULvAqyeVopOqWSrJePYVW+kegvQloqkn4eN?=
 =?us-ascii?Q?Ng5FK+lZv7vukYIb5QYc5/fL9ufm6OcGRlYmSWH94vJAdDpXwWc3eVm8aLQ4?=
 =?us-ascii?Q?HuHaxHspJR7maZVGKcGlgBWn/zQOi76iAMZ+AmA6VHs0Okg7aDn3mY37qRxu?=
 =?us-ascii?Q?0ktMcIOhudu+6syS7KBOMkeTvxG8NOAmbqe3dVdfUDyjwbme2dQALS9qI0P2?=
 =?us-ascii?Q?POOAKQHEuTBmMFY3r8ezFG97ey6ORiTwuzcWT8G0flLueM5ZvzpdoIs6x+UB?=
 =?us-ascii?Q?GdGIIjQX6jqFZ0if9Uez4ghNFYD2Xhr/NJGkGQ4dH1aYggvJlTEA+UdbhKhv?=
 =?us-ascii?Q?+G3iFZdRRlyc/lkw4ygrPZudalZChPDwawr20OpCHq4gRRcuDgxDzCRld0sF?=
 =?us-ascii?Q?9YS7gCh44cVczzFE+xO3UfmMOk9PCX+asxGT2Z/f97HJ3mli5O7rLW/xaGXe?=
 =?us-ascii?Q?Fv5hcvub72CwfZeN1JDVC0S8O2Ps/r4Qxmk0MxRE9qAtw4mSpAOPYwle6Idd?=
 =?us-ascii?Q?zwmf6AmIYrQ2XbZftB3SKU8pqUUWoOS3gxYUMXnYKr18A2UUjBQRK4eYRHFS?=
 =?us-ascii?Q?zPx9A6LZaGbzmP273Rc54INJUidWq/gq+FuO0kLq4v+aKwQ4hYtBb0fYShmA?=
 =?us-ascii?Q?ASICdLluxVTmQU6wtDHASKOp/TNFIPoe0P0DS6F8V4oFm2ucd/RaGQY32S1y?=
 =?us-ascii?Q?rC6Z1sWJnLYTICHo1Sfn4kYJR7D9Hcfr2IAnc/AdQnr54OYHhvd3KVryInm+?=
 =?us-ascii?Q?bAglh8l834kTgsQ2fkthxhr4xlzGgCnz1kB/KdxVcmg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a5243d-bb22-4fdc-cfa6-08d89139ccc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 12:01:10.6818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7oIkruQWzU9GUL4DeJUE+nYQANe0SdjR2/WkEGx4eU0XjUBtlUHVYLieGp2fTvbfYluPIXS6HCEKvHkajshZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1931
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606305672; bh=aqvIICuEPyHUvtfW1Tpb95ltRz23grApiLAdOXyDF6U=;
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
        b=RQ2xsK8teHd3gN2+9olICP71WLNdQZ5IGXBSZwX1fAA65ZZOBLD4EAKBeT4LMn9K/
         s/3dj4EgXfdY9CZlE7yqfVwcwLYRRQe7ji2hcPyHdryB9EgEikei/Nor76y/ANbxkX
         5iiP4EpaLnnB4dc2xi07h9LX6kSQgySo5pCnTq65wauHf1Yym0H6MU3oE0+HzYIXDQ
         RLwgT11Te+MPmQT1is0yGH/hscYhT4rmLsSpmM3YrbtTRXKlQIMtVpra6T1Ysgo1dz
         vq2nuplaVD3/Xl+3Rr3tRTJq0JxY/ldLbgI9Zftv7Un1iPx7sqYVQlfas8yRNrNxrl
         RSuAR2TSPDvwA==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Wednesday, November 25, 2020 1:20 PM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Marek Behun <marek.behun@nic.cz>; jacek.anaszewski@gmail.com; linux-
> leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> Hi!
>=20
> > > And yes, if you have some kind of device with a status LED, then you
> > > can put that into the first card. For example sda::status would be
> > > accetpable. But cardXX is way too generic.
> > >
> > > Perhaps you can explain what "card" is in this context? What is its
> > > main function?
> >
> > I provide support for new modular systems which could be equipped with
> > the different types of replaceable line cards and management board.
> > The first type of line card is 16x100GbE QSFP28 Ethernet ports.
> > It equipped with Lattice CPLD device aimed for system and ASIC
> > control, Nvidia FPGA, Nvidia gearboxes (PHYs).
> >
> > After that we'll have other line cards: 8x200Gbe QSFP28 Eth ports,
> > 4x400Gbe Eth QSFP-DD, smart cards equipped with Nvidia ARM CPU for
> > offloading and for fast access to the storage (EBoF).
> >
> > For this modular system CPLDs are connected through I2C bus and LED
> > driver will work over I2C. On main plane CPLD is connected through LPC,=
 and
> LED driver works over LPC.
> >
> > Card is common name. But I'd like to avoid some more specific names.
> >
> > For example, we have huge InfiniBand modular systems with 800 of IB
> > 200G and 400G ports, which I didn't have yet in upstream. Those system
> > have also replaceable line cards (so called leaves) and replaceable fab=
ric
> cards (so called spines).
> > If I'll give name 'card<bus#>, it will be good also for those systems.
> > If I'll give more specific name, it'll be not so good name for
>  > fabric cards.
>=20
> Ok, I guess card<something> is best suggestion so far. If it is really st=
atus for
> specific PCI card, then that's the right way to name it.
>=20
> Maybe "pciecard<>" would be even better.

Hi Pavel,

Thank you for reply.

I'd like to avoid 'pci' in name.
Line card can be connected to the different kinds of fabric. It could be fo=
r example
InfiniBand or NVlink connectivity.

Also LED itself is accessed through I2C bus.

If you are OK with card<something>, where something in this case is I2C bus=
 number,
I'll send v2 patch with this change.

Thanks,
Vadim.

>=20
> Plus we really should have documentation somewhere so that next person
> trying to name a LED on a card ends up with same answer.
>=20
> > I can use name 'fru' instead of 'card' which is standard name and
> > stands for 'Filed Replicable Unit'. Such name will be good for line
> > cards, for fabric cards, for power units, FANs etcetera.
>=20
> Best regards,
>=20
> 									Pavel
> --
> http://www.livejournal.com/~pavelmachek
