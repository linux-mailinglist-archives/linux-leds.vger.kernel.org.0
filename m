Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2314E407C5E
	for <lists+linux-leds@lfdr.de>; Sun, 12 Sep 2021 10:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhILIJl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Sep 2021 04:09:41 -0400
Received: from mail-co1nam11on2085.outbound.protection.outlook.com ([40.107.220.85]:12709
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhILIJl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Sep 2021 04:09:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akp+/LevsUIlnRQh/6HQnh+IKjTE/QfEFqJ+PDMgDiiDykPWkYEB8WLSw5o3dVD8RCXLbbUne+iPaHVPj8A4PMAoOHvgz+4aBao+tCXXK/182XTkOC+nbBJReVWOejrcdZx3LqHxc51jzXGIMrF8W2ExwJ0jpw57rI6sAZc6fWoMZdCSNA4Azis5B05tMPYTnSZ4obQ8jkoPIMQnzs7OxOvLPAE1ohz73HbkacoBBfwmdSuMf2rjEm1BeEHS3rLuTKgxCKG/ML7uyVXsw+zoVwmLLfS2XKA9h8AXXD2Uca81wR2SdkmnDy+YuVROmAhxQmgM/5kjSgOxnkQKq2FMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rxc6BQfngACSFmT+g6yn6+ZMy0qZtets/M9IhrAHkqo=;
 b=BHJWibjcew+X11TnbGof3auLndp6yjiXVspJpw9wzwoCn6fjvqVJdkNs4osNCV6QsZb8b0LyEoA0fMdgCa7Ge5px5KkoYxlEcdI8uAiPfOc3QDQCPRHrysXkqgli9wgC0+UBWF8q1fArcYGsIcnNQH7ijdFJHsmI0V3oGqubSB9d2hM5gMPMjlRQM/Afi+hCAC8RIQPlOuPVybi/vL6uGiloIvcm8S4F4w7z7mhpEz4l4ewQocrD6Zec1F2e2K0i2MDWi/FDaXAaLiBFIQAxsnzAqhpnJZLDa6erGc3MGhv8VtVJGMWxJZcWceikkPHWdJkiCYrc+U/+zZHs7nHcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxc6BQfngACSFmT+g6yn6+ZMy0qZtets/M9IhrAHkqo=;
 b=eWtR63dmzDmS+t/i2E/Oqo0y9DaBrQKJ00zxh3iYZ3CuMvpVpC5eY/xKXSIsZbFh8pqXOAV+XDTgazhR0uRrLMYJX7N3YpS+i1v1BeT8FVDSPXMoHyQAzjOLIY3FrTy8o1gV1Q2nvwCua0DP5lNMoB8vb4+KI6h0rjNMBEBJy737/14rdKURWjhJcy708ro5hyV047R9tBw/iaR4j99TN1caSkvErrQKzg8aGAsU7thhh23L6//Hmcx+KeYCCjEvSMAU1wjh5uXtSEZmOfPtB0J+5Lgqr1hwLtoqwU86M8v6RXn6N4/sLBpFHUI7Z9ySNHON149u6JljxLDDJpTNhw==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Sun, 12 Sep
 2021 08:08:25 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::f00b:b206:d819:d8c8]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::f00b:b206:d819:d8c8%6]) with mapi id 15.20.4500.018; Sun, 12 Sep 2021
 08:08:25 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: pending patches
Thread-Topic: pending patches
Thread-Index: AdeS0DQxb1q79RP9TeSzeQiW4BazEQCyhSiABH3oCwAABNyEgAABh1gA
Date:   Sun, 12 Sep 2021 08:08:25 +0000
Message-ID: <BN9PR12MB5381D1D6590C2B87751314D2AFD89@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <BN9PR12MB538114BC3CA171DD31E420A6AFFD9@BN9PR12MB5381.namprd12.prod.outlook.com>
 <20210820080631.GA22757@amd>
 <BN9PR12MB53811FD7FC0C8DD410F785CEAFD89@BN9PR12MB5381.namprd12.prod.outlook.com>
 <20210912071107.GA16081@amd>
In-Reply-To: <20210912071107.GA16081@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 269ed5bf-5f01-413c-37e9-08d975c47eea
x-ms-traffictypediagnostic: BN9PR12MB5227:
x-microsoft-antispam-prvs: <BN9PR12MB5227EEB277A558DD5AB8D329AFD89@BN9PR12MB5227.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6RzyBd7HDJdUgKMlMp1Edjum7a18N+oGrR7nXUHUVojsiBur0BRmtqK6T9pTvi+F7iLtQZ1EVF4UoTx5DKQDfGgtpKjTQV//H7L8JKBoBfhpnaDiRmbNRKziceHogZAf9k508FM30uJ37u9EH5RicqMq/0Q0jyogIxBAQvURHzE/Asj7VGn7q3k0N1BPUevIz06noLOnYPMO93+7xSwh+BHrvRD3RXxOEEBR6RIuuON/MH9U/yUt7s+I5NVtQEXZyJNrK1brqd+Chc04U46Pgr6knD6TOFhBpR9TrpZDkSC4GjU4LKG0gLqlmbvjfWAllz9OjWuXUD5AYtf4hYK0bSQGSWowlb17TMSL4jlMyEL03iC8JWhpkRWjfCPBjZzBRbt9YH4MuM7fcWZLCDzLwGWVQGlfhHS3FdZcfzoDBNPs4ocBWmgLJfWl8qqi2vaZogGX4s2lexBnBlvD1Ec6ZH/sWVO/JmC1exygDebrgxvPxvrWGf3PB7U4j+iJZbM8yW4nzl+T7mXp6pYzC3ihKEVSZx/qCdF74+luCFb87nYSzW0hgWt0tebch8kufGBgNs7AttKYfLuYjWeeIiA27Un5C9TdGn83ehgkbX8F2Ppr970D7P8P4NhAw+5cbft4QLopuKd1eXbEf3zPWWOT82zYT/hQmA5B8cuovb4ZQ4ElGCK7Uj+K4eG9SQEARcFfsXP89R3d8MXu47gldgvbU00bh8yUvUq7EbSnugyvqKHBTrZGESm/uo2yPhozitTB//HQcPY5N1KXp8Pwj9KljbusGlVpTLC3qwRMoH7sU/A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(66476007)(66556008)(122000001)(26005)(64756008)(316002)(38100700002)(76116006)(38070700005)(66946007)(966005)(33656002)(66446008)(9686003)(6916009)(86362001)(2906002)(3480700007)(83380400001)(71200400001)(478600001)(53546011)(6506007)(8936002)(186003)(4326008)(7696005)(8676002)(55016002)(52536014)(7116003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kuBJjSRupIWnA87cf+aFtFSsVIV8Gq+/ZJkcTx0uD/WMISDlkUAGnwv4s0G4?=
 =?us-ascii?Q?OKk26v1PSZVWoDgSJx366dOFABs2AHFd4K1ZGqBObkGXTDwu4C53576v5xXu?=
 =?us-ascii?Q?5WTm/6B+hpc7O88Ehbkwzy3drOgJ/ygV/XCajH4/N5T7KPVTvv0z2UBwQBpd?=
 =?us-ascii?Q?J5Vg50/E5WXbTpABLoFMLxrAIT6JPnqGi0J4ItvhICFL3Qw1ADqj4JiQLKH5?=
 =?us-ascii?Q?sPT6+TSlBd/vkJNM7/lebVz+l3KZ5cxxXJ6FuzCul3PV3J7VdYHvIDij4lEg?=
 =?us-ascii?Q?Cn1IP0QueEV5ZZ5g77Gu/2LEzl/ueGlalx82doYE8RHly1s6Su08I5Gj8LKb?=
 =?us-ascii?Q?KnVWEnnP0KMkBUydXYSr8aHfPSNtyC21st21cx1RkfPPQLbh32pl0k4bzJFd?=
 =?us-ascii?Q?RuvBLO6/D4Icizjuw1SnU3FsGdpO9G4JsEAe1TIYGa8GTeYhO8yvxgai1MNz?=
 =?us-ascii?Q?w6PoJs0vvwhOb6otSRR9dUwE8HfDtu39BkARiu2EASg6WDUrarqn61yNwh2Q?=
 =?us-ascii?Q?SYGV0ufYDZprhWDbnrmDeeNKFq+WsrlMUqtdGIUbfNxNHVCZp5GU9TYUBNh8?=
 =?us-ascii?Q?LKjiC0eGtdOYtTIbaTeA0CfzpB/mZHjm5vtzy9n23reX6u9iBaxBJxX/TXdl?=
 =?us-ascii?Q?cDx99X/A2d4ygRjyYUNCZYBbkdsXcMUZ2hQd4UAUyp14+nI+IO8Cnzi2llxc?=
 =?us-ascii?Q?Txz2YmGHocEeRRZUE22jibBHC/ei+QCHR7FORbhicNV0YluoZxcA5Ldn5TaE?=
 =?us-ascii?Q?fQgEgTHmhw0Ouui7Sk0ep82LPOMz/vLAlYvAPFBgdencGVr5D+90ACBwOxYi?=
 =?us-ascii?Q?PMvk8zzkmFmkF8rhRSl4elT1A2qI3iv0isXbKC+O2frzHhvV0NrGqIDGripU?=
 =?us-ascii?Q?O2YfN0I5pr3+2LhcdywKKQBQEbo1iASEZaLSxmPqB8tEZvXjiQNsLsh/bEjX?=
 =?us-ascii?Q?DVqC8r2DAXhOjwdMfLqlZ2vpH1iSMdSLXARZJvZbvDeKEaEtTomjnMRfgyRR?=
 =?us-ascii?Q?80dJmKh/99uxI1w/2jrvjL7z58B5vz+B80K3YT+v5IYS5x8G9Xx1qIGMLI5H?=
 =?us-ascii?Q?i7HE4CF9W8CO65OQ8KReaFWlemgBYcbxXbnHikC2P36nN/URZsXgNUG8yBvu?=
 =?us-ascii?Q?KcJkJPfPtQW/u+htyWNrdp5Lg1I17jz/4Hahu4mIMpIOmZZUOrgn/gQzmiqq?=
 =?us-ascii?Q?X4L2jLTYSWaeUSvzvy5rjPVXFmJH3ZDnm6bSGFnZ/TSDDzDtebsGd8lDrlBF?=
 =?us-ascii?Q?GUDY+xHDEb7R6DulncoohDP0WTEBAPLQD+nlcKsCfTRFddQB1Tx49bHaBwyq?=
 =?us-ascii?Q?TpAJPcwssvGdPos06NuOxmNG?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269ed5bf-5f01-413c-37e9-08d975c47eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2021 08:08:25.1859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nG0FDXdo4tPAFnrJTGr6hnNCBdAnbCREGVAJEh6TvhdzyU+in4qtjCYZ+WUuPNm5rLBXhQ7eVXmxepNJ8nWBag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Sunday, September 12, 2021 10:11 AM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: linux-leds@vger.kernel.org
> Subject: Re: pending patches
>=20
> Hi!
>=20
> > > > I have two pending patches:
> > > > https://patches.linaro.org/patch/432324/ from 2021-05-07
> > >
> > > I don't understand this one. Are these normal single-color LEDs, or
> > > is it some kind of weird red/orange/amber/green combination exposed
> as single LED?
> >
> > This is not single-color LED. LED is controlled by programmable
> > device, color is set by writing relevant bit mask combination to the re=
lated
> LED register.
>=20
> Not a single-color LED yet using single-color API, and now you are introd=
ucing
> additional hacks on the top of it. Sorry, no.

Could you explain your point, please?
Where is the hack? API is used on top of specific hardware by setting bitma=
sk, while
generic API is used.

>=20
> > > > https://patches.linaro.org/patch/403538/ from 2021-03-16, which
> > > > has been
> > > re-sent.
> > >
> > > In this case, I don't think i2c bus number is suitable way to
> > > identify add-on card. Having some way of identifying add-on cards
> > > makes sense (as we'll probably have other vendors having "fault" or
> "activity"
> > > light on their cards), but those boards will not neccessarily have i2=
c on
> them.
> >
> > Line card always has I2C connection, LED color is controlled through a
> > programmable device, which is always I2C device. So, this is I2C and bu=
s
> number identifies topology.
>=20
> I see it works for your hardware. I don't believe it works for other vend=
ors
> having "activity" LED on their card, and I'd like to see consistent namin=
g
> across vendors.

Name is constructed like:
/sys/class/leds/<card type><bus>:status:green/
In same way it will work for other vendors.=20

>=20
> > Pavel,
> > I have those patches pending very long time. Could you, please, help
> > to get them accepted?
>=20
> Not really, sorry.
>=20
> Best regards,
> 									Pavel
> --
> http://www.livejournal.com/~pavelmachek
