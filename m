Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A3530DFB7
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 17:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbhBCQ1S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 11:27:18 -0500
Received: from mail-eopbgr80097.outbound.protection.outlook.com ([40.107.8.97]:34053
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233269AbhBCQ1P (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 3 Feb 2021 11:27:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h134F2M6An2zyHisVVZmypSJ7sUsjkcoZH+1A4ZzVKzEruXPrmU5WCyFBO150dwx0yo0liRe46hyGleQsQUXtNsMyvFWXn1FIBiJdd5AGk+Yy10/q3DgVy66RlSy2WY9gchhsZPdpnlcjSvEcuCvul0EQq5Ji72QegP/l5KbsvyacAUX0mNn8EK5owv4HsEtMm7rfSCKkq6R7lk9SmYtiKvBHc9kg7+aAe11TwKEfkoq+GJ6D2cX+4/TylSkLi4UmgLaEzt0Gz549/bbiwMkMCbn6UvPCObc1zrC3nB/s5HzON/4DFfONg2izJXGelRofa1AWU/Mf3fv4piNjlYhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b0Q68ZA2QToNMlJ5S8sJFB6OtRR3KU1y6AY6dqlE84=;
 b=M/8W7ZG3Sdo86QBv2uUxbD9gUEsJLhRi+aP9w7dSMstcDSIRu1JCEH7GS3ju+P7kLQfjcUNfBBcPkKlsYaNFm+kZSkp8tYDfoG0+3riRgpRAwbMHE1lkleV+Yp976LB+8M++2AgMaWNElRrruI1+pE8Z58xRgtlSUEGZPEsUW8S1gHoUUvSmpp1AVxuTNEH4jAhNDA49Vx2cGjGWKzGD+T0ZGGw4bk79FJpSt0kvpNt0UJeyx1+TguH4WyRR6vDOV/pbDQZK/quJxaQ2f5uC+LBExdKOktm4FcsgtPZdmNcw9uMifYmoJIFv1n0rt43ULbAwI/6sslAL8tQ9AuCqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b0Q68ZA2QToNMlJ5S8sJFB6OtRR3KU1y6AY6dqlE84=;
 b=fK85uWCntpHpTTabZHrHU5SEfPiIwARtNO7ArfMc9xp+Vl1tKWH+5PispGw6x3rdBY7iBANDGdVeB+Iq2fhTwfpO+ElsNnE/G43dovz30y2kV+lKhyOiXN9Gck5iyUsQhO67Ikqar29o+BDQO06MfLT3+gFnytxU0E1up7sk4+o=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DBAP190MB0808.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 3 Feb
 2021 16:26:26 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 16:26:26 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
CC:     Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH 2/2] leds: lp50xx: remove unused regulator
Thread-Topic: [PATCH 2/2] leds: lp50xx: remove unused regulator
Thread-Index: AQHW+gdf79SX45aHf0yCjzeHay43vKpGIqMAgABQHoCAAAmBAIAAG34AgAAFTZA=
Date:   Wed, 3 Feb 2021 16:26:26 +0000
Message-ID: <DB8P190MB06340D1909D0B592D4D3B1F8D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210203083408.2534-1-schuchmann@schleissheimer.de>
 <20210203090249.GA14154@amd> <2e9dff78-7fde-404d-6fad-6aeedf1145d1@ti.com>
 <20210203142336.GA12369@duo.ucw.cz>
 <0ddd5bdf-0484-3c20-1b6e-5573d1ff90f6@ti.com>
In-Reply-To: <0ddd5bdf-0484-3c20-1b6e-5573d1ff90f6@ti.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c13b27e-c325-4891-3ed2-08d8c86073fb
x-ms-traffictypediagnostic: DBAP190MB0808:
x-microsoft-antispam-prvs: <DBAP190MB0808FC2AAC19FBB40FD877CFD9B49@DBAP190MB0808.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5FbxCNgNXuVVlgwO3aBzMIzjwungdtzg4RwYNRSZO/nlsQlc9pWWlfKwjUNVZmKyS4U7s1vOI/YTjS/PJqLI8UyPteVTfeR6Mq0D0VklVQ/AeyhLcwaMut1ynTOuKbtzOxrOkioVg2AwSVOMfpIQjL5X2nAn/roo7dD10M1Vsod/DcSsDIlVFIdyiYkozPWk8XMrE/zhBBS49dxKmvIX+l9zcrMQzISfGSeO5UGNl346xqqIe85DMudtpeM5HWVnRo2yRHgxRvJEUWCmM5p33nCJYblNkmlBeUOJUPZPK7hCEJE3Y8/ig6LKdvDsKucmtnfEVsRfO9TWxTpTgpfur11adZwVVhY9MOlKNei2mBpdfH4QN1YfXniRRP9u26uplHEWDiW41ReIQBNKbDfiW1PcmYNvoH5FVMc+bzN1AUTz7ddzZIMrMr9BwEXDxa7gmjwDdG3jtnkLsXe0rxsfUBVGKp9QGI01gzb/FoPaeQNiKv7H64Aa3yVFsVE82O2mHCjB6H2gTTcLT+2OMjmV3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(39830400003)(136003)(346002)(366004)(396003)(52536014)(54906003)(76116006)(66556008)(110136005)(64756008)(66946007)(4326008)(66476007)(316002)(66446008)(8936002)(55016002)(7696005)(33656002)(83380400001)(9686003)(2906002)(5660300002)(8676002)(6506007)(86362001)(478600001)(186003)(71200400001)(26005)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qE7GsdH0STVwXMpWnckr+zdKodxDtVBJXUarPV3ebxg8SJYUXFc8VvKYs8uT?=
 =?us-ascii?Q?HDiIYhKkEEXci8SLdS7JazmFHi4eXrymlpeaBTGiwGcQpKyF0I/nd6dlxq0m?=
 =?us-ascii?Q?GrIy1WThv5ATpnlZ04YnfIKxx+l2ut90XSz7zZlHAYnc3rjBcim7LxWwY8TQ?=
 =?us-ascii?Q?R4pn2nFsx+lT7Q31R6ngWKhf4NGHoaGyg9bm11Ls+jDkx4WTtr64KYqkwXJ4?=
 =?us-ascii?Q?/vSdhHoGULoaEW0tA8DAtp8Uid75eW8snMGvbLn9BTxnCNoUGF5tEN3onvL9?=
 =?us-ascii?Q?ONq2FpocNxF5l6n72yAQmAfhALwUk77GOwSmzZcmzdQDb0PQa1raXydH7aGe?=
 =?us-ascii?Q?VZ3fuqSlU0NevC3wkrV01q9DmRcQiF2CO0DSjI5g6mjcAXQf/D6cRJ+xHEh4?=
 =?us-ascii?Q?sEoG0wVcupsEORWtV4d+II4grPfmK8uozn8In4eeNtCqSCIUl1/KbMWeLJBm?=
 =?us-ascii?Q?w21Auu0QQisFhFKDziZkC9p5ClT00sSqspiGlmNGYIUIHkr6NWgB+opyYyE0?=
 =?us-ascii?Q?JJ+aSLpA/rFNStLf+0Pb6iHFOTuplaaJAb/lAwqE4Elhafr2BKX+5v5bKLRg?=
 =?us-ascii?Q?vkcGvd6WWsN1k6ClvSUoqNK2GvhqQdQJ5q+n2bSRuFKKv1hHdKBG0qMMjS2c?=
 =?us-ascii?Q?CqJgtulVXgpmnb2SEl++z9cK4kUM4EiKNHFZamtTjnfgNKkkQFub9EzqiyUo?=
 =?us-ascii?Q?gVMa/iSjEiA9xT7sNJG/MqJe7F50/5lqEmSg7J/G6QsWOaMHf6sthT8Q6EVt?=
 =?us-ascii?Q?vBkTWv2b4MSLsOi22fKaERPULfpNuFJikmNARhhTwLZ2HMGmThCXGFlkkzmG?=
 =?us-ascii?Q?XWP6LkGUabrFeWTNJOqaqEyvZofZmfcX46AhgmysNidteTzyVrwKujAsCkT/?=
 =?us-ascii?Q?ThYJRDCHDkzuro7xu+gIrFVXREdkOtHSEUOVrmKNxIYgriaLNczIHiunf2d5?=
 =?us-ascii?Q?uvAuM62WKl8nO1az+VdTVaZJgk9t1aJk3ArerwVhemiZWGUK4oBHgnp2DFNH?=
 =?us-ascii?Q?o1hcq5/I+idEas85LlmNpQXmGhQeWMpQT8BnDOvTKesbnQcSVmtv+L5Y2WPn?=
 =?us-ascii?Q?VpEqumWNER+RE5HYXX4Nc9gvAfX2i5L7+zB8co05BGk1+f5wHVpC2yNeLTYl?=
 =?us-ascii?Q?f01PNmcJwAwAVV5lLDYx3OmYSH4/i5oSKbSf+Fpdf/+nzHYAOFXHsRtMVZXC?=
 =?us-ascii?Q?tVl+ninM5om6tlgTsy9Y+6FADdGf3/vaqhjCdEBcEHURLQbUC1oc8UwC1jCm?=
 =?us-ascii?Q?OZ/1s9cj1aByYGzlIeK5859PYva01GcmBu6/We1bwO+X2NKJhODMRFSzNl6a?=
 =?us-ascii?Q?5RuKCSAA0NzdyMqpc7sTyjuC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c13b27e-c325-4891-3ed2-08d8c86073fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 16:26:26.0260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FB7R0PL0NaCHfiXbhl19UOfO+T2WSQ8kZ+1qjjQhDEuj+ko8+oJE4Xd0H88bR7fvU7tSMPGexZHmkIzsh77x9Dkh3s+eLtn13bcyKRStb34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0808
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan, hello Pavel,
> > Do you have set up where this is needed and you can test this? Will
> > you submit the fixes?
>=20
> No I use an always on regulator in my setup. I have no managed supplies
> exposed.

I am also sorry I do not have a setup ready for testing this.
I think we should ignore this patch then?`

For now I am working on the enable pin in the driver.
The enablement seems it does not work. The order of I2C-Reset
and Enable is wrong and the pin is used before initialized.
But I do not have any patches ready.
Is the enable pin working on your side?

Best Regards,

   Sven
