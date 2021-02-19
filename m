Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7297731F87D
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 12:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhBSLjE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 06:39:04 -0500
Received: from mail-eopbgr50101.outbound.protection.outlook.com ([40.107.5.101]:30895
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229498AbhBSLi5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 06:38:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ark0iGTkzjszNtl3oWLj9V36S/UZZI8ZN9qPxDdoTBXHM45H++ctBgFfEeojar/FPwNwYkZIqMIQEP5gWatltNA9402rQzFOlVGHghIC4MwRrb6s5WMUiHkYohJSzMe7DmPWYdditT+sq8r6jEToYF8VGb3nMaOE61DI1OJhfIvLmDu2pRs5nvXSWAyf2UWGpBebOAZ6R+rDzvQkKvn8/5Mg0utytIsC4yKobIhhAnXfacJNQrIOmKu+xaTjOXH/baJSGC1K3qc5eXVJAZzlluh1/sf8E9Dmg5sYt01bKqik1vfyPOpmLAQIlbL9trVAtnRv8GcapmCQreqk3c6HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETrHF5QVeA/ceDe74Tm9DB7WxVHH3/FvlH5azjiSbgo=;
 b=ZunYCzCHIOAytS/wcWiKYBK4wlBHcqtIheHEZ4n7wxCUXEAj9IWJfYdE/AMGwuM1NFT/+LTbCGotKaZSkrF+GXRQIeyP2oqfCeiM+Q/tDgYZQ0ZaRcvTYDQY/r6TG5329DbxGXaahGBU0Veov9l7+s09hOJxbbc1CxXKzcVotPz7JTMGg6l6Uw/ksdNaBM6N1eM3ErGyMsjCGb2AUSMGHnOjS/k5b0IFJmNH/qrVK5t0TxFhl9QWfKQ+j3JRXdMyhs4as7TFvRKZeWQETVmE8Cx0pN4J/BMXFSswW5bEhqhqbfUhglM07fUrP9bzL3emn4gz+FyO3Vy3LseE7Tn7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETrHF5QVeA/ceDe74Tm9DB7WxVHH3/FvlH5azjiSbgo=;
 b=GXuoG4sJGibKYkm5YVUB0/V1Ag4MDP20vyQVFVakCCeTeLGP0P9WZuqUY9wcII7e4r05FrhW+COSEsyLaX9BfEyarIyzKkJoWlyBCOYykwtlYq6CD/g3C5F88/qq3Y4RNrfRa6WNH8NmCa1KzK+34xTZIB3OFajamdDWh5TjbPE=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DBAP190MB0982.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Fri, 19 Feb
 2021 11:38:09 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::64eb:97b0:de3c:4c5d]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::64eb:97b0:de3c:4c5d%6]) with mapi id 15.20.3846.041; Fri, 19 Feb 2021
 11:38:09 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNMX/Qkt5m5zEyD/i/lN5kehqpIFN8AgAE/3tCAAAo+AIAADCTwgBYAVICAAAMvgA==
Date:   Fri, 19 Feb 2021 11:38:09 +0000
Message-ID: <DB8P190MB06340AA6D789A80A4CE2B6C6D9849@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
 <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205103438.GB27854@amd>
 <DB8P190MB063473FEA37E69E6DF6BC5F6D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210219111659.GI19207@duo.ucw.cz>
In-Reply-To: <20210219111659.GI19207@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73283e2c-0e39-424c-e622-08d8d4cad4d7
x-ms-traffictypediagnostic: DBAP190MB0982:
x-microsoft-antispam-prvs: <DBAP190MB0982B743AFB858BF60C3D817D9849@DBAP190MB0982.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3rz25HgzUw1MaX1/1hhUjo9ZTtnRuvMj6g+zXblomYgTyi052CyavrYqsej2SbGsiScQdpqifEcHl9c78QMXbOPFUX/6SwTSWMmX1bDouqACwjhWj8vWgxDi3mWWhAnrxjXTI4BlT+92yB4NwtG12mwNCKq+UUARZeMYLwOPlpuKVuB2uFlsD35w811n8tpl1VrFT9Ix/THBMSgSJelsp4zvXXfo+eTKzZ9cK8/gaBmdxvhmDMQZK8/JPd5nNZHNlFFY2Icj+ZJ9O3mtlj5zix5Y1J3FxTmMeS02eTZNIUPjmT1hAmFgtWCTiN+WPkovr7jAmsa92UznAqVX41yYZBb1hUUec8Aks8X1chFjw7NzTvSmp2Ncg1o7zPlF9flMNZTPHeUtbH0eTPH7OwniL2QitZbOjQAMa4ssAi4ErxPIh/5zNvjY98HiCD1JdYbeOnL0Cy7TuzpslDiES+W8/uq+IHTxqTq6GzAMXp4F6/BkT83UeXZ07gVgQ8BjZz+AkMLEx4tJd2zhSvtRfNgQTS3pk+c+bPl61flykzTL5qLZ/tNDt4Mh6z3Rn6oeEUVIZso+PcykS54Kdzo9NRXljCL2pUZp2BqPUW9aCra1Wrw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(366004)(39840400004)(4326008)(71200400001)(8936002)(52536014)(66574015)(316002)(5660300002)(83380400001)(86362001)(66946007)(64756008)(66446008)(478600001)(26005)(966005)(186003)(66476007)(76116006)(6506007)(7696005)(8676002)(54906003)(2906002)(110136005)(33656002)(9686003)(66556008)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?cY7GgNs2ISp2YloxOWwb9n+Fgy7PGJYaAY+XVWDMWGeF03463LPy3sGzpz?=
 =?iso-8859-1?Q?O1cajkJd4xHNCrCQRvKTnF3iaIVLzEJCW7S+yJicLIWcQEha3lAbd+B1Yf?=
 =?iso-8859-1?Q?p6+k2p25xYsKx/2Nrdan4AJST1AXjcQREbU9D/RHuMYqMOeklBxBeiUDFX?=
 =?iso-8859-1?Q?12YJet1//zlNwKuo9CVWyL5gCcCZrads1HHOExv2wLXuq9tcHyi7HrNKch?=
 =?iso-8859-1?Q?qf2AVVAF++z8Cphu9uwtyS9a/Utwx+2gqqpywxSFBD5u0r9UHokqC+ixdS?=
 =?iso-8859-1?Q?SuDqIZlZGemZXC4ahqkMkH8ldGTN9ud+bH20CFnQIce09pZpFG42h0YxZh?=
 =?iso-8859-1?Q?KgBuMH3mWupHRwLlSyeTvh2wTW2f1WkaYNA2tqSbtn3ok6VoCgKh9OMGkL?=
 =?iso-8859-1?Q?C9jOSlb2hhoVUKfbxEOdVKVg4vvNUDRXJdQZmaB6yak9Pcl+ykoX9PLtRt?=
 =?iso-8859-1?Q?wYznN/Jh/e5gwcjr1c78x4i8vgOtTx9u0zCj7AvTu86KMMOnkYSkbshseV?=
 =?iso-8859-1?Q?QtX7sG5V7kgGCWmkSZsndHsrRdlQRGBEvi9/NKo4fG4PStgRZ5PanKoTXj?=
 =?iso-8859-1?Q?LlSHXo3ouisYOE415mAusgr7hJHpsp4eBqvqyZm/CRdCqhCerRy2TYfkfG?=
 =?iso-8859-1?Q?eHqILc51CTTiWTV91ATlr98baCv+mVd17h+KkjY7hJwQFLBr6yboMeLPVo?=
 =?iso-8859-1?Q?SLh+qKUuE9t/xMwMAmleQeihIefCQiOUZn+mPss4kZqVudDWHp1s6Vg2B6?=
 =?iso-8859-1?Q?y1wZdf1fMVZ1AwchNQssKy6s8hyPK4OVUz7TQLtbDWl1RnmJbbkfQ44oHP?=
 =?iso-8859-1?Q?yM8YAhNtZEByDnUtpn+7y25JD3IFiLDkjvysBSh1Z4P/neTtqf9mYF5ack?=
 =?iso-8859-1?Q?8Q5fz4h5m1BbQqTRKYU6da4Kkts+CGweoOoDdrzxWY0C/kb/Ms2bIUmem6?=
 =?iso-8859-1?Q?wsmqskjCLcH0eJTeCCl+JLD6t2uq8iccSTLR7ceIaxHftRR7HxWMVb/61W?=
 =?iso-8859-1?Q?lpw4ApD/PUBIqQrrl3YVO0Rda3COsDwojIWLmBxFwDvG3vIwn0Z+ACOAM9?=
 =?iso-8859-1?Q?ghU8WnC15ITOjBNEmm2iXpVtn3ipuncch2I/ldE8D+wCfOpYfph2eNNbCt?=
 =?iso-8859-1?Q?s55hfMdQ9xLl7HxbOgUTsXVolaQBSiNBURe0+wW+4oGxZSAVuYU6yS+60M?=
 =?iso-8859-1?Q?WSynISWc5caCiMEwYiEoC06gLIMPXrEDXBCjT0priYbeR8tbnpEdSPZqEU?=
 =?iso-8859-1?Q?AUP51WseqjW2xgb5uz0mJqjkCySA/dL2RTI7b2OSO1x2TMIsq1bawQmSOm?=
 =?iso-8859-1?Q?zeyQNGw4zr+az08GReAqhr7Am5ak/2YjJytllsgGHfnASjIr7kp4N4wadZ?=
 =?iso-8859-1?Q?MuzSRz4bL+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73283e2c-0e39-424c-e622-08d8d4cad4d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 11:38:09.1758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxsLVXzqwO3+leQzOBQbvJ1BnuprQdQxfLLZlQ6Xp+9aYBid/zsFFYU8DFUfQZ6mVHq+l+SqGb6UuyZJX+8+p5W2itVhxk5GqClLYk4FJfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0982
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel, hello Andy,

> -----Urspr=FCngliche Nachricht-----
> Von: Pavel Machek <pavel@ucw.cz>
> Gesendet: Freitag, 19. Februar 2021 12:17
> An: Sven Schuchmann <schuchmann@schleissheimer.de>
> Cc: Dan Murphy <dmurphy@ti.com>; linux-leds@vger.kernel.org; linux-kernel=
@vger.kernel.org
> Betreff: Re: [PATCH v2 2/4] leds: lp50xx: add setting of default intensit=
y from DT
>=20
> > > Can you or Dan submit patch getting the regulator support to work? If
> > > not, I guess we should remove the regulator support after all.
> >
> > To be true I am fairly new to the kernel and have no idea
> > how to test this. So no, I don't want provide a patch (except
> > for removing), sorry.
>=20
> No problem. It seems Andy submitted series for this.
>=20

To me it seems that patches from Andy don't make
the regulator work. Maybe I am wrong?

I am very busy right now but hopefully I will find some more
time next week to submit some new patches. On my list so far
for the lp50xx:
* Remove unused variable https://www.spinics.net/lists/linux-leds/msg17654.=
html
* Enable-GPIO not working (used before init, reset/enable order wrong)
* Add default setting from DT https://www.spinics.net/lists/linux-leds/msg1=
7596.html
* Fix regulator https://www.spinics.net/lists/linux-leds/msg17631.html

Best Regards,

   Sven
