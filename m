Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C8330ED62
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 08:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhBDHcR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 02:32:17 -0500
Received: from mail-eopbgr140127.outbound.protection.outlook.com ([40.107.14.127]:7365
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232977AbhBDHcQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Feb 2021 02:32:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5SxAMrlwuE1iF56PvockIPhbTgXYEpbRGQ2wdCmwzI44v5C5+8PU7jLX38Hz9YBcBOkDzbjLaQxRb2JE4fe7ut2/ek5GYCf2Ee40Ueq3XAhM3N5woP8CeH62JtNjPq0mhADAPwqhyGPmyOF1xWZchHCeA77V0T/GUSOoqnYCETadL5EAej0wK+SIS4pEC0jsyIgrI+9TFixK+PfJOs70JJJBBAMLrSInbQQsv8pmx0QMWFV3vuAFqtEGYupgnpS/2aE5tfIRZfdpB3xYmC50g91OV5Y9uff+74XqrVQ4/1lWo5VZSzGt+xrLX0wzu22WHxKG22VmPidmptxhX1Ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSGDNUL4tnVOSOTM9xUVchjg5oB8KkMGvvMn0AnAZeY=;
 b=FTzxLC525/gLH6U/ZVI6mckLe+js4BDo3jgVHzZHmjLtj35t51QgJMIaYhHCp+PJx+EELylA8aXF3EBWkzzkLbbeXd4km6Nl1vSqpGZ4IIsi02vF9QhMxoTNa7Eo3S2UuuBSJoD3b7ouP4Vjje+n3QextCGIdCqksAfLb3YtQKD3F7G2UyfPqb/U4lmYHzLCYCb1Proo165Y5yQqLvikzb6dtGI9kifKlQ/iR4F+q9+y2Lc/AUBVDaomowbjjA0PdF9pYP/3aRJX4pcUonXpIHuTajK4stEp3IVxKlQxo59JK3Pg8xkEWO8jD++7Pu2Qz+EMkxEJfwUvQeuawet/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSGDNUL4tnVOSOTM9xUVchjg5oB8KkMGvvMn0AnAZeY=;
 b=f10dy2Gn7XKUz0bZwYj/YPxTmOCYPC4knDLIgG1CbWwp0EJLtWXCgQJ+WAfQ6JIrsrVEXx/wTkOb9+6j01EsPoFIa90t1ngOVvii2OgG95yVjbDCxkIg5889yLxkU2+VurYnFhPCG5pfqa1+OMpe5Quaj2UrrScN1Y0NsgND17M=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB6P190MB0054.EURP190.PROD.OUTLOOK.COM (2603:10a6:4:88::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19; Thu, 4 Feb 2021 07:31:26 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 07:31:26 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
CC:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Thread-Topic: [PATCH v1] leds: lp50xx: add setting of default intensity from
 DT
Thread-Index: AQHW7lFOn/1Jlt56EkOy+ZVk/3cx2qpGlWAAgAAP4bCAABNlgIAADMWAgAAAZQCAAOw7kA==
Date:   Thu, 4 Feb 2021 07:31:26 +0000
Message-ID: <DB8P190MB0634002C60A8680823421A69D9B39@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
 <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210203163555.GA23019@duo.ucw.cz> <20210203182137.339f8470@nic.cz>
 <20210203172302.GB23019@duo.ucw.cz>
In-Reply-To: <20210203172302.GB23019@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d18f31a-9135-4e66-1fff-08d8c8dee17c
x-ms-traffictypediagnostic: DB6P190MB0054:
x-microsoft-antispam-prvs: <DB6P190MB0054921CC7E5CC68151A5622D9B39@DB6P190MB0054.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XOCvIwIymvAXD0ddg7IoSMLjcbxWFxNYnJesprwwpreat+FifOyrJWmdvY7l9JWqXkv6v6CeYS8uEMsrljLvScaSB7BzCmnkfrqkn+tGvyIw5CNrLkGUw+2SijhWdq07RDtSFN3BXbjGTCG5pjASmE0lIFuxIQCIz8KZQg0bcCBUIogV2CVUjsulWS19jMPW7u5ZPbfyC6/eGHqYRfWM04b3K+deVaOAeGBQep3JpXwo1VJKXzDkd1oqCToGRsMx+EtCkIO3Gi9bypvZMjN1fSMmpYmwrqDXE5uBAobnOZmmGVMMSatZO6ENyRZI2Hsg/PPs2cWhg/76Q5Re2WBguSlcuAwxGUrZ6L2QLgaIThy2GakwoL120WzVfJ+EZsTlH+8ke3ESao4o+bHwIEPDJhQVZg5aTFhDCwRxtrWEOloA19RiAcMNSVmZjAnt02fDlGjyC6pWBlfj97YFyvjaX00Uiff95IfwkMoLsNwlEt0UNU7rsHbU5K4j9Azi/NQ9tnkDOxwNUW6UJVgGzodxxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(136003)(366004)(376002)(346002)(33656002)(86362001)(66946007)(5660300002)(52536014)(110136005)(26005)(66446008)(54906003)(316002)(83380400001)(71200400001)(7696005)(478600001)(66556008)(186003)(4744005)(66476007)(64756008)(76116006)(8936002)(6506007)(9686003)(55016002)(8676002)(2906002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MCRxPV7QRNK+HinGcJbBO95WW67IDhXD5Nz9AySZ6ZAPAbQvpREz5CrUk5/N?=
 =?us-ascii?Q?ekXu8t7Glla49nfYovKoGRAWuZB3GYmpOAsvUlkR21y3H1xvhpLQHy4SF7Fx?=
 =?us-ascii?Q?pmbceKr9ODl0I1hzyW6S3q6WLWJFtKa8L/XW2eQecmnlJm6IazcUysgt8RTA?=
 =?us-ascii?Q?tc9Mnj8FSQiTCN/8HZx3o/jqeky9azpbA/x/8NPyAcWQo/booqs5X+GjaRaY?=
 =?us-ascii?Q?n+O8AYMrpRaDhKZaxLjQPG63P3CEE7R0vQ1y7MAi6yptvNm8CHDOJH8Lt8CB?=
 =?us-ascii?Q?5Y+bMOnzMyuIL6JXBlaZv09CgsR0MiO47B1ojHs2FrjQlrwKDuMvyE1AJgfC?=
 =?us-ascii?Q?hdMrQT6TIUYZtm8/zh/wHrL7C3/Zy+Qz8MwiDmaPp/TOHdR+IFn4L1WmtKGR?=
 =?us-ascii?Q?v9g8LqLfB30a/VX0w1+HwMWCeW2K5qg6l4i+5qNQnFg7dYNMj7lAw1RqJ81P?=
 =?us-ascii?Q?jst4LvUeRKCXTMttvlqA5hnGNShi0DbBt5UgJc6ISAtuFCB0/1QAj4SPatyK?=
 =?us-ascii?Q?Itk1LwPQLNF98swj2ScwGOMci+0vw9oLdWEMo2U4xNT1zKUqd64DHUfd4RG1?=
 =?us-ascii?Q?ZmEsSDEEcillwAjx7P/iwlleh6qnGLOXtBchSZ40pgT4dIH9zrOybqQ9Hdz7?=
 =?us-ascii?Q?A2yXUNFULGtmC9kjg5mfSqkoMJZMH+5uV5NYok4Me/cKqEIM7DHBtS0/tV1A?=
 =?us-ascii?Q?XQ+j2rCL1Teg6C/bixTi2wiAqYbZkLb/dfC5Uu7/uzlFb3ZGVJA7r7RbGPzE?=
 =?us-ascii?Q?R/B0Qdg4MyfP4GoFb8zFBcoxPETmdmNmDCK7F0vM5JaonAraiHLY6mnvQ+st?=
 =?us-ascii?Q?YIbBbjl0ftoHNlSNiN9lfDjKJOamcZy8vDj7yCXKji+08SRU8iIvofF1qXXA?=
 =?us-ascii?Q?viTijGpxDkXKEq/RC/oucHgZiBPKe9sHR5q+dyoZi48OGFiXot/+QS+lVPjt?=
 =?us-ascii?Q?NKup0oSz9ce0KJh3gdgj5swiDymlBFVkj5+WyAYicx16YHevZO0DWXEWwY6G?=
 =?us-ascii?Q?Sz44usdNq00RzVZ/mUf7UFlb+erv2UHpUEi/j0dS5iX5LALHSmayceqTvQXv?=
 =?us-ascii?Q?aOH31kwgouScmm2ShrbA+jGwPuCEGD1QyK6VMMxvsCIiHfII/E2JfByRTQlO?=
 =?us-ascii?Q?izwdF7gD5eeqy29+CvRgczTo02msLnH2KHoIquQQUXyZN4TilsX2iM5y+nYK?=
 =?us-ascii?Q?VA85Hhd74UAV2IqM1K3REgDkgVayZUqbac4xLv8+01/xCJhdk2zD6cEHkP8C?=
 =?us-ascii?Q?LA/6zA/HUGTQ/1cUkgV7nb6xjNsJX24TFzeX5WDqhh25esdD3smR1cHFgYNk?=
 =?us-ascii?Q?0fZ3NHca/vnhvp2yWHYYr35m?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d18f31a-9135-4e66-1fff-08d8c8dee17c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 07:31:26.3411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8A9q/h59dWLb8jx+H+ekYtUd/74zfTT/JFf4Gwzy102ZxrdvsUxXo4WeiqPWyhMXyubMw1jyxEwdS48zHqQpRxWHcvc9smfzou7870QF3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0054
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel, hello Marek

> > Is the property default-intensity documented in DT bindings?

I updated the documentation in leds-lp50xx.yaml. Is it this what you mean?

> > Wouldn't it be better if the property was used in the multi-led node
> > instead of the channel node? I.e.
> >   multi-led@3 {
> >     color =3D <LED_COLOR_ID_RGB>;
> >     default-intensity =3D <100 0 0>;
> >   };
>=20
> Yes, this would be better.

Sound good, I will see what I can do here.

Regards, Sven
