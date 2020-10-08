Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934332870EF
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 10:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgJHIrw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 04:47:52 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:52144 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728550AbgJHIrw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Oct 2020 04:47:52 -0400
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7ed2340000>; Thu, 08 Oct 2020 16:47:48 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 08:47:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 8 Oct 2020 08:47:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkUBmrtLoJOX61IjhpcHMzQgAJ1IV4VQujTNN7lM0piG1Ycb/D8E6xe2cKmCOAoIDRM+HBEUlUipyICKrMSxj9zzeKwMzrlWaT39xi9Vv8upplsNJP6QjX131Gs2tTdrcmE0IuvsYlQil7V1Kcbd3Ldycb/cpkkUbaLWgML949Jia4YFjHFhDsLiFcqSQD+Yur9x8nTaZ9pd5I9OMt7naGZVemmI/35PNZaDHuL+bsr7XKIpHG0rBwWZdR95XWxDnjGsuSTvOTUC1UwvIzI9quiWHE7oZEUkhuMkzyM6zLDmrT5o28QfFqRfZM708KuAA/dnUeb13iHlrXiajxRH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7E3KeVxoRl7RlUGvHK1GJt6dqw8+xK3+LrCmMD5LTg=;
 b=eqcWwCQ0xqOJw2O43pno9kJhkGsnNbGQ9hqLwPQj5ty5efmZDwl7/GwVsqINIDVs/XKT859sWZE+wEYW5zkJmcDx7auOhwtz8u3x5mAxMfoV1HuYCu9aKTtS/Al+2mx2y5TN2n5cTgHcYJrlZQQ+gIAtqZpCm/wEWdfSyl15SX8lfE0xBBstksHEIM56QPxgNofPTvXWS8vmdfTceBMgAhsh0Q5W6gjm/LAbTbuUKdPdC/XTFRAsWHUHVV+bTLI6WodiGga7DV4VXGTMcOT1Qw/W7cmNLokqpTI+IbO+6u57VD1sQHmmFPG2Df5IdWAu9tsdNufDvhQuwlE4DnCsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB2344.namprd12.prod.outlook.com (2603:10b6:4:b2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 08:47:45 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::95da:ae81:7ee5:3484%5]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 08:47:45 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcIAAICCAgAAMliA=
Date:   Thu, 8 Oct 2020 08:47:45 +0000
Message-ID: <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz> <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
In-Reply-To: <20201008075619.GB32424@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [109.186.235.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3131d3a5-1fb5-4683-3357-08d86b66d394
x-ms-traffictypediagnostic: DM5PR12MB2344:
x-microsoft-antispam-prvs: <DM5PR12MB2344F2B28C6306E73784FD8AAF0B0@DM5PR12MB2344.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ruk3RYrISkdPAAYlQmyeUbAcV7sPR06hNsESzrWQjvvUHFaqz7TdBZRCrVZfppWGO1tQ21C4SNbalzMLa3EEVhHfydEBO/fqt+mKrVl68SGq3KjBtjcsNDul3M3b2oAeT0IhQ6Iiv+c/RM5MYiS/9Z9NSw/ygAhxc2kp9CKWX1ppU/ZWtDFUUn2bF5nEju7A0/MiJ5TPZl4rVFNVuHGztTq6FNI7sYeuPxVo3nZYfDAqD1fPtKw7w02Z0PlNbWaAB25XQyt8sxWSGk0lhSCpW4W9gQfM5Ux11KEW6BxQDxwferREOwZP1qjHxJChgCpZ59+SnBcvmFEYX/ZFINn1As03RmTH7MDdj2/eYatula8YHdkB1ttp36F5F/NsyWNG9WccQlmoqE05kNkhmULsOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(316002)(4326008)(52536014)(66476007)(6506007)(53546011)(86362001)(55016002)(33656002)(66946007)(76116006)(66556008)(6916009)(64756008)(66446008)(83380400001)(8676002)(966005)(2906002)(186003)(5660300002)(478600001)(83080400001)(9686003)(8936002)(26005)(7696005)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: p0TEBvswoii1E4y2ukFHCUUU5Sl6n0jIXvUFxBX+WY7n6VEDgIi+sQPEwbxESWhqV9qt403rs+bQGUF+8oWjYC4iSogg6XUMr1JplHAE1nLRdK502tAsg8WljV49UKv9m5YPcj74Vg4Bl5SIyxFUsQbUDYfUxe9LOc0AZrh3O6q9kM0zLIMy/qY6lghqODOwq04q+S0PdewRKFIa0mrwaDpsHHKpxPH1RA4BGsIxHl7CKvyPAXIRzgbngTxN2GJIBqjsYV+Gu5ePDzcEKlHBvTKvg3Xa2JEMSuCU9L5M3qyMPGu/hU3Ib15yOK/m/B1Mbt3vk46SqvR0TuSx8jlHDSOzo1pRwG7GRVqyAmdrT/YABRv0MjCPuCqCiwy4rgCHTyZMj+BZN1O435jorkUqr5mCUYLr+CN+hgz/pJkUasXAeV9B4KDrBjhLzHQ1MIYra10bPsTOt6oGh8Qst8VHv17TXQdfPEgN/Sw+1Uzvb189YoFRxF46svmgtv87NESru5n8M0PfOGv4FZ67HepKSXDKzCzpVTuecm2ZF57EFKphqumb+M9YHQ/8UOpHmNG3TlpmTqzquKygg2TcaADiZaK4bzLAukQTfV1V27vkbJLYPK/IuhKe36rhq611wtvg5uISkdS1Sydscm4FCWK2Sg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3131d3a5-1fb5-4683-3357-08d86b66d394
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 08:47:45.2137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XUxr+Wy/1s2rHoF1WYlTe8AtkCKXY8o/WLrnhXeR1XX2KmtiK8+2Op2Zc+AakErDhsgAul80QRYhqB+jGAuK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2344
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602146868; bh=K7E3KeVxoRl7RlUGvHK1GJt6dqw8+xK3+LrCmMD5LTg=;
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
        b=nXovub5l5fwvfxcemOn3MSlnUAAy9F5Ghg6xqfjX2iuaVelvdSubgyJuX8hqQZ6Ej
         +NkUovZxa0RF76AUaOgj6uGngWCfHpWyqTT2tJIV+kDzLogGDJv+wPgUvEJEqHERmR
         HORw6lwGMGnfWMk4Mtzz1FFQKbwsbqhpFLSqPWCpEstuC5xfHoKp8GqJWM4EBQLBt6
         +qOVq6ogiPkk0ePSBZLi5gG7CtA/u3G/C+uEiDkPiLna0YmNTzNO4NDHdVp/CchePn
         cBWZx2BZRspcFFVx3I3+XbTuLE1PcVWlPHW25g5E/iKxZCVHd2NR5bBjmt8GWkY8Vo
         MIwlAcHX0GQTA==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Thursday, October 08, 2020 10:56 AM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Marek Behun <marek.behun@nic.cz>; jacek.anaszewski@gmail.com; linux-
> leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> Hi!
>=20
> > > > > It could be more than one instance of LED with the same name in
> > > > > the modular systems. For example, "status" or "uid" LED can be
> > > > > located on chassis and on each line card of modular system.
> > > > > In order to avoid conflicts with duplicated names, append
> > > > > platform device Id, which is unquie, to LED name after driver nam=
e.
> > > > > Thus, for example, "status" LED on chassis is to be called, like
> > > > > it is called now on non modular systems, on which platform
> > > > > device Id is not
> > > > > specified: "mlxreg:status:green". While for the line cards LEDs
> > > > > it will be called like: "mlxreg48:status:green",
> > > > > "mlxreg66:status:green", etcetera.
> > > >
> > > > No.
> > > >
> > > > You really should not have mlxreg: in the LED label. It is useless.
> >
> > 'mlxreg' is device name, which could be CPLD or FPGA.
> > It should be in label.
>=20
> No.
>=20
> You can try to explain what "mlxreg" means, but...
>=20
> You can get away with "eth0" as a device name. We should talk about
> "switch0" I guess.
>=20
> > There also few other reasons for that.
> >
> > This name is used in thousands system in the field and customers use
> > it in their application.
>=20
> That may be reason not to change existing names.
>=20
> > We used to provide our ASIC and CPLD or FPGA logic
> > (Verilog) to ODM vendors, which build their own switch on top of it
> > and use our drivers. So, the can implement additional LED on their
> > switches, not controlled by our drivers and device name 'mlxreg'
> > allows to distinct between LED objects.
> >
> > Actually name like 'mlxreg48', 'mlxreg56' are yet another 'mlxreg'
> > devices with appended physical bus Id.
>=20
> But noone is currently using mlxreg123 in their applications, so that par=
t is not
> going in.

Yes, this is true.
I could modify it as:

		if (priv->pdev->id > 0)
			sprintf(led_data->led_cdev_name, "%s%d:%s", "card",
				priv->pdev->id, data->label);
		else
			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
				data->label);

>=20
> Best regards,
>=20
> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
