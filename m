Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08354341511
	for <lists+linux-leds@lfdr.de>; Fri, 19 Mar 2021 06:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbhCSFwf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Mar 2021 01:52:35 -0400
Received: from us-smtp-delivery-115.mimecast.com ([170.10.133.115]:46969 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233915AbhCSFwL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Mar 2021 01:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1616133130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=GhMJXxJ5L06kHpK9I4rBHD6NlwNIZjp8ZjP5lnZqMV4=;
        b=e6onPRaRhUNF6IQiHJANaEcPnmB1qL72ZV7zfpc4xLjoiP2nWHdCy9qSlEvQ4C9NZ+q5iy
        yKK+B0swJE85mwzr1Ye3KzI07AuMSa08s1Xs4Bd67yBo6+yj86zabsIW18PgvfwlG+jYdV
        KbWSxsI7YqODhrCMUTaJrvI9p3poukU=
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-0BddYkh0M2SyqKW0mALd2Q-1; Fri, 19 Mar 2021 01:52:08 -0400
X-MC-Unique: 0BddYkh0M2SyqKW0mALd2Q-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by BLAPR19MB4401.namprd19.prod.outlook.com (2603:10b6:208:294::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 05:52:05 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Fri, 19 Mar 2021
 05:52:05 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>
Subject: Re: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Topic: [PATCH 1/1] leds: lgm: Improve Kconfig help
Thread-Index: AQHXGwlKnpCn2fIGT0qLVmIAnSpIpQ==
Date:   Fri, 19 Mar 2021 05:52:04 +0000
Message-ID: <MN2PR19MB36930296394483B3AC733626B1689@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <8ae0456a08ef1a2491fd382b273ff7259e6fcbd0.1615969806.git.rtanwar@maxlinear.com>
 <MN2PR19MB3693EEA37EA1FC18238FE45EB16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20210318075552.GA2331@amd>
 <MN2PR19MB3693318349FCCF3201E8EA80B1699@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20210318203711.GA8429@amd>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88fc6e9e-722b-4163-639a-08d8ea9b2022
x-ms-traffictypediagnostic: BLAPR19MB4401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR19MB4401498A135308C215542DAFB1689@BLAPR19MB4401.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ibWaMvdaphzKUmStwBJL7xr0apLriUsSBxGhPV+h2CT+EoY89MoB3Bm+eyQ8x7avCV846xsdxSo50eKhg3T4FQKRC3gXZyv2Go4UU1lAPEbyl7hpUeBoV6AosOm5sYTUPTZoDxwN2un7T9V2+Wb6OkpchzTCokecDPyBf3jAQDSJJxd3daJnjMGSe27aEuG75divocbQYpLYbaW+PAPeZYmTugdF2IHmNXmlytVM88UJTMDV1GY4FbW/GlpbUqEF0SJLeoFNhKg4fRhyzaBtZ4xiBl4G1szCNA23CPeHEi4nUxq42EBkMNlhysoMWXAoryAhyiwYxroFkLDa5gfN5fbql+j6D6FnhK+Gt1rDaX07yJCVj9wO9XUhDsFFGg3igJqh9kWPnGvSmRPnUOe5PLIuMC9Fv/eSVAypgUpeWH+99Swy4fMSQh60HwVMqIIXw6gSxaFimFko5t+VkPfAVEl2kqHeLr4EtRVLSDBMxIUmdMRIPOA8rqgVHVNYLwufSZB3A3xOmAstJT8GIVgbkSJj6Fto+850/oI73o2+5gDlBdPXEuvEO9H49EQW8Zqa3huJaY8CXbYY9kJNc0K6AV9vYeZ+k/Gg2Us7Z/Kl/8E7JgGeC9u0G1NEEN4OT96HYRQe+Tf6MxubTe0QIX40kF7w8OD9LYylcXzmpmFdX78ENQJhFq30XhzVW8pOs6ubTOaxBN3sRuloSIkIfTcTjF9XPSoy8/FnFNnG3RpWHuo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(478600001)(7696005)(38100700001)(966005)(8676002)(6916009)(66446008)(6506007)(66946007)(53546011)(5660300002)(52536014)(83380400001)(55016002)(86362001)(26005)(4326008)(9686003)(107886003)(8936002)(316002)(186003)(71200400001)(76116006)(33656002)(91956017)(66476007)(2906002)(64756008)(66556008)(54906003);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2gByACIuaqBfzyNpApvyt35vJQtvhMZ2vMkGSramhlhd1RBVQSa8Bl5rpQFu?=
 =?us-ascii?Q?wVnHVT9stiLMSQTz/xbOSSZrfaFO1y0UrRo+cZnfqI9pv0uL2/tssX2/p2KB?=
 =?us-ascii?Q?n5IZ38vfpYQbGN/xp/eYsm1MvanRzcymkqDa18wh/JOkriBxIB4hy9oIG47e?=
 =?us-ascii?Q?4MLda9oqTar+Q9LkPMXPZbzxfYYpVE7cBfUn3Sd6hd4r+pWub/KKawaVtN7J?=
 =?us-ascii?Q?wz65UdKI++WZxpWQzYW14LzYvn7qatb3Y58pcXQ9PNrmyYfuE3OM3Sqp//D7?=
 =?us-ascii?Q?jp97he2kNHX153dBkaA461/2G/+O5l/gNFncUo7YdKr8ZR2lFjKsYxLeW8BD?=
 =?us-ascii?Q?GO/LSKoUaZWVik2ZbumTHOF6plBNO48GxOLrsiTtZCxqK38UogFchO/uq0/B?=
 =?us-ascii?Q?GEf/7Y8SFQOIE5xwB/VMR5nUKs2MyKoNoZ9WEJP9YGDlNW8mFsOLBxIGYn1a?=
 =?us-ascii?Q?jQtMDGU3aYJVteM6+pK4OODtSjLhlxaS44CMaM5BVrvfvhRpTcz76JyNfj+0?=
 =?us-ascii?Q?vMwcDcQWxZOsD/10FEww9XuaPR9sDEG1W1xqjS3oqYpLdhxJEzBDUFyqOQI5?=
 =?us-ascii?Q?Nzz0Bd1FQwNwwfp5ZokOho+qkiSDFXaFFxA0ciBOtM7TERWg5fGO8g9HSc0W?=
 =?us-ascii?Q?JkyzHG+i0cedp4CEtV58QNImZ7Kykv1mXD7cz35UfAKKrYc/mrGKyBLuI5QG?=
 =?us-ascii?Q?LD+ePKoiXeURRmCXDsAzf00ewLqibCZk4ajgWE56ThXmHk21wKsOfA0dOHb+?=
 =?us-ascii?Q?ob4i+Tqs0ikvLutpHjtLdAImWNFKyFEP8QIR6B5qqLiUUFFgUbd1XynKslGt?=
 =?us-ascii?Q?CFFpvdyLBWDpDLyXro94f+pILbXQTUw9AmTXymSAyBPM/hUOcV/9rsLvxbLu?=
 =?us-ascii?Q?hbqduKDeuAtWcesUYH5cuh8qDb80ylER26lO8DXywfzHOqIFfVcM30pLm5/z?=
 =?us-ascii?Q?LHSoI8YAdSUiAlevkjFtiJhZAFAnQWS8lb0lUVe8Btf0JdRoEI2NZ7F38Plv?=
 =?us-ascii?Q?l7kU3a2NSrdBMWJbi11YygeyZzTKIiWaBxoY7d0zSPakr7Pc/qw0zULLi50O?=
 =?us-ascii?Q?z8zmvOOD2vYooNPCwrPHgh3OELxWHXtlWmpo5t4CVKd7lKWq7UMv6Mi/+qFG?=
 =?us-ascii?Q?jEyw5rpUKkSGDS/uTkiF2OiNOoeRGtsFuVdnLilFVVNrUJwRKRhFVF2zomEX?=
 =?us-ascii?Q?bucBBeCgHtHYr1+ao5P8xdZhMLMfsRBPZFYftBv2Y6zhavSeSFDO/w4aSGZ2?=
 =?us-ascii?Q?CshaJTtHNpkbyKewmMx3F10AdcPzgk0NaGGK1RkyubtnwO2V8FYLxqO3f9qT?=
 =?us-ascii?Q?b8Q20NS2UahpjRChIYs2WL0zXEduJCG30VlKbZnUFnjV4w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fc6e9e-722b-4163-639a-08d8ea9b2022
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:52:04.6444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oru4c0/tuUOhLLBOqM5KbGwaHs6miCh30jUFkWb+8ezTevbCgpZNXATTJA6OIcQjU2dQnUMBYbUHfCe8rwKh5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4401
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,=0A=0AOn 19/3/2021 4:37 am, Pavel Machek wrote:=0A> Hi!=0A>=20=0A>=
=20=0A>  > > > help=0A>  > > > - Parallel to serial conversion, which is al=
so called SSO=0A>  > > > controller,=0A>  > > > - can drive external shift =
register for LED outputs.=0A>  > > > - This enables LED support for Serial =
Shift Output controller(SSO).=0A>  > > > + This option enables support for =
LEDs connected to GPIO lines on=0A>  > > > + Lightning Mountain(LGM) SoC. T=
hese LEDs are driven by a Serial=0A>  > > > + Shift Output(SSO) controller.=
 The driver supports hardware=0A>  > >=0A>  > > What is Lightning Mountain?=
 The codename is not widely known. Where=0A>  > > can we find that hardware=
? Notebooks? Phones? Only some development=0A>  > > boards?=0A>  > >=0A>  >=
=0A>  > Lightning Mountain is generically a network processor with a primar=
y=0A>  > targeted application as Gateway SoC. It has already been added as =
a=0A>  > valid Intel Atom processor variant in=0A>  > arch/x86/include/asm/=
intel-family.h as below:=0A>=20=0A> Yep, but Kconfig users are not going to=
 read header files.=0A>=20=0A> If the SoC is not shipping in any products, =
state so.=0A>=20=0A=0A=0AGot your point. Will update the help text.=0A=0A=
=0A>  > > > *=0A>  > > > - * Copyright (c) 2020 Intel Corporation.=0A>  > >=
 > + * Copyright (c) 2021 MaxLinear, Inc.=0A>  > > > */=0A>  > > >=0A>  > >=
=0A>  > > I don't think you can do that, and I don't think you should be do=
ing=0A>  > > it in the same patch.=0A>  >=0A>  > Well noted. Will revert it=
 back now and update later in a separate=0A>  > patch. Thanks.=0A>=20=0A> D=
on't. You can't update copyright like that.=0A>=0A=0AWell noted.=0A=0ARegar=
ds,=0ARahul=0A=0A=0A> Pavel=0A> --=20=0A> http://www.livejournal.com/~pavel=
machek=20=0A> <http://www.livejournal.com/~pavelmachek>=0A=0A

