Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853E6286E94
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 08:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgJHGQ5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 02:16:57 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16757 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728839AbgJHGQk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 02:16:40 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7eaeba0001>; Wed, 07 Oct 2020 23:16:26 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 06:16:38 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.58) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 8 Oct 2020 06:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhsYFMrWf9Oeydy0P6X4mvUVsoLXCBLPztAlhiiTDFivE4X4vitknMrMbNvDCD3ZbiJ2QSk2TFEvnauRC4/aC6EGb8iaLWS1uKRQlsnxFPGXGPsLno0rQjQvneGb6mO/2DNF+1wvvNFhXRBmY5qg2NQ9mkJh7iSo3CENx3iHxFneSCRTbJ0X8CQwaQzgXdDY2kM85/grw30vrjgP0ah4E/ILFIIWN0hv3J4Lb1dwYHoshbGhCDnoGWObColYxOPLHdXDPafhGR9VaB9ds37AifXLkRUYOhRGp1h5UuqHy80DG30BkvZFU/ELv4rIrkHNRTGAycCGGInPfIdROdWeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtM5FkmhOWis3M8cXbY4FElGy+9EpapsuxWViwfISVw=;
 b=GvP2yIhKKHVp4qZuAgUu+uC5FhR971QC1Qu4OG1SQd0YUbG8rwGNpFz7/3ugtn69ZOkuXyenPB7aixqY1gZBQZBnUhNEyKcgzBNdejPa+yo031iGUA6nQ6M2xs+8dwkE6suIaOh/MzbT1s532LBIRUY/7yJbl5NFZCQqGbQYbqETX+6jhuMu0olOokPd5sPHhTm6RGOhQaPRICKE3xMI+T0n8Qal77gP1EtjnB14kvkDocUOzMZeO6aE6vjfdoKCbmkJ6dLSS0wATp9CCtkYu10R+ElL5HpOsZX6qXDZxTPD/fBT/RV6zrCzfzHpXcxf46FOjh87Aatr8yLoKhiMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 8 Oct
 2020 06:16:37 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484%5]) with mapi id 15.20.3433.045; Thu, 8 Oct 2020
 06:16:37 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Marek Behun <marek.behun@nic.cz>, Pavel Machek <pavel@ucw.cz>
CC:     "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcA==
Date:   Thu, 8 Oct 2020 06:16:37 +0000
Message-ID: <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz> <20201007142049.02d8c3ba@nic.cz>
In-Reply-To: <20201007142049.02d8c3ba@nic.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nic.cz; dkim=none (message not signed)
 header.d=none;nic.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [109.186.235.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70623e69-28ea-4fe8-2236-08d86b51b6a8
x-ms-traffictypediagnostic: DM6PR12MB4331:
x-microsoft-antispam-prvs: <DM6PR12MB4331BC72611D65FC53B4AA36AF0B0@DM6PR12MB4331.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ffwkdui5Q9qk3we5rECJNu26lH1Ml6OraMiibCL1QV3ijkoyO7g8Q0BQj7NTBxgGKeV5pEMXItqNWNdqALd+NIzZxoVXwKzIoDXJkJNFR21Y+Cq/gQ4vLw/u5NocNv6NVzPenqcLePAjBK5BjOwbjt5GKi09OLeyFLlJuKMrOOPI6DO6mMDu4/kRMf50n3gizr0AV+COQCeGEiQyLBya35QW3obHhlksqsqu2Dwqc45W6azCaUEP2x11JYAPWaT/9reNQFRoQq147GczH+PAYOHbCotWgfWUbdMwnLj9MP6PzWpZAmRnEHBxEemaxlyvO2aoaX087Z5lDaFgnl5ZGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(8676002)(4326008)(55016002)(8936002)(478600001)(66556008)(64756008)(66446008)(5660300002)(66476007)(66946007)(52536014)(71200400001)(76116006)(83380400001)(2906002)(316002)(7696005)(110136005)(86362001)(9686003)(54906003)(33656002)(6506007)(53546011)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7UQK4tdSjnPaUpQcn2sYlciFvtBB0npIsQSPqMIIzIVM8Ylw1wYlFt61LtYkrJC1wqyQ3QNB+w1Ie4fFt0tOYUP01XBvyhz+FTTmP0ep3D5KhraZbyI1r1YOPqqZmHvcTca6I59UozUCb6Jid+IxLyNLw3a7NgmxcLw1z3fS85m4lUw+ei30soJKE/DwFDx7LkVzzCIFEEgXBPUoAALseZwhbiBt/tQ9Izs6DoQiw+zEVmnr08Yb5MXgtZTyUAaU/LDL8cyqN+bxhN2sNFTLxzlreR0DysNK0h2MRcWfci2tMs8L9rsPwSWo09EXwdOPNuWHa66fTZa7+RPiiWuWpLEpNcV3ikD7Ohdi3edxFB1Q7XLEjcNuTkAmzLrrcAhdHk7Zv66dbsiZH5GGUHepy4ATHeZj/DDVCUBFUSwbCS47cvhF7qC8dkcPONEoULhtrIGF3JJ7pRQty+1Mwu/NSX7/TQr5VuNc9H9eDlzKq9slDSCF8ONe5R9cUyQpuBseUlKj45wYwf39JZLXvSxUjfWNHLqsmC3eWfJM+8MTcUNSeASeYEC0HuJyLBJiM3rbdLL2Kf0l2mjLIMc7d8WRcKYJ6FI+sj8LnTZOI21SHU9h98NFA8aIUgivnG1wAeCs31MazcJvRyj/VWRoBpj86g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70623e69-28ea-4fe8-2236-08d86b51b6a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 06:16:37.2161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJHC0fkQJ/f1VzoVO8Q8Bp6Rl21zLx8pHeH4BCrJAnYddzeOlT4mMmdDFrpAnxEsPn4jWDw6veK+FLX58RJWAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602137786; bh=xtM5FkmhOWis3M8cXbY4FElGy+9EpapsuxWViwfISVw=;
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
        b=i6qUFhaRRVMsIhQLB9Y5rtDgVeaxabsvA2HCY4S5orJM6fG4nXxh8IK5RDpmbA2Dd
         Sg+HPMHEwXT+BuI6BYZWRVzw+SA4kV0ZyUXM4GoUfAxTC+xs8FG21HmFzveXz191yP
         42iuMFdjDv0y2mFtS6yQ3PEUQAl7N/b8KefSCFCoabJT8p2da1ETDIS7P7K0Su8gO7
         Nqd+Hu3L2Eke/uNnOCvHguTtQJiOdNl9FvF/b49iBxUtyZLmzPlwd5H0xrReO1iSO/
         zBkuWDtm1saD6VtDRKZmvVQfuddKas/q8w+Tqew49AEiAaLtlG/pQ4XWjMNKCtvPNL
         m0Kf1RZKC8wMQ==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Marek Behun <marek.behun@nic.cz>
> Sent: Wednesday, October 07, 2020 3:21 PM
> To: Pavel Machek <pavel@ucw.cz>
> Cc: Vadim Pasternak <vadimp@nvidia.com>; jacek.anaszewski@gmail.com;
> linux-leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> On Wed, 7 Oct 2020 13:31:05 +0200
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > On Tue 2020-10-06 19:58:50, Vadim Pasternak wrote:
> > > It could be more than one instance of LED with the same name in the
> > > modular systems. For example, "status" or "uid" LED can be located
> > > on chassis and on each line card of modular system.
> > > In order to avoid conflicts with duplicated names, append platform
> > > device Id, which is unquie, to LED name after driver name.
> > > Thus, for example, "status" LED on chassis is to be called, like it
> > > is called now on non modular systems, on which platform device Id is
> > > not
> > > specified: "mlxreg:status:green". While for the line cards LEDs it
> > > will be called like: "mlxreg48:status:green",
> > > "mlxreg66:status:green", etcetera.
> >
> > No.
> >
> > You really should not have mlxreg: in the LED label. It is useless.

'mlxreg' is device name, which could be CPLD or FPGA.
It should be in label.

There also few other reasons for that.

This name is used in thousands system in the field and
customers use it in their application.

We used to provide our ASIC and CPLD or FPGA logic
(Verilog) to ODM vendors, which build their own switch
on top of it and use our drivers. So, the can implement
additional LED on their switches, not controlled by our
drivers and device name 'mlxreg' allows to distinct between
LED objects.

Actually name like 'mlxreg48', 'mlxreg56' are yet another
'mlxreg' devices with appended physical bus Id.

This is not actually 'functionenumerator'.

> >
> > Make it so that LEDs on main body are ":foo:bar", and LEDs on the
> > expansion card has something reasonable as the device part.
> >
> > Best regards,
> > 								Pavel
>=20
> Moreover the LED core, if there are more LEDs with same color and functio=
n,
> constructs labels in the form
>   [device:]color:function-functionenumerator
> so if we want your driver to align with other LED drivers, you should put=
 the
> enumerator at the end of the label
>   green:status-48
>   green:status-66
> ...
>=20
> Pavel, the LED core does not put the ':' symbol at the beginning if there=
 is no
> devicename. The LED name is only "color:function". Should this change?
>=20
> Marek
