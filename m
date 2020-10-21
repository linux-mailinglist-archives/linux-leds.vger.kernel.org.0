Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C96294C9B
	for <lists+linux-leds@lfdr.de>; Wed, 21 Oct 2020 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440325AbgJUM3r (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Oct 2020 08:29:47 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:38492 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439911AbgJUM3r (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 21 Oct 2020 08:29:47 -0400
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9029b90000>; Wed, 21 Oct 2020 20:29:45 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 12:29:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 21 Oct 2020 12:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfEapCGv5IbBmOZiY2qrs8HZ0AMIQka8RDM3AgbOUjZFT5gYX/BZCtA/aYMhRAwDurfLhSyQc9z8d8bMB0Cxuz41KVHKr+ay7x/iQ2pPEBzZ8dsjVAPvFxeBjVbbGSEweRd/ULHQ2jU5wabFDCjSSuSl4u2aeVl00Az37DG4buOgZHFXTozqz3epM0Y1+7WgUtwGSWh0t9vEdc/KE4layK3Gnv0cg2BgTZ9i1VZhicEcnOBt7D3EmhZp1nJirmGKaYgyw192UqGEw9YyG9qt9oPAT2G6g3yoWyvporpC2V0yYnw6DMgZfc/MOUAAj2JthA8+5Ue9mcvkrPbDNRG6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iygyZknMfcMwrHLk2LR/pJ3O6akJeAGTTKK/e+Zj+To=;
 b=XHXUe29yx1ReJxC2t3aUWeNHR1NXUWcI9qMxBha2/JU/VfnjXi7Ncz0s2UKCwDQSGaguy1itKO2UVGFR5LjDr/0Hp2+qZkT5F4Km7oJaWMn+dFJoj1XGrNcfUxAipXz2eAnlapeBlFs5aMNQ/mh+TikEbAv+bfOAiKEDqqq7I1zpvR56g1yVmAXTxPwJYMu2Dx2tAa1bYv70TZ6/+l0DiqqCeJ5zYPEwOx5+M99JM3TAJnWqyO9jTMAtEC2flEmd2pPmujwI+q/Zj5H5Tt1AGbL0fTltNNOlq5hSvmAsSfBjbTQ2oOmTK6VK2djOCOn3TjcjyRzTk9NMP2rJxgDpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR12MB2344.namprd12.prod.outlook.com (2603:10b6:4:b2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 21 Oct
 2020 12:29:42 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ed54:cdbb:aa11:13fd]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::ed54:cdbb:aa11:13fd%5]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 12:29:42 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Topic: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Thread-Index: AQHWnAINfoo/2MAw0k+EDTNnWZDZ0amMAquAgAAN5YCAAShOcIAAICCAgAAMliCAAAQLAIAACL5AgAASMQCABkCe4IAODIkAgAA4/+A=
Date:   Wed, 21 Oct 2020 12:29:42 +0000
Message-ID: <DM6PR12MB38982F973CA7D42A528478C1AF1C0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz> <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008123214.2a5de507@nic.cz>
 <DM6PR12MB38989BFE9D1967C69E397A6BAF070@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201021083334.GA29124@duo.ucw.cz>
In-Reply-To: <20201021083334.GA29124@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [93.173.199.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c28f0120-f284-4550-4435-08d875bcfcae
x-ms-traffictypediagnostic: DM5PR12MB2344:
x-microsoft-antispam-prvs: <DM5PR12MB2344C996C7FBE322A38EA230AF1C0@DM5PR12MB2344.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LrERtPkgo/Z7Oh04Kc/Xw9jkqLSydmEfQE05EfHDhZzOUOVCaXwAJsJLykTOcBiJn3grMpRbmQKNL1IPke0Bj2tIEkRwRUCwTGoziHpRDrwc9wwLC/SuQvh3DzRw+Cf9L9TLCmxXbQH3WkuHJBMbMhKYHCoBBYVIsVb44fKbYrphJIj3R4J1wgz6WVxHPImo+cLU5Cf5Um4F0/1VmgeL0c1VLdcvoyYfrjhurlLr8VCw2zY2m5PPngj8o5bHqIfVFGwFMfXyuxTncLOIdirLyalsuuWTXCoYnmRCn6YKD6tbO1zRDuSOUwLH/GyikmaWquDa9iKdIEHOhKu5Ws+neoRYTwkT92/xflzh6UrA90m09CGMe5B9qtW0EDQlDHpBu1WyGR//4DKt9wgKNSgZwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(76116006)(966005)(66556008)(478600001)(6916009)(55016002)(316002)(54906003)(5660300002)(66476007)(66946007)(52536014)(7696005)(64756008)(9686003)(26005)(66446008)(8676002)(6506007)(8936002)(53546011)(2906002)(186003)(86362001)(4326008)(83380400001)(71200400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3j9YnAyDDCul4gmL9jy/h/wFoeeXVjMad82hFefpw0bQsKTkh5PaVIwQr21bcPmbbgm6x8ahIWyUaTr1uQ33HDoR+FxVRCF3uF1ASdMDGmgfWTLyBQxoU4NAWiF/1yVWYvQylTGjVwZ4tbDD9Y7JI+LqIuD/fT5vRs3MMNfSKzNvQbuNxovL/jVScYrbyqtt8uuKO1kk/XjvXw/rTRhGqTW2fHbeesbfh6YIz4GS9gJpFp1hJynGZq6Sma76gyDiNdmiGbX7Hld7aBQkoTrbWlWzu/PbxSLCLnjfp1XwVdMO5HNiyx5QSDv9Se3qGJA0fT0BgL0b2bj6z5Ilid+eUdIxVkhM/7+4YASSJTWtKis7uL2/M4yDkT0rSWoxaELT63QedQewp/wpyU8W9z+907U5id2Q6EovoJBbJKyWf8OO3a8VZtTzOJy8Cpd/gyp4MLxoIcCm3mVCUrlUzDdRH9Ri2YuyGjWJkqg5PjGmTsb7XXzko1i5bekyEJ5f1mveuvIUJlJHwC5CL/TEdwbpZxWNGzqVR6LZg+rQeBCHSrdHyjP5N5jthEFivt7UGtDy0rrryDxNzFCQg2IFL5DPI5qS+paZQ/iHpCdJIEufBvetNFKIJNXzVo2I2Ns7CQYBLJ26L6qAw0tMPsLL4tjhTA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28f0120-f284-4550-4435-08d875bcfcae
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 12:29:42.4966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlQtLhXUNtnAMdZzvPnv8uI3Ghci6UwyCe6dmCIoaxgWN+DxXNseD8mVBYblduyxARqtkT+uRhJ9baYNakUHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2344
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603283385; bh=iygyZknMfcMwrHLk2LR/pJ3O6akJeAGTTKK/e+Zj+To=;
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
        b=eA6WVlkt8xeqaH21MlMwCrEHBycZryRdj7YrWGmIn4z6HOsf+Pd/s+jNkTX6Ghr1D
         YuUJsgPAUsFtn9o70u3lIND1YAuSxJ7OhhiQZn9VXCddINepAXHyQIsg8CjOYkcE2R
         J6Cgu39hXOBUkXzmmncrjyO7rzAjVnohKKRlWPya3SYbxrdSDf+Ksd0f8FHPHYPu5n
         lxX2e7VY2FXF2DBOUE88A9gpHiz5f2j0ynSiSP3EzIy29pgBXMMNpkfQIX1mh6x3KZ
         gfyEIoSQMHUMLSjVi1Zfjm/1Cg2lX4Jd++XLx3SbVO0JHeSnYldIIXJsBb0CjPg+q7
         PqEiKzkEPhl0A==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Wednesday, October 21, 2020 11:34 AM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Marek Behun <marek.behun@nic.cz>; jacek.anaszewski@gmail.com; linux-
> leds@vger.kernel.org
> Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation=
 of
> same name LED for modular systems
>=20
> Hi!
>=20
> > > > But why you consider it as function enumerator?
> > > > For example card48, card56 are two different devices of same type.
> > > > Both have 'status' LED.
> > >
> > > OK this is a fair point.
> > >
> > > I was thinking such because in my mind I had this idea that for an
> > > ethernet switch with interfaces lan0 - lan4 it would make sense to
> > > use the LED_FUNCTION_LAN function with function enumerator. But
> > > thinking about this now again makes me wonder if instead the lan0 -
> > > lan4 should be devicenames instead, since normally they are network
> interface names.
> > >
> > > Vadim, the reason why Pavel and I think that mlxreg (or mlxregN) is
> > > not valid devicename part (although mlxreg has to stay since many
> > > users already depend on it, as you say), is that the mlxreg name is
> > > not exposed anywhere else in Linux from userspace point of view.
> > >
> > > Devicename eth0 is okay, because it is network interface name.
> > > Devicename sda would be okay, because everyone knows it is a block
> > > device and you can access it via /dev/sda.
> > > Devicename hci0 would be okay because it is bluetooth interface
> > > accessible via hcitool.
> > > Devicenames mtd0, kbd0, mouse0 would be okay, I think.
> > >
> > > But mlxreg is not accessible via anything else in the system. Unless
> > > your systems also have something like /dev/mlxreg, that is.
> > >
> > > Do the LEDs on these cards only indicate status of the cards
> > > themselves as a whole? Or are there LEDs on these cards dedicated to
> > > their peripherals? For example if there is an ethernet port with
> > > LEDs on one of these cards, the devicename part for these LEDs
> > > should be of the device of that ethernet port, not mlxreg...
> >
> > Hi Marek,
> >
> > Each line card must have 'status' LED, indicating status of line card i=
tself.
> > User can set non-green in case some there are some alarms on different
> > devices, equipped on this line card. It can be set blink during line ca=
rd
> initialization.
> >
> > Line card could be equipped with UID LED. User can set this LED in
> > order to find physical location of line card. Sometimes it's hard to
> > see the sticker on chassis.
> >
> > Line card also equipped with per port LED, but those LEDs are handled b=
y
> FW.
> >
> > So, the device in this case is 'line card'.
> >
> > In my previous reply I suggest name 'fru' stands for the filed replacea=
ble unit.
> > This is not something, that is exposed in '/dev', but it describes any
> > replaceable unit within the system.
>=20
> So.. you'd use the LED to locate right PCI card, or the LED would indicat=
e that
> whole card is failing, etc...?
>=20
> Could we use pci00:1b.0 as the device name? (same as lspci). Probably rep=
lace
> : with _...
>=20

Hi Pavel,

Yes, STATU and UID LED indicates whole line card status/location.

Some line cards could be connected through PCIe, but not all.
From chassis management perspective they are connected by I2C.
And CPLD register map is accessed through I2C.

Following your suggestion it could be i2c-{n} as device name (pdev->id is I=
2C bus):

 		if (priv->pdev->id > 0)
 			sprintf(led_data->led_cdev_name, "%s%d:%s", "i2c-",
 				priv->pdev->id, data->label);
 		else
 			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
 				data->label);

Or bus name could be passed through the 'identity' filed:
		if (priv->pdev->id > 0)
			sprintf(led_data->led_cdev_name, "%s%d:%s", led_pdata->identity,
				priv->pdev->id, data->label);
		else
			sprintf(led_data->led_cdev_name, "%s:%s", "mlxreg",
				data->label);

Thanks,
Vadim.

> Best regards,
> 								Pavel
> --
> http://www.livejournal.com/~pavelmachek
