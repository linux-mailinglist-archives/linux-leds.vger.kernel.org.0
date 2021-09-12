Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735C2407BF1
	for <lists+linux-leds@lfdr.de>; Sun, 12 Sep 2021 07:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhILFIK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Sep 2021 01:08:10 -0400
Received: from mail-bn1nam07on2050.outbound.protection.outlook.com ([40.107.212.50]:25993
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229547AbhILFIK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Sep 2021 01:08:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abjIxNuD2AUSNrzwpPCd0dfJHICPDgYD7klkkh2R0Vi/ekf50TGMjNDRhErOSMtEWGoO14/cpXPGYJ9SPX6l93bmZB469SncAFNc9o81ZQ1GP3DKL8MOEoBI3HzV4y4GG2c4+KOgAynv9JslC0wvMy6n2ybPsHSOc4IgB1npVnpeQCCQj178WrGRAulncAp8V+hxllbIm17ilxIR3NyD/aGw+yS6QkPKhCDXh2cItcx3Uu57zWygw980erRAugKPIpe/vX3vw2gP88ABwu/JsgFPnhnh3xJ6BztuKZT9FNRgvxFTVL+C5SEI3D6ltU4l2sIy6qTRljKgHS3aZFt+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pzXhvWdDJuWWuf7AvDLYHMRfOKJyOuesvvyTRYqRaY8=;
 b=kdckFimbPwFN5Z/DYZ1sC619bzzn2WG7x43j3943iGNKQXUCCzYkgVZ2m+V0PwK+mRv6TyQrfIjEgMxrqrN12CN9ufUyPfoiUNM0dAsT8WyM2f5fu9EJKIcu13cZkMIkajQYc0eShBFDzqZhZHcJGTnhhnfVx2P09RK25MR6ZBwEKGqNICRunUOVcyTxz/uNjXYtF3un/DjKmxgO9wKbl9y17NTDW8ZRHEOXJdo/bF4OlIQLsU1rCAuIxuOGEpk3A20bgdA3+ezgW0PHtp2rjBqbTmGZfKLI7zhXUKyzAX6INpvYz/qDoMO3waZbIFX7d7sAXSGQobxgYHP1wdZHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzXhvWdDJuWWuf7AvDLYHMRfOKJyOuesvvyTRYqRaY8=;
 b=m46g2a8pl9Q1Doi3fZMYnPWChI8U97htpCtuWlyZ3pSenevwTmzCEcaCtXheCXoyOCDrChAJYmAT9lr2kW3GOuSz+FZoztnHBUZoY58a8fOOYP7VsNp84P6egkrZAzlInkFEc41jINvGFfGiwt6NbH/LjiX92ZsNqc6KoihX9G2o57T6SnCZnNMqQlRiQm0idnPv7dmydKg/DOaoptJz3r90kWEi/hVJLqEbNlS63EgomZlNqB+H1bMEXiumG9iOtyIo3O6hfevkYgXb02CNdgJmX9Gps14lB7e+aC4F7660ya4DhRNqq9g7aC04B6u7vBl917AAwMmJZp/pen5HIA==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Sun, 12 Sep
 2021 05:06:55 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::f00b:b206:d819:d8c8]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::f00b:b206:d819:d8c8%6]) with mapi id 15.20.4500.018; Sun, 12 Sep 2021
 05:06:55 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: pending patches
Thread-Topic: pending patches
Thread-Index: AdeS0DQxb1q79RP9TeSzeQiW4BazEQCyhSiABH3oCwA=
Date:   Sun, 12 Sep 2021 05:06:55 +0000
Message-ID: <BN9PR12MB53811FD7FC0C8DD410F785CEAFD89@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <BN9PR12MB538114BC3CA171DD31E420A6AFFD9@BN9PR12MB5381.namprd12.prod.outlook.com>
 <20210820080631.GA22757@amd>
In-Reply-To: <20210820080631.GA22757@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 643db86f-6cb6-46a2-41df-08d975ab2432
x-ms-traffictypediagnostic: BN9PR12MB5210:
x-microsoft-antispam-prvs: <BN9PR12MB521087F1F1899BDEA4F852F0AFD89@BN9PR12MB5210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MSM3qHXx39S3/gUZ6yLcXo16+WRz7IL6YHMUIT9rX5Abse2ZqjeO/J4UG/x/XCI+aN8P7xk6upm050v5oq8f8B/XMycrNmZdPTXYAtVbRkEG1Z+YUWUmGv82FmXxASbv3G97+CYa3se4evu2et/6TrseqrQlFcBoBeJrAwq1H42TYex3nw0mP5JwK9nAAQcyBLhQWBkjFAs4hG5V4Ed97vQNc3N8smV1BeLfEBv3OS6wREpOY6aEttyXwvCHlpG37b5SiBF4w39mcJ3x5cTO35e+c69upGscB50dIgmLdn0wxHzA3w/kXgEo4tPw2EVOOCK6OmJhjb65Vkhf6x1PJ5ue74iEo8YEmQEYTeEAi9Kt2vr+r6nwXTBsKXpcHo8rplrfsAKOVgRN1OOklewJ3F9xWrzMVf/bCQLx4Zm6WLznX/q39xNa8CaNA/SSKiJs9G3JtcvAIRG78GzyWw5DJtAHj7PEY1AVAR36GVq5y5LLi2ULoxbrcyMiWNi2OeYtNIKFTC6RM+s4VFkv9bPTxEwV8tdb9shvMCwfslaeIrhCQ1pFRauqPKts353Tjg3ESK1CuIijpZdlkIDpLDaiIqnO8BiJVnw8fJMvYorrfNC3YaTvOXCV11papvV8lFrIyyQtF3xRZvEjo4Ew1AbsuEjFP29gg03IgWYI+NjqPM1FHtGWEVG+eQ/Hg0nqvmno/KcBHHOmE0Wvv+aIb+D4pI3BsIJX5PIJsiSXTxHr7B3UaE37xXF10UbSNjTI3U0/m1CQdX1YYRHjPnnYwhKG+rH4kSKirt8QPtmQvvuh8QI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(71200400001)(2906002)(66476007)(316002)(8676002)(478600001)(66946007)(966005)(83380400001)(66446008)(64756008)(3480700007)(55016002)(38070700005)(7116003)(26005)(76116006)(86362001)(38100700002)(186003)(9686003)(7696005)(52536014)(33656002)(6506007)(53546011)(4326008)(5660300002)(6916009)(8936002)(66556008)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AM7qGknmtzORO2pq6HsypJNXINF5DmWk/Df1UpXA/bIPLlBVEpzW+56bukX1?=
 =?us-ascii?Q?ir21gynAi8Xs8AOmHExC9/ucdzBqhdzpkvKmUMzdKj0PcTRMkzVeD3Q02r2p?=
 =?us-ascii?Q?c861oO2LhPjbzVPgkmf8Lgvgibw6dkb23dezS7pZ6u11Ee6KZD/ax4miyuGh?=
 =?us-ascii?Q?t30lUt4QPUQwaVFKqWWfIPlxqaOGOmvOWMW9fPqAKIFAGFcA7KkGWZdH2sPu?=
 =?us-ascii?Q?VAoJKxFlCB3TZ3FkvVK4Hd0RBXI4SnvxnY4v6Hpxgej52SddLpPGDSFs9DOE?=
 =?us-ascii?Q?S/u8MGQPG6cyBU9sjlxX5SQl+M6urKnamrSjTjG42dnkNCQMSEviFRtGd5rl?=
 =?us-ascii?Q?HbOv0QmYPKv6jqQnDP3gdpuTLIrhB4u6aXoBLPlKHPzJWuXom77fb7Nt3WA5?=
 =?us-ascii?Q?fO6K2WODj7HcH31bX725WvxK3nXXoWfnQ9OfZtyp7JLyAtf9WK30mEoo7yeX?=
 =?us-ascii?Q?bkwhc+pl3vKyWrp2UX5F2niT5o29NEQM3ksyA0gLgTI6VsJ7WKjRzKWJxfxb?=
 =?us-ascii?Q?SHgA1x2ZIqfx+S7EUAa9qfoCyc8xvzJOMvNGZ2A7qeLhoPyLXtW37vQcofNo?=
 =?us-ascii?Q?QP4P9DvgWBbpMh8KjC/94R8U98DqakGU9OczWshpt5Cm2S1+5lfuItjrKmIc?=
 =?us-ascii?Q?2FAdsFFc03Ars3fgkP8372TcTU2dcYsE6ufO4TeTC4lN1VwwpTpZdM05Nj9U?=
 =?us-ascii?Q?OFr+HbtJcgVbUxA2/vadFEvqpp3T5Rx0FMo5XvHzfu6CmPIxF1r98rxkcYAH?=
 =?us-ascii?Q?+MId7iwGmYzL/nfJyar6MVOnpWhmKkIazQMKO5X3+8z3c7LFXtTDoljB4YVn?=
 =?us-ascii?Q?5ysMo8Eiq2QEpM2ZxVl/lHABvcGXKQIGwWQMdnwriArXXAWxdFqTsWH8I8J3?=
 =?us-ascii?Q?PxT6Y+DruNcrJJIkERftg9exH2uEKVtmyC3NCHdp9ned9lSE6q5QU1d1nZ/X?=
 =?us-ascii?Q?l3/9y1A5xVZVYAHG8Edte/FeMz6WC/bgKni1fc6ZBwHN29LNrC2c+/1x9k4h?=
 =?us-ascii?Q?GjmaMBRHyOClz1aXgoUJsDADEJLIIWOlKXlCpvUXaxHWPo5UuoIxBGKoYFUC?=
 =?us-ascii?Q?u8gY9A6V6kX3pPJjkUSUofzTKhz1dhcDJ8e8hhUWQOLT/Pg3sBVF2npMhqyb?=
 =?us-ascii?Q?re5/oS6Ds+RXArMTAHWy9vTfuI/F5qQt+E4c14ztSFnP4blw+/w1WmCRtRUd?=
 =?us-ascii?Q?JE67T4bksDqJDsgWjHolYU6dm5T4gAvqCb7vKIC7aQUQNe3JEZhoSD3jXTUp?=
 =?us-ascii?Q?Z29AjZV1Hks1m/rA7RKW5wLtOjzergOGbP+Demq/LiMlNnj/enIx/BdioQDZ?=
 =?us-ascii?Q?Y+3BzzzRZ1R3g24O+rXj8yyY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643db86f-6cb6-46a2-41df-08d975ab2432
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2021 05:06:55.6209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoQAh+gx0aIsV3tjShTA8hC9W8dFhh7a1I2xwn9jB+S73FN+NmpfJtjIZKIBmP1EXUCr2aNGfoZoPRvvO/su8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek <pavel@ucw.cz>
> Sent: Friday, August 20, 2021 11:07 AM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: linux-leds@vger.kernel.org
> Subject: Re: pending patches
>=20
> Hi!
>=20
> > I have two pending patches:
> > https://patches.linaro.org/patch/432324/ from 2021-05-07
>=20
> I don't understand this one. Are these normal single-color LEDs, or is it=
 some
> kind of weird red/orange/amber/green combination exposed as single LED?

This is not single-color LED. LED is controlled by programmable device, col=
or is
set by writing relevant bit mask combination to the related LED register.

>=20
> > https://patches.linaro.org/patch/403538/ from 2021-03-16, which has bee=
n
> re-sent.
>=20
> In this case, I don't think i2c bus number is suitable way to identify ad=
d-on
> card. Having some way of identifying add-on cards makes sense (as we'll
> probably have other vendors having "fault" or "activity"
> light on their cards), but those boards will not neccessarily have i2c on=
 them.

Line card always has I2C connection, LED color is controlled through a prog=
rammable
device, which is always I2C device. So, this is I2C and bus number identifi=
es topology.

Pavel,
I have those patches pending very long time. Could you, please, help to get=
 them
accepted?

Thanks,
Vadim.


>=20
> Best regards,
> 								Pavel
> --
> http://www.livejournal.com/~pavelmachek
