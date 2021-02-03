Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D1730E09D
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 18:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhBCRLw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 12:11:52 -0500
Received: from mail-eopbgr70133.outbound.protection.outlook.com ([40.107.7.133]:2432
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232108AbhBCRLU (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 3 Feb 2021 12:11:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXbcRUQ+e1lOktuIjdZ8/N5cPH/V+oOYIn0qyoZO7Rab2KyX23r/rn0U0eqruonCrwPVqeFwoi5ysbfxZ1wVki66qJY7En0M+H8yHGeZC8Xj1/giCOPv8lfUut9MkyrGIHLBlUVacvwMh5s327yialDqokfQCoKmcGMaRkdMt3XQXf7i1j4oPlkkDwlkwgU7uVymzehb07C2Q4+CgJ6AmuTXtyne8AXtWF61BasMkaYjiTzSKKvyW78jAqFcg5nBaX3+aW0XaUI+nzwTO9mQHLsoQjhVHU2ChdO8tmUzHTj7VLEA+tIwPm74m1YjySEucbsKt5BxLoxDRtBwn0k6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rki/rZEu0e+st9FqFJjABQ0OuQxxLBmEEvGrUFK4l94=;
 b=h4Qs775E5GgWeIV5HUTJNS1cbvcBQ0TaHSx8JngaQ9qT1ihRj0BP6ZcrZTa0z0INkU4zt6fkbA/QvXkPOlwKaL7ecK9OelUg1K0ECR7yfF5CSKHAF5eW/4KbDOTltKqNAry2npeOEL1OpP/c544omORAVVDrVNI2Y+bRT+aJUj4LwIuPB/q2yWGI5SAVC59+nDtdTDxmudKSTG9vIl9Ns6zToYqEpMMiZGjN8NZVTEV3jN14WLNZI6iZ0AUuDA3Wt/+Fp5YzTvAtEwhkaNMLUVw+hFkj49DyZtrCbBchGoLKFuN34lyakoGzscBNCheyRMH6t56P3ytWq30FDMYn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rki/rZEu0e+st9FqFJjABQ0OuQxxLBmEEvGrUFK4l94=;
 b=HeGgJuZTCj7acLI2xnhEs0hM1uS5V9jGvQci6Gtf+YmnTKVVc3FTlzT3scZ+F0TZXg8+mAqYJ3Gt4Grc2bICUY4QOj9AoIupHj84ddOghce+pUxtZccUfThEzwbBZxRHPEPcr5hiyC0qh392FDTSOizd9hlL+paiCQ2dz8MTeTU=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DBAP190MB0821.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Wed, 3 Feb
 2021 17:10:31 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 17:10:31 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Thread-Topic: [PATCH v1] leds: lp50xx: add setting of default intensity from
 DT
Thread-Index: AQHW7lFOn/1Jlt56EkOy+ZVk/3cx2qpGlWAAgAAP4bCAABNlgIAABpCg
Date:   Wed, 3 Feb 2021 17:10:30 +0000
Message-ID: <DB8P190MB0634880713B530F51F95CEE0D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
 <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210203163555.GA23019@duo.ucw.cz>
In-Reply-To: <20210203163555.GA23019@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 909c665c-5ce6-4dab-5d29-08d8c8669c92
x-ms-traffictypediagnostic: DBAP190MB0821:
x-microsoft-antispam-prvs: <DBAP190MB0821B7F6193360E6EDB01F18D9B49@DBAP190MB0821.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BWpVNBSRPrYX81CP8fA8Sd3BUeP+SwvPt4yB/LKhHV4pEQyUAQaA3DhcWpQXPiblrjzwINUrrhe0IC6jtQ0lZeRAkRGmdE2tROARA4r4pMoTEByLwM2hjmf597nmADUoh/H1QsoGaLdtWEIG/01BaPWmJHuP7rsHZ8jHKa9QxXPnKrubvCXIvXl+H7lasQeYxzyNVw7F36fXctjqKAwt0PUkJqABlvX0TbVpxc8LP9eLbJrAyfJWnM+EGNAbkMiGylUE29QAFx3lQDwRjk/AJUuPixndsPK0vs/brtQ8yQHrhy9lxUNpf4mrA1rFKVeO+n9S1KEdz5FrLMrK0MlRboj2+T9FDMRVuuGvd2cEGNALCGNpw+fS38CxdboObKzLid1fUzKCWNtgQmm9HL9TYkbipjcHeU2cZ9xtWTXwp4la6+rI+FnLt1lH8HJudZqfpeh0eKXdalki0Szt8dCBhUfCnvueypQFD9n0b91LN6dkwLxgcJ5o5eUFJuCUnxdlGzCWvJkJWfCGVf8ev06azA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39840400004)(136003)(376002)(396003)(366004)(346002)(66476007)(55016002)(83380400001)(6916009)(33656002)(4326008)(7696005)(8676002)(64756008)(2906002)(71200400001)(66446008)(66946007)(66556008)(5660300002)(52536014)(76116006)(186003)(478600001)(86362001)(316002)(8936002)(54906003)(6506007)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bsrshn4KNAQPuQfvn5OUX9zO4bMfwHlt6LmhlXGQpkrieimK9p6nN6aGVeUM?=
 =?us-ascii?Q?8o3597/omu/xR4tyvMBdHqDXzKpun2wH6Mc+DafLi4D/RKOdRNkvzF/MyXDq?=
 =?us-ascii?Q?MYuAbRl06Af3080Cwnfw9e6ekHkBhtLp2fNw3age/iJzcY6zyMQNcNwz4gxQ?=
 =?us-ascii?Q?PQbJjc2aF2PktLIWs1r2WuXMlfBq1K7TBKpAM/934JcoGFhJ4G4erxHejw4o?=
 =?us-ascii?Q?G9MZlt+FtRFwGWKcxu8m9DFNV3b310dkuTMCSRCEZbHBMye61NNqLDhV2nc/?=
 =?us-ascii?Q?Z1Dv+4bclE98hF1+R/HbqL/xsZllxQnoJibYULHKit1lhZ+GSXtBdP6439sQ?=
 =?us-ascii?Q?90Dg1t6gYkB7HYZ3bMkUt/w4ocTQNY/pkc6Y8dU1RdTSF02A3PDL6K45UGw8?=
 =?us-ascii?Q?sSZF5BcegumEde5E/NdGNEIZNRS1EYZ8sbiCEq/1GOjn2AXtK7pcF4c0EvC2?=
 =?us-ascii?Q?bf7rU5JLBeAfojcb0FR1Ve+D/+Uz6TfkL0UTxjJ0gFxtap8d/+VOpKZ6577O?=
 =?us-ascii?Q?KHpYvrN0kbZLLVpdPRkdPZ2Lst2tBgDTJl6g5gDON/UMx9PfDLyzCefWFioK?=
 =?us-ascii?Q?uG6kke6ooLI0Bbq2tujYA+do3Cejb3v4qsi6IgICeQG/uk/bc28Oq6enPoPN?=
 =?us-ascii?Q?LM0K2JcnRH5PcDp7WIkvPZ6g4sbdeGuYQES8xpKy5KaQAMAX+7w6qY3pyra3?=
 =?us-ascii?Q?22/kGAQvZeB+ZJob0FqlTe/Gf9B+aMmlHYIXlzR35kMDJXKILEFVXeBRSjLg?=
 =?us-ascii?Q?hVYBAhZ5LLUgD8CQqIBnG8eeI1ln1wTVmt+wovKwkT31sWXZoHowl+hsyYyV?=
 =?us-ascii?Q?ijbWa7va5Yue7tZ/yKUR99IefwKaWsnjZpu4SKikky2G5+dywVcP3l5cFvE8?=
 =?us-ascii?Q?Sps5vL4ketiha4Bj4vETzG7d3lYhOtv7BejYSWxelMPec/PIbLtjrmBhC+f2?=
 =?us-ascii?Q?UpASFmRKsvvWseSa0RKFWRgvuBfdnPnoqUj5rGD1QrTWFPEZMYehE9cBW9sq?=
 =?us-ascii?Q?7d96MPlcKhUehKvEFTobd1+08sxjpGRftf8p/ODIAcB4TAKYfAd/RgsA2CMt?=
 =?us-ascii?Q?jUYLovPHKrLYEVHt7Ht/8RTZh0KsdvAU2kgiwPypJim3nac+RsS0fHKuTWs+?=
 =?us-ascii?Q?l3I6uigKW+y1THU+ReROy6awYIDnS3Hj2IqLmcz9oAUd6UIUOVnQM93pLrZv?=
 =?us-ascii?Q?xB9j4PUtxw+6ZUbLNDwc5ulydDmRNXmIbkXp0fqQzkLAEXLCr7Gl6ccDq8YP?=
 =?us-ascii?Q?O0Lus/AZyC583DtvfkYXQ0AWqZU6XZ5VWwNVUckDE2i/sv6/6oUv/rm6BC86?=
 =?us-ascii?Q?/EOqJUiRUUNss/WBNiRlCNp0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 909c665c-5ce6-4dab-5d29-08d8c8669c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 17:10:30.9045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8pN7fAfUG7rTdwyYNzXngCLe0lRHwqPPQEFdPsq5T7CixIdWkH4iZqG7slQ1I4O0LO0kVOK3LcBV8zZu6RmDD52fzl4ea6CTDzc6q/ey8OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0821
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

>=20
> Yes, sounds reasonable. Could we get default intensity of 100% on all
> channels if nothing else is specified?
>=20
> Or maybe simply "if intensity is not specified, start with 100%, and
> use explicit =3D0 if other color is expected".
>=20
Mh, if someone is already using the led driver and updates to a newer kerne=
l=20
we would then turn on all leds per default to the maximum intensity during =
boot=20
until they are set the way they should be from userspace. I don't know if t=
his
is what we want? If yes, sure, we could set them to maximum per default.

Also if we want to use Percentage Values (%) for setting the intensity
I think this should also be done for the userspace interfaces and not only =
from DT.=20
So at this time setting the RGB-LED to white is done like this:
echo "255 255 255" > /sys/class/leds/rgb\:led/multi_intensity
would then get=20
echo "100 100 100" > /sys/class/leds/rgb\:led/multi_intensity
Again over here: If we would change it would break earlier Applications
from userspace. Just my thoughts. What do you think?

Best Regards,

   Sven




