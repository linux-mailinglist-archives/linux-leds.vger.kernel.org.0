Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3DB3EDD66
	for <lists+linux-leds@lfdr.de>; Mon, 16 Aug 2021 20:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhHPS5C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Aug 2021 14:57:02 -0400
Received: from mail-sn1anam02on2049.outbound.protection.outlook.com ([40.107.96.49]:21249
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229889AbhHPS5C (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Aug 2021 14:57:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtCNtupve5CysosRYPXDvirgVnypbeRY3/m1uuz2mnHMo60HxDhea/jccklTUdkzCSBhjsFsf+8iMIm7ftlpi3i2hvbM9UuziE19eLHZ6HW8bcN1mKZVYgHxBZ2G94K8Ua19OxSG9MwjBeiMkm+rKPlOLGxwaEhdR8vfPGI5UesKbamyWL5BoHj6ApBsLMqBZSEMys5OGhd4ov+2nm26lstOao2G+F4Dv3jnAQ/7PYi8lw34cf0rMb+i0g3Zn6EotleYNzAIEXSzLsLRrPJo8S82/TAAPoFj+MrRw1k1ZVaRnspjlsgU/WR8aJ2Ck9QgmzCM8k6y/KT8dqBaYCHqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jaMJCpH19r3gKSLK4ScrRWz8Ci4AExyvnCQvpohPPw=;
 b=YzqC3nmUmeKdMR1vd0sDX9nAV7O5rsN3jXp5Xknyb6woxpJfLX52iwwInHJp0HRCdUGswOBhIT96GHHcOcffp26aWj0ckA95AICzUrS30Ypr2p5whj4WLPZCZCLD5lbwpsqTNBw43z1enL3XhZ71eChGMmwzC0tqGBOjr/EmyAk7b+M6iaeFDOatR7uyBI/kFmvxsFgGtilQ8J6jkUqgPN5/eMeMQZr8rw3qu33jy0bAYfvedTvDnQiB1I/XUT+OVOvDyCcq7C07Ca0ebV3c7PFvg6q4VGH5ZOYTtfK27J7qMP1cv0KWXC5+X9pp1M5NwarJnFUqXZymFcsKWTMc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jaMJCpH19r3gKSLK4ScrRWz8Ci4AExyvnCQvpohPPw=;
 b=V7wtjTKWNxbvsYxRZsKTevgFCaT2GBpoIMQSmjmEK3yofRECLBvJnJZVRRkH5jOxeIRoukhQT00uq5fgZfTKPbgtLEdg2Br0VVEUoJeq16E3wj1a/FyUi2cVtRwKnxMmnXA+CQ+eTfcsMdaH5HWQ+DPBn6DN8P1tKUAaKSLdqLkfjXELgbkqv4vEwIlhhGFfOrS+Drr9llE3Qf6GgREN7d34nVBzCjypaA52cM455XJW0rXeTevD/5rT+VPHscsA0BZ9WDl55vHkCMNbla8OYUcoydmqPzk9UuoiGfy6H3xcuiW6WjZOJUaLIfn26BCDDTQPSV+Z0rtmyHsyRI7dGw==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 18:56:28 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::a4c8:8770:ecf2:7031]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::a4c8:8770:ecf2:7031%8]) with mapi id 15.20.4415.019; Mon, 16 Aug 2021
 18:56:28 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: pending patches
Thread-Topic: pending patches
Thread-Index: AdeS0DQxb1q79RP9TeSzeQiW4BazEQ==
Date:   Mon, 16 Aug 2021 18:56:28 +0000
Message-ID: <BN9PR12MB538114BC3CA171DD31E420A6AFFD9@BN9PR12MB5381.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bf221d1-a550-47c9-d0c8-08d960e78e30
x-ms-traffictypediagnostic: BN9PR12MB5196:
x-microsoft-antispam-prvs: <BN9PR12MB5196760C3CC8AF132B15D925AFFD9@BN9PR12MB5196.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fLXAkpweLtZ4UqR1yAFViIuU8FRjLBWj78U0+UyexcOV9M4IKBz/DYNihBd+zK478xFNv+RRaL6eRvB6qnArgIO1HSqquSNVecyYcmVfRNOI30PXqeRQDuRqIVGpCpw7DbGsawNCPF4n4HNBn8B4OkyR4Ie9CM+7o39bBOWHifwDLWkUbTVYgJZmDeE+pSGZt3ZVu85Pq0KJ3MmQ8H5GcjJVqQkSNsrtHkzUhAhI/NRKttHnDeDp3+C9INa6r+oluUhAYW8DTNweihlD6+Cdcie0Kvh9RbwGRsl5R6zf3yp4cIa6fexD62lLuQ8wFh+uv/Gl7CGjpnGT4JpncospCHZ+8R2IPtlfYk1+wCLAF9merBpX+HDI2CAf3LF25QVJ+v9nJhuXfI+Y5T6DLoBfp57spuVndkpZB7CQa85G5N1upIzsgCGFLeGAe61iCzLOZyfCztxrBg7ZsmlWY4ZfOk27hSRMWfXK7bX7evSIgykwjzr9L36yczAweO+25n+ebMBlldKQkIcRD6fwkgg/L4VJzLCJR9YLGF9ShoC/da5PnemlXh+lqEtoneopxLBxg+Ztvenz8PMfQf6dmbENPt4nN8o0Yj1qaeo9Tzfo3jTbWgHiPhW69++v58olbrNCYrLvtCdUUWrmJbu6b8Z7QzCRbgNbET+aWYpsVtU83jYcfxWU3uT1zCAnA7+FjymRmGgb0UHEUUy/WRo+GidGifEAZJRhii9WwNvDbZt5EjDGPWCOF2GN/7gAuTHn7uIypt8+qGaLM+3rlDKMpuMvAUosSbuq1/IaA2TQHP5MItqA1xjYC0iqeOZUdVipg2uEeqHuQUO1PDECI6u1WyLlPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(64756008)(66556008)(478600001)(66476007)(66446008)(66946007)(7696005)(8936002)(26005)(76116006)(33656002)(5660300002)(2906002)(86362001)(4326008)(52536014)(7116003)(316002)(38100700002)(9686003)(122000001)(8676002)(6916009)(966005)(6506007)(71200400001)(55016002)(38070700005)(558084003)(186003)(3480700007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QtQz97tCHSFOgoHmu1cHURVxl5moxyIMoRsLMifIOYKJtauBV/zGR6wWCYMt?=
 =?us-ascii?Q?Fyh3XBD+IZnk2ZLhaMGQolQK1FkUUWeejZu3BblvK7mPCtcU9Oz5Yk1LZKi7?=
 =?us-ascii?Q?C/60YS60GLT5ir2TK+Hb/hm5pgnRkXRosFMdLdB468nDNZx3JOY/A/CUCx+U?=
 =?us-ascii?Q?b4Jbrm8VhOniabdn5Z7cPxMxWqTnEkrBD5aMeuD56+CuG8X/Sud1t3x7MG4U?=
 =?us-ascii?Q?wdO8pUpBehF+B88g02qZMjPZlH/MQMUQum8eVLuQWIkh7Zqn3WHeCXvsh7D5?=
 =?us-ascii?Q?sfmkDLbgJqeEG7MxZ6a7WU/TfKgYA/V2GKUZDxiTRGv3Z9r3c4ASzp8gx1AA?=
 =?us-ascii?Q?oy1R6AlLogMCY8LF44ObYFPdK+xSBuKye0jFuYQyA8PgmxxLXeAy8PwDev5/?=
 =?us-ascii?Q?kLfVFo+cWkaJ1MBLo4ylm9Ryv+LCebSvZK14L7VVbGPCYV0A9E0N5kXk+f68?=
 =?us-ascii?Q?SKkZpdbqUbkOlr/l3f08uyucoshw5jIEcEHsoLoRFwPIuLDfY+rwKI/WclND?=
 =?us-ascii?Q?l3EEaBy7CtwEre8Yk6RJzcEtIHoeAgePlH5jjJLeYdCxJg6iawBZbtEolG2i?=
 =?us-ascii?Q?FHHGaczECDH79/EOTzce65V9lzq8G7GQFH9IVQGnXStWHPdaujcgoGVKjYm+?=
 =?us-ascii?Q?UBhZnTtZdBi5xK4B+zUo5jDXT/OcWfswmGgpeTsyJBTw9Wum/Kh4CBsIB2ck?=
 =?us-ascii?Q?D3AKWgfr5fw19kalNhJTn72m/Gw66eoqnTAJYfHzJetS+znQXYWImnDyjmrO?=
 =?us-ascii?Q?mo6IxYBYiGAik9sm1KfnkjpDZLG+mggHwanO+bwGM7iAyW+jDpZjQ81Oddsl?=
 =?us-ascii?Q?H95l81oS5YocquVIbJ4pV7lrXt3Z8fJrBPiLfCIqHvjHbQf6fSKSIifKHc4D?=
 =?us-ascii?Q?JCc+6UitMX2ZFMxi49PAnolv8BpuhdebnGfUvTf0rbrkEFivKegYmJYbwVEw?=
 =?us-ascii?Q?fxRkibAjPld08RWsATXWRFX92Mucohn+mO5QOHCWOzGfzrqV3hRybbX6Bdi7?=
 =?us-ascii?Q?bmUmGcm7JVGXly5LFr4uMDvVrNbNVSEgLFhPKt/FM1BagzJg892Nq4ZZTNFi?=
 =?us-ascii?Q?Jizgg8MwJrYvUUCfNNlt4fZx8mQqCVLwhT6y7bFAlItCg/wedv1SeiomYB4E?=
 =?us-ascii?Q?YcPsIH0tHOopX2AcrdoYglDjQzPekpkyEVmukOxiokwe1Q3Qkx03CdcihScg?=
 =?us-ascii?Q?2c64jWmkLdcwNRXow7tjWqaeBFiL/9T187lfTFfq25+qK5wVkaxtFJjPgj8K?=
 =?us-ascii?Q?oOF2HtEIT+OLzTsqjnqebq22gX0Ws0sYoke0lxWoMYJN7DFA+hIuVKYs2oPP?=
 =?us-ascii?Q?I//cNwMffTRUUPCuiiGnoCEV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf221d1-a550-47c9-d0c8-08d960e78e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2021 18:56:28.8334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGLepBW2wVFoL97Lo5gidUz7xqHogS4E1Q6S2KAOnTLwYt53VunoCLsWBsyaz1CrEh7HgPJInEVoXmi0967/hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5196
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

I have two pending patches:
https://patches.linaro.org/patch/432324/ from 2021-05-07
https://patches.linaro.org/patch/403538/ from 2021-03-16, which has been re=
-sent.

Could these patches be accepted?

Thanks,
Vadim.
