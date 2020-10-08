Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA30287292
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 12:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgJHKcF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 06:32:05 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18745 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgJHKcE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 06:32:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7eea360002>; Thu, 08 Oct 2020 03:30:14 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 10:32:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 8 Oct 2020 10:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGDI129mQPdLXsmtv31rq4VaPR9nhoRUtHyLmW1ZJjqwujGLisgl4dcoy8vfL8uTu76gFC0Dbp61E/l6amFxVTBr1uKeQ2SUlfXmqLvwCCzEFumvQXULRRWZXnPxKJCD0po8La7gTNrD8KAb1zA1EPLRNblKFUFdLytAvMtSnVZdU1JCQYCviHwJxbbGcqQg1bYe8n0Iel73n909WisFynmb+/QAeN2sFabCofhPvwV9ZSVqs1JmNRNm+IezWT2p9NoL5qbHAbJVIOG/aJPjvtiFskscI05SOUyZp90yCrRrWkj9FzgRBpN5FcNk7RGMVq6PCzcqRNJ4f3GEu/ra2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izQbQ8bNw0pe9F6c7zDXPvqEOUDVwQ6f+OJcx5yCLMA=;
 b=AHkZB5XPkdM1XSxoBzBmVM6s8B12fEK8qbdcNUiAqWVYJeQt9HSRMdGo72S7JDhP2B9C3FT6wHn7Nxv3u57G53Yb8K8e7GxUnKUC6Q7pM8LJWTfQoT2v1DPcfywEzFSh0dqLq5N8GVcx+JTkgIpSGQN9aHpg6uO68+e7F1CcrWlconj6jEBySZvQo2kL/se6TbxgnPSbpgYWJexnm8I6RKUsBgpPRTkNUkuqALrzaqW6DgAuGHFGE5PSHhy6BsZzGHCTHaZuCaxWRBU3qyN8IZuCxQL1cFKAJ6IC+kZJKIHolQw77rAhEDjdZB5s1ogTr//ecol3mJ0xk/16rGhClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB3900.namprd12.prod.outlook.com (2603:10b6:5:1c9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 8 Oct
 2020 10:32:01 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484%5]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 10:32:01 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcIAAICCAgAAMliCAAAQLAIAACL5AgAAKnwCAAADKsA==
Date:   Thu, 8 Oct 2020 10:32:01 +0000
Message-ID: <DM6PR12MB3898258991C6F8C0044B9BBAAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz> <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008100508.GA16084@duo.ucw.cz>
In-Reply-To: <20201008100508.GA16084@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [109.186.235.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e5e32b5-626e-49c4-5cac-08d86b75649a
x-ms-traffictypediagnostic: DM6PR12MB3900:
x-microsoft-antispam-prvs: <DM6PR12MB3900C28C01E227B958DA419BAF0B0@DM6PR12MB3900.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DhhASiNtNg1kHjgjnhILooDmPPrGNAki5vVAEKT8pZlSnikje+oqpvX1vwxx8/aSDqJsx8Z1zTxVTy4t3FLDcqHSvaiDXQ6H7tCq1oWN4ycqch2nbc6PbKqQu2nLIe/UkS50AenVeU5j49UE9puAisWOInz1h+OemzILOV3uX2kDq4zJHR6bHMYpxnPvKa4Oxu4zREhiDtWLk9jGEOfNSeegbPm0+a0FuRd79pgIWJKSbi2TRCutOKXRKpiQ6OdQbuMhdvd5+g5BQZHkAcbWrwr+uY2z0fp4a+o75j23r+D6xLr46OyTdzFdgK+dO13e/4yK0ThE57bjpxlrnspQfyykfc8DMsP0kGKVXhlqLscE6Fvnouj7vXW00uv22EZ2f5E2/uriXKMrc5/ZyZI74Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(33656002)(76116006)(9686003)(6506007)(26005)(83380400001)(8676002)(53546011)(478600001)(52536014)(8936002)(6916009)(71200400001)(966005)(66946007)(66446008)(66556008)(4326008)(55016002)(316002)(86362001)(5660300002)(64756008)(186003)(54906003)(2906002)(7696005)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: moHNpl6YnFOEAibA1jO2x5wm1cGkfP/gZ3cAp7KeFONGQ4syKOk/xGcL5McvmtTXYR4RUnY2Otxky9/D6HJgriewVlNUTV0FczEAEcnCUx5SjBWGUmxycKg0Xw25K2bzKjIuU3WcsL014N1FOIrR0c+enkwq49njv2PE7lRUK5OqFK2Pf+i6/MJGCa8ym6mdT3mxzgyAsdkZrLEIDwU9J8PJJ20p+tYT29kPKBm0zDUiErryBFDlEYPBa37/3bPui5NO4RDY/eCMdTzvTlLa8BoeUfhkm360te+rMgYBcnzSbiut4zuMaAsn4Uxxut7NFpOr6Z7GFfW5py3MesBLUoeTBvNX+3uMkyl9hPbgHCQlHF4VVg2fwPVZqsJLClfbR5bYKJkmKT8jfwYG1DHk9WTQk1xd6iOz9IlCOR0TbHAd4YKYAXmSKUfK6CDc6uY5AXazaLoVPrZ8JGHTg70Ra9/vijAeZusk4y8eX9ecr7IXlt+3NQbE08GZ6SDflGyLFVH/owMiqmQESKj5/8KvsmZISODrEYYsl82awFP2ztwhoFH8eOXLzyVjzRVtwRmynoJYfhJaO634tZ/LdtZcXPwibkRQkaJgIjfgYq6gEmavxIB3KBVpT3+sJR82rop2Sqkr3UFAPEEC3Q3Ff7oPMQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5e32b5-626e-49c4-5cac-08d86b75649a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 10:32:01.4779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIRdkEE6zcSAjsbPoycB/zd8nCsAhG/iY1anKPtKvHFGsHcgEjApc6e6GnX/Cm5vn8mZ2PL6itI+h7HOxVDMEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3900
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602153014; bh=izQbQ8bNw0pe9F6c7zDXPvqEOUDVwQ6f+OJcx5yCLMA=;
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
        b=J4r+HRoVWFCPid2+M/gD6TQ2sujc8TuiirNxM6naaUge8j3xPcqH8HH598xH0kIb1
         2f5hC9Cq44JbhiHmOROD8xeUy4VhRFaPCtz8SBHslS0VApHcZKh9IBa+Tj2vA8YTRQ
         nVP4tSsgkfb9TmYufGDEOyh4yjsQEWE3Afr5iv1cva6V3cqTf03se2S2JcZs8rAjxl
         LEvdxVa3OAkmBJmYBHuWaYafkGZUKBn3z9dn20GcxTCj9/q1102ZZT95u8PY/VuAFU
         SNXKvBlRph008YWz1SC8grvDNk+JITnHE9bT7R0ti/YXo4uWw3R3j+RrQnUFg6hD4W
         X84hbJ/4vuvYw==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Thursday, October 08, 2020 1:05 PM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Marek Behun <marek.behun@nic.cz>; jacek.anaszewski@gmail.com; linux-
> leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> Hi!
>=20
> > > Vadim, the LED core constructs names in form
> > >   device:color:function-enumerator
> > > so if you must have number there, IMO it should be
> > >   mlxreg:green:status-48
> > >   mlxreg:green:status-56
> > >   ...
> >
> > But why you consider it as function enumerator?
> > For example card48, card56 are two different devices of same type.
> > Both have 'status' LED.
>=20
> It would help if you could explain what "mlxreg" is.

This is common name for CPLD or FPGA register map, shared between different
platform drivers, while CPLD or FPGA can be connected to CPU trough LPC, SP=
I or
I2C bus.


>=20
> And yes, if you have some kind of device with a status LED, then you can =
put
> that into the first card. For example sda::status would be accetpable. Bu=
t
> cardXX is way too generic.
>=20
> Perhaps you can explain what "card" is in this context? What is its main
> function?

I provide support for new modular systems which could be equipped with the
different types of replaceable line cards and management board.
The first type of line card is 16x100GbE QSFP28 Ethernet ports.
It equipped with Lattice CPLD device aimed for system and ASIC control, Nvi=
dia FPGA,
Nvidia gearboxes (PHYs).

After that we'll have other line cards: 8x200Gbe QSFP28 Eth ports, 4x400Gbe=
 Eth QSFP-DD,
smart cards equipped with Nvidia ARM CPU for offloading and for fast access=
 to the storage
(EBoF).

For this modular system CPLDs are connected through I2C bus and LED driver =
will work
over I2C. On main plane CPLD is connected through LPC, and LED driver works=
 over LPC.

Card is common name. But I'd like to avoid some more specific names.

For example, we have huge InfiniBand modular systems with 800 of IB 200G an=
d 400G
ports, which I didn't have yet in upstream. Those system have also replacea=
ble line cards
(so called leaves) and replaceable fabric cards (so called spines).
If I'll give name 'card<bus#>, it will be good also for those systems.
If I'll give more specific name, it'll be not so good name for fabric cards=
.

I can use name 'fru' instead of 'card' which is standard name and stands fo=
r
'Filed Replicable Unit'. Such name will be good for line cards, for fabric =
cards,
for power units, FANs etcetera.

>=20
> Best regards,
> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
