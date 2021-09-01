Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB963FD89F
	for <lists+linux-leds@lfdr.de>; Wed,  1 Sep 2021 13:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238659AbhIALZO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Sep 2021 07:25:14 -0400
Received: from mail-eopbgr20049.outbound.protection.outlook.com ([40.107.2.49]:17158
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234678AbhIALZN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 Sep 2021 07:25:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAK/MBadOReuFvdZBQ/ythtMZwwjfsBq8epOk2HV7vX8+su/W3VcFrFcqYV0Mr5CT8K9e8ZkwM7tml2zgGIVHTdP5RgUZDAGcct3bYQpcYZRekjKJw2qf5nTTYqnKHWufYZRjDr/Gqm2X6YNvSgCW2pz4p2LlPptO2bYp3ob+7WbaWwMaxGHFHbwPgbhyargL0QKba78UkXHKzCiCto8nbLZWjmd0dOsYojsrMB3R5ZpatkGkbDyOnNr1jPt/+O/SlgQ07Q1BEbpmA0ViJql3AmJnR1YeerA/pzPZ0lawS34F03MX6Ews6SGH7Cq+ClE0cew7J1tJdnWCg7hgTqoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dicAGMl3b3k5CnBSR80NTAZVEe0veVgYnYWXZqJQF4Q=;
 b=KUIa85UH59+6lcul87zxCkkVu1/95paBKQAH504U2q7w47FTmZisvjQgHSbIFv6OggapngxPwMBSgi4QfAxCbN9BeJc/VYJofRov8p4cAcY1uUNrOdGBLOs9eX3+F89vo0tYjewieP892w7mWPeRqfFlCREKG8lrAd3i79jj1IUT8Mthnt+OR79QwtnwZiOdmDSMpMjWyu40CwVXef4XFWL8P0RQ3xxpbTSkiBj7rYHe4XggUVbFlH+22p0WdaU6zg5sX9rPw0XhitCA0g09M2gCPRZ4nvtyJcG/vMs2+a04UXYBA6aAdtMZ8S1m+mp7xx/52rRb2y9pjgNmbj68dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dicAGMl3b3k5CnBSR80NTAZVEe0veVgYnYWXZqJQF4Q=;
 b=T4SQaO3nfugSQsS+P+jIHinc8u07kdWhNVjQx989Xp4/sf+n/X7Q/FAo3BGco3cF7Ltv0Mnp10YzsIKzz8ac3PRaygRLw7XeNad3aD6Zd19yOlnd7+TG5Fn54m/OkXVsc83SQ0kFK8ZP/8kB3gRYDq1a84cEU+TgxfSU2jnyxs4=
Received: from DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1b4::17)
 by DB7PR10MB2250.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:24:14 +0000
Received: from DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6087:5286:e094:4fe5]) by DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6087:5286:e094:4fe5%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:24:13 +0000
From:   "hamza.farooq@siemens.com" <hamza.farooq@siemens.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "henning.schild@siemens.com" <henning.schild@siemens.com>,
        "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
        "Haeussler, Gerd" <gerd.haeussler.ext@siemens.com>
Subject: RE: Define LEDs with mixed colors
Thread-Topic: Define LEDs with mixed colors
Thread-Index: AdefC/4ZhHUj2Mp2SWmM9Mt1YYYklQAFdcWAAABrR1A=
Date:   Wed, 1 Sep 2021 11:24:13 +0000
Message-ID: <DBAPR10MB42198EA968C14B13B510834D8ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
References: <DBAPR10MB42195CA4E52FDD30F0598AE98ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
 <20210901110929.GA18522@duo.ucw.cz>
In-Reply-To: <20210901110929.GA18522@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-09-01T11:24:12Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=4e585811-c117-4cc3-93c1-bb685b2b6cd0;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28e8023c-c6a9-4c71-7ef5-08d96d3b0722
x-ms-traffictypediagnostic: DB7PR10MB2250:
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR10MB22507EA657DF20C3ECC6A6A78ACD9@DB7PR10MB2250.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X/wMgcMdbZhizAyDEGLOIHoyM6RWagm36vTM8vtjPF+SsSlDQ+luJw8tSTrrmeUU5QOZYU0Pr4CqgE4AP+46x8fWL1b6mpb/YCM35GvEh5aR/YKEMH5XTcS/LMiZ8hcVvyN8CFUlVeVRoEXfeiOWPb5HrL8bfqDiYuWvbt18h4VwtYnMISegvXNGoNM6VMJzH0RMM8UAD0pAzUrOjdEKQsW6tbqt4ZnhzWKAh89ZRne6nzBJX0TiVsG0HSZ9S7g/u3g+z4SsnbyU0pYAnaGyAy2MBngd5vhLRRzEdS8d9nhUCpBjhBny8+I8bJ549c38IkpYflqGrufUz2uJ8cQltm92kQ909grFrY3bRnIBnnIz8t6adzPBMWxgtxxYIb8InKSjx84DTRqcMuskThBBeA3qRVCkOAfVEiPu4yuCoCJNm+k7nrt0kG4Q93XqCZPXf33eW6df7CZIWnxr8Ov1JAVqr6BzjNr3cFXOrbGWBgr80Wjra8X+rDaAlEgXuEf+nDGFyQZE7EbNwp0pPS7UrD7igjhjwTvAuc1BQ4MIyWd2QlEz64OeFL/x4/de7TSGX/dYn41JYndpUUf+L33UIvX7pyLrK5hDL5FM8YvDaxyIfUKnKV6AcKFAVrGONj19hCjarxXYqblQT/zfJzKXUU8RQalaHfwKkf0rj44+xiXE7mjtt/ICk2EfFSqYrkoEGM02IpSfeqjs6eoKnh6nwKtxtQbHf/8NAt3QwtyJ3MpJRfD4DFndhnvGRj93uWmiD3u/cE51a4taqNmoKSQaE3GxgTX2Ndarb52dSKC3cDg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(64756008)(66556008)(5660300002)(8936002)(71200400001)(107886003)(55016002)(9686003)(2906002)(76116006)(38100700002)(52536014)(122000001)(316002)(66946007)(38070700005)(186003)(6506007)(54906003)(6916009)(26005)(7696005)(508600001)(53546011)(966005)(8676002)(66476007)(33656002)(83380400001)(4326008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZFyy2lGnZw0Ck1oFeWl+XrOhImlZ+9Nb6lmUf3Z9RvrvE9p1De6NGdbAwmxf?=
 =?us-ascii?Q?osC8IwNYnYapQwj7MHhvgtfmgVSmRsNpcF14v8s1fOD6x8y7q9rv4qCaKGaY?=
 =?us-ascii?Q?4U/d67ddJUpvpmrfyqNKrFuLkN3VzI8PD2RGPD6z5Ic1vFDtzPwPlztymLWi?=
 =?us-ascii?Q?ck3HUbGv1pvG9gB8njb7JAr02/s75FFGjATs38q2m56UI6Qhh/qW7WzmxSBB?=
 =?us-ascii?Q?csuT+mja9qTeg9mFQZyuoxOtP3aIBiwH7IJ9wz1IForggC97RpRCs4ajASzq?=
 =?us-ascii?Q?0DfivxDp5rDTIObOGJZyrYWNeiOWdFur6eP8uiLmWfbw3WjtZyPoXVTDRps9?=
 =?us-ascii?Q?+3Gq+eEbofaDImM3YI6Mwu3cqnMkxF9y5Rjv7THtbAdFVyYaNFRlDueaiimq?=
 =?us-ascii?Q?76Hu+xorNS0s+whCZVn2Ss3HIxs0lNvlCYuP00NNH1qY5TyO/UgbgJgyJsI8?=
 =?us-ascii?Q?5RpE87U5pu7DMhNJvmGhCW6pzd+BzzUj5N9ZR/OKGJmL0qD7voJfyYE30fPB?=
 =?us-ascii?Q?lUC+/dDJYMtA3mJ9HpwTb8ZaBNYZhI19VNeTQ4mk6Iub3tl8e8vN+18FOD3U?=
 =?us-ascii?Q?dq8oq1O5hhNVuBv6pId0DXV4yvTZ7GFIDoQqHZDDiZ0wcSmprlgTZE98w7XE?=
 =?us-ascii?Q?FLOY/4vQa6zbioYXmhgOQhl2+sjrat8qs94RbqAegoYyXrLzxwrvR1r395PP?=
 =?us-ascii?Q?rqjCXS3/YbzJmdijSqyibvUJBGi4pB5cyXwR95llY2GEwsOEELt0iei+Vvce?=
 =?us-ascii?Q?K1glvWKFq2Q1qkQin18UX1CEb8dHW+Bqv2YuFX2kvaK0MaQKtMxPe6itdls/?=
 =?us-ascii?Q?OujBuXfzte4D6WL5f9qiwj24nsyk6LcAXHF1XH8ROvtB4/CeI1dednMpLMfV?=
 =?us-ascii?Q?Mox1Q0lKPWW71L4F8APu9ABfhpTVZUfXRNoYiQnrGg7mSQKDKcMQYJK3opTw?=
 =?us-ascii?Q?lJC0Y4erWekEfR/m1k1koPa4DBk4RIRM3K4u9kbxPMMZGIS6c8NLDakAlqWB?=
 =?us-ascii?Q?L99Fy5d7QwX0WrECEePt8glu/+uqn3W3CCysXZMWt+E8UYCFh4a5egmHOseR?=
 =?us-ascii?Q?Zad5Cl/uFuI5Zxj9c7xPncVFQH+WDuaeVeaRarLRMBfsIv+pKhGjjLNJsbUf?=
 =?us-ascii?Q?yakNxSU/NRD23Z/rHHSdeNjuiH/mALaqqAc96nRhmhdSC9FW5Z7hjHPzSxsa?=
 =?us-ascii?Q?wuq1HwrXuDln5KboZNqwJJSp1+1SdHfLBUPkTFsEJfUYeE5wTEnY3eVjxSbS?=
 =?us-ascii?Q?UMZ3LsAzmVQRrsNGpgkxO3jw3Nqll04EoL+2zW1IDqPq7+VTg4Sa9uJv0bLu?=
 =?us-ascii?Q?nEdEu3LZLaBow5KwggOOGnTT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e8023c-c6a9-4c71-7ef5-08d96d3b0722
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 11:24:13.8013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shJoU6VT0mFXaskRjWPodMPlrV4Q4hZMrvafcHzd/kvxstfWiURcREZ4C0lja12ULCgDyJEhB12AGf27LN1PLJBmV0VDBzxvpbWX+Y4tK3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2250
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Wednesday, September 1, 2021 1:09 PM
> To: Farooq, Muhammad Hamza (DI FA CTR IPC PRC2)
> <hamza.farooq@siemens.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; Linux Kernel Mailing
> List <linux-kernel@vger.kernel.org>; Linux LED Subsystem <linux-
> leds@vger.kernel.org>; Platform Driver <platform-driver-
> x86@vger.kernel.org>; Schild, Henning (T RDA IOT SES-DE)
> <henning.schild@siemens.com>; Kiszka, Jan (T RDA IOT)
> <jan.kiszka@siemens.com>; Haeussler, Gerd (ext) (DI FA CTR IPC PRC2)
> <gerd.haeussler.ext@siemens.com>
> Subject: Re: Define LEDs with mixed colors
>=20
> Hi!
>=20
> > I am toying with the idea of writing a multicolor LED GPIO driver. What
> would be the right way to define mixed color LEDs (for leds-gpio), in dev=
ice
> tree or ACPI?
> > Consider the following:
> >
> > leds {
> > 	compatible =3D "gpio-leds";
> > 	led0 {
> > 		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW>;
> > 		color =3D <LED_COLOR_ID_RED>;
> > 	};
> >
> > 	led1 {
> > 		gpios =3D <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
> > 		color =3D <LED_COLOR_ID_GREEN>;
> > 	};
> > 	led2 {
> > 		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW
> > 			&mcu_pio 1 GPIO_ACTIVE_LOW>;
> > 		color =3D <LED_COLOR_ID_AMBER>;
> > 	};
> > };
> >
> > This probably won't work as "gpios" seem to be single object in gpio-le=
ds
> driver code, but what can I do to achieve something similar?
> > It is important to define this LED in DT/ACPI in order for the user app=
 to see
> it in the /sys/class/led folder, without having to write platform-specifi=
c
> driver.
> >
>=20
> So you have one package with red and green LED, each connected to one
> GPIO?
Right. It is possible to create orange color, and I want to use DT/ACPI to =
present this info to the userland.

>=20
> Can you take a look at Documentation/leds/leds-class-multicolor.rst?
Couldn't find a hint there therefore this email thread. I might eventually =
write a multicolor led-gpio driver so want to know how to handle mixed LED.

>=20
> Best regards,
> 								Pavel
> --
> http://www.livejournal.com/~pavelmachek
