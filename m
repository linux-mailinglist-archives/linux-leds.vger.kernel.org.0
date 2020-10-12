Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F9528B210
	for <lists+linux-leds@lfdr.de>; Mon, 12 Oct 2020 12:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbgJLKOW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Oct 2020 06:14:22 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17955 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbgJLKOV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2020 06:14:21 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f842c700000>; Mon, 12 Oct 2020 03:14:08 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Oct
 2020 10:14:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 12 Oct 2020 10:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTF6OBSwtKP7ltl3RHRD/siERzS9rB6Gl05Fprws4Q4VwnI4Io2i29B/A6R8xqOTvwLPlvd8tOvCL29pYgSnmMn3fu+mW7b26KvKZV139pFh5Kshvj0Czxi8i5wIvBm+LCqsLZlZRLvcAJfJXq8YEOK/KjYKEoKyiDQfQi/kuFcwcbsYyx1jzK0pf2O5ZjH8G+7DeHDnECQtq8nnJAdUm2zmP32jUUTFwBzsoHedxT+JHDfBoalP+To1Y70V325JB/OEHoRaz1PuX4cqomBwYyDxl5UaJLHNJ4bP7PBgUbpV26Bqm4bsG6ZB9wBDv/HSyu6731jzFIIHnCZBJzuang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boZ3TFLlV77XCuV0UBxWzyNcB1E2qXywYGOjVtJEkEw=;
 b=WsOGocQ65l/bIhGaysNAt4FhTQLHYauOgTSrBKgj+mmS4H9js/SQoaXOKswCIabR14nnO+fYZYyVlFvM4iJpmQo6wweljl3XmZMktjNrLSI/bZMfBO6nFz183bYUwNnYED20Gg6qwazqJQQbnxgxPXABSgFuxDYFXyuS7198ThS90oHssFpw5cZ44E2WRDMuLRIBY6XlFLTMk2M3fqw5uGSt2mmr1jrYOFK68JfxiqqXaHgEH5t16Ljil0Or6COi2uCJoE8zzHpBM554ou89FqaRSNU9p4j4JraAmDjUFZ66cUviA8Z8VNe9xmdUS2gOdiujPqw/MCSBGEUGh8drfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB1180.namprd12.prod.outlook.com (2603:10b6:3:74::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.27; Mon, 12 Oct 2020 10:14:19 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ed54:cdbb:aa11:13fd]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ed54:cdbb:aa11:13fd%5]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 10:14:19 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Marek Behun <marek.behun@nic.cz>
CC:     Pavel Machek <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcIAAICCAgAAMliCAAAQLAIAACL5AgAASMQCABkCe4A==
Date:   Mon, 12 Oct 2020 10:14:18 +0000
Message-ID: <DM6PR12MB38989BFE9D1967C69E397A6BAF070@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz>     <20201007142049.02d8c3ba@nic.cz>
        <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008075619.GB32424@amd>
        <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008105550.44fa3165@nic.cz>
        <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008123214.2a5de507@nic.cz>
In-Reply-To: <20201008123214.2a5de507@nic.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nic.cz; dkim=none (message not signed)
 header.d=none;nic.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [109.186.235.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 123a9977-9728-47d4-7fa3-08d86e979508
x-ms-traffictypediagnostic: DM5PR12MB1180:
x-microsoft-antispam-prvs: <DM5PR12MB1180144FEFBDD2C01A87CF5BAF070@DM5PR12MB1180.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vWcsvGj8NSU+0+fiAdjfspb1aquGIwDpdXbXTDgVgge8mDzjQtP0uuG5dccJLbG1faJtMWBKGTboRImAVSggjgeH4Ao28hDajZ1ujjYCW5YpTHBeq2kyi4N+bSjUGvPNmlM15HpF9iJW93Gh7rTH8SuwDL8mcLwKap4YzWxOa0TqaeNJTIZQp9MYUP7rnrApjFcWNUBlGzkDL8ACZKJm5QdpYoGomihSjXDR+hdsUm32tfxssIqHfBWyatRmpEBoiwvdvOKQPZ++P/GYdcyKJe1GdhldFeWGhzsP9qF547tc8pm+2yHk+1nkFXUGU8dx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(64756008)(66446008)(76116006)(66476007)(4326008)(52536014)(66946007)(5660300002)(71200400001)(83380400001)(86362001)(33656002)(8936002)(8676002)(53546011)(6506007)(9686003)(2906002)(54906003)(55016002)(186003)(6916009)(26005)(316002)(478600001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: jNkdn5QG0RuDDoneJGXhxeqpwGw9diZ7/naMGwJs7VFa8rqRK0pXustOTILee1vlGcp0oYOd6/dbDY0AZrD5Xy+NzZgnsWIdFcTdICQyPG/rTDxe6MuoY1DdNSpQ48lJBg/uRsaMn7NCGkKNBdes8vn1pLi3jJDc+AGYxyrwI+Axg6SgoSe0qnWplGH75RD21Cu8xC5Zu2ly3X7XWQA6ejRSu2mf2ICF9Mr7DNMJYzTzCbCebdpcimdRIyvue5RT9bEG4FLumfh2sXvVyO8/PL902Cq7N2nEtaXzXOEGcHjEAq+6ojRsy5CeJjvGaH+L37XxpnLwnclu/xOB/o9pCBhmmJr5Py0bjxJCUgf36nrurkMBxFcEfGlBGoDLIRG2msfoBu6qle3/p+Zhb0BX1SSeNZcu7hCoA/OhhjNPWZSMwbKnL/ndK4YFlvDZdN2X7D+dhmeYbF1XI7glDBCqsEKdtnguLS1koKUWotbqXOx6W/pbJvSlFgT7jwl2waOHNXFnZIIOTcYZsOmqV4IMDGOeOI6GldAyLS1l5jsjerZifNROisj+Zf6DA1/xx/Yjq85+XzAvImGJ6L8CY6T6AvokU8PbA0Gz7ZgDWiT6Rj08NHJqlb/e0yjXE9pZ65P5cH3h99ngNn9RUdL+6I3PDg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123a9977-9728-47d4-7fa3-08d86e979508
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 10:14:19.0105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 035u1l6L7hOerWmRFbUIpJidqK4tLRflSnIgVWMa6VrMXf0bflJ+v70k0srp+kLsgPZNuyGhqg2siWKlI9VctQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1180
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602497648; bh=boZ3TFLlV77XCuV0UBxWzyNcB1E2qXywYGOjVtJEkEw=;
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
        b=W5pmcpBv0rN73pHooNkUVIO4RC0x6ZsV0tDAXe5jDROtSJAUc0hPcLSwX9Dr4y5Na
         hx3P97VB66gjo+2qOtdnfyn/wNI/wEWc91GNEY0LdHjB4RisaI4Sxw2FTVaZBiQEKR
         rO72mcyWeCmRNSjuFfnfAMWynWuCvrztjRzJgcsAeN4qFX1QKJMyivm7RxbOUFvnVZ
         Idk2Gpfrn57sSV5v0LROcWVS4fD4M7YA+qWJkwIsCxSD+Haawm4tpGJGQ2BvKFshe5
         SOuhFtQD6+e6VsE2Gu1P4tOQ+rjyixLccxchFwBq8iD5GPgMBujsjfvdl324pgKGsi
         cCcdgors5R8fA==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Marek Behun <marek.behun@nic.cz>
> Sent: Thursday, October 08, 2020 1:32 PM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Pavel Machek <pavel@ucw.cz>; jacek.anaszewski@gmail.com; linux-
> leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> > >
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
> OK this is a fair point.
>=20
> I was thinking such because in my mind I had this idea that for an ethern=
et
> switch with interfaces lan0 - lan4 it would make sense to use the
> LED_FUNCTION_LAN function with function enumerator. But thinking about
> this now again makes me wonder if instead the lan0 - lan4 should be
> devicenames instead, since normally they are network interface names.
>=20
> Vadim, the reason why Pavel and I think that mlxreg (or mlxregN) is not
> valid devicename part (although mlxreg has to stay since many users
> already depend on it, as you say), is that the mlxreg name is not exposed
> anywhere else in Linux from userspace point of view.
>=20
> Devicename eth0 is okay, because it is network interface name.
> Devicename sda would be okay, because everyone knows it is a block device
> and you can access it via /dev/sda.
> Devicename hci0 would be okay because it is bluetooth interface accessibl=
e
> via hcitool.
> Devicenames mtd0, kbd0, mouse0 would be okay, I think.
>=20
> But mlxreg is not accessible via anything else in the system. Unless your
> systems also have something like /dev/mlxreg, that is.
>=20
> Do the LEDs on these cards only indicate status of the cards themselves a=
s a
> whole? Or are there LEDs on these cards dedicated to their peripherals? F=
or
> example if there is an ethernet port with LEDs on one of these cards, the
> devicename part for these LEDs should be of the device of that ethernet
> port, not mlxreg...

Hi Marek,

Each line card must have 'status' LED, indicating status of line card itsel=
f.
User can set non-green in case some there are some alarms on different devi=
ces,
equipped on this line card. It can be set blink during line card initializa=
tion.

Line card could be equipped with UID LED. User can set this LED in order to
find physical location of line card. Sometimes it's hard to see the sticker=
 on
chassis.

Line card also equipped with per port LED, but those LEDs are handled by FW=
.

So, the device in this case is 'line card'.

In my previous reply I suggest name 'fru' stands for the filed replaceable =
unit.
This is not something, that is exposed in '/dev', but it describes any repl=
aceable
unit within the system.

>=20
> Marek
