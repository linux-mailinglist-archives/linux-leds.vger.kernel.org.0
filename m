Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D720E6049BA
	for <lists+linux-leds@lfdr.de>; Wed, 19 Oct 2022 16:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiJSOuw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Oct 2022 10:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiJSOuf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Oct 2022 10:50:35 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00051.outbound.protection.outlook.com [40.107.0.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F2B5FD4
        for <linux-leds@vger.kernel.org>; Wed, 19 Oct 2022 07:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jslYF1i17tgBAMfE3VmGQqYE7q5dksBIFJAWrg9FJMHsrCpPS82RsdFUiTsjl3zOfBHkzi+cojtSqjWN9qPbzZE9/k3jZavUO0Qc2dAmqP7QdkiTFnJwIy/zovUQHzDKW/7kAR5tAoCXfY0PkDnWo80AVKvIo2M1aGzD54YuB0ZGzATy8aebM3slgoSLtUJhij2jyZvdWcKZMSTSz04MGei0agZTPqnUhXzfoYkaJ07z7sU+KMmQHi+ANE6rSXM3cXghBfuMLddYiFLFBx2B8Rr2SI1ptIBHa/MuA72ZgrwGmCFOlg9deZ0yuYXuB4Onj/8lIeT0QsfjmlEI2vLaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AleD7/LtTSepRL6izaUppFDmZROWzuzs7c3P5mrQHOs=;
 b=WnBOsy6ZNfVrwILaKNnt9pX5lk1Y2z5SnYyadMbki0kvmTe2hs2M31SrzXPAeOJiSJRuWf0ed0WQW2tiKXmA8zyjdSx0v0ODcEqAY+FOKIEG1CXQYbFK7iEqywsta1QfBZSXBzH/6u/5OhoEl2F+CJt9g7tQ+fIqWdn+lM8qmg7rvZbtSqa00BoBTYu3BgCXWdegaDjVzlSshjYK0hXzLL/PhqipvnR3EbP5bYtjXm6MV67slCQ3oza6DEZgN3UHi6qTD/WBBSYhtF8+UcunlIoEE1RkKmbc9o6UFirWEsgtj4IOUyx1KkRoKn2wBffKeksRGaFKKiqg0nGkCZcpuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pt.bosch.com; dmarc=pass action=none header.from=pt.bosch.com;
 dkim=pass header.d=pt.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pt.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AleD7/LtTSepRL6izaUppFDmZROWzuzs7c3P5mrQHOs=;
 b=lJJBL+jlV6qCdvvrkxZdm81EkXpekypLYezDAQgeRX9J4yVq+NnnADur1+tCCEr6hDUi4Ds+braHKQChQraJ/UjbuwNOZa40OGp8DuFfNEhZB0hN5AghRPdxEu+An3mEccQ0cA+2csSzx5Ct/OEd9SAu8qQlEZcITtrMhYU1HTE=
Received: from DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:149::12)
 by DU0PR10MB6680.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:400::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 14:39:19 +0000
Received: from DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::85f3:9b04:469a:e68c]) by DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::85f3:9b04:469a:e68c%9]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 14:39:19 +0000
From:   "Soares Vitor (HOME/ENG-Ovr)" <Vitor.Soares2@pt.bosch.com>
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     "pavel@ucw.cz" <pavel@ucw.cz>
Subject: leds-pwm: software limit on brightness level
Thread-Topic: leds-pwm: software limit on brightness level
Thread-Index: AdjjxyVwa7U5ww/OQB+JZOFt3Ztf6A==
Date:   Wed, 19 Oct 2022 14:39:19 +0000
Message-ID: <DB8PR10MB376679C1D290B55EAF6BDFE6992B9@DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: pt-PT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pt.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3766:EE_|DU0PR10MB6680:EE_
x-ms-office365-filtering-correlation-id: 4cda98e3-bfbd-4264-cb4d-08dab1dfb49c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zFKTkncV9lb4OIm4u0GeEctsW4NcFduAbSgEbD2Y/r2os+A+HVTXTn+krTraqHjXPbpnqlPQlcVSNOpLok+BcwBfwI0m4EkWW2FLLgDGTdaAnBxbDeVidEFmKWth9MbwWTdVpIxaJb6fC/6lyzHndl/O/PS/aUIP0FhQroj1X2ahHhgRd0dcGElCbCovvTzAdrNmIUtLQG0hfxn0+NiOjUzjDDSn8H2mBDRqB9IqHwtkAoTtHG01K0QSiHzwD3D0LtgGGOHlF1HfCHjbzsx8f+AexkZmtrycvTloATwHk5mLFcz3WI6aw+2w9UhGN7hBIynCZVVs2rkPC0IPtuOzpRW5i1Ggnn1YOphfxkiFP71ssZrEMHffyicAn8euBQUFmVzo8WVdxfyvR++JVGyKk0XU4c9xSkawN3gQsL1/tgIkLp9jvNbO/PftyYdin4R/cLQhVYax5q9k0iVXPONCLcdrKQT9AijFgnIgDO51O6qQLKvwNo+z99NIOeNZV7lEZBfTCzMm6y80azSKq3Uu3o4kmGngR61uCsm1KpnZDBJVHal3h2O4ytwZXMknWpnXz3xXDVDjTvmnzJK9hkVRdsbxzKu1R/xiIrXXW9ore24SWkRMd8Ou/4LrmRs9923S4lhA2hfXN+sxe1usId8ATekd0Zo6yz66O4O1JUCKPcafZ2LFu+ee5e3328FcHJmowQ4FOBDv/L/I3esUo7dBaG6S9hEK10PZwgzXsmRDJ/gSav6fhVscf4Uqceadk8kCQ9YcZSNDl7dXFBq7m3LO2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(71200400001)(86362001)(83380400001)(38070700005)(186003)(4744005)(122000001)(82960400001)(38100700002)(5660300002)(41300700001)(52536014)(55016003)(8936002)(6506007)(478600001)(9686003)(26005)(8676002)(7696005)(66476007)(66446008)(76116006)(2906002)(64756008)(66946007)(6916009)(66556008)(316002)(4326008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1EO3KwkQoFmDWl59ypHxdGnFfWO7L0mpwdFaUdEoFrcEliTXQSehaGfmc5cO?=
 =?us-ascii?Q?NF/s/WwjIEM9PpkqXs2gnYdyqRXEPoTRmwwnELPeEYV+kmVF6U3FllpHo5Tu?=
 =?us-ascii?Q?BGwDRdvW/mWOsMeq6FdrwEVny7Ta4CBlgQ2nnQaQ0tB8UyOr3pdrBRTEwHJ+?=
 =?us-ascii?Q?3XLxzQSy8LzfjeLoxIaJ4oUTWoNzpnJtgdlGY8OMWIxQEgkSkpTZITftOJhK?=
 =?us-ascii?Q?CxepJoVSadKX6WvYKcXfXMtq0ZVW39S7R/sSt++sVgtGHNxXDgZKPY66Oa6A?=
 =?us-ascii?Q?ZAHrbwpNYVsYr6n8TitCw74ejuSsDd3ZKlBBWbaHomCd2N991agV/kaARTG9?=
 =?us-ascii?Q?Fncn9uiIErkkcTZ1Wa3LLwjMJ/Xk6lHFfF4PKZw2R8TjVxKFPW5LyNp/lkNb?=
 =?us-ascii?Q?VzT8g3Ki/ezQ5QUdSLn7PWhxYNYEjFqacwItuLPW7pNPIA6KCf169XxK7529?=
 =?us-ascii?Q?dwxJx8qka57LW4sFXBURZmDdGlIEIzjw37TUc0kIkjVe0+BpxAFQFX42kuyy?=
 =?us-ascii?Q?MPJyQ9iZ5ukmPEtCM4NxHKxpmzfdCwgF1Q+i3m8Vx9LXEk20eqr70MIL7WNG?=
 =?us-ascii?Q?wlPelhdBptr2a9BiQawGuMyYWh2uh7/oOLuofPAp5Bxlb2sf1/FIQAzqO4xT?=
 =?us-ascii?Q?s5M3CSByzINxkAaAzw92RPKLgJIl6kOMcYuxi8Dfw3Txu8aSwZJlaetbUhiZ?=
 =?us-ascii?Q?KKYtZTh+3kpoCieotBa4fQh+RXRSmu9cniAmV//6x06P0mpGSFt5yVuJIajo?=
 =?us-ascii?Q?55FqDhA7yX6L2eqIAUSZo5eFhSf7xg8sMc+49RIVFrAUyvFq2r3r7aRC+vAX?=
 =?us-ascii?Q?BHmUU1svIK8La4anYJgf3bb1P0Mo1z5NS/PCdNbv8Jao8mBel3HpiXjFaZy0?=
 =?us-ascii?Q?jj4bkQelwLsMjxlcphgFiveDa4HxbDR/aCMgyqtjQk4yqZzgcnu5J43E3/w3?=
 =?us-ascii?Q?tkffd3CNkxq0FPwpqJIe2HHxqdO3if5cYCzOaf4nmPRkQG+cDhdE5Ra3yh54?=
 =?us-ascii?Q?1qfU9gOdfZa0KARlU5RfyrumMhZVTaVSR+zGftIoB7Wifr0Ku2VLTm3XQNNh?=
 =?us-ascii?Q?jpqIjYPgvKunLXetOwrA5+0Ib+wMTP2Z7Rpg6s+/4pUGb52DpIke2EZKzsTH?=
 =?us-ascii?Q?+bAtfUeVdqV08FMtzpj4TG++zk0Pp2Zah0zqbmMPrWAPv3urLSZ53imyLELV?=
 =?us-ascii?Q?JuPIGrKPmKnA60uXiWti7Ncefhs5bGV1JW6cAxhXcrvXgf+uO02jW6sQj4Iw?=
 =?us-ascii?Q?ZHXG8uMt657u90QCC1wgqIozPDsBVKkbVmuxx/u1uCcHAySh6+4noZeSmLon?=
 =?us-ascii?Q?6Cta+JY6Lr2IXJ7s4zBSoail8Tp3kuHHnMVz3AL9p+R5Csl5cvHtbM6eTEQ7?=
 =?us-ascii?Q?M/pNYdinw0EZ1ywC2Zglq9Pev4mBt0ccU1lI7HFr/b9JetcWRGVnPOqZr5Gk?=
 =?us-ascii?Q?/9nrV+UHZ+PNYCeD+ebcjDTzd2IRySILc5wzuf6nJNnSCTOY7W6+aSZ0Z+Wr?=
 =?us-ascii?Q?0/PmY+yF7TiZExwi9Jm0aGpen/w4rnwfrdt/VOOY8HjShusNRn/onPDtYfKe?=
 =?us-ascii?Q?r0XrBZGhjrqfnsDda6Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: pt.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3766.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cda98e3-bfbd-4264-cb4d-08dab1dfb49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 14:39:19.1719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9AFzVqO06DbDmyrhp8s5jCBmaB7QExo4UdsgnrSFtZW0n9TdVGcmoPLtz/LWiSIhOvdQYs2hj34oefl6liO+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6680
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
=20
I'm using the leds-pwm driver and want to put a software limit on the
brightness level.
I checked the max-brightness property, but according to the source,
it defines the value for which the duty cycle =3D 100%.
=20
In contrast with:
  /Documentation/devicetree/bindings/leds/backlight/common.yaml=20
The max-brightness definition, the led-pwm documentation isn't so
specific on this topic.
Hence, I wonder if max-brightness aims to set the duty cycle =3D 100%,
and if so, how could I implement a solution to set a software limit on
brightness level?

Thanks,
Vitor Soares
