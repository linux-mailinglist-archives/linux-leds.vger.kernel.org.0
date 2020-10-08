Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4D9287183
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 11:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgJHJat (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 05:30:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1600 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgJHJas (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 05:30:48 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7edc3a0000>; Thu, 08 Oct 2020 02:30:34 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 09:30:46 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 8 Oct 2020 09:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRNrlqq/WU8REtJh4hEc69sVvI1doMO/Y4ZScyfMwk25yuIYKF5OxfYy4n/xoY+WnLgR80ok0pPwgxqsjMg180x0a/7LXqp13wqHXaCWJH/Yoi7X/qNMGvroWZOV1Y5KOOtIpR/zmKqxf6dzuuhRYnWqXj/zQTRXj0LtdU93+WQ1zT9ns75iv3hjx4EEBkvYsxHo8eu6V3085IprEUrxqgUgLDKylnSa3f1z6WgY/8H9Kw8kuonW6+4ZByTBparmAOjYXNNkeaYYtME5O+OhqJsZ17DMrEIH24lzY+6RKNVsswcHSUlgs70BcSF6Mj+hQTZrmu6IohqrHOWqqQMGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tQnbgivHQ54DNACab7di56Tt2+GbUfw1gRpf62creY=;
 b=A/fR5/FZHzsji+BDU9d0xQcwWnv/Ubfsst6p/24pT7FI1nejIEUqEvcvzR1mDu34EjRQNf2ah+RhDzICLPFbD3jeSb1Kdc7KDtkFxpwAEZCUPNLJMeT23UXuldhGuSEakLaVLdwttkC74w2zJWsjPcgt/7BJqDzjVs93fOgPeb30pEnyyqP8L8FcT2xLS4BXVluci7dwXA7iq6d+jpZ5PECRH2ggnnqCKpbKApVdpv2YsjxkuRuyj+mMxB2KtTQBf8HmMoqMfHtlawJfXwLbabCGujUO97pGCf11kvqCE/xXROM5fFPSXxY2EmTvtWSwt5zT/bGzpfRe3+j+F0wB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB2392.namprd12.prod.outlook.com (2603:10b6:4:b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 8 Oct
 2020 09:30:45 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484%5]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 09:30:45 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Marek Behun <marek.behun@nic.cz>
CC:     Pavel Machek <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcIAAICCAgAAMliCAAAQLAIAACL5A
Date:   Thu, 8 Oct 2020 09:30:45 +0000
Message-ID: <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz>     <20201007142049.02d8c3ba@nic.cz>
        <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008075619.GB32424@amd>
        <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
In-Reply-To: <20201008105550.44fa3165@nic.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nic.cz; dkim=none (message not signed)
 header.d=none;nic.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [109.186.235.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc9c5977-69b3-4283-4b1d-08d86b6cd55f
x-ms-traffictypediagnostic: DM5PR12MB2392:
x-microsoft-antispam-prvs: <DM5PR12MB2392E671D33448DFD0DF1A9CAF0B0@DM5PR12MB2392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:462;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HwQR0Idpzu2lCZzqyb6mtbF7UsLxC+rRnrpL+Yi0TuWHhgcpjBFeQOD6odgwTzwWXtR7avsiWAGvfxe4EBJ8iikki+eTUc+SRLSzlqDPBcyOnvgXQBIT+koTMHJOTgtUvPh/bfN5CwyUFMECG1G5OzofZ2m6EiABS8nLbwYW/fb8+lOQl1wgTpEsJSwL0BMrJ3xSHLRijkHzFxNXGkVVTaljm01vcB9C2Wu9reNRGoK1r2Vy3hpEDLxHTuT2Z37EbjjFx32fsxhXZtUlKq3fzR1aLzXWSfEePp9RJYiFk0xl71vSE/SOUEs780X9pvNP07EAnB8MgGO3uh9wVzNJ+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(9686003)(8936002)(52536014)(316002)(66476007)(66946007)(64756008)(66446008)(83380400001)(66556008)(86362001)(76116006)(26005)(71200400001)(7696005)(53546011)(6916009)(2906002)(5660300002)(8676002)(4326008)(54906003)(55016002)(6506007)(186003)(478600001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qXnRiEQaZxmmmxCheQP5RmjHA/4zb62IVUIQ5vQDNvics7NwGzTRi+IsJzU6K1PcS4AynYq7t+4KVDjAjhm6IvMprSi5PEoU1kIFpI+uqnq0fbpcrmAyXApcjjO2j/CX7h+6iNUPeW2utj/+3tXB/ZboB3Maw56bIqQdfSEbV7kun2rQr/bJIXZhppOW0p3zGefVEAZahRc60EZzULN/Mqfx2sQ5kk7eMXwxgzHGlyK1vnP3c4uviRaPdBUltFuytraoClwGnsBK2o0fxUPoSpRALazw9H86hxc7akKiwx9Xf/slg+sZ/GxIXpdinfTX6DyhhbVN6E0v4zS+Qf1XYIuXZCX3V9oHgzkL+wShIFEekY5JZoEzSW4MQCMEV7bCaeRK/t30w0JXWhs8iQ/bpIMdJ4iCIdSD+Y9HK2E0lsbGsnCOSpeeJ9nEwHz9iX3EMLsVq1nfNY+iF7X4uOpCn131nZG6z5YgMSTguVxDSpLyTQ5vC6uStT6+qRlwXqaM+Hd51lcSINH19L2mjldlc3DT9aXTFZXZRBHKoPRJlY/AMueE8as2bfV6BY4t5ktq/q/1QqSNxOhu3ChERYOvwmrgREZmHt1lVITbpVkzdpJjGNCgMXZpjDw3VYQAV2e20fIulZdEB8ammzXibtODNA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9c5977-69b3-4283-4b1d-08d86b6cd55f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 09:30:45.2527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xsFG09ybtxt4cd6uFOprg93ypX7AEUS6i+ho3mfWmLvE1ZP33Dkf9Ztmr83cYNuNtePXntg7iN+g+MMQ9OcAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2392
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602149434; bh=/tQnbgivHQ54DNACab7di56Tt2+GbUfw1gRpf62creY=;
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
        b=B5Cz7iomGekioyNdyYXGuBRw/t30Cjay0FDsYM1k6D0/GXgOegmKaPpkt9XVSm07t
         Ealty7fvJgbcTERT2zC5/wgdv1Os4JJV+cHpyHEIwrqdivDtfUTSAZIPBhFaoDXzun
         Ck8ZUHgC4TwDaWsRkgUltz2Z+DvTdu1w1ys8ywn1YIKAG1UiUlOQkwA8HMeR/WlLFV
         O5+RhI+IWJ5DRNbTowVbeGG7VZ1aty5PVMNATOcWFWip9JXnmQU0jwlmQpJfl836RQ
         06ragZzG/h3sFWuhqmffoHgtlhq8zsCruHda0t8Jig6p3ncLEoiUMFqOi84ymvENr4
         lQxuQajQnZXTA==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Marek Behun <marek.behun@nic.cz>
> Sent: Thursday, October 08, 2020 11:56 AM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Pavel Machek <pavel@ucw.cz>; jacek.anaszewski@gmail.com; linux-
> leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> On Thu, 8 Oct 2020 08:47:45 +0000
> Vadim Pasternak <vadimp@nvidia.com> wrote:
>=20
> > >
> > > But noone is currently using mlxreg123 in their applications, so
> > > that part is not going in.
> >
> > Yes, this is true.
> > I could modify it as:
> >
> > 		if (priv->pdev->id > 0)
> > 			sprintf(led_data->led_cdev_name, "%s%d:%s", "card",
> > 				priv->pdev->id, data->label);
> > 		else
> > 			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
> > 				data->label);
> >
>=20
> Vadim, the LED core constructs names in form
>   device:color:function-enumerator
> so if you must have number there, IMO it should be
>   mlxreg:green:status-48
>   mlxreg:green:status-56
>   ...

But why you consider it as function enumerator?
For example card48, card56 are two different devices
of same type.
Both have 'status' LED.

>=20
> Marek
